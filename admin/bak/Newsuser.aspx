<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Newsuser"
    CodeBehind="Newsuser.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>增加商户</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="style/admin.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        table
        {
            font-weight: normal;
            line-height: 170%;
            font-family: Arial;
        }
        A:link
        {
            color: #237C04;
            text-decoration: none;
        }
        td
        {
            height: 20px;
            line-height: 20px;
            font-size: 12px;
            padding: 0px;
        }
        .td_title, th
        {
            height: 20px;
            line-height: 22px;
            font-weight: bold;
            border: 0px solid #fff;
            text-align: left;
        }
        .td1
        {
            padding-right: 3px;
            padding-left: 3px;
            color: #999999;
            padding-bottom: 0px;
            padding-top: 5px;
            height: 25px;
        }
        .td2
        {
            padding-right: 3px;
            padding-left: 8px;
            padding-top: 5px;
            color: #083772;
            background: #EFF3FB;
            font-size: 12px;
            text-align: right;
            width: 35%;
        }
        .td3
        {
            padding: 1px 1px 0 0px;
            color: #083772;
            background: #EFF3FB;
            font-size: 12px;
            text-align: center;
        }
        .moban
        {
            padding-top: 0px;
            border: 0px;
        }
        input
        {
            border: 1px solid #999;
            padding: 3px;
            margin-left: 10px;
            font: 12px tahoma;
            ling-height: 16px;
        }
        .input4
        {
            border: 1px solid #999;
            padding: 3px;
            margin-left: 10px;
            font: 11px tahoma;
            ling-height: 16px;
            height: 45px;
        }
        .button
        {
            color: #135294;
            border: 1px solid #666;
            height: 21px;
            line-height: 21px;
        }
        .nrml
        {
            background-color: #eeeeee;
            font-weight: bold;
        }
        .radio
        {
            border: none;
        }
        .checkbox
        {
            border: none;
        }
        .addnew
        {
            font-size: 12px;
            color: #FF0000;
        }
        a.servername
        {
            height: 470px;
            width: 527px;
            color: #E54202;
            cursor: hand;
        }
        .current
        {
            border: #ff6600 1px solid;
        }
        a:hover
        {
            height: 470px;
            width: 527px;
            color: #E54202;
            cursor: hand;
        }
        #nav LI A.noncurrent
        {
            /*border:#DC171E 3px solid;*/
        }
        #nav UL
        {
            padding-bottom: 0px;
            padding-left: 5px;
            padding-right: 5px;
            padding-top: 0px;
        }
        #nav LI
        {
            display: inline;
            padding-left: 10px;
        }
        #nav LI a:hover
        {
            border: #B6E000 1px solid;
        }
        #nav li A:visited
        {
            border: #ff0000 1px solid;
        }
        img
        {
            border: #CCCCCC 1px solid;
            padding: 0 5px;
        }
        #tplPreview
        {
            position: absolute;
            top: 0px;
            left: 0px;
            background: #ffffff;
            border: 1px solid #333;
            font-size: 12px;
            color: #4B4B4B;
            padding: 12px 15px 15px 15px;
        }
    </style>
</head>
<body class="todaybody">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellspacing="1" cellpadding="3">
        <tr>
            <td colspan="4" style="font-weight: bold; font-size: 14px; background: url(style/images/topbg.gif) repeat-x;
                color: teal; height: 28px">
                增加商户
            </td>
        </tr>
        <tr>
            <td class="td2">
                签约属性：
            </td>
            <td class="td1">
                &nbsp;<asp:RadioButtonList ID="rbuserclass" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Flow">
                    <asp:ListItem Value="0" Selected >个人</asp:ListItem>
                    <asp:ListItem Value="1">企业</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
          
        <tr>
            <td width="10%" class="td2">
                商户账号：
            </td>
            <td width="90%" colspan="3" class="td1">
                <asp:TextBox ID="txtName" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                密码：
            </td>
            <td colspan="3" class="td1">
                <asp:TextBox ID="pwd" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                邮箱：
            </td>
            <td colspan="3" class="td1">
                <asp:TextBox ID="email" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                手机：
            </td>
            <td colspan="3" class="td1">
                <asp:TextBox ID="shouji" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                QQ：
            </td>
            <td colspan="3" class="td1">
                <asp:TextBox ID="qq" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                真实姓名：
            </td>
            <td class="td1">
                <asp:TextBox ID="txtfullname" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                网站：
            </td>
            <td colspan="3" class="td1">
                <asp:TextBox ID="TextBox2" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <tr>
        <td class="td2">
                    所属业务员：</td>
                <td class="td1">
                    <asp:DropDownList ID="ddlmange" runat="server" ></asp:DropDownList>
                    <asp:TextBox ID="txtGetPromSuperior" runat="server" Width="200px" Visible="false"></asp:TextBox>
                </td>
         </tr>
         <tr>
             <td class="td2">
                    所属代理：</td>
                <td class="td1">
                   <asp:DropDownList ID="ddlagents" runat="server" AutoPostBack="true" ></asp:DropDownList>
                </td>
        </tr>
        <tr>
            <td class="td2">
                是否开通 ：
            </td>
            <td class="td1">
                <asp:DropDownList ID="ddlStatus" runat="server" Width="150px">
                </asp:DropDownList>
            </td>
        </tr>
      
        <tr>
            <td class="td2">
                认证信息 ：
            </td>
            <td class="td1" colspan="5" style="width: 100%">
                <asp:CheckBox ID="cb_isRealNamePass" runat="server" Text="实名认证" />
                &nbsp;<asp:CheckBox ID="cb_isEmailPass" runat="server" Text="邮件认证" />
                &nbsp;<asp:CheckBox ID="cb_isPhonePass" runat="server" Text="手机认证" />
            </td>
        </tr>
         <tr>
            <td class="td2">
               
            </td>
            <td class="td1" colspan="5" style="width: 100%">
                <asp:Button ID="Button1" runat="server" Text="提交" onclick="Button1_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
