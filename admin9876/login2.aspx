<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.login2" Codebehind="login2.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="./Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="./Left.aspx" -->
<!-----------------left------------------>
<style>
    .lockscreen-credentials{
        margin-left: 60px;
    }
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" >
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        二级密码验证
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">

    <form id="form1" runat="server" class="hold-transition lockscreen" style="background-color: #fff; max-width: 450px;margin: auto;border-radius: 8px;">

         <div class="lockscreen-wrapper" style="max-width: 450px !important;">
              <div style="height: 50px;background-color: #3c8dbc;max-width: 450px;border-radius: 4px;color: #fff;line-height:50px;font-size: 20px;text-align: center">
                  请输入二级密码
              </div>
              <!-- User name -->
              <div class="lockscreen-name" style="margin-top: 30px;font-size: 24px;"><%=username %></div>

              <!-- START LOCK SCREEN ITEM -->
              <div class="lockscreen-item" style="margin-top: 30px;">
                <!-- lockscreen image -->
                <div class="lockscreen-image" style="border: solid 1px #b2b2b2">
                  <img src="<%=ADMIN_URI%>/style/admin/dist/img/en2.jpg" alt="User Image">
                </div>
                <!-- /.lockscreen-image -->

                <!-- lockscreen credentials (contains the form) -->
                <div class="lockscreen-credentials">
                  <div class="input-group">
                    <input type="password" id="txtPsec" runat="server" class="form-control" placeholder="二级密码" style="border: solid 1px #b2b2b2">

                    <div class="input-group-btn" style="border: solid 1px #b2b2b2;" >
                      <button type="button" runat="server" onserverclick="btnOk_ServerClick" style="height: 32px;" class="btn"><i class="fa fa-arrow-right text-muted"></i></button>
                    </div>
                  </div>
                </div>
                <!-- /.lockscreen credentials -->

              </div>
              <!-- /.lockscreen-item -->
              <div style="clear: both; height: 30px;"></div>
              <div class="help-block text-center">
                <span id="lblMessage"  runat="server" style="color:red"></span>

              </div>
              <div class="text-center">
                <a href="#"></a>
              </div>
              <div class="lockscreen-footer text-center" style="margin: 18px;">
                请输入您的二级密码进行操作验证，如果您忘记二级密码，可在密码修改重置二级密码，请妥善保管好您的密码
              </div>
              <div style="clear: both; height: 30px;"></div>
            </div>

    </form>



 </section>
 </div>

<!-----------------footer------------------>
 <!-- #include file="./Footer.aspx" -->
<!-----------------footer------------------>