<%@ Page Title="" Language="C#" MasterPageFile="~/user/Site1.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.User.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <td valign="top" class="r">


      <!--改动-->
        <table class="Index_card">
          <tr>
            <td style="width:65px;"><div class="em"></div></td>
            <td width="32%">
                <div class="Contact">
                    <dl class="overflow-visible">
                        <dt class="overflow-visible">
                            <div id= "nameclass" runat="server" >
                                <span class="abbr">
                                    <span class="color_fei">Hi, </span>
                                    <span class="color_shenn"><asp:Literal ID="LitUserName" runat="server"></asp:Literal></span>

                                    <span class="auth-show">
                                      <span class="auth-icon auth-icon-v">
                                        <span class="auth-tip">
                                          <span class="auth-tip-content">
                                            <span class="auth-tip-ok"><a href="/user/verify/" title="您还没有进行实名认证">立即认证！</a></span>
                                          </span>
                                          <span class="auth-tip-corner"><span class="auth-tip-corner-inner"></span></span>
                                        </span>
                                        <a href="/user/realname/" class="auth-icon-v-link" title="已认证，认证类型：<%=LitLleixing %>" ></a>
                                      </span>
                                     
                            </span>
                            <span class="auth-btn"><a href="/user/realname/" class="Annkeld">立即认证</a></span>
                            </div>
                            <div class="Bz"><span class="ju">认证邮箱:&nbsp;<span class="color_ju"><asp:Literal ID="litEmai" runat="server"></asp:Literal></span>&nbsp;&nbsp;&nbsp;<span class="ju">商户ID:&nbsp;&nbsp;&nbsp;<span class="color_ju"><%=getnid%></span></div>
                        </dt>
                        <dd>
                            <ul class="aul">
                                <li>安全手机：<span id="classshouji" runat="server" >已绑定</span><a  class="Mleft20 color_tiann" id="linshouji" runat="server">修改</a></li>
                                <li class="a">安全邮箱：<span id="classemail" runat="server">已绑定</span><a class="Mleft20 color_tiann" id="linemail" runat="server">修改</a></li>
                               <li class="b">实名认证：<span id="shiming" runat="server">已认证</span><a class="Mleft20 color_tiann" id="shimingtext" runat="server">修改</a></li>
                                <li class="c">提现密码：<span id="classtixian" runat="server" >已绑定</span><a href="/user/awalpassword/" class="Mleft20 color_tiann" id="lintixian" runat="server">修改</a></li>
                            </ul>
                        </dd>
                    </dl>
                </div>
            </td>
            <td style="width:2%;">&nbsp;</td>
            <td style="width:65px;"><div class="em Money"></div></td>
            <td width="32%">
                <div class="Contact">
                    <dl>
                        <dt>
                            <div class="Ti change">
                                
                                <span class="abbr" ><asp:Literal ID="litbalance" runat="server"></asp:Literal>元</span>
                                <span class="ju"><%--<a href="/user/payment/" class="Annkeld">充 值</a>--%><a href="/User/withdrawal/" class="Annkele">提 现</a></span></span>
                            </div>
                            <div class="Bz changea" id="Span1" runat="server">今日订单：<%=totalsuccordertotal %> 笔<span class="ju"><a href="/user/order/" class="color_tiann">查看</a></span></div>
                        </dt>
                        <dd>
                            <ul class="bul Mtop20">
                                <li><a href="/user/withdrawal/">提现</a></li>
                                <li><a href="/user/verify/">提现账户</a></li>
                                <li class="w"><a href="/user/order/">订单管理</a></li>
                            </ul>
                            <div class="Scfdh0"></div>
                            <ul class="bul">
                                <li><a href="/user/money/">收支明细</a></li>
                                <li><a href="/user/cashcoupon/">提现记录</a></li>
                                <li><a href="/user/api/">API接入</a></li>
                                <li class="w"><a href="/user/userrate//">商家费率</a></li>
                            </ul>
                        </dd>
                    </dl>
                </div>
            </td>
            <td style="width:2%;">&nbsp;</td>
            <td style="width:65px;"><div class="em overcome"></div></td>
            <td width="32%">
                
                <div class="Contact">
                    <dl>
                        <dt>
                            <div class="Ti niaoyunicon change">
                                <span class="abbr Pleft50">专席秘书</span>
                                <span class="ju"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=800808089&site=爱扬网络&menu=yes" class="Annkeld">联 系</a><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=800808089&site=爱扬网络&menu=yes"class="Annkele">投 诉</a></span>
                            </div>
                            <div class="Zsname Bz Pleft50 changea"><%=businessname %><span style="font-size:12px;color:#999;padding-left:20px"></span></div>
                        </dt>
                        <dd>
                            <ul class="cul Pleft50">
                                <li>工号：KF10086</li>
                                <li>Q Q：<span class="color_tiann">800808089</span></li>
                                <li>电话：0535-3202999</li>
                            </ul>
                        </dd>
                    </dl>
                </div>
            </td>
          </tr>
          <tr>
            <td colspan="8" style=" height:25px;">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" valign="top">
                <dl class="dl_1">
                    <dt>
                        <div class="Dt_1">&nbsp;产品与统计信息</div>
                    </dt>
                    <dd>

                        

                        <div class="Dt_0">
                        
                            <div class="Bpwen1 ico7"><span>已绑定银行卡：(<%=bankcoe%>)张</span><a href="/user/verify/">查看</a></div>
                            <div class="Bpwen1 ico8"><span>站内消息未读：(<%=getmsgcount %>)条</span><a href="/user/message/">查看</a></div>
                            
                            <div class="Bpwen1 ico1"><span>今日成功订单总数：<%=totalsuccordertotal %>笔</span></div>
                            <div class="Bpwen1 ico2"><span>今日成功总金额：<%=totalrealvalue %>元</span></div>
                            
                            <div class="Bpwen1 ico3"><span>今日网银订单金额：<%=TodayIncomewangyin%>元</span></div>
                            <div class="Bpwen1 ico4"><span>今日QQ钱包充值金额：<%=TodayIncomeQQ%>元</span></div>

                            <div class="Bpwen2 ico5"><span>今日微信充值金额：<%=TodayIncomeweixin%>元</span></div>
                            <div class="Bpwen2 ico6"><span>今日支付宝充值金额：<%=TodayIncomealipay%>元</span></div>

                            <div class="Scfdh0"></div>
                        </div>
                    </dd>
                    <dd class="Dd">
                        <div class="Dd_1"></div>
                        <div class="Dd_2"></div>
                        <div class="Dd_3"></div>
                    </dd>
                </dl>
            </td>
            <td>&nbsp;</td>
            <td colspan="2" valign="top">

                <dl class="dl_2">
                    <dt>
                        <div class="Dt_1">会员公告</div>
                        <div class="Dt_3"><a class="color_tiann">更多</a></div>
                    </dt>
                    <dd>
                        <div class="Dt_0">
                            <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                                   <div class="Bpwen1">
                                        <%#Eval("newstitle")%></a>
                                        <span>
                                            <%#Eval("addTime", "{0:MM-dd}")%></span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                           
                        </div>
                    </dd>
                    <dd class="Dd">
                        <div class="Dd_1"></div>
                        <div class="Dd_2"></div>
                        <div class="Dd_3"></div>
                    </dd>
                </dl>
            </td>
          </tr>
        </table>
        <!--结束-->
 
    </td>

</asp:Content>
