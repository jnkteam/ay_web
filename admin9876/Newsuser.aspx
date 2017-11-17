<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Newsuser"
    CodeBehind="Newsuser.aspx.cs" %>

<!-----------------header---------------->
 <!-- #include file="./Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="./Left.aspx" -->
<!-----------------left------------------>

<style type="text/css">
table { FONT-WEIGHT:normal;line-height:170%;FONT-FAMILY:Arial}
A:link {COLOR:#237C04;TEXT-DECORATION: none;}
td {    padding: 8px;
        line-height: 1.42857143;

        border-top: 1px solid #ddd;
        font-size: 14px;
        overflow: hidden;
        word-break: break-all;
        word-wrap: break-word; }
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
.td1 {    padding：5px;
          color: #3e3e3e;
          background: #ffffff;
          width: 35%;}
.td2 {padding-right: 10px;
          padding-left: 8px;
          padding-top: 8px;
          color: #333;
          font-size: 14px;
          font-weight: 400;
          background: #e8eaee;
          text-align: right;
          width: 15%;}
input {
           padding: 6px 12px;
           font-size: 14px;
           line-height: 1.42857143;
           color: #555;
           background-color: #fff;
           background-image: none;
           border: 1px solid #ccc;
           }
label{font-weight: 400; margin-right: 2px;}
.lable { border:1px solid #999;padding:3px;font:12px tahoma;ling-height:16px;}
select { border:1px solid #999;padding:3px;margin-left:3px;font:12px tahoma;ling-height:16px}

#nav LI A.noncurrent {/*border:#DC171E 3px solid;*/}
#nav UL {PADDING-BOTTOM: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; PADDING-TOP: 0px}
#nav LI {DISPLAY: inline; padding-left:10px;}
#nav LI a:hover {border:#B6E000 1px solid;}
#nav li A:visited {border:#ff0000 1px solid;}
img{border:#CCCCCC 1px solid;padding:0 5px}
#tplPreview {
position: absolute;
top:0px;
left:0px;
background:#ffffff;
border:1px solid #333;
font-size:12px;
color:#4B4B4B;
padding:12px 15px 15px 15px;}
.form-group input{
width: 13px;
height: 13px;
color:#0e76a8;
position:relative;
top:2px;
}
.td1 input{
position: relative;
top:2px;
}
.rbl-asp td{
border: none;
}
.btn-danger{
height: 40px;
color: #fff;
border: none;
}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        增加商户
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">



    <form id="form1" runat="server">

    <table width="100%" border="0" cellspacing="1" cellpadding="3">
        <tr>
            <td class="td2">
                签约属性
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
                商户账号
            </td>
            <td width="90%" colspan="3" class="td1">
                <asp:TextBox ID="txtName" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                密码
            </td>
            <td colspan="3" class="td1">
                <asp:TextBox ID="pwd" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                邮箱
            </td>
            <td colspan="3" class="td1">
                <asp:TextBox ID="email" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                手机
            </td>
            <td colspan="3" class="td1">
                <asp:TextBox ID="shouji" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                QQ
            </td>
            <td colspan="3" class="td1">
                <asp:TextBox ID="qq" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <style>
        .form-control{
        width: 227px !important;
        }
</style>
        <tr>
            <td class="td2">
                真实姓名
            </td>
            <td class="td1">
                <asp:TextBox ID="txtfullname" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                网站
            </td>
            <td colspan="3" class="td1">
                <asp:TextBox ID="TextBox2" runat="server" Width="227px"></asp:TextBox>
            </td>
        </tr>
        <tr>
        <td class="td2">
                    所属业务员</td>
                <td class="td1">
                    <asp:DropDownList ID="ddlmange" class="form-control" runat="server" Width="227px" ></asp:DropDownList>
                    <asp:TextBox ID="txtGetPromSuperior" runat="server" Width="227px" Visible="false"></asp:TextBox>
                </td>
         </tr>
         <tr>
             <td class="td2">
                    所属代理</td>
                <td class="td1">
                   <asp:DropDownList ID="ddlagents" runat="server" class="form-control" AutoPostBack="true" Width="227px" ></asp:DropDownList>
                </td>
        </tr>
        <tr>
            <td class="td2">
                是否开通
            </td>
            <td class="td1">
                <asp:DropDownList ID="ddlStatus" class="form-control" runat="server" Width="227px">
                </asp:DropDownList>
            </td>
        </tr>
      
        <tr>
            <td class="td2">
                认证信息
            </td>
            <td class="td1" colspan="5" style="width: 100%">
                <asp:CheckBox ID="cb_isRealNamePass" runat="server" Text="实名认证" />
                &nbsp;<asp:CheckBox ID="cb_isEmailPass" runat="server" Text="邮件认证" />
                &nbsp;<asp:CheckBox ID="cb_isPhonePass" runat="server" Text="手机认证" />
            </td>
        </tr>
         <tr>

            <td class="td1" colspan="5"  style="width: 100%">
                <asp:Button ID="Button1" runat="server" CssClass="button btn  btn-danger" Text="提交" onclick="Button1_Click" />
            </td>
        </tr>
    </table>
    </form>
    </section>
    </div>


<!-----------------footer------------------>
 <!-- #include file="./Footer.aspx" -->
<!-----------------footer------------------>
