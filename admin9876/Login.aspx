<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Login" Codebehind="login.aspx.cs" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>登录-后台管理</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
 <style>

 .form-control {
     display: block !important;
     width: 100% !important;
     }
</style>
<script type="text/javascript">
    function $(arg) {
	    var r_obj = null;
	    if(typeof(arg) == 'object') {
		    return arg;
	    }
	    r_obj = document.getElementById(arg);
	    if (r_obj == null) {
		    r_obj = document.getElementsByName(arg)[0];
	    }
	    return r_obj;
    }

    try {
      document.oncontextmenu = new Function('return false;');
    } catch (e) {}


    function checkform() {
    if (document.all.UserNameBox.value == "") {
        alert("请输入用户名")
        document.all.UserNameBox.focus();
        return false
    }
    if (document.all.pas.value == "") {
        alert("请输入密码");
        document.all.pas.focus();
        return false
    }
    if (document.all.CCode.value == "") {
        alert("请输入验证码");
        document.all.CCode.focus();
        return false
    }
    return true
    }

    function ChangeMap(obj) {
        obj.src = "/CodeImage.aspx?code=" + Math.random();
    }
    </script>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="javascript:void (0)"><b>后台管理系统</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg"><%=PlatformName%></p>

   <form id="form1" runat="server" onsubmit="return checkform()">
      <div class="form-group has-feedback">
        <input id="UserNameBox" runat="server" type="text" name="UserNameBox" class="form-control" placeholder="用户名">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input id="pas" runat="server" type="password" class="form-control" placeholder="密码">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>

       <div class="form-group has-feedback">
              <input type="text" name="CCode" id="CCode" class="form-control" placeholder="验证码" style="width: px">
              <span class="glyphicon  form-control-feedback" style="z-index:50;width: 94px !important; line-height: 28px !important;">

              <img src="/CodeImage.aspx" alt="看不清，点击更换图片" name="codeimg" width="88" height="30"
                                          class="mid" id="codeimg" style=" cursor: pointer"
                                          onclick="ChangeMap(this)" />
                </span>
            </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input id="RememberMe" type="checkbox" name="RememberMe" checked="checked"> 记住密码
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" name="Submit" class="btn btn-primary btn-block btn-flat">登录</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <div class="social-auth-links text-center">
      <p></p>

    </div>


  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="<%=ADMIN_URI%>/style/admin/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<%=ADMIN_URI%>/style/admin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="<%=ADMIN_URI%>/style/admin/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
