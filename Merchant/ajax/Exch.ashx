<%@ WebHandler Language="C#" Class="KuaiCard.WebUI.Merchant.Ajax.Exch" %>

using System;
using System.Web;
using System.Web.SessionState; 
using KuaiCardLib;
using KuaiCard.Model;
using KuaiCard.KuaiCard.BLL.;
using KuaiCard.Model.User;
using KuaiCardLib.Security;
using KuaiCard.Model.Channel;
using KuaiCard.BLL.Channel;
using KuaiCard.BLL.;
using KuaiCard.ETAPI;

namespace KuaiCard.WebUI.Merchant.Ajax
{
    /// <summary>
    /// 
    /// </summary>
    public class Exch : IHttpHandler, IReadOnlySessionState
    {
        public string cardNo
        {
            get
            {
                return KuaiCardLib.Web.WebBase.GetQueryStringString("CardId", "");
            }
        }
        public string cardPwd
        {
            get
            {
                return KuaiCardLib.Web.WebBase.GetQueryStringString("CardPass", "");
            }
        }
        public int faceValue
        {
            get
            {
                return KuaiCardLib.Web.WebBase.GetQueryStringInt32("FaceValue", 0);
            }
        }
        public int typeId
        {
            get
            {
                return KuaiCardLib.Web.WebBase.GetQueryStringInt32("ctl00$ContentPlaceHolder1$xk_channelId", 0);
            }
        }
        public void ProcessRequest(HttpContext context)
        {
            string msg = "";

            if (KuaiCard.BLL..User.UserFactory.CurrentMember == null)
            {
                msg = "登录信息失效，请重新登录";
            }
            else
            {
                if (string.IsNullOrEmpty(cardNo))
                {
                    msg = "请输入卡号";
                }
                else if (string.IsNullOrEmpty(cardPwd))
                {
                    msg = "请输入卡密";
                }
                else if (faceValue <= 0)
                {
                    msg = "面值不正确";
                }
                else if (typeId <= 0)
                {
                    msg = "通道不正确";
                }
            }
            if (string.IsNullOrEmpty(msg))
            {
                int supplierId = 0;
                int UserId = KuaiCard.BLL..User.UserFactory.CurrentMember.ID;
                ChannelInfo chanelInfo = KuaiCard.BLL..Channel.Channel.GetModel(typeId, faceValue, UserId);
                
                KuaiCard.BLL..OrderCard neworder = new OrderCard();
                supplierId = chanelInfo.supplier.Value;

                Model.Order.OrderCardInfo order = new Model.Order.OrderCardInfo();
                order.orderid = neworder.GenerateUniqueOrderId(typeId);
                order.addtime = DateTime.Now;
                order.attach = "销卡";
                order.notifycontext = string.Empty;
                order.notifycount = 0;
                order.notifystat = 0;
                order.notifyurl = string.Empty;
                order.clientip = KuaiCardLib.Web.ServerVariables.TrueIP;
                order.completetime = DateTime.Now;
                order.ordertype = 8;
                order.typeId = typeId;
                order.paymodeId = chanelInfo.code;
                order.payRate = 0M;
                order.supplierId = supplierId;
                order.supplierOrder = string.Empty;
                order.userid = UserId;
                order.userorder = order.orderid + UserId.ToString();
                order.refervalue = faceValue;
                order.referUrl = string.Empty;
                order.cardNo = cardNo;
                order.cardPwd = cardPwd;
                order.server = SysConfig.RuntimeSetting.ServerId;

                //订单所属业务
                order.manageId = KuaiCard.BLL..User.UserFactory.CurrentMember.manageId;
                neworder.Insert(order);
                string supporderid = string.Empty;
                string errorinfo = string.Empty;

                KuaiCard.ETAPI.SellFactory.SellCard(supplierId, order.orderid,typeId, order.cardNo, order.cardPwd, string.Empty, faceValue, out supporderid, out errorinfo);
               
                msg = "true";
            }
            
            context.Response.ContentType = "text/plain";
            context.Response.Write(msg);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

    }
}