<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Withdraw.Pay" Codebehind="Pay.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="../style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../style/admin/dist/css/AdminLTE.min.css">

<style>
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
label{font-weight: 400; margin-right: 10px;}
select { border:1px solid #999;padding:3px;font:12px tahoma;ling-height:16px}
.button {color: #135294; border:1px solid #666; height:21px; line-height:21px;}
a:hover {height:470px;width: 527px;color:#E54202;cursor:hand;}
#nav UL {PADDING-BOTTOM: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; PADDING-TOP: 0px}
#nav LI {DISPLAY: inline; padding-left:10px;}
#nav LI a:hover {border:#B6E000 1px solid;}
#nav li A:visited {border:#ff0000 1px solid;}
img{border:#CCCCCC 1px solid;padding:0 5px}
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
.td3{
border-left: 1px solid #ddd;
border-right: 1px solid #ddd;
}
.td4{
border-left: 1px solid #ddd;
border-right: 1px solid #ddd;
border-bottom: 1px solid #ddd;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="0" cellspacing="1" cellpadding="1" class="headtitle" style="width:100%">
                <tr>
                    <td>
                        <table style="border-right: #c9ddf0 1px solid; border-top: #c9ddf0 1px solid; border-left: #c9ddf0 1px solid;
                            border-bottom: #c9ddf0 1px solid" cellspacing="0" cellpadding="0" width="100%"
                            bgcolor="#f3f9fe" border="0">
                            <tr>
                                <td class="tdTit_h" style="padding-left: 10px">
                                    用户信息
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="table1" cellspacing="1" cellpadding="1" width="99%"
                                        align="center" bgcolor="#c9ddf0">
                                        <tbody>
                                            <tr bgcolor="F6F6F6">
                                                <td class="td3" colspan="1" height="40" valign="middle" style="width: 150px" align="center">
                                                    用户ID</td>
                                                <td class="td3" colspan="1" height="40" valign="middle" align="center">
                                                    商户名</td>
                                                <td class="td3" colspan="1" height="40" valign="middle" align="center">
                                                    帐户余额</td>
                                                <td class="td3" colspan="1" height="40" valign="middle" align="center">
                                                    收款人</td>
                                                <td class="td3" colspan="1" height="40" valign="middle" align="center">
                                                    收款银行</td>
                                                <td class="td3" colspan="1" height="40" valign="middle" align="center">
                                                    银行账号</td>													
                                                <td class="td3" colspan="1" height="40" valign="middle" align="center">
                                                    开户地址</td>
                                                <td class="td3" colspan="6" height="40" valign="middle" align="center">
                                                    用户状态</td>
                                            </tr>
                                            <tr bgcolor="ffffff">
                                                <td class="td4" align="center" colspan="1" height="40" style="width: 150px" valign="middle">
                                                    <asp:Label ID="UidLabel" runat="server"></asp:Label></td>
                                                <td class="td4" colspan="1" height="40" valign="middle" align="center">
                                                    <asp:Label ID="UserNameLabel" runat="server"></asp:Label></td>
                                                <td class="td4" colspan="1" height="40" valign="middle" align="center">
                                                    <asp:Label ID="MoneyLabel" runat="server"></asp:Label></td>
                                                <td class="td4" colspan="1" height="40" valign="middle" align="center">
                                                    <asp:Label ID="PayeeNameLabel" runat="server"></asp:Label></td>
                                                <td class="td4" colspan="1" height="40" valign="middle" align="center">
                                                    <asp:Label ID="BankLabel" runat="server"></asp:Label></td>													
                                                <td class="td4" colspan="1" height="40" valign="middle" align="center">
                                                    <asp:Label ID="AccountLabel" runat="server"></asp:Label></td>
                                                <td class="td4" colspan="1" height="40" valign="middle" align="center">
                                                    <asp:Label ID="PayeeaddressLabel" runat="server"></asp:Label></td>													
                                                <td class="td4" colspan="6" height="40" valign="middle" align="center">
                                                    <asp:Label ID="UserStatusLabel" runat="server" ForeColor="#00C000"></asp:Label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table style="border-right: #c9ddf0 1px solid; border-top: #c9ddf0 1px solid; margin-top: 10px;
                            border-left: #c9ddf0 1px solid; border-bottom: #c9ddf0 1px solid" cellspacing="0"
                            cellpadding="0" width="100%" bgcolor="#f3f9fe" border="0">
                            <tr>
                                <td class="tdTit_h" style="padding-left: 10px" width="16%">
                                    申请提现</td>
                                <td width="84%">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table id="table_zyads" style="margin-bottom: 10px" cellspacing="1" cellpadding="1"
                                        width="99%" align="center" bgcolor="#c9ddf0">
                                        <tbody>
                                            <tr>
                                                <td bgcolor="#ffffff">
                                                    <table id="searchandSoftSumReport" cellspacing="0" cellpadding="0" width="100%" border="0">
                                                        <tbody>
                   <tr>
                       <td class="td2">
                           申请时间</td>
                       <td class="td1">
                           <asp:Label ID="AddTimeLabel" runat="server"></asp:Label></td>
                   </tr>
                   <tr>
                       <td class="td2">
                           收款人</td>
                       <td class="td1">
                           <asp:Label ID="lblPayeeName" runat="server"></asp:Label></td>
                   </tr>
                   <tr>
                       <td class="td2">
                           收款银行</td>
                       <td class="td1">
                           <asp:Label ID="lblBank" runat="server"></asp:Label></td>
                   </tr>
                   <tr>
                       <td class="td2">
                           开户地址</td>
                       <td class="td1">
                           <asp:Label ID="lblPayeeaddress" runat="server"></asp:Label></td>
                   </tr>
                   <tr>
                       <td class="td2">
                           银行账号</td>
                       <td class="td1">
                           <asp:Label ID="lblAccount" runat="server"></asp:Label></td>
                   </tr>
                   <tr>
                       <td class="td2">
                           提现金额
                       </td>
                       <td class="td1">
                           <span>
                               <asp:Label ID="PayMoneyLabel" runat="server"></asp:Label></span>
                               <span>
                               </span>
                       </td>
                   </tr>
                   <tr>
                       <td class="td2">
                           扣税</td>
                       <td class="td1">
                           <asp:TextBox class="form-control" ID="TaxBox" runat="server">0</asp:TextBox></td>
                   </tr>
                   <tr>
                       <td class="td2">
                           手续费</td>
                       <td class="td1">
                           <asp:TextBox class="form-control" ID="ChargesBox" runat="server">3</asp:TextBox></td>
                   </tr>
                   <tr>
                       <td class="td2">
                           代付接口</td>
                       <td class="td1">
                           <div class="input-group">
                           <asp:DropDownList class="form-control" ID="ddlSupplier" runat="server" ></asp:DropDownList>
                           </div>
                       </td>
                   </tr>
                   <tr>
                       <td  colspan="4">
                       <div align="center">
                           <asp:Button ID="btnSave" class="button btn  btn-danger" runat="server" Text="保存资料" onclick="btnSave_Click" />
                           <asp:Button ID="btnSure" class="button btn  btn-danger" runat="server" Text="确认支付" onclick="btnSure_Click" />
                           <input type="button" id="btnreturn" class="button btn  btn-danger" value="返回列表" onclick="javascript:window.location.href='Pays.aspx'" />
                           </div>
                   </td>
                   </tr>
                   <tr>

                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="height: 10px">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script type="text/javascript" language="javascript">
var table=document.getElementById("searchandSoftSumReport");
if (table){
for(i=0;i<table.rows.length;i++){
if(i%2==0){
table.rows[i].bgColor="ffffff";
}else{table.rows[i].bgColor="F6F6F6"}
}
}
</script>
<script type="text/javascript" language="javascript">
function Setchkall(obj){
var objs = document.getElementsByName("chk");
for(i=0;i<objs.length;i++){
objs[i].checked=obj.checked;
}
}
</script>
