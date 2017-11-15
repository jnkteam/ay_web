<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Page.aspx.cs" Inherits="KuaiCard.WebUI.User.Page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
    <meta http-equiv='refresh' content='2;URL=/user/' />

    <script type='text/javascript'>window.setTimeout(function (){window.location = '/user/';}, 1000*2)</script>

    <link href='/static/css/message.css' rel='stylesheet' type='text/css' />
    <title>消息提示</title>
    <style>
    * {margin:0;padding:0}
a{color:#00aadb; text-decoration:none}
a:hover {color:#c00; text-decoration:underline}
li{list-style:none;text-overflow:ellipsis;overflow:hidden;white-space:nowrap}
body{font:12px/1.5em Arial,Verdana,Helvetica,sans-serif;color:#333}

.msgbox{width:600px; margin:150px auto;text-align:center; border:6px solid #e4f4ff}
.msgbox dl{border:1px solid #88bfc9; padding:2px}
.msgbox dl dt{height:28px; line-height:28px; background:#00b3d4; color:#fff}
.msgbox dl .msg{padding:25px 0 20px 0}
.msgbox dl .jump{padding:0 0 30px 0}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class='msgbox'>
        <dl>
            <dt><strong>消息提示</strong></dt><dd class='msg'><asp:Label ID="textprompt" runat="server"></asp:Label></dd><dd class='jump'><a href='/user/'>如果页面没有自动跳转，请点击这里。</a></dd></dl>
    </div>
    </form>
</body>
</html>
