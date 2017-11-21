<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.SupplierEdit" Codebehind="SupplierEdit.aspx.cs" %>

<!DOCTYPE html>
<html>
<head>
    <title>新建编辑供应商</title>

   <!-- Bootstrap 3.3.7 -->
   <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
   <!-- Theme style -->
   <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/dist/css/AdminLTE.min.css">

    <style type="text/css">
        table
         {
             width: 100%;
             max-width: 100%;
           
             border: 1px solid #f4f4f4;
             able-layout:fixed;
         }
         .table td{
             padding: 8px;
             line-height: 1.92857143 !important;
             vertical-align: top;
             border-top: 1px solid #ddd;
             font-size:14px;
             overflow: hidden;

             word-break: break-all; word-wrap:break-word;
         }
A:link {COLOR:#237C04;TEXT-DECORATION: none}
td {height:20px; line-height:20px; font-size:12px;padding:0px; vertical-align:middle !important;}
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
.td1 {padding-right:3px;padding-left:3px;color:#999999;padding-bottom:0px;padding-top:5px;height:25px;}
.td2 {padding-right:3px;padding-left:8px;padding-top:5px; color: #333;background: #e8eaee;font-size:12px;text-align:right;}
.td3 {padding:1px 1px 0 0px;color:#083772;background:#EFF3FB;font-size:12px;text-align:center;}
.moban {padding-top:0px;border:0px}
input { border:1px solid #999;padding:3px;margin-left:10px;font:12px tahoma;ling-height:16px}
.input4 {border:1px solid #999;padding:3px;margin-left:10px;font:11px tahoma;ling-height:16px;height:45px;}

.nrml{background-color:#eeeeee;font-weight: bold;}
.radio { border:none; }
.checkbox { border:none; }
.addnew {font-size: 12px;color: #FF0000;}
a.servername{height:470px;width: 527px;color:#E54202;cursor:hand;}
.current {border:#ff6600 1px solid;}
a:hover {height:470px;width: 527px;color:#E54202;cursor:hand;}
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
padding:12px 15px 15px 15px;
}
#txtdesc{width: 193px !important;
           margin-left: 11px;}
.form-control{width: 317px !important}
#Active{border:0 !important;}
#IsDebug{border:0 !important;}
#Active td{border:0 !important;}
#IsDebug td{border:0 !important;}
</style>

    <script type="text/javascript">
function backreturn(){
    location.href='SupplierList.aspx';
}
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered table-hover dataTable">
                <tr>
                    <td class="td2">
                        接口商编号</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtcode"  required class="form-control" runat="server" Width="50%"></asp:TextBox>
                    </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        接口商名称</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtname" required class="form-control" runat="server" Width="50%"></asp:TextBox>
                    </div>
                    </td>
                </tr>


                <tr>
                    <td class="td2">
                        支持功能</td>
                    <td class="td1">


                        <asp:CheckBox ID="chkiwap" Text="网银" runat="server" Checked="True" />
                        <asp:CheckBox ID="chkiali" Text="支付宝" runat="server" Checked="True" />
                        <asp:CheckBox ID="chkiwx" Text="微信" runat="server" Checked="True" />
                        <asp:CheckBox ID="chkisdistribution" Text="代付" runat="server" Checked="True" />
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        账号</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpuserid" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        密钥</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpuserkey" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        商户名称</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpusername" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        预留参数1</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="PUserParm1" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>

                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        预留参数2</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="PUserParm2" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>

                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        预留参数3</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="PUserParm3" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>

                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        预留参数4</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="PUserParm4" class="form-control" runat="server" Width="50%"></asp:TextBox> <span class="txt"></span>
                        </div>

                    </td>
                </tr>

                <tr>
             <td class="td2">
                                        启停标记</td>
                                    <td class="td1">
                                    <div class="input-group">
                                                           <asp:RadioButtonList ID="Active" runat="server" RepeatDirection="horizontal">
                                                               <asp:ListItem Selected="true" Value="1">是</asp:ListItem>
                                                               <asp:ListItem Value="0">否</asp:ListItem>
                                                           </asp:RadioButtonList>
                                                           </div>

                                    </td>
                                </tr>

                 <tr>
                             <td class="td2">
                                    开关调试标记</td>
                                                    <td class="td1">
                                                     <div class="input-group">
                                                                                                               <asp:RadioButtonList ID="IsDebug" runat="server" RepeatDirection="horizontal">
                                                                                                                   <asp:ListItem Selected="true" Value="1">是</asp:ListItem>
                                                                                                                   <asp:ListItem Value="0">否</asp:ListItem>
                                                                                                               </asp:RadioButtonList>
                                                                                                               </div>

                                                    </td>
                                                </tr>

                <tr>
                    <td class="td2">
                        网关地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="BankPostUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="td2">
                        异步通知地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="BankReturnUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>

 <tr>
                    <td class="td2">
                        同步返回地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="BankNotifyUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        查单接口地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="BankSearchUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        中转域名地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="BankJumUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        代付提交地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="DistributionUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="td2">
                        代付通知地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="DistributionNotifyUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>

                <tr>
                                    <td class="td2">
                                        代付查询地址</td>
                                    <td class="td1">
                                    <div class="input-group">
                                        <asp:TextBox ID="DistributionSearchUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>


                <tr>
                    <td class="td2">
                        说明</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtdesc" runat="server" class="form-control" Width="400px" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        排序</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtsort" runat="server" class="form-control" Width="50%">0</asp:TextBox>
                        </div>
                    </td>
                </tr>
                <!--
                <tr>
                    <td class="td2">
                        是否系统</td>
                    <td class="td1">

                        <asp:CheckBox ID="chkissys" Text="issys"  runat="server" Checked="False" />

                    </td>
                </tr>
                <tr>
                -->
                    <td colspan="2" style="text-align: center; height: 30px;">
                        <asp:Button ID="btnSave" CssClass="button btn  btn-danger" runat="server" Text="保 存" OnClick="btnSave_Click"></asp:Button>

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
