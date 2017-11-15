<%@ Page Language="C#" MasterPageFile="~/User/Site1.Master" AutoEventWireup="True" CodeBehind="content.aspx.cs" Inherits="KuaiCard.WebUI.User.message.content" Title="收款帐号管理" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <style>
    .message-control-button {
      display: inline-block;
      height: 26px;
      margin-left: 16px;
      border: 1px solid #009fd9;
      border-radius: 1px;
      line-height: 26px;
    }
    .title02 .message-control-button {
      *margin-top: -28px;
      padding: 0 18px;
      font-size: 14px;
      color: #009fd9;
    }
    .title02 .message-control-button:hover {
      background-color: #009fd9;
      color: white;
    }
    .title02 .message-control-button-back {
      float: none;
      *margin-top: 0;
      padding-left: 32px;
      background: url(/skin/images/User/Icon/back_blue.png) no-repeat 10px center;
      vertical-align: text-bottom;
    }
    .title02 .message-control-button-back:hover {
      background-image: url(/skin/images/User/Icon/back_white.png);
    }
    .message-panel {
      margin-top: 25px;
      border: 1px solid #dddddd;
    }
    .message-panel-header {
      padding-top: 29px;
      border-bottom: 1px solid #e7e7e7;
      background: #f2f7fa;
      line-height: 1;
      text-align: center;
    }
    .message-panel-header-title {
      font-size: 18px;
      font-weight: normal;
      color: #333534;
    }
    .message-panel-header-time {
      margin: 16px 0;
      font-size: 12px;
      color: #afb0b0;
    }
    .message-panel-body {
      padding: 25px 40px 60px;
      line-height: 1.7;
      font-size: 14px;
      color: #545454;
    }
    .message-panel-body p + p {
      margin-top: 20px;
    }
  </style>

    <td valign="top" class="r">
    <div class="title02">
      站内消息&nbsp;
      <a href="/user/message/" class="message-control-button message-control-button-back">返回</a>
     
    </div>
    
    <div class="clear"></div>
    
    <div class="message-panel">
      <div class="message-panel-header">
        <h2 class="message-panel-header-title">
          <asp:Label ID="lit_content" runat="server"></asp:Label>
        </h2>
        <div class="message-panel-header-time">
         <asp:Label ID="lit_addtime" runat="server"></asp:Label>
        </div>
      </div>
      
      <div class="message-panel-body">
      <asp:Label ID="lit_title" runat="server"></asp:Label>
      </div>
    </div>
    
    
    </td>

</asp:Content>
