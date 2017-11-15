<%@ WebHandler Language="C#" Class="KuaiCard.web.WebService.verifyuname" %>

using System;
using System.Web;
using KuaiCard.BLL.User;
using KuaiCardLib.Web;

namespace KuaiCard.web.WebService
{
    /// <summary>
    /// 
    /// </summary>
    public class verifyuname : IHttpHandler
    {
        public string method
        {
            get
            {
                return WebBase.GetQueryStringString("method", string.Empty);                 
            }
        }

        public string regType
        {
            get
            {
                return WebBase.GetQueryStringString("regType", string.Empty);
            }
        }

        public string emailLoginName
        {
            get
            {
                return WebBase.GetQueryStringString("emailLoginName", string.Empty);
            }
        }
        
        /// <summary>
        /// 空--代表未知
        /// 0--代表不存在
        /// 1--代表存在
        /// </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context)
        {
            string result = string.Empty;
            #region method
            if (string.IsNullOrEmpty(method))
            {
                string userName = WebBase.GetQueryStringString("mobileLoginName", string.Empty);
                string email = WebBase.GetQueryStringString("email", string.Empty);
                string censor = WebBase.GetQueryStringString("censor", string.Empty);
                if (censor == "1")
                {
                    if (!string.IsNullOrEmpty(userName))
                    {
                        if (UserFactory.Exists(userName))
                        {
                            result = "False";
                        }
                        else
                        {
                            result = "True";
                        }
                    }
                }
                else if (censor == "2")
                {
                    if (!string.IsNullOrEmpty(email))
                    {
                        if (UserFactory.EmailExists(email) == 999)
                        {
                            result = "False";
                        }
                        else
                        {
                            result = "True";
                        }
                    }
                }
            }
            #endregion
            else
            {
                int checkresult = UserFactory.EmailExists(emailLoginName);
                if (checkresult == 999)
                {
                    result = "-1";
                }
                else if (checkresult == 1)
                {
                    result = "0";
                }
                else
                {
                    result = "10"; 
                }
            }
            context.Response.ContentType = "text/plain";
            context.Response.Write(result);
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