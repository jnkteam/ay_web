<%@ Page Language="C#" AutoEventWireup="true" Codebehind="UserSupplierConfig.aspx.cs" Inherits="KuaiCard.WebUI.Manage.UserSupplierConfig" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户服务商通道设置</title>
    <link href="../style/admin.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
table { FONT-WEIGHT:normal;line-height:170%;FONT-FAMILY:Arial}
A:link {COLOR:#237C04;TEXT-DECORATION: none}
td {height:20px; line-height:20px; font-size:12px;padding:0px; }
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
.td1 {padding-right:3px;padding-left:3px;color:#999999;padding-bottom:0px;padding-top:5px;height:25px;}
.td2 {padding-right:3px;padding-left:8px;padding-top:5px;color:#083772;background:#EFF3FB;font-size:12px;text-align:right;}
.td3 {padding:1px 1px 0 0px;color:#083772;background:#EFF3FB;font-size:12px;text-align:center;}
.moban {padding-top:0px;border:0px}
input { border:1px solid #999;padding:3px;margin-left:10px;font:12px tahoma;ling-height:16px}
.input4 {border:1px solid #999;padding:3px;margin-left:10px;font:11px tahoma;ling-height:16px;height:45px;}
.button {color: #135294; border:1px solid #666; height:21px; line-height:21px;}
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
</style>

    <script type="text/javascript">
        function closewin() {
            window.opener = null;
            window.open('', '_self');
            window.close();
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td class="td2">
                        用户编号：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtUserID" runat="server" Width="50%" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        用户名称：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtUserName" runat="server" Width="50%" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">供应商：</td>
                    <td class="td1">
                        　<asp:DropDownList ID="ddlsupp" runat="server" Width="50%"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        通道类型：</td>
                    <td class="td1">
                        <asp:CheckBoxList ID="chkChannelType" runat="server" RepeatDirection="Horizontal" Width="50%">
                            <asp:ListItem Text="网银" Value="102"></asp:ListItem>
                            <asp:ListItem Text="支付宝" Value="101"></asp:ListItem>
                            <asp:ListItem Text="手机支付宝" Value="980"></asp:ListItem>
                            <asp:ListItem Text="手机微信" Value="990"></asp:ListItem>
                            <asp:ListItem Text="手机微信(外置)" Value="116"></asp:ListItem>
                            <asp:ListItem Text="QQ扫码" Value="209"></asp:ListItem>
                            <asp:ListItem Text="手机网银" Value="1020"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        账号：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtpuserid" runat="server" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        密钥：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtpuserkey" runat="server" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        用户名称：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtpusername" runat="server" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        账号1：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtpuserid1" runat="server" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        密钥1：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtpuserkey1" runat="server" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        账号2：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtpuserid2" runat="server" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        密钥2：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtpuserkey2" runat="server" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        中转域名：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtJumpUrl" runat="server" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        网银提交地址：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtpostBankUrl" runat="server" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        代付提交地址：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtdistributionUrl" runat="server" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        说明：</td>
                    <td class="td1">
                        　<asp:TextBox ID="txtdesc" runat="server" Width="400px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        预留参数1：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtExtParm1" runat="server" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        预留参数2：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtExtParm2" runat="server" Width="50%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        排序：</td>
                    <td class="td1">
                        <asp:TextBox ID="txtsort" runat="server" Width="50%">0</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; height: 30px;">
                        <asp:Button ID="btnSave" runat="server" Text="保 存" OnClick="btnSave_Click">
                        </asp:Button>
                        <input type="button" value="关 闭" onclick="closewin()" />
                    </td>
                </tr>
            </table>
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <asp:Repeater  ID="rptList" runat="server" OnItemCommand="rptList_ItemCommand">
                            <HeaderTemplate>
                                <tr height="30" style="background-color: #507CD1; color: #fff">
                                <td>序号</td>
                                <td>供应商名称</td>
                                <td>支持通道类型</td>
                                <td>时间</td>
                                <td>说明</td>
                                <td>操作</td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr height="30" bgcolor="#EFF3FB">
                                <td><%# Eval("id")%></td>
                                <td><%# Eval("suppliername")%></td>
                                <td><%# Eval("channeltypelistname")%></td>
                                <td><%# Eval("addtime")%></td>
                                <td><%# Eval("desc")%></td>
                                <td>
                                    <a href="UserSupplierConfig.aspx?cmd=edit&userid=<%# Eval("userid") %>&ID=<%# Eval("id") %>" class="cvlink">编辑</a> 
                                    <asp:Button ID="btnDelete" runat="server" Text="删除" ToolTip="删除" CommandName="delete" CommandArgument='<%# Eval("id")%>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                </asp:Repeater>
            </table>
                                        
        </div>
        <asp:HiddenField ID="hidID" runat="server" />
    </form>
</body>
</html>

