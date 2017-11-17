<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="content.aspx.cs" Inherits="OriginalStudio.WebUI.User.message.content" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title"><a href="/user/message/" class="pull-right" style="font-size:10px"><<返回站内消息</a></h1>
    </div>
    <div class="main">
        <table class="list-table">
            <tr>
                <td class="th">标题</td>
                <td><asp:Label ID="lit_title" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="th">时间</td>
                <td><asp:Label ID="lit_addtime" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="th">内容</td>
                <td><asp:Label ID="lit_content" runat="server"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>
