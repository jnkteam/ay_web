<%@ WebHandler Language="C#" Class="KuaiCard.WebUI.Merchant.Ajax.CashPass" %>

using System;
using System.Web;
using System.Web.SessionState; 
using KuaiCardLib;
using KuaiCard.Model;
using KuaiCard.BLL;

namespace KuaiCard.WebUI.Merchant.Ajax
{
    /// <summary>
    /// 提现密码
    /// </summary>
    public class CashPass : IHttpHandler, IReadOnlySessionState
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context)
        {
            string msg = "";
            if (KuaiCard.BLL.User.UserFactory.CurrentMember == null)
            {
                msg = "登录信息失效，请重新登录";
            }
            else
            {
                string loginpass = KuaiCardLib.XRequest.GetString("loginpass");
                string email = KuaiCardLib.XRequest.GetString("email");
                string newpass = KuaiCardLib.XRequest.GetString("newpass");
                string repass = KuaiCardLib.XRequest.GetString("repass");

                if (KuaiCardLib.Security.Cryptography.MD5(loginpass) != KuaiCard.BLL.User.UserFactory.CurrentMember.Password)
                {
                    msg = "密码不正确";
                }
                if (email != KuaiCard.BLL.User.UserFactory.CurrentMember.Email)
                {
                    msg = "邮件地址不正确";
                }
                if (newpass != repass)
                {
                    msg = "两次密码不一致";
                }
                if (string.IsNullOrEmpty(msg))
                {
                    KuaiCard.BLL.User.UserFactory.CurrentMember.Password2 = KuaiCardLib.Security.Cryptography.MD5(newpass);
                    if (KuaiCard.BLL.User.UserFactory.CurrentMember.Password2 == KuaiCard.BLL.User.UserFactory.CurrentMember.Password)
                    {
                        msg = "登录密码与提现密码不能相同";
                    }
                    else
                    {
                        if (KuaiCard.BLL.User.UserFactory.Update(KuaiCard.BLL.User.UserFactory.CurrentMember, null))
                        {
                            msg = "true";
                        }
                        else
                        {
                            msg = "更新失败";
                        }
                    }
                }
                context.Response.ContentType = "text/plain";
                context.Response.Write(msg);
            }
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