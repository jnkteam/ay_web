<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="list.aspx.cs" Inherits="OriginalStudio.WebUI.User.IP.list" Title="" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">绑定IP列表</h1>
    </div>
    <div class="main m-form tabular-form">
    <table class="query-table">
        <thead>
            <tr class="tr-list-head">
                <th>序号</th>
                <th>IP地址</th>
                <th>IP类型</th>
                <th>绑定日期</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
        <asp:Repeater ID="rptIPList" runat="server" OnItemCommand="rptIPList_ItemCommand">
            <ItemTemplate>
                <tr>
                    <td><%# Eval("id")%></td>
                    <td><asp:Label ID="lblip" runat="server" Text='<%# getMarkStr(Convert.ToString(DataBinder.Eval(Container.DataItem, "ip"))) %>' ></asp:Label></td>
                    <td><%# Eval("ip_type_desc")%></td>
                    <td><%# Eval("bind_date", "{0:yyyy-MM-dd HH:mm:ss}") %></td>                    
                    <td><asp:LinkButton ID="lkbtn" runat="server" CommandArgument='<%#Eval("id") %>'  CommandName="delete" >删除</asp:LinkButton></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        </tbody>
    </table>        
    </div>
</asp:Content>