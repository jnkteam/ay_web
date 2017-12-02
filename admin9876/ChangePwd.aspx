<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.ChangePwd" Codebehind="ChangePwd.aspx.cs" %>

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
.td1 {    padding：5px;
          color: #3e3e3e;
          width: 35%;
          text-align: left}
.td2 {padding-right: 10px;
          padding-left: 8px;
          padding-top: 8px;
          color: #333;
          font-size: 14px;
          font-weight: 400;
          background: #e8eaee;
          text-align: right;
          width: 25%;
          }
input {
           padding: 6px 12px;
           font-size: 14px;
           line-height: 1.42857143;
           color: #555;
           background-color: #fff;
           background-image: none;
           border: 1px solid #ccc;
           }
label{font-weight: 400; margin-right: 10px;}

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
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        修改密码
        <small>第三方支付平台</small>
      </h1>

      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
        <div id="modelPanel" style="background-color: #F2F2F2">
        </div>
        <input id="selectedUsers" runat="server" type="hidden" />
        <table width="100%" border="0" cellspacing="1" cellpadding="1" class="table1">
                <tr>
                    <td align="center">
                        <table style="border-right: #c9ddf0 1px solid; border-top: #c9ddf0 1px solid; border-left: #c9ddf0 1px solid;border-bottom: #c9ddf0 1px solid" cellspacing="0" cellpadding="0" width="100%" bgcolor="#f3f9fe" border="0">
                            <tr>
                                <td>
                                    <table id="setpsd"   cellspacing="1" cellpadding="1" width="100%"
                                        align="center">
                                        <tr>
                                            <td align="right" width="19%" class="td2">
                                                原密码</td>
                                            <td width="81%" height="30" align="left" class="td1">
                                                <input id="old_password" runat="server" class="reg"  type="password" name="old_password" style="width: 300px" /></td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="td2">
                                                新密码</td>
                                            <td align="left" height="30" class="td1">
                                                <input id="pas" runat="server" class="reg"  type="password" name="pas" style="width: 300px"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="td2">
                                                确认新密码</td>
                                            <td height="30" align="left" class="td1">
                                                <input id="re_password" runat="server" class="reg"  type="password" name="re_password" style="width: 300px"></td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="19%" class="td2">
                                                原二级密码</td>
                                            <td width="81%" height="30" align="left" class="td1">
                                                <input id="oldsedpwd" runat="server" class="reg"  type="password" name="old_password" style="width: 300px" /></td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="td2">
                                                新二级密码</td>
                                            <td align="left" height="30" class="td1">
                                                <input id="newsedpwd" runat="server" class="reg"  type="password" name="pas" style="width: 300px"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="td2">
                                                确认新二级密码</td>
                                            <td height="30" align="left" class="td1">
                                                <input id="newsedpwd2" runat="server" class="reg"  type="password" name="re_password" style="width: 300px"></td>
                                        </tr>
                                        <tr>

                                            <td height="30" align="left" class="td" colspan="10">
                                                <asp:Button ID="btnUpdate" CssClass="btn-danger" runat="server" Text="确认修改" OnClick="btnUpdate_Click" />
                                            </td>
                                        </tr>
                                        <tr>

                                            <td height="30" align="left" class="td1" colspan="10">
                                                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="height: 40px">
                    </td>
                </tr>
        </table>
    </form>



<script type="text/javascript" language="javascript">
var table=document.getElementById("setpsd");
if (table){
for(i=0;i<table.rows.length;i++){
if(i%2==0){
table.rows[i].bgColor="ffffff";
}else{table.rows[i].bgColor="f3f9fe"}
}
}
</script>

</section>
</div>

<!-----------------footer------------------>
 <!-- #include file="./Footer.aspx" -->
<!-----------------footer------------------>