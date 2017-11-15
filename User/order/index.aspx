<%@ Page Title="" Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.user.order.index"  %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <script type="text/javascript" src="/js2.0/lib/laydate/laydate.js"></script>
    <div class="titlebar">
        <h1 class="title">网银订单管理</h1>
    </div>
    <div class="main m-form query-form">
        <div class="form-group">
            <label class="control-label">起始日期：</label>
            <input id="sdate" runat="server" type="text" class="form-control laydate" />
        </div>
        <div class="form-group">
            <label class="control-label">截止日期：</label>
            <input id="edate" runat="server" type="text" class="form-control laydate"/>
        </div>
        <div class="form-group">
            <label class="control-label">通道类型：</label>
            <select id="channelId" runat="server" class="form-control input-sm">
                <option value="0">所有通道</option>
                <option value="102">在线银行</option>
                <option value="101">支付宝</option>
                <option value="100">财付通</option>
                <option value="99">微信</option>
            </select>
        </div>
        <div class="form-group">
            <label class="control-label">订单状态：</label>
            <select name="Success" id="Success" runat="server" class="form-control input-sm">
                <option value="0" selected="selected">所有</option>
                <option value="2">成功</option>
                <option value="4">失败</option>
                <option value="1">处理中</option>
            </select>
        </div>
        <div class="form-group">
            <label class="control-label">下发状态：</label>
            <asp:DropDownList ID="ddlNotifyStatus" runat="server" class="form-control input-sm">
                <asp:ListItem>所有</asp:ListItem>
                <asp:ListItem Value="1">处理中</asp:ListItem>
                <asp:ListItem Value="2">已成功</asp:ListItem>
                <asp:ListItem Value="4">失败</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="main m-form query-form">
        <div class="form-group">
            <label class="control-label">其他：</label>
            <select id="select_field" runat="server"  class="form-control input-sm">
                <option value="1">商户订单号</option>
                <option value="3">系统订单号</option>				
            </select>
        </div>
        <div class="form-group">
            <label class="control-label">订单号：</label>
            <input name="okey" type="text" id="okey" runat="server" maxlength="30" value="" class="form-control input-lg" />
        </div>
        <asp:Button ID="b_search" runat="server" Text="搜索" CssClass="btn btn-primary btn-query" OnClick="b_search_Click" />
    </div>
    <table class="query-table">
        <thead>
            <tr class="tr-list-head">
                <th>系统订单</th>
                <th>商户订单</th>
                <th>支付方式</th>
                <th>提交金额（元）</th>
                <th>成功金额（元）</th>
                <th>订单状态</th>
                <th>回调状态</th>
                <th>提交时间</th>
                <th>详情</th>
            </tr>
        </thead>
        <tbody>
        <asp:Repeater ID="rptOrders" runat="server" OnItemDataBound="rptDetails_ItemDataBound">
            <ItemTemplate>
                <tr>
                    <td><%# Eval("orderid")%></td>
                    <td><%# Eval("userorder")%></td>
                    <td><%# Eval("modeName")%></td>
                    <td><em><%# Eval("refervalue", "{0:f0}")%></em></td>
                    <td><em><%#GetViewSuccessAmt(Eval("status"),Eval("realvalue"))%></em></td>
                    <td><%#GetViewStatusName(Eval("status"))%></td>
                    <td><%# Enum.GetName(typeof(KuaiCard.Model.Order.OrderNofityStatusEnum), Eval("notifystat"))%></td>
                    <td><%# Eval("addtime", "{0:yyyy-MM-dd HH:mm:ss}")%></td>
                    <td><a href="/user/order/view.aspx?orderid=<%#Eval("orderid")%>">&laquo; 查看</a></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        </tbody>
    </table>
    <div class="query-extra">
        <div class="pagination">
                <webdiyer:AspNetPager ID="Pager1" runat="server"  AlwaysShow="True" CustomInfoHTML="共%PageCount%页/%RecordCount%条"
                    CustomInfoTextAlign="Left" FirstPageText="首页" HorizontalAlign="Right" LastPageText="末页"
                    NavigationToolTipTextFormatString="跳转{0}页" NextPageText="下一页" PageIndexBoxType="TextBox"
                    PageSize="20" PrevPageText="上一页" ShowBoxThreshold="50"  SubmitButtonText="GO&gt;&gt;"
                    TextAfterPageIndexBox="页" TextBeforePageIndexBox="跳到" CurrentPageButtonClass="active"
                    PageIndexBoxClass="col-md-1"
                    OnPageChanged="Pager1_PageChanged" Width="100%">
                </webdiyer:AspNetPager>
        </div>
        <div class="query-subtotal">
            共有 <%=totalordertotal%> 笔订单 &nbsp; | &nbsp; 成功订单：<%= totalsuccordertotal%> 笔 &nbsp; | &nbsp; 总成功金额：<%=totalrealvalue%> 元
        </div>
    </div>
</asp:Content>