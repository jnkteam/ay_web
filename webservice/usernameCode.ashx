<%@ WebHandler Language="C#" Class="KuaiCard.web.WebService.usernameCode" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using KuaiCard.BLL.User;
using KuaiCardLib.Web;

namespace KuaiCard.web.WebService
{
    /// <summary>
    /// 
    /// </summary>
    public class usernameCode : IHttpHandler, IReadOnlySessionState
    {
        
        
        /// <summary>
        /// 空--代表未知
        /// 0--代表不存在
        /// 1--代表存在
        /// </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context)
        {
            string msg = "";
            string url = "";
            string result = "no";
            string userName = WebBase.GetQueryStringString("mobileLoginName", string.Empty);
            string code = WebBase.GetQueryStringString("code", string.Empty);
            if (!string.IsNullOrEmpty(userName))
            {
                if (string.IsNullOrEmpty(code))
                {
                    result = "no";
                    msg = "验证码不能为空！";
                  
                }
                else   if (HttpContext.Current.Session["CCode"].ToString() != code.ToUpper())
                {
                    result = "no";
                    msg = "验证码不正确！";
                }
                else if (string.IsNullOrEmpty(userName))
                {
                    result = "no";
                    msg = "用户名不能为空！";
                }
                else  if (UserFactory.Exists(userName))
                {
                    result = "ok";
                    url = "";
                }
                else
                {
                    result = "no";
                }

            }
            context.Response.ContentType = "text/plain";//"text/plain";
            context.Response.Write("{\"result\":" + result + ",\"msg\":\"" + msg + "\",\"url\":\"" + url + "\"}");
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