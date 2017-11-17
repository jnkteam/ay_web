<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="OriginalStudio.WebUI.User.Api.index" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">技术开发资料</h1>
    </div>
    <div class="main m-form tabular-form">
        <div class="form-group">
            <label class="control-label">商户ID</label>
            <div class="form-static">1631</div>
        </div>
        <div class="form-group">
            <label class="control-label">商户密钥</label>
            <a href="open.aspx" class="btn btn-primary expand-key">展开密钥</a>
            <a href="modify.aspx" class="btn btn-primary modify-key">修改密钥</a>
            <div class="form-warning">为了资金安全,请勿向第三方泄露密钥,如需修改请联系商务</div>
        </div>
        <div class="document-example">
            <i class="icon icon-doc"></i>
            <h3>技术开发文档例</h3>
            <p>提供面向本站发起API支付的相关技术参数,接入说明等</p>
            <a href="/user/api/Demo.zip" class="btn btn-primary btn-download">点击下载</a>
        </div>
        <asp:Label ID="userid" runat="server"  Visible="false"></asp:Label>
        <asp:Label ID="userkey" runat="server"  Visible="false"></asp:Label>
    </div>
</asp:Content>
