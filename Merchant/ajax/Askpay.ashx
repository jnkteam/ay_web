<%@ WebHandler Language="C#" Class="KuaiCard.WebUI.Merchant.Ajax.Askpay" %>

using System;
using System.Web;
using System.Web.SessionState; 
using KuaiCardLib;
using KuaiCard.Model;
using KuaiCard.BLL;
using KuaiCard.Model.User;
using KuaiCardLib.Security;

namespace KuaiCard.WebUI.Merchant.Ajax
{
    /// <summary>
    /// 
    /// </summary>
    public class Askpay : IHttpHandler, IReadOnlySessionState
    {        
        public UsersAmtInfo _currentUserAmt = null;
        public UsersAmtInfo currentUserAmt
        {
            get
            {
                if (_currentUserAmt == null && KuaiCard.BLL.User.UserFactory.CurrentMember != null)
                {
                    _currentUserAmt = KuaiCard.BLL.User.UsersAmt.GetModel(KuaiCard.BLL.User.UserFactory.CurrentMember.ID);
                }
                return _currentUserAmt;
            }
        }

        public decimal balance
        {
            get
            {
                decimal _balance = 0M;
                if (currentUserAmt != null && currentUserAmt.balance.HasValue)
                {
                    _balance = currentUserAmt.balance.Value;
                }
                return _balance;
            }
        }

        public decimal unpayment
        {
            get
            {
                decimal _unpayment = 0M;
                if (currentUserAmt != null && currentUserAmt.unpayment.HasValue)
                {
                    _unpayment = currentUserAmt.unpayment.Value;
                }
                return _unpayment;
            }
        }
        /// <summary>
        /// 已冻结金额
        /// </summary>
        public decimal Freeze
        {
            get
            {
                decimal _Freeze = 0M;
                if (currentUserAmt != null && currentUserAmt.Freeze.HasValue)
                {
                    _Freeze = currentUserAmt.Freeze.Value;
                }
                return _Freeze;
            }
        }

        /// <summary>
        /// 今日收入
        /// </summary>
        public decimal TodayIncome
        {
            get
            {
                DateTime btime = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd 00:00:00"));
                // DateTime stime =  Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd 23:59:59"));
                return KuaiCard.BLL.Settled.Trade.GetUserIncome(KuaiCard.BLL.User.UserFactory.CurrentMember.ID, btime, DateTime.Now.AddDays(1));
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
                if (!KuaiCard.BLL.SysConfig.isopenCash)
                {
                    msg = KuaiCard.BLL.SysConfig.closecashReason;
                }
                else
                {
                    string payMoneyStr = KuaiCardLib.XRequest.GetString("payMoney");
                    string safepass = KuaiCardLib.XRequest.GetString("safepass");
                    decimal payMoney = 0M;
                    decimal enableAmt = balance - unpayment - Freeze;
                    if (KuaiCard.BLL.User.UserFactory.CurrentMember.Settles == 1)
                    {
                        enableAmt = balance - unpayment - Freeze - TodayIncome; ;
                    }
                    KuaiCard.Model.Settled.TocashSchemeInfo scheme = KuaiCard.BLL.Settled.TocashScheme.GetModelByUser(1,KuaiCard.BLL.User.UserFactory.CurrentMember.ID);
                    if (scheme == null)
                    {
                        msg = "未设置提现方案，请联系客服人员!";
                    }
                    else
                    {
                        if (string.IsNullOrEmpty(payMoneyStr))
                        {
                            msg = "请输入您要提现的金额";
                        }
                        else if (!decimal.TryParse(payMoneyStr, out payMoney))
                        {
                            msg = "请输入您正确的金额";
                        }
                        else if (string.IsNullOrEmpty(safepass))
                        {
                            msg = "请输入您的提现密码";
                        }
                        else if (Cryptography.MD5(safepass) != KuaiCard.BLL.User.UserFactory.CurrentMember.Password2)
                        {
                            msg = "提现密码不正确";
                        }
                        else if (payMoney > enableAmt)
                        {
                            msg = "余额不足,请修改提现金额";
                        }
                        else if (payMoney < scheme.minamtlimitofeach)
                        {
                            msg = "您的提现金额小于最低提现金额限制.";
                        }
                        else if (payMoney > scheme.maxamtlimitofeach)
                        {
                            msg = "您的提现金额大于最大提现金额限制.";
                        }
                        else
                        {
                            int todaytimes = KuaiCard.BLL.SettledFactory.GetUserDaySettledTimes(KuaiCard.BLL.User.UserFactory.CurrentMember.ID,
                                            KuaiCardLib.TimeControl.FormatConvertor.DateTimeToDateString(DateTime.Now));
                            if (todaytimes >= scheme.dailymaxtimes)
                            {
                                msg = "您今天的提现次数已达到最多限制，请明天再试。";
                            }
                            else
                            {
                                decimal todayAmt = KuaiCard.BLL.SettledFactory.GetUserDaySettledAmt(KuaiCard.BLL.User.UserFactory.CurrentMember.ID,
                                            KuaiCardLib.TimeControl.FormatConvertor.DateTimeToDateString(DateTime.Now));

                                if (todayAmt + payMoney >= scheme.dailymaxamt)
                                {
                                    msg = string.Format("您今天的提现将超过最大限额，你最多可以提现{0:f2}", scheme.dailymaxamt - todayAmt);
                                }
                            }
                        }
                    }

                    if (string.IsNullOrEmpty(msg))
                    {
                       KuaiCard.Model.SettledInfo itemInfo = new SettledInfo();
                        itemInfo.addtime = DateTime.Now;
                        itemInfo.amount = payMoney;
                        itemInfo.charges = 0M;
                        itemInfo.paytime = DateTime.Now;
                        itemInfo.status = SettledStatus.审核中;
                        itemInfo.tax = 0M;
                        itemInfo.userid = KuaiCard.BLL.User.UserFactory.CurrentMember.ID;

                        if (KuaiCard.BLL.User.UserFactory.CurrentMember.Settles == 0)
                            itemInfo.AppType = AppTypeEnum.t0;
                        else
                            itemInfo.AppType = AppTypeEnum.t1;

                        itemInfo.PayeeBank = KuaiCard.BLL.User.UserFactory.CurrentMember.PayeeBank;
                        itemInfo.payeeName = KuaiCard.BLL.User.UserFactory.CurrentMember.full_name;
                        itemInfo.Account = KuaiCard.BLL.User.UserFactory.CurrentMember.Account;
                        itemInfo.Paytype = 1;
                        itemInfo.charges = scheme.chargerate * payMoney;
                        if (itemInfo.charges < scheme.chargeleastofeach)
                        {
                            itemInfo.charges = scheme.chargeleastofeach;
                        }
                        else if (itemInfo.charges > scheme.chargemostofeach)
                        {
                            itemInfo.charges = scheme.chargemostofeach;
                        }

                        if (DateTime.Now.Hour > 16)
                        {
                            itemInfo.required = DateTime.Now.AddDays(1);
                        }
                        else
                        {
                            itemInfo.required = DateTime.Now;
                        }
                        if (KuaiCard.BLL.SettledFactory.Apply(itemInfo) > 0)
                        {
                            if (BLL.SysConfig.radioButtonPhone)
                            {
                                string smscontext = KuaiCard.BLL.SysConfig.sms_caiwu_tocash;

                                if (!string.IsNullOrEmpty(smscontext) && !string.IsNullOrEmpty(BLL.SysConfig.textPhone.ToString()))
                                {

                                    smscontext = smscontext.Replace("{@username}", KuaiCard.BLL.User.UserFactory.CurrentMember.UserName);
                                    smscontext = smscontext.Replace("{@settledmoney}", payMoney.ToString("f2"));
                                    smscontext = smscontext.Replace("{@sitename}", KuaiCard.BLL.WebInfoFactory.CurrentWebInfo.Name);

                                    KuaiCard.BLL.Tools.SMS.Send(BLL.SysConfig.textPhone.ToString(), smscontext, "");
                                }
                            }
                            msg = "true";
                            
                        }
                        else
                        {
                            msg = "提现失败";
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