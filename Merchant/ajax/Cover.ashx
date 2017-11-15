<%@ WebHandler Language="C#" Class="KuaiCard.WebUI.Merchant.Ajax.Cover" %>

using System;
using System.Web;
using System.Web.SessionState; 
using KuaiCardLib;
using KuaiCard.Model;
using KuaiCard.BLL;

namespace KuaiCard.WebUI.Merchant.Ajax
{
    /// <summary>
    /// 
    /// </summary>
    public class Cover : IHttpHandler, IReadOnlySessionState
    {
        /// <summary>
        /// 站点名称
        /// </summary>
        public bool isnew
        {
            get
            {
                return string.IsNullOrEmpty(KuaiCard.BLL.User.UserFactory.CurrentMember.question);
            }
        }       

        public void ProcessRequest(HttpContext context)
        {
            string msg = "";
            if (KuaiCard.BLL.User.UserFactory.CurrentMember == null)
            {
                msg = "登录信息失效，请重新登录";
            }
            else
            {
                string action = KuaiCardLib.XRequest.GetString("action");
                string newques = KuaiCardLib.XRequest.GetString("newques");
                string newans = KuaiCardLib.XRequest.GetString("newans");
                string oldans = KuaiCardLib.XRequest.GetString("oldans");

                if (!isnew)
                {
                    if (oldans != KuaiCard.BLL.User.UserFactory.CurrentMember.answer)
                    {
                        msg = "问题答案不对";
                    }
                }                
                if (string.IsNullOrEmpty(newques))
                {
                    msg = "新问题为空";
                }
                else if (string.IsNullOrEmpty(newans))
                {
                    msg = "新问题为空";
                }
                if (string.IsNullOrEmpty(msg))
                {
                    KuaiCard.BLL.User.UserFactory.CurrentMember.question = newques;
                    KuaiCard.BLL.User.UserFactory.CurrentMember.answer = newans;

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