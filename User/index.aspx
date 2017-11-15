<%@ Page Title="" Language="C#" MasterPageFile="~/user/MainSite.Master" AutoEventWireup="True" CodeBehind="Index.aspx.cs" Inherits="KuaiCard.WebUI.User.Index" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">商户首页</h1>
    </div>
    <div class="main">
        <div class="index-row">
            <div class="index-col">
                <div class="index-box">
                    <div class="box-hd">
                        <h3 class="box-title"><i class="icon icon-home"></i><asp:Literal ID="LitUserName" runat="server"></asp:Literal></h3>
                    </div>
                    <div class="box-bd">
                        <ul class="m-list index-basic">
                            <li>
                                <asp:Literal ID="litEmai" runat="server" Visible="false"></asp:Literal>
                                <span class="key">商户编号：</span><span class="value"><em class="id"><%=getnid%></em></span>
                            </li>
                            <li>
                                <span class="key">安全手机：</span>
                                <span class="value">
                                    <span id="classshouji" runat="server"  class="state">已绑定</span>
                                    <a id="linshouji" runat="server" class="link">修改</a>
                                </span>
                            </li>
                            <li>
                                <span class="key">安全邮箱：</span>
                                <span class="value">
                                    <span id="classemail" runat="server" class="state">已绑定</span>
                                    <a id="linemail" runat="server" class="link">修改</a>
                                </span>
                            </li>
                            <li>
                                <span class="key">IP绑定：</span>
                                <span class="value">
                                    <% if (gblnBindIP)
                                           { %>
                                        <span class="state">已绑定</span>
                                        <a href="ip/" class="link">修改</a>
                                    <% } else {%>
                                        <span class="state">未绑定</span>
                                        <a href="ip/" class="link">绑定</a>
                                    <% } %>
                                </span>
                            </li>
                            <li>
                                <span class="key">提现密码：</span>
                                <span class="value">
                                    <span  id="classtixian" runat="server" class="state">已绑定</span>
                                    <a id="lintixian" runat="server" href="/user/awalpassword/"  class="link">修改</a>
                                </span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="index-col">
                <div class="index-box">
                    <div class="box-hd">
                        <h3 class="box-title"><i class="icon icon-fund"></i>资金管理</h3>
                    </div>
                    <div class="box-bd">
                        <ul class="m-list index-fund">
                            <li>
                                <em><asp:Literal ID="litbalance" runat="server"></asp:Literal></em> 元 
                                <a href="/User/withdrawal/" class="link">提 现</a>
                                <a href="/User/recharge/" class="link">自动充值</a>								
                            </li>
                            <li>
                                今日订单：<em><%=totalsuccordertotal %></em> 笔 <a href="/user/order/" class="link">查看</a>
                            </li>
                            <li>
                                <a href="/user/withdrawal/">提现</a>
                                <a href="/user/verify/">提现账户</a>
                                <a href="/user/order/">订单管理</a>
                            </li>
                            <li>
                                <a href="/user/money/">收支明细</a>
                                <a href="/user/cashcoupon/">提现记录</a>
                            </li>
                            <li>
                                <a href="/user/api/">API接入</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="index-col">
                <div class="index-box">
                    <div class="box-hd">
                        <h3 class="box-title"><i class="icon icon-team"></i>专席秘书</h3>
                    </div>
                    <div class="box-bd">
                        <ul class="m-list special-secretary">
                            <li>
                                专席秘书：
                                <a href="#" class="btn btn-primary">联 &nbsp; 系</a>
                                <a href="#" class="btn btn-primary">投 &nbsp; 诉</a>
                            </li>
                            <li>Admin-01</li>
                            <li>工号：KF10086</li>
                            <li>客服Skype：<span class="qq">zhifoopay.com</span></li>
                            <li>客  服Q Q：<span class="qq">20630369</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="index-row">
            <div class="index-col col-2">
                <div class="index-box">
                    <div class="box-hd">
                        <h3 class="box-title"><i class="icon icon-stat"></i>产品与统计信息</h3>
                    </div>
                    <div class="box-bd">
                        <ul class="m-list index-stat">
                            <li>
                                <div class="half">
                                    <span class="key">已绑定银行卡：</span><span class="value"><em><%=bankcoe%></em> 张 
                                    <a href="/user/verify/" class="link">查看</a></span>
                                </div>
                                <div class="half">
                                    <span class="key">站内消息未读：</span><span class="value"><em><%=UserMsgCount%></em> 条 
                                    <a href="/user/message/" class="link">查看</a></span>
                                </div>
                            </li>
                            <li>
                                <div class="half">
                                    <span class="key">今日成功订单总数：</span><span class="value"><em><%=totalsuccordertotal %></em> 笔</span>
                                </div>
                                <div class="half">
                                    <span class="key">今日成功总金额：</span><span class="value"><em><%=totalrealvalue %></em> 元</span>
                                </div>
                            </li>
                            <li>
                                <div class="half">
                                    <span class="key">今日网银订单金额：</span><span class="value"><em><%=TodayIncomewangyin%></em> 元</span>
                                </div>
                                <div class="half">
                                    <span class="key">今日QQ钱包充值金额：</span><span class="value"><em><%=TodayIncomeQQ%></em> 元</span>
                                </div>
                            </li>
                            <li>
                                <div class="half">
                                    <span class="key">今日微信充值金额：</span><span class="value"><em><%=TodayIncomeweixin%></em> 元</span>
                                </div>
                                <div class="half">
                                    <span class="key">今日支付宝充值金额：</span><span class="value"><em><%=TodayIncomealipay%></em> 元</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="index-col">
                <div class="index-box">
                    <div class="box-hd">
                        <h3 class="box-title"><i class="icon icon-sound"></i>会员公告</h3>
                    </div>
                    <div class="box-bd">
                        <ul class="m-list notice-list">
                            <asp:Repeater ID="rptNews" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href="#"><span class="time"><%#Eval("addTime", "{0:MM-dd}")%></span><%#Eval("newstitle")%></span></a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="index-row">
            <div class="index-col col-3">
                <div class="index-box">
                    <div class="box-hd">
                        <h3 class="box-title"><i class="icon icon-trend"></i>十日内交易量</h3>
                    </div>
                    <div class="box-bd">
                        <div id="bar-chart" class="main-chart" style="height: 250px"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../js2.0/charts.js" type="text/javascript"></script>
</asp:Content>
