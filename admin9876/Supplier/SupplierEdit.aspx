<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.SupplierEdit" Codebehind="SupplierEdit.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>新建编辑供应商</title>
    <link href="../style/admin.css" type="text/css" rel="stylesheet" />
   <!-- Bootstrap 3.3.7 -->
   <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
   <!-- Theme style -->
   <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/dist/css/AdminLTE.min.css">

    <style type="text/css">
        table
         {
             width: 100%;
             max-width: 100%;
             margin-bottom: 20px;
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
                        供应商编号</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtcode" class="form-control" runat="server" Width="50%"></asp:TextBox>
                    </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        供应商名称</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtname" class="form-control" runat="server" Width="50%"></asp:TextBox>
                    </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        网址地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpurl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        Logo图片</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtlogourl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        支持种类</td>
                    <td class="td1">
                        <asp:CheckBox ID="chkisbank" Text="在线" runat="server" Checked="True" />
                        <asp:CheckBox ID="chkiscard" Text="卡类" runat="server" Checked="True" />
                        <asp:CheckBox ID="chkissms" Text="短信" runat="server" Checked="True" />
                        <asp:CheckBox ID="chkissx" Text="声讯" runat="server" Checked="True" />
                        <asp:CheckBox ID="chkisdistribution" Text="代付" runat="server" Checked="True" />
                        <asp:CheckBox ID="chkiwap" Text="手机网银" runat="server" Checked="True" />
                        <asp:CheckBox ID="chkiali" Text="手机支付宝" runat="server" Checked="True" />
                        <asp:CheckBox ID="chkiwx" Text="手机微信" runat="server" Checked="True" />
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
                        用户名称</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpusername" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        账号1</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpuserid1" class="form-control" runat="server" Width="50%"></asp:TextBox>快钱 神州行账号
                        </div>

                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        密钥1</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpuserkey1" class="form-control" runat="server" Width="50%"></asp:TextBox>快钱 神州行密钥
                        </div>

                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        账号2</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpuserid2" class="form-control" runat="server" Width="50%"></asp:TextBox>快钱 联通充值卡账号
                        </div>

                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        密钥2</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpuserkey2" class="form-control" runat="server" Width="50%"></asp:TextBox> <span class="txt">快钱联通充值卡账号</span>
                        </div>

                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        账号3</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpuserid3" class="form-control" runat="server" Width="50%"></asp:TextBox>快钱 电信账号
                        </div>

                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        密钥3</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpuserkey3" class="form-control" runat="server" Width="50%"></asp:TextBox>快钱  电信密钥
                        </div>

                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        账号4</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpuserid4" class="form-control" runat="server" Width="50%"></asp:TextBox>快钱 骏网一卡通账号</div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        密钥4</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpuserkey4" class="form-control" runat="server" Width="50%"></asp:TextBox>快钱 骏网一卡通密钥</div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        账号5</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpuserid5" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        密钥5</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpuserkey5" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        网址返回地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpbakurl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        卡类返回地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtCardbakUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        中转域名</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtJumpUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        网银提交地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpostBankUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        异步通知地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpostCardUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                 <tr>
                    <td class="td2">
                        卡类查询地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtQueryCardUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        短信息提交地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtpostSMSUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        代付款提交地址</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox ID="txtdistributionUrl" class="form-control" runat="server" Width="50%"></asp:TextBox>
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
                <tr>
                    <td class="td2">
                        是否系统</td>
                    <td class="td1">

                        <asp:CheckBox ID="chkissys" Text="issys"  runat="server" Checked="False" />

                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; height: 30px;">
                        <asp:Button ID="btnSave" CssClass="button btn-xs  btn-danger" runat="server" Text="保 存" OnClick="btnSave_Click"></asp:Button>
                        <input type="button" Class="button btn-xs  btn-danger"  value="返 回" onclick="void (0)" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
