<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.User.mobile.index" Title="修改绑定手机" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">修改绑定手机</h1>
    </div>
    <div class="main m-form tabular-form">
        <div class="form-group">
            <label class="control-label">当前手机号码</label>
            <div class="form-static"><asp:Label ID="usertel" runat="server"></asp:Label></div>
        </div>
        <div class="form-group">
            <label class="control-label">验证方式</label>
            <select class="form-control">
                <option value='mobilecode'>短信验证码</option>
            </select>
        </div>
        <div class="btn-group">
            <button type="submit" class="btn btn-primary">下一步</button>
        </div>
    </div>
</asp:Content>
