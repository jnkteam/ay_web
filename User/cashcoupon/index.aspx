<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.User.cashcoupon.index" Title="修改密码" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <script type="text/javascript" src="/js2.0/lib/laydate/laydate.js"></script>
    <div class="titlebar">
        <h1 class="title">结算记录</h1>
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
            <label class="control-label">状态：</label>
            <select id="fState" runat="server" class="form-control input-sm">
                <option value="-1">全部</option>
                <option value="1">审核中</option>
                <option value="2">支付中</option>
                <option value="4">无效</option>
                <option value="0">已取消</option>
                <option value="8">已支付</option>
            </select>
        </div>
    </div>
    <div class="main m-form query-form">
        <div class="form-group">
            <label class="control-label">结算订单号：</label>
            <input name="okey" type="text" id="trade_no" runat="server" maxlength="30" value="" class="form-control input-lg" />
        </div>
        <div class="form-group">
            <label class="control-label">收款人：</label>
            <input name="okey" type="text" id="accountname" runat="server" maxlength="30" value="" class="form-control input-mg" />
        </div>
        <div class="form-group">
            <label class="control-label">银行卡号：</label>
            <input name="okey" type="text" id="bankaccount" runat="server" maxlength="30" value="" class="form-control input-lg" />
        </div>
        <asp:Button ID="b_search" runat="server" Text="搜索" CssClass="btn btn-primary btn-query" OnClick="b_search_Click" />              
    </div>
    <table class="query-table">
        <thead>
            <tr class="tr-list-head">
                <th>结算订单号</th>
                <th >结算方式</th>
                <th>结算金额</th>
                <th>收款人</th>
                <th>开户行</th>
                <th>银行卡号</th>
                <th>提现状态</th>
                <th>处理时间</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rptDetails" runat="server" OnItemDataBound="rptDetails_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("trade_no") %></td>
                        <td>银行卡</td><td><%#Eval("amount", "{0:f1}")%></td>
                        <td><%# Eval("PayeeName") %></td>
                        <td><%# KuaiCard.BLL.SettledFactory.GetSettleBankName(Eval("PayeeBank").ToString()) %></td>
                        <td><%# Eval("Account").ToString() %></td>
                        <td><%# Enum.GetName(typeof(KuaiCard.Model.SettledStatus), Eval("status")) %></td>
                        <td><%# Eval("paytime", "{0:yyyy-MM-dd HH:mm:ss}") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
    <div class="query-extra">
        <div class="pagination">
            <webdiyer:AspNetPager ID="Pager1" runat="server"  AlwaysShow="True"  CustomInfoHTML="共%PageCount%页/%RecordCount%条"
                CustomInfoTextAlign="Left" FirstPageText="首页" HorizontalAlign="Right" LastPageText="末页"
                NavigationToolTipTextFormatString="跳转{0}页" NextPageText="下一页" PageIndexBoxType="TextBox"
                PageSize="20" PrevPageText="上一页" ShowBoxThreshold="50" 
                    SubmitButtonText="GO&gt;&gt;"
                TextAfterPageIndexBox="页" TextBeforePageIndexBox="跳到" CurrentPageButtonClass="active" 
                OnPageChanged="Pager1_PageChanged"  Width="100%">
            </webdiyer:AspNetPager>
        </div>
        <div class="query-subtotal">
            共有 <%= totalcount %> 笔订单 &nbsp; | &nbsp; 成功订单：<%= successcount %> 笔 &nbsp; | &nbsp; 总成功金额：<%= successamt %> 元 &nbsp; | &nbsp; 总手续费：<%= successcharges%> 元
        </div>
    </div>
</asp:Content>
