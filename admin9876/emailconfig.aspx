<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.emailconfig" ValidateRequest="false" Codebehind="emailconfig.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>վ������</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="style/admin.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
table { FONT-WEIGHT:normal;line-height:170%;FONT-FAMILY:Arial}
A:link {COLOR:#237C04;TEXT-DECORATION: none}
td {height:20px; line-height:20px; font-size:12px;padding:0px; }
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
.td1 {padding-right:3px;padding-left:3px;color:#999999;padding-bottom:0px;padding-top:5px;height:25px;}
.td2 {padding-right:3px;padding-left:8px;padding-top:5px;color:#083772;background:#EFF3FB;font-size:12px;text-align:right; width:35%}
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
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellspacing="1" cellpadding="3">
            <tr>
                <td colspan="4" style="font-weight: bold; font-size: 14px; background: url(style/images/topbg.gif) repeat-x;
                    color: teal; height: 28px">
                    �ʼ�����</td>
            </tr>
            <tr>
                <td width="10%" class="td2">
                    �����ʼ���������</td>
                <td width="90%" colspan="3" class="td1">
                    <asp:TextBox ID="txtEmailServerAddress" runat="server" Width="227px"></asp:TextBox>�ʼ���������ַ ��ʽ��: smtp.gmail.com</td>
            </tr>
            <tr>
                <td class="td2">
                    �˿ڣ�</td>
                <td colspan="3" class="td1">
                    <asp:TextBox ID="txtEmailServerAddressPort" runat="server" Width="50px"></asp:TextBox>�磺�˿� 465
                    </td>
            </tr>
            <tr>
                <td class="td2">
                    �ʼ��ĵ�ַ���ƣ�</td>
                <td colspan="3" class="td1">
                    <asp:TextBox ID="txtServerUserName" runat="server" Width="227px"></asp:TextBox>
                    ��ʽ��: ggp@gmail.com</td>
            </tr>
            <tr>
                <td class="td2">
                    ���룺</td>
                <td colspan="3" class="td1">
                    <asp:TextBox ID="txtServerUserPass" runat="server" TextMode="Password"  Width="227px"></asp:TextBox>
                    ��ʽ��: ggp@gmail.com</td>
            </tr>
            <tr>
                <td class="td2">
                    ��ʾ�ʼ����ԣ�</td>
                <td colspan="3" class="td1">
                    <asp:TextBox ID="txtmailfrom" runat="server"   Width="227px"></asp:TextBox>
                    ��ʽ��: ttpay@service.com</td>
            </tr>
            <tr>
                <td class="td2">
                    ��ʾ���ƣ�</td>
                <td colspan="3" class="td1">
                    <asp:TextBox ID="txtMailDisplayName" runat="server"   Width="227px"></asp:TextBox>
                    ��ʽ��: ����֧��ƽ̨�ͷ�</td>
            </tr>
             <tr>
                <td class="td2">
                    �Ƿ�Ssl���ӣ�</td>
                <td colspan="3" class="td1">
                    <asp:CheckBox ID="ckb_ssl" runat="server" Text="�Ƿ�Ssl����" /></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="td1" colspan="3">
                    <span style="padding-left: 3px; height: 40px">
                        <asp:Button ID="btn_Update" runat="server" Text="ȷ�ϸ���" OnClick="btnUpdate_Click" OnClientClick="allQQ()" />
                    </span>
                </td>
            </tr>
        </table>
        
        <table width="100%" border="0" cellspacing="1" cellpadding="3">
            <tr>
                <td colspan="4" style="font-weight: bold; font-size: 14px; background: url(style/images/topbg.gif) repeat-x;
                    color: teal; height: 28px">
                    �ʼ�����</td>
            </tr>
            <tr>
                <td class="td2">
                    �������䣺</td>
                <td colspan="3" class="td1">
                    <asp:TextBox ID="txtmailto" runat="server"   Width="227px">171218192@qq.com</asp:TextBox>
                    </td>
            </tr>
             <tr>
                <td class="td2">
                    ���ݣ�</td>
                <td colspan="3" class="td1">
                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="4"  Width="600px">test</asp:TextBox>
                    <input type="text" name="username"/>
                    </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="td1" colspan="3">
                    <span style="padding-left: 3px; height: 40px">
                        <asp:Button ID="btnSend" runat="server" Text="����" 
                        onclick="btnSend_Click"  />
                    </span>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
