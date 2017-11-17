<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Login.aspx.cs" Inherits="OriginalStudio.WebUI.User.UserLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>登录</title>
    <script src="js2.0/alljs.js" type="text/javascript"></script>
    <script type="text/javascript" src="js2.0/zft.js"></script>
    <link href="css/loginstyle.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	    function checkInput() {
	        if ($("#j_username").val() == "") {
	            alert('账号不能为空');
	            return false;
	        }
	        if ($("#j_password").val() == "") {
	            alert("密码不能为空！");
	            return false;
	        }
	        if ($("#j_captcha_response").val() == "") {
	            alert("验证码不能为空！");
	            return false;
	        }
	        return true;
	    }
    </script>
</head>
<body>
    <div class="login-container">
	    <h1>欢迎登录商户系统</h1>
	
	    <div class="connect">
		    <p></p>
	    </div>
	
        <form  id="form1" runat="server">
		    <div>
                <input runat="server" name="j_username" id="j_username" type="text" placeholder="请输入登录名" autocomplete="off" maxlength="50"/>
		    </div>
		    <div>
                <input runat="server" name="j_password" id="j_password" type="password"  placeholder="请输入密码"/>
		    </div>
		    <div>
                    <input  runat="server" name="j_captcha_response" id="j_captcha_response" maxlength="4" type="text" placeholder="请输入验证码" class="input2"/>
                    <img alt="点击刷新验证码" id="captchaImg" data-url="/CodeImage.aspx" src="/CodeImage.aspx"   width="80" height="30" title="点我换一张" onclick="reloadimage();"/>
		    </div>
            <asp:Button ID="btnLogin" runat="server" Text="登　　录" CssClass="btn" OnClientClick="return checkInput();" />
	    </form>

	    <a href="UserReg.aspx">
		    <button type="button" class="register-tis">还有没有账号？</button>
	    </a>

    </div>

	<script src="js/login/jquery.min.js"></script>
	<script src="js/login/common.js"></script>
	<!--背景图片自动更换-->
	<script src="js/login/supersized.3.2.7.min.js"></script>
	<script src="js/login/supersized-init.js"></script>
	<!--表单验证-->
	<script src="js/login/jquery.validate.min.js?var1.14.0"></script>

</body>
</html>
