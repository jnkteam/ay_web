<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.User.validate.index" Title="验证" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:HiddenField ID="sendtime" runat="server" />
    <asp:HiddenField ID="userid" runat="server" />
    <input name="sign" type="hidden" value='<%=sign%>' />
    <div class="titlebar">
        <h1 class="title">验证<%=yzname %></h1>
    </div>
    <div class="main">
        <form action="" method="post" class="m-form tabular-form">
            <div class="form-group">
                <label class="control-label">当前手机号码</label>
                <div class="form-static"></div>
            </div>
            <div class="form-group">
                <asp:Label ID="yznameid" runat="server" class="control-label"></asp:Label>
                <input type="text" value="" class="form-control" placeholder="请输入短信验证码" />
                <input type="button" value="发送短信" class="btn btn-primary btn-send" id="sendcode" />
            </div>
            <div class="form-group">
                <label class="control-label">新手机号码</label>
                <input type="text" value="" class="form-control" placeholder="请输入新手机号码" />
            </div>
            <div class="form-group">
                <label class="control-label">验证码</label>
                <div class="captcha-control">
                    <input type="text" value="" class="form-control" placeholder="请输入验证码" />
                    <img src="../img/captcha.png" alt="" class="captcha">
                </div>
            </div>
            <div class="btn-group">
                <button type="submit" class="btn btn-primary" onclick="ajaxSubmit();">提交绑定</button>
            </div>
        </form>
    </div>
<td valign="top" class="r">

    <input name="a" type="hidden" value="checkMobile" />

    <div class="title02"></div>

      <table class="V_tb2">
          <!-- 隔行变色 -->
		  <SCRIPT LANGUAGE="JavaScript">
		      $(function () {
		          $(".td1").each(function (i) { this.style.backgroundColor = ['#fff', '#fafafa'][i % 2] })
		      })
          </SCRIPT>
      	<tr class="td1">
        <th><font style="color:#F00">*</font><%=yzname %></th>
        <td>
        	
            &nbsp;&nbsp;
			</td>
      </tr>

      <tr class="td1">
        <th><font style="color:#F00">*</font>效验码</th>
        <td><input type="text" id ="verifycode" name="verifycode" class="V_input2" /></td>
      </tr>

      <tr class="td1">
        <th></th>
        <td><a  href="javascript:"  class="V_btn4 submit ajaxSubmit" >下一步</a></td>
      </tr>
    </table>
    
    </td>

 <script type="text/javascript">
     function ajaxSubmit() {
         var code = $("#verifycode").val();
         var name = $("input[name='sign']").val();
         var sSource = '/user/Service/Code.ashx?t=' + Math.random();
         var postData = 'name=' + name + '&code=' + code;
         var loading = $.dialog.tips("提交中，请稍后……", 60, "loading");
         $.ajax({
             type: "post",
             dataType: "json",
             timeout: 10000,
             url: sSource,
             data: postData,
             
             success: function(json) {

             if (json.result == 'ok') {
                 loading.close();
                     $.dialog({
                         title: '信息提示',
                         content: json.msg,
                         icon: json.ico,
                         time: '2',
                         ok: true
                     });
                     window.location.href = json.url;
                 } else {
                 loading.close();
                     $.dialog({
                         title: '信息提示',
                         content: json.msg,
                         icon: json.ico,
                         time: '2',
                         ok: true

                     });

                 }
             }

         })
     }
     $(function() {
         var sendtime = $("#sendtime").val();
         var sign = $("input[name='sign']").val();
         $("#sendcode").ajaxsend({
         url: '/user/Service/sendMobileCode.ashx',
             data: function() {
                 return {
                     template: function() {
                         return sign;
                     }
                 };
             },
             time: 60,
             restTime: sendtime,
             text: '再次发送效验码',
             success: function(json) {
                 $.dialog.tips(json.text, 2, (json.result ? 'success' : 'error'));
             },
             error: function() {
                 alert('发送失败');
             }
         });
     });
    </script>
</asp:Content>
