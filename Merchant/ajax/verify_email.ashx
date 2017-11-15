<%@ WebHandler Language="C#" Class="verify_email" %>

using System;
using System.Web;

public class verify_email : IHttpHandler {

    public string parms
    {
        get
        {
            return KuaiCardLib.Web.WebBase.GetQueryStringString("parms", "");
        }
    }
    
    public void ProcessRequest (HttpContext context) {
        string msg = "";
        try
        {
            string decodeparams = KuaiCardLib.Security.Cryptography.RijndaelDecrypt(parms);
            string[] arr = decodeparams.Split('&');
            if (arr.Length == 2)
            {
                int _itemId = 0;
                if (int.TryParse(arr[0].Split('=')[1], out _itemId))
                {
                   KuaiCard.BLL.User.EmailCheck bll = new KuaiCard.BLL.User.EmailCheck();
                   KuaiCard.Model.User.EmailCheckInfo itemInfo = bll.GetModel(_itemId);
                    if (itemInfo == null || itemInfo.status != KuaiCard.Model.User.EmailCheckStatus.提交中
                    || itemInfo.Expired < DateTime.Now
                        )
                    {
                        msg = "无效的信息或此链接已失效";
                    }
                    else
                    {
                        itemInfo.checktime = DateTime.Now;
                        itemInfo.status = KuaiCard.Model.User.EmailCheckStatus.已审核;
                        if (bll.Update(itemInfo))
                        {
                            msg = "激活成功 请登录";
                        }
                    }

                }
            }
        }
        catch
        {
            msg = "提交无效的参数";
        }
        string script = string.Format(@"
<SCRIPT LANGUAGE='javascript'><!--
alert({0});
location.href='/index.aspx';
//--></SCRIPT>
",
               KuaiCardLib.Security.AntiXss.JavaScriptEncode(msg));

        HttpContext.Current.Response.Write(script);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}