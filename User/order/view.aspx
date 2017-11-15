<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="view.aspx.cs" Inherits="KuaiCard.WebUI.User.order.view" Title="网银订单详情" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">网银订单管理</h1>
        <a  href="/user/order/"  class="back">返回订单列表 &gt;</a>
    </div>
    <div class="main">
        <table class="list-table">
            <asp:Repeater ID="rptOrders" runat="server" >
                <ItemTemplate>
                    <tr>
                        <td class="th">平台订单编号</td>
                        <td><%# Eval("orderid")%></td>
                    </tr>
                    <tr>
                        <td class="th">商户订单编号</td>
                        <td><%# Eval("userorder")%></td>
                    </tr>
                    <tr>
                        <td class="th">支付方式</td>
                        <td><%# Eval("modeName")%></td>
                    </tr>
                    <tr>
                        <td class="th">提交金额</td>
                        <td><em><%#Eval("refervalue", "{0:f0}")%></em></td>
                    </tr>
                    <tr>
                        <td class="th">成功金额</td>
                        <td><em><%#GetViewSuccessAmt(Eval("status"),Eval("realvalue"))%></em></td>
                    </tr>
                    <tr>
                        <td class="th">订单状态</td>
                        <td><span class="state"><%#GetViewStatusName(Eval("status"))%></span></td>
                    </tr>
                    <tr>
                        <td class="th">商家返回</td>
                        <td><%#Enum.GetName(typeof(KuaiCard.Model.Order.OrderStatusEnum), Eval("notifystat"))%> <%#Eval("notifycontext")%></td>
                    </tr>
                    <tr>
                        <td class="th">回调次数</td>
                        <td><%#Eval("notifycount")%></td>
                    </tr>
                    <tr>
                        <td class="th">下单时间</td>
                        <td><%# Eval("addtime", "{0:yyyy-MM-dd HH:mm:ss}")%></td>
                    </tr>
                    <tr>
                        <td class="th">完成时间</td>
                        <td><%# Eval("completetime", "{0:yyyy-MM-dd HH:mm:ss}")%></td>
                    </tr>
                    <tr>
                        <td class="th">充值地址</td>
                        <td><a href='<%# Eval("referurl")%>' target='_blank'><%# Eval("referurl")%></a></td>
                    </tr>
                    <tr>
                        <td class="th">手动回调</td>
                        <td><a href='<%# Eval("againNotifyUrl")%>' target='_blank'><%# Eval("againNotifyUrl")%></a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</asp:Content>
