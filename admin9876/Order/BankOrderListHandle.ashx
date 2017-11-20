<%@ WebHandler Language="C#" Class="BankOrderListHandle" %>
using System;
using System.Web;
using OriginalStudio.BLL;
public class BankOrderListHandle : IHttpHandler {

    public void AlertAndHref(string Alert,string Href,HttpContext context){}
    
    public void ProcessRequest (HttpContext context) {
        string type          = context.Request.Form["type"];
        string orderid       = context.Request.Form["orderid"];
        string supplierId    = context.Request.Form["supplierId"];
        string refervalue    = context.Request.Form["refervalue"];
        General.Common.Json json = new General.Common.Json();
        //====================================
        
            try
            {
                string str2;
                if (type == "btnReissue")
                {
                    //手动回发
                    str2 = orderid;
                    if (!string.IsNullOrEmpty(str2))
                    {
                        string result = new OrderBankNotify().SynchronousNotify(str2);
                        json.AddToJson("result", result);
                        
                    }
                }
               
                else if (type == "btnRest")
                {
                    string str4 = orderid + supplierId + refervalue;
                    if (!string.IsNullOrEmpty(str4))
                    {                  
                        json.AddToJson("result", "redirectUri");
                        json.AddToJson("url", "ResetOrder.aspx?orderid="+orderid+"&oclass=1&supp="+supplierId+"&amt="+supplierId+"");

                    }
                }
                 
                else
                {
                    OrderBank bank;
                    if (type == "btnDeduct")
                    {
                        str2 = orderid;
                        bank = new OrderBank();
                        if (bank.Deduct(str2))
                        {
                           json.AddToJson("result", "扣量成功");
                        }
                        else
                        {
                           
                            json.AddToJson("result", "扣量失败，可能是余额不足");
                        }
                       
                    }
                    
                    else if (type == "btnReDeduct")
                    {
                        str2 = orderid;
                        bank = new OrderBank();
                        if (bank.ReDeduct(str2))
                        {
                            
                            json.AddToJson("result", "还单成功");
                        }
                        else
                        {
                           
                            json.AddToJson("result", "还单失败");
                        }
                       
                    }
                }
                
            }
            catch (Exception exception)
            {
            
                json.AddToJson("result", exception.Message);
            }

            
            context.Response.Write(json.ToString());

       
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

   


}