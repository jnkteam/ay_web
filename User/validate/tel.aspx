<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="tel.aspx.cs" Inherits="KuaiCard.WebUI.User.validate.tel" Title="无标题页" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
	<script type="text/javascript">
	    //验证码
	    function reloadimage() {
	        document.getElementById("captchaImg").src = "/CodeImage.aspx?t=" + Math.random();
	    }
    </script>
    <div class="titlebar">
        <h1 class="title">绑定手机</h1>
    </div>
    <input type="hidden" id="sendtime" value="0" />
    <div class="main m-form tabular-form">
        <div class="form-group">
            <label class="control-label">手机号码</label>
            <input type="text" name="Phone" class="form-control" placeholder="请输入手机号码" />
        </div>
        <div class="form-group">
            <label class="control-label">短信验证码</label>
            <input type="text" name="verifycode" class="form-control" placeholder="请输入短信验证码" />
            <input type="button" value="发送短信" class="btn btn-primary btn-send" id="sendcode" />
        </div>
        <div class="form-group">
            <label class="control-label">验证码</label>
            <div class="captcha-control">
                <input type="text" name="imgcode" value="" class="form-control" placeholder="请输入验证码" />
                <img  alt="点击刷新验证码" id="captchaImg" data-url="/CodeImage.aspx" src="/CodeImage.aspx"  class="captcha" title="点我换一张" onclick="reloadimage();"/>
            </div>
        </div>
        <div class="btn-group">
            <button type="submit" class="btn btn-primary" onclick="ajaxSubmit();">提交绑定</button>
        </div>
    </div>
    <script type="text/javascript" language="javascript">
        function ajaxSubmit() {
            var code = $("input[name='verifycode']").val();
            var imgcode = $("input[name='imgcode']").val();
            var Phone = $("input[name='Phone']").val();
            var sSource = '/user/Service/Code.ashx?t=' + Math.random();
            var postData = 'Phone=' + Phone + '&code=' + code + '&imgcode=' + imgcode + '&name=newtel';
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: sSource,
                data: postData,
                success: function (json) {
                    if (json.result == 'ok') {
                        alert(json.msg);
                        window.location.href = "/user/";
                    } else {
                        alert(json.msg);
                    }
                }
            })
        }
        $(function () {
            var sendtime = $("#sendtime").val();
            var sign = $("input[name='Phone']").val();
            $("#sendcode").ajaxsend({
                url: '/user/Service/sendPhone.ashx',
                data: function () {
                    return {
                        template: function () {
                            return $("input[name='Phone']").val();
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
