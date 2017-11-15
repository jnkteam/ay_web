<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.User.IP.delete" Title="修改绑定手机" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">删除绑定IP</h1>
    </div>
    <div class="main m-form tabular-form">
        <div class="form-group">
            <label class="control-label">删除IP</label>
            <div class="form-static"><%=gDeleteIP %></div>
        </div>
        <div class="form-group">
            <label class="control-label">邮箱地址</label>
            <input type="text"  id="email" class="form-control" value=<%=gUserEmail  %> readonly="readonly" />
            <a href="javascript:sendmailcode();" class="btn btn-primary btn-send">发送邮件</a>
        </div>
        <div class="form-group">
            <label class="control-label">邮箱验证码</label>
            <input type="text"  id="emailcode" class="form-control" placeholder="请输入邮箱验证码" />
        </div>
        <div class="form-group">
            <label class="control-label">验证码</label>
            <div class="captcha-control">
                <input type="text"  id="imgcode" class="form-control" placeholder="请输入验证码" />
                <img  alt="点击刷新验证码" id="captchaImg" data-url="/CodeImage.aspx" src="/CodeImage.aspx"  class="captcha" title="点我换一张" onclick="reloadimage();"/>
            </div>
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-primary" onclick="ajaxSubmit();">删除IP</button>
        </div>
    </div>
    <script type="text/javascript">
        //验证码
        function reloadimage() {
            document.getElementById("captchaImg").src = "/CodeImage.aspx?t=" + Math.random();
        }
        //发送验证码邮件
        function sendmailcode() {
            var email = $("#email").val();
            if (email == "") {
                alert("请填写邮箱地址！");
                return;
            }
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: '/user/Service/sendMail.ashx',
                data: "template=" + email,
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
            if (confirm('确定要删除该IP吗?') == false)
                return;
            var rec = <%=gID %>;
            var imgcode = $("#imgcode").val();
            var emailcode = $("#emailcode").val();
            if ((emailcode == "") || (imgcode == "")) {
                alert("内容填写不全！");
                return;
            }
            var sSource = '/user/Service/code.ashx?t=' + Math.random();
            var postData = 'rec=' + rec + '&email=' + emailcode + '&imgcode=' + imgcode + '&name=delip';
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: sSource,
                data: postData,
                success: function (json) {
                    if (json.result == 'ok') {
                        alert(json.msg);
                        self.location = "/user/ip/List.aspx";
                    } else {
                        alert(json.msg);
                    }
                }
            })
        };
    </script>
</asp:Content>
