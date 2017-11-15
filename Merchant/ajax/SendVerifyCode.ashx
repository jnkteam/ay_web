<%@ WebHandler Language="C#" Class="KuaiCard.WebUI.Merchant.Ajax.SendVerifyCode" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using KuaiCardLib;
using KuaiCard.Model;
using KuaiCard.BLL;
using KuaiCardLib.Data;
using Aspose.Cells;
using System.IO;
using System.Data;
using KuaiCardLib.Security;
using KuaiCard.Model.User;

namespace KuaiCard.WebUI.Merchant.Ajax
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>

    public class SendVerifyCode : IHttpHandler, IReadOnlySessionState
    {
        public Model.User.UserInfo currentUser
        {
            get
            {
                return BLL.User.UserFactory.CurrentMember;
            }
        }

        public void ProcessRequest(HttpContext context)
        {
            string msg = string.Empty;

            if (currentUser == null)
            {
                msg = "登录信息失效，请重新登录";
            }
            else
            {
                string phone = KuaiCard.BLL.User.UserFactory.CurrentMember.Tel;
                string cacheKey = "PHONE_VALID_" + phone;


                string validcode = new Random().Next(10000, 99999).ToString();
                KuaiCard.Cache.WebCache.GetCacheService().AddObject(cacheKey, validcode);

                string smscontext = KuaiCard.BLL.SysConfig.sms_temp_Authenticate;//string.Format("您的验证码是:{0}[{1}]", validcode, KuaiCard.BLL.WebInfoFactory.CurrentWebInfo.Name);
               
                smscontext = smscontext.Replace("{@username}", KuaiCard.BLL.User.UserFactory.CurrentMember.UserName);
                smscontext = smscontext.Replace("{@sitename}", KuaiCard.BLL.WebInfoFactory.CurrentWebInfo.Name);
                smscontext = smscontext.Replace("{@authcode}", validcode);

                string result = KuaiCard.BLL.Tools.SMS.SendSmsWithCheck(phone, smscontext, "");

                if (string.IsNullOrEmpty(result))
                {
                    msg = "true";
                }
                else
                {
                    msg = result;
                }

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