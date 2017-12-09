<%@ WebHandler Language="C#" Class="BankOrderList" %>
using System;
using System.Web;
using System.Data;
using System.Collections.Generic;
using OriginalStudio.Lib.Data;
using OriginalStudio.BLL;
using OriginalStudio.BLL.Supplier;
using OriginalStudio.BLL.User;
using Wuqi.Webdiyer;
using OriginalStudio.DBAccess;

using System.Data.SqlClient;
using System.Text;

public class BankOrderList : IHttpHandler {

    public void AlertAndHref(string Alert,string Href,HttpContext context){}
    public enum OrderTypeEnum
    {
        API = 1,
        无来路 = 2,
        有来路 = 4,
        批量销卡 = 8
    }
    public void ProcessRequest (HttpContext context) {
        List<SearchParam> searchParams = new List<SearchParam>();
        int result = 0;
        AspNetPager Pager1 = new AspNetPager();
        string txtOrderId       = context.Request.Form["txtOrderId"];
        string txtuserid        = context.Request.Form["txtuserid"];
        string ddlChannelType   = context.Request.Form["ddlChannelType"];
        string ddlsupp          = context.Request.Form["ddlsupp"];
        string txtUserOrder     = context.Request.Form["txtUserOrder"];
        string txtSuppOrder     = context.Request.Form["txtSuppOrder"];
        string ddlOrderStatus   = context.Request.Form["ddlOrderStatus"];
        string ddlNotifyStatus  = context.Request.Form["ddlNotifyStatus"];
        string StimeBox         = context.Request.Form["StimeBox"];
        string EtimeBox         = context.Request.Form["EtimeBox"];
        string page             = context.Request.Form["page"];


        
        if (!string.IsNullOrEmpty(txtOrderId.Trim()))
        {
            searchParams.Add(new SearchParam("orderId_like", txtOrderId.Trim()));
        }
        if (!(string.IsNullOrEmpty(txtuserid.Trim()) || !int.TryParse(txtuserid.Trim(), out result)))
        {
            searchParams.Add(new SearchParam("userid", result));
        }
        if ((!string.IsNullOrEmpty(ddlChannelType.Trim()) && int.TryParse(ddlChannelType.Trim(), out result)) && (result > 0))
        {
               
            searchParams.Add(new SearchParam("channeltypeId", result));
        }
        if ((!string.IsNullOrEmpty(ddlsupp.Trim()) && int.TryParse(ddlsupp.Trim(), out result)) && (result > 0))
        {
            searchParams.Add(new SearchParam("supplierId", result));
        }
        if (!string.IsNullOrEmpty(txtUserOrder.Trim()))
        {
            searchParams.Add(new SearchParam("userorder", txtUserOrder.Trim()));
        }
        if (!string.IsNullOrEmpty(txtSuppOrder.Trim()))
        {
            searchParams.Add(new SearchParam("supplierOrder", txtSuppOrder.Trim()));
        }
        if ((!string.IsNullOrEmpty(ddlOrderStatus.Trim()) && int.TryParse(ddlOrderStatus.Trim(), out result)) && (result > 0))
        {
            searchParams.Add(new SearchParam("status", result));
        }
        if ((!string.IsNullOrEmpty(ddlNotifyStatus.Trim()) && int.TryParse(ddlNotifyStatus.Trim(), out result)) && (result > 0))
        {
            searchParams.Add(new SearchParam("notifystat", result));
        }
        DateTime minValue = DateTime.MinValue;
        if ((!string.IsNullOrEmpty(StimeBox.Trim()) && DateTime.TryParse(StimeBox.Trim(), out minValue)) && (minValue > DateTime.MinValue))
        {
            searchParams.Add(new SearchParam("stime", StimeBox.Trim()));
        }
        if ((!string.IsNullOrEmpty(EtimeBox.Trim()) && DateTime.TryParse(EtimeBox.Trim(), out minValue)) && (minValue > DateTime.MinValue))
        {
            searchParams.Add(new SearchParam("etime", minValue.AddDays(1.0)));
        }

        List<SqlParameter> paramList = new List<SqlParameter>();
        string wheres = BuilderWhereText(searchParams, paramList);

        //context.Response.Write(wheres);
        DataSet set = new OrderBank().AdminPageSearch(searchParams, Pager1.PageSize, Convert.ToInt32(page));

        DataTable table = null;
        if (set.Tables.Count != 0)
        {
            table = set.Tables[0];
            table.Columns.Add("orderTypeName"); //订单类型
            table.Columns.Add("supplierName"); //接口商
            table.Columns.Add("difftime");

            for (int i = 0; i < table.Rows.Count; i++)
            {
                table.Rows[i]["orderTypeName"]  = Enum.GetName(typeof(OrderTypeEnum), table.Rows[i]["ordertype"]);
                table.Rows[i]["supplierName"]   = getsupplierName(table.Rows[i]["supplierId"]);
                table.Rows[i]["difftime"]       = this.GetDifftime(Convert.ToInt32(table.Rows[i]["userid"]), table.Rows[i]["completetime"]);

            }
        }


        General.Common.Json json = new General.Common.Json();
        if (table.Rows.Count > 0)
        {
            DataTable table1 = set.Tables[1];
			
            table.Columns.Remove("notifycontext");
            json.AddToJson("data", table);
            json.AddToJson("count", table1);
            json.AddToJson("index", page);           
            json.AddToJson("success", true);
        }
        else {
            json.AddToJson("success", false);
        }

        //context.Response.Write(wheres);

        context.Response.Write(json.ToString());
        
    }







    public double GetDifftime(int userId, object completeTime)
    {
        DateTime minValue = DateTime.MinValue;
        if (UserAccessTime.GetModel(userId) == null)
        {
            return 1000.0;
        }
        DateTime? nullable = new DateTime?(UserAccessTime.GetModel(userId).lastAccesstime);
        if (nullable.HasValue)
        {
            minValue = nullable.Value;
        }
        return Convert.ToDateTime(completeTime == DBNull.Value?DateTime.Now:completeTime).Subtract(minValue).TotalMinutes;
    }
    protected string getsupplierName(object obj)
    {
        if ((obj == DBNull.Value) || (obj == null))
        {
            return string.Empty;
        }
        return SysSupplierFactory.GetSupplierModelByCode(int.Parse(obj.ToString())).SupplierName;
    }





    public bool IsReusable {
        get {
            return false;
        }
    }

    //========================
    /// <summary>
    /// where 条件字符串拼接   测试用  上线需要删除
    /// </summary>
    /// <param name="param"></param>
    /// <param name="paramList"></param>
    /// <returns></returns>
    private static string BuilderWhereText(List<SearchParam> param, List<SqlParameter> paramList)
    {
        StringBuilder builder = new StringBuilder(" 1 = 1");
        if ((param != null) && (param.Count > 0))
        {
            for (int i = 0; i < param.Count; i++)
            {
                string str2;
                SearchParam param2 = param[i];
                if (param2.CmpOperator == "=")
                {
                    str2 = param2.ParamKey.Trim().ToLower();
                    switch (str2)
                    {
                        case "userid":
                            {

                                SqlParameter item = new SqlParameter("@userid", SqlDbType.Int);
                                item.Value = (int)param2.ParamValue;
                                paramList.Add(item);
                                builder.Append(" AND [userid] = '"+ item.Value + "' "  );
                                break;
                            }
                        case "agentid":
                            {

                                SqlParameter parameter2 = new SqlParameter("@agentid", SqlDbType.Int);
                                parameter2.Value = (int)param2.ParamValue;
                                paramList.Add(parameter2);
                                builder.Append(" AND [agentid] = '" + parameter2.Value + "'" );
                                break;
                            }
                        case "manageid":
                            {

                                SqlParameter parameter3 = new SqlParameter("@manageId", SqlDbType.Int);
                                parameter3.Value = (int)param2.ParamValue;
                                paramList.Add(parameter3);
                                builder.Append(" AND [manageId] = '" + parameter3.Value + "'" );
                                break;
                            }
                        case "typeid":
                            {

                                SqlParameter parameter4 = new SqlParameter("@typeId", SqlDbType.Int);
                                parameter4.Value = (int)param2.ParamValue;
                                paramList.Add(parameter4);
                                builder.Append(" AND [typeId] = '" + parameter4.Value + "'"  );
                                break;
                            }
                        case "supplierid":
                            {

                                SqlParameter parameter5 = new SqlParameter("@supplierId", SqlDbType.Int);
                                parameter5.Value = (int)param2.ParamValue;
                                paramList.Add(parameter5);
                                builder.Append(" AND [supplierId] = '" + parameter5.Value + "'"  );
                                break;
                            }
                        case "userorder":
                            {

                                SqlParameter parameter6 = new SqlParameter("@userorder", SqlDbType.VarChar, 80);
                                parameter6.Value = "%" + SqlHelper.CleanString((string)param2.ParamValue, 80) + "%";
                                paramList.Add(parameter6);
                                builder.Append(" AND [userorder] like '" + parameter6.Value + "'" );
                                break;
                            }
                        case "orderid":
                            {

                                SqlParameter parameter7 = new SqlParameter("@orderid", SqlDbType.VarChar, 80);
                                parameter7.Value = "%" + SqlHelper.CleanString((string)param2.ParamValue, 80) + "%";
                                paramList.Add(parameter7);
                                builder.Append(" AND [orderid] like '" + parameter7.Value + "'"  );
                                break;
                            }
                        case "supplierorder":
                            {

                                SqlParameter parameter8 = new SqlParameter("@supplierOrder", SqlDbType.VarChar, 100);
                                parameter8.Value = "%" + SqlHelper.CleanString((string)param2.ParamValue, 100) + "%";
                                paramList.Add(parameter8);
                                builder.Append(" AND [supplierOrder] like '" + parameter8.Value + "'"  );
                                break;
                            }
                        case "orderid_like":
                            {

                                SqlParameter parameter9 = new SqlParameter("@orderid", SqlDbType.VarChar, 100);
                                parameter9.Value = SqlHelper.CleanString((string)param2.ParamValue, 100) + "%";
                                paramList.Add(parameter9);
                                builder.Append(" AND [orderid] like '" + parameter9.Value + "'"  );
                                break;
                            }
                        case "status":
                            {

                                SqlParameter parameter10 = new SqlParameter("@status", SqlDbType.TinyInt);
                                parameter10.Value = (int)param2.ParamValue;
                                paramList.Add(parameter10);
                                builder.Append(" AND [status] = '" + parameter10.Value + "'" );
                                break;
                            }
                        case "statusallfail":
                            //builder.Append(" AND ([status] = 4 or  [status] = 8)");
                            builder.Append(" AND ([status] = 4)");  //2017.2.12 =8的情况去掉！！！！！
                            break;

                        case "notifystat":
                            {

                                SqlParameter parameter11 = new SqlParameter("@notifystat", SqlDbType.TinyInt);
                                parameter11.Value = (int)param2.ParamValue;
                                paramList.Add(parameter11);
                                builder.Append(" AND [notifystat] = '" + parameter11.Value + "'"  );
                                break;
                            }
                        case "promid":
                            {

                                SqlParameter parameter12 = new SqlParameter("@promid", SqlDbType.Int);
                                parameter12.Value = (int)param2.ParamValue;
                                paramList.Add(parameter12);
                                builder.Append(" AND exists(select 0 from PromotionUser where PromotionUser.PID = '" + parameter12.Value + "' and PromotionUser.RegId=userid)");
                                break;
                            }
                        case "stime":
                            {

                                //builder.Append(" AND [addtime] >= @stime");
                                SqlParameter parameter13 = new SqlParameter("@stime", SqlDbType.DateTime);
                                parameter13.Value = param2.ParamValue;
                                paramList.Add(parameter13);
                                builder.Append(" AND [processingtime] >= '" + parameter13.Value + "'");
                                break;
                            }
                        case "etime":
                            {

                                //builder.Append(" AND [addtime] <= @etime");
                                SqlParameter parameter14 = new SqlParameter("@etime", SqlDbType.DateTime);
                                parameter14.Value = param2.ParamValue;
                                paramList.Add(parameter14);
                                builder.Append(" AND [processingtime] <= '" + parameter14.Value + "'");
                                break;
                            }
                    }
                }
                else
                {
                    str2 = param2.ParamKey.Trim().ToLower();
                    if ((str2 != null) && (str2 == "status"))
                    {

                        SqlParameter parameter15 = new SqlParameter("@status1", SqlDbType.TinyInt);
                        parameter15.Value = (int)param2.ParamValue;
                        paramList.Add(parameter15);
                        builder.AppendFormat(" AND [status] {0} " + parameter15.Value, param2.CmpOperator);
                    }
                }
            }
        }
        return builder.ToString();
    }


}