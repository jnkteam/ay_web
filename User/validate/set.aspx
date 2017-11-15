<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="set.aspx.cs" Inherits="KuaiCard.WebUI.User.validate.set" Title="无标题页" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h5 class="page-title">绑定邮箱</h5>
    <input type="hidden" id="sendtime" value="0" />
    <div class="block-area" id="tableHover">
        <div class="table-responsive overflow">
            <table class="table table-bordered table-hover tile view-table">
                <tr>
                    <th class="view-title"><font style="color:#F00">*</font>新邮箱</th>
                    <td>
                        <div class="col-md-2">
                            <input type="text" name="email" value="" class="form-control input-sm" />
                        </div>
                        <div class="col-md-2">
                            <input type="button" value="发送效验码" class="btn m-r-5" id="sendcode" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <th><font style="color:#F00">*</font>效验码</th>
                    <td>
                        <div class="col-lg-2"><input type="text" name="verifycode" class="form-control m-b-10" /></div>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td><input type="submit" value="提交设置" onclick="ajaxSubmit();" class="btn m-r-5" /></td>
                </tr>
            </table>
        </div>
    </div>
    <script src="/static/dialog/jquery.dialog.js?skin=default" type="text/javascript"></script>
    <script src="/static/dialog/plugins/iframeTools.js" type="text/javascript"></script>
    <script type="text/javascript"  language="javascript">
     function ajaxSubmit() {
         var code = $("input[name='verifycode']").val();
         var aemail = $("input[name='email']").val();
         var name = $("input[name='email']").val();
         var sSource = '/user/Service/Code.ashx?t=' + Math.random();
         var postData = 'email=' + aemail + '&code=' + code + '&name=newmail';
         //var loading = $.dialog.tips("提交中，请稍后……", 60, "loading");
         $.ajax({
             type: "post",
             dataType: "json",
             timeout: 10000,
             url: sSource,
             data: postData,
             success: function (json) {

                 if (json.result == 'ok') {
                     loading.close();
                     $.dialog({
                         title: '信息提示',
                         content: json.msg,
                         icon: json.ico,
                         time: '5',
                         ok: true
                     });
                     window.location.href = "/user/";
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
     $(function () {
         var sendtime = $("#sendtime").val();
         var sign = $("input[name='email']").val();
         $("#sendcode").ajaxsend({
             url: '/user/Service/sendMail.ashx',
             data: function () {
                 return {
                     template: function () {
                         return $("input[name='email']").val();
                     }
                 };
             },
             time: 60,
             restTime: sendtime,
             text: '再次发送效验码',
             success: function (json) {
                 $.dialog.tips(json.text, 2, (json.result ? 'success' : 'error'));
             },
             error: function () {
                 alert('发送失败');
             }
         });
     });
    </script>
</asp:Content>
