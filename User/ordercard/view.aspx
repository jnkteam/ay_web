<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="view.aspx.cs" Inherits="OriginalStudio.WebUI.User.ordercard.view" Title="卡类订单详情" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
     <h5 class="page-title">卡类订单详情<a href="/user/ordercard/" class="pull-right" style="font-size:10px"><<返回订单列表</a></h5>
    <div class="block-area" id="tableHover">
        <div class="table-responsive overflow">
            <table class="table table-bordered table-hover tile view-table">
                <asp:Repeater ID="rptOrders" runat="server" >
                    <ItemTemplate>
                    <tr>
                        <th class="view-title">平台订单编号</th>
                        <td> <%# Eval("orderid")%></td>
                    </tr>
                    <tr>
                        <th>商户订单编号</th>
                        <td> <%# Eval("userorder")%></td>
                    </tr>
                    <tr>
                        <th>充值卡号</th>
                        <td><%# Eval("cardNo")%></td>
                    </tr>
                    <tr>
                        <th>充值密码</th>
                        <td><%# KuaiCardLib.Text.Strings.Mark(Eval("cardPwd").ToString())%></td>
                    </tr>
                    <tr>
                        <th>充值类型</th>
                        <td><%# Eval("modetypename")%></td>
                    <tr>
                        <th>提交面值</th>
                        <td><%#Eval("refervalue", "{0:f0}")%></td>
                    </tr>
                    <tr>
                        <th>成功面值</th>
                        <td><%#GetViewSuccessAmt(Eval("status"),Eval("realvalue"))%></td>
                    </tr>      
                   <tr>
                        <th>订单状态</th>
                        <td><%#GetViewStatusName(Eval("status"))%></td>
                    </tr>
                    <tr>
                        <th>充值详情</th>
                        <td><%# Eval("msg")%></td>
                    </tr>
                    <tr>
                        <th>回调次数</th>
                        <td><%#Eval("notifycount")%></td>
                    </tr>
                    <tr>
                        <th>下单时间</th>
                        <td><%# Eval("addtime", "{0:yyyy-MM-dd HH:mm:ss}")%></td>
                    </tr>
                    <tr>
                        <th>完成时间</th>
                        <td><%# Eval("completetime", "{0:yyyy-MM-dd HH:mm:ss}")%></td>
                    </tr>     
                    <tr>
                        <th>充值地址</th>
                        <td><a href='<%# Eval("referurl")%>' target='_blank'><%# Eval("referurl")%></a></td>
                    </tr>
                    <tr>
                        <th>手动回调</th>
                        <td><a href='<%# Eval("againNotifyUrl")%>' target='_blank'><%# Eval("againNotifyUrl")%></a></td>
                    </tr>
                </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
 </asp:Content>
