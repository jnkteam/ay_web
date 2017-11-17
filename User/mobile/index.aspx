<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index_modify.aspx.cs" Inherits="OriginalStudio.WebUI.User.mobile.index" Title="修改绑定手机" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">修改绑定手机</h1>
    </div>
    <div class="main m-form tabular-form">
        <div class="form-group">
            <label class="control-label">当前手机号码</label>
            <div class="form-static"><%=gUserTel %></div>
        </div>
        <div class="form-group">
            <label class="control-label">新手机号码</label>
            <input type="text" id="newmobile" class="form-control" placeholder="请输入新手机号码" />
            <a href="javascript:sendmsgcode();" class="btn btn-primary btn-send">发送短信</a>
        </div>
        <div class="form-group">
            <label class="control-label">短信验证码</label>
            <input type="text" id="msgcode" class="form-control" placeholder="请输入短信验证码" />
        </div>
        <div class="form-group">
            <label class="control-label">验证码</label>
            <div class="captcha-control">
                <input type="text" id="imgcode" class="form-control" placeholder="请输入验证码" />
                <img  alt="点击刷新验证码" id="captchaImg" data-url="/CodeImage.aspx" src="/CodeImage.aspx"  class="captcha" title="点我换一张" onclick="reloadimage();"/>
            </div>
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-primary" onclick="ajaxSubmit();">提交绑定</button>
        </div>
    </div>
    <script type="text/javascript">
        //验证码
        function reloadimage() {
            document.getElementById("captchaImg").src = "/CodeImage.aspx?t=" + Math.random();
        }
        //发送短信验证码
        function sendmsgcode() {
            var mobile = $("#newmobile").val();
            if (mobile == "") {
                alert("请填写手机号码！");
                return;
            }
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: '/user/Service/sendPhone.ashx',
                data: "template=" + mobile,
                success: function (json) {
                    if (json.result == 'true') {
                        alert(json.text);
                    } else {
                        alert(json.text);
                    }
                },
                error: function () {
                    alert('发送失败');
                }
            });
        }
        function ajaxSubmit() {
            var mobile = $("#newmobile").val();
            var msgcode = $("#msgcode").val();
            var imgcode = $("#imgcode").val();
            if ((mobile == "") || (msgcode == "") || (imgcode == "")) {
                alert("内容填写不全！");
                return;
            }
            var sSource = '/user/Service/code.ashx?t=' + Math.random();
            var postData = 'Phone=' + mobile + '&code=' + msgcode + '&imgcode=' + imgcode + '&name=newtel';
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: sSource,
                data: postData,
                success: function (json) {
                    if (json.result == 'ok') {
                        alert(json.msg);
                        self.location = "/user/";
                    } else {
                        alert(json.msg);
                    }
                }
            })
        };
    </script>
</asp:Content>
