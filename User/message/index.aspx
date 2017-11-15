<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.User.message.index"%>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">站内消息</h1>
    </div>
    <div class="main m-form query-form">
        <table class="query-table">
            <thead>
                <tr class="tr-list-head">
                    <th>标题</th>
                    <th>发送时间</th>
                    <th>详情</th>
                </tr>
            </thead>
            <tbody>
            <asp:Repeater ID="msg_data" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("msg_title")%></td>
                        <td><%# Eval("msg_addtime", "{0:yyyy-MM-dd HH:mm:ss}")%></td>
                        <td><a href="/user/message/content.aspx?id=<%# Eval("id")%>">查看</a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            </tbody>
            <asp:Repeater ID="msg_unread_data" runat="server" Visible="false"></asp:Repeater>
            <webdiyer:AspNetPager ID="PagerUnRead" runat="server" Visible="false"></webdiyer:AspNetPager>
            <asp:Repeater ID="msg_read_data" runat="server" Visible="false"></asp:Repeater>
            <webdiyer:AspNetPager ID="PagerRead" runat="server" Visible="false"></webdiyer:AspNetPager>
        </table>
        <div class="query-extra">
            <div class="pagination">
                <webdiyer:AspNetPager ID="PagerAll" runat="server"  AlwaysShow="True" CustomInfoHTML="共%PageCount%页/%RecordCount%条"
                            CustomInfoTextAlign="Left" FirstPageText="首页" HorizontalAlign="Right" LastPageText="末页"
                            NavigationToolTipTextFormatString="跳转{0}页" NextPageText="下一页" PageIndexBoxType="TextBox"
                            PageSize="20" PrevPageText="上一页" ShowBoxThreshold="50"  SubmitButtonText="GO&gt;&gt;"
                            TextAfterPageIndexBox="页" TextBeforePageIndexBox="跳到" CurrentPageButtonClass="active"
                            PageIndexBoxClass="col-md-1"
                            OnPageChanged="PagerRead_PageChanged" Width="100%">
                </webdiyer:AspNetPager>
            </div>
        </div>
    </div>
</asp:Content>
