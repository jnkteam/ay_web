<%@ WebHandler Language="C#" Class="KuaiCard.WebUI.Merchant.Ajax.ModiPwd" %>

using System;
using System.Web;
using System.Web.SessionState; 
using KuaiCardLib;
using KuaiCard.Model;
using KuaiCard.BLL;

namespace KuaiCard.WebUI.Merchant.Ajax
{
    /// <summary>
    /// 修改密码
    /// </summary>
    public class ModiPwd : IHttpHandler, IReadOnlySessionState
    {      
        public void ProcessRequest(HttpContext context)
        {
            string msg = "";
            if (KuaiCard.BLL.User.UserFactory.CurrentMember == null)
            {
                msg = "登录信息失效，请重新登录";
            }
            else
            {
                string email = KuaiCardLib.XRequest.GetString("email");
                string oldpass = KuaiCardLib.XRequest.GetString("oldpass");
                string newpass = KuaiCardLib.XRequest.GetString("newpass");
                string repass = KuaiCardLib.XRequest.GetString("repass");

                if (KuaiCardLib.Security.Cryptography.MD5(oldpass) != KuaiCard.BLL.User.UserFactory.CurrentMember.Password)
                {
                    msg = "旧密码不正确";
                }
                else if (email != KuaiCard.BLL.User.UserFactory.CurrentMember.Email)
                {
                    msg = "邮件地址不正确";
                }
                else if (newpass != repass)
                {
                    msg = "两次密码不一致";
                }
                else if (newpass == oldpass)
                {
                    msg = "新密码不能为新一样";
                }
                if (string.IsNullOrEmpty(msg))
                {
                    KuaiCard.BLL.User.UserFactory.CurrentMember.Password = KuaiCardLib.Security.Cryptography.MD5(newpass);

                    if (KuaiCard.BLL.User.UserFactory.Update(KuaiCard.BLL.User.UserFactory.CurrentMember, null))
                    {
                        msg = "true";
                    }
                    else
                    {
                        msg = "更新失败";
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