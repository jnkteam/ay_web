<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="OriginalStudio.WebUI.User.money.index" Title="修改密码" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <script type="text/javascript" src="/js2.0/lib/laydate/laydate.js"></script>
    <div class="titlebar">
        <h1 class="title">收支明细</h1>
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
            <asp:DropDownList ID="ddlChannelType" runat="server" class="form-control input-sm">
                <asp:ListItem Value="">--所有方式--</asp:ListItem>
                <asp:ListItem Value="102">网银</asp:ListItem>
                <asp:ListItem Value="101">支付宝</asp:ListItem>
                <asp:ListItem Value="99">微信</asp:ListItem>
                <asp:ListItem Value="100">财付通</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:Button ID="b_search" runat="server" Text="搜索" CssClass="btn btn-primary btn-query" OnClick="b_search_Click" />
    </div>
    <table class="query-table">
        <thead>
            <tr>
                <th>序号</th>
                <th>日期</th>
                <th>通道</th>
                <th>充值金额</th>
                <th>提成比例</th>
                <th>条数</th>
                <th>实际到账</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rptOrders" runat="server" >
                <ItemTemplate>
                    <tr>
                        <td><%#((Pager1.CurrentPageIndex-1)*20)+Container.ItemIndex +1%></td>
                        <td><%#Eval("mydate")%></td>
                        <td><%#Eval("modetypename")%></td>
                        <td><%#Eval("faceValue","{0:f2}")%></td>
                        <td><%#Eval("payrate", "{0:p2}")%></td>
                        <td><%#Eval("s_num")%></td>
                        <td><%#Eval("sumpay","{0:f2}")%></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
    <div class="query-extra">
        <div class="pagination">
            <webdiyer:AspNetPager CssClass="pagination" ID="Pager1" runat="server"  CustomInfoHTML="共%PageCount%页/%RecordCount%条"
                CustomInfoTextAlign="Left" FirstPageText="首页" HorizontalAlign="Right" LastPageText="末页"
                NavigationToolTipTextFormatString="跳转{0}页" NextPageText="下一页" PageIndexBoxType="TextBox"
                PageSize="20" PrevPageText="上一页" ShowBoxThreshold="50" 
                    SubmitButtonText="GO&gt;&gt;"
                TextAfterPageIndexBox="页" TextBeforePageIndexBox="跳到" CurrentPageButtonClass="active" 
                OnPageChanged="Pager1_PageChanged" 
                    PageIndexBoxClass="Pager1_input" Width="100%">
            </webdiyer:AspNetPager>
        </div>
        <div class="query-subtotal">
            订单条数总计：<%=totalordercount%> 条 &nbsp; | &nbsp; 金额总计：<%= totalfaceValue %> 元 &nbsp; | &nbsp; 实际入款：<%=totalsumpay%> &nbsp; | &nbsp; 手续费总计：<%=totalchargeValue%>
        </div>
    </div>
</asp:Content>
