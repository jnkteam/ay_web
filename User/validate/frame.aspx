<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="frame.aspx.cs" Inherits="OriginalStudio.WebUI.User.validate.frame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/skin/user/user.css" rel="stylesheet" type="text/css" />
<link href="/skin/user/validate_frame.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/jquery.core.js"></script>
<script type="text/javascript" src="/static/js/jquery.form.js"></script>
<script type="text/javascript" src="/static/dialog/jquery.dialog.js?skin=default"></script>
<script type="text/javascript" src="/static/dialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="/static/js/jquery.ajaxsend.js"></script>
<script type="text/javascript" src="/static/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/static/js/jquery.tab.js"></script>
<script type="text/javascript" src="/skin/user/js/user.js"></script>
<script type="text/javascript" src="/skin/user/js/validate_frame.js"></script>
<title>操作保护</title>
<script type="text/javascript">
    function MM_jumpMenu() {
        var options = $('#sect option:selected').val();
        $("#fangshi").val(options);
        $("input[name='']").val(options);
    }
 </script>
</head>
<body>
    <form id="form1" runat="server">
   <body scroll="no">

	<div id="mainbody">

		<div style="padding:15px">

            <div class="listtab">
                <div class="wrap">
                    <ul id='tabs'>
                        <asp:Label ID="usertext" runat="server"></asp:Label>
                    </ul>
                </div>
            </div>
            <input type="hidden" id="fangshi" name="fangshi" value="" />
            <input name="verifytype" id="verifytype" type="hidden" value="woaini" />
			<input type="hidden" id="sendtime" value="0" />
			<input type="hidden" id="userid" value="19494" />


			<div style="padding:15px 0">
            <div id="email" style="display:none">
                <table cellpadding="0" cellspacing="0">
                    <tbody>
                        <tr>
                            <th width="70">邮箱:</th>
                            <td><select class="select">
                                 <option value="email_send">邮箱验证码 <%=email %></option>
                            </select></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input type="button" value="发送效验码" class="send" id="email_send" style="width:120px" disabled="disabled" /></td>
                        </tr>	
                        <tr>
                            <th>填写效验码:</th>
                            <td><input type="text" name="email_code" class="input" style="width:110px" /></td>
                        </tr>
                    </tbody>
                </table>
			</div>


            <div id="mobile" style="display:none">
               <table cellpadding="0" cellspacing="0">
                    <tbody>
                        <tr>
                            <th width="70">手机:</th>
                            <td><select class="select" >
                                <option value="sms_send">短信验证码 <%=shouji %></option>
                            </select></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input type="button" value="发送效验码" class="send" id="sms_send" style="width:120px" disabled="disabled" /></td>
                        </tr>	
                        <tr>
                            <th>填写效验码</th>
                            <td><input type="text" name="sms_code" class="input" style="width:110px" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>


            <div id="protection" style="display:none">
               <table cellpadding="0" cellspacing="0">
                    <tbody>
                        <tr>
                            <th width="70">问题:</th>
                            <td><select class="select">
                                <option value="">你的亲属 (配偶) 的姓名？</option>
                            </select></td>
                        </tr>
                        <tr>
                            <th>答案:</th>
                            <td><input type="text" name="answer_code" class="input" style="width:200px" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>


            </div>
            
		</div>

	</div>

    </form>
</body>
</html>
