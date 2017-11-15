<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="modify.aspx.cs" Inherits="KuaiCard.WebUI.User.Api.modify" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">技术开发资料</h1>
    </div>
    <div class="main m-form tabular-form">
        <div class="form-group">
            <label class="control-label">商户ID</label>
            <div class="form-static"><%=gUserID %></div>
        </div>
        <div class="form-group">
            <label class="control-label">修改密钥</label>
            <input type="text" id="newkey" class="form-control" placeholder="请输入密钥" readonly="readonly" />
            <a href="javascript:getkey();" class="btn btn-primary generate-key">随机生成新密钥</a>
        </div>
        <div class="form-group">
            <label class="control-label">支付密码</label>
            <input type="password" id="paypwd" class="form-control" placeholder="请输入支付密码" />
        </div>
        <div class="form-group">
            <label class="control-label">验证码</label>
            <div class="captcha-control">
                <input type="text" id="imgcode"  class="form-control" placeholder="请输入验证码" />
                <img  alt="点击刷新验证码" id="captchaImg" data-url="/CodeImage.aspx" src="/CodeImage.aspx"  class="captcha" title="点我换一张" onclick="reloadimage();"/>
            </div>
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-primary" onclick="ajaxSubmit();">提交修改</button>
        </div>
        <div class="document-example">
            <i class="icon icon-doc"></i>
            <h3>技术开发文档例</h3>
            <p>提供面向本站发起API支付的相关技术参数,接入说明等</p>
            <a href="Demo.zip" class="btn btn-primary btn-download">点击下载</a>
        </div>
    </div>
    <script type="text/javascript">
        function getkey() {
            var sSource = '/user/Service/code.ashx?t=' + Math.random();
            var postData = 'name=getkey';
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: sSource,
                data: postData,
                success: function (json) {
                    if (json.result == 'ok') {
                        $("#newkey").val(json.msg);
                    } else {
                        alert(json.msg);
                    }
                }
            })
        }
        function ajaxSubmit() {
            var paypwd = $("#paypwd").val();
            var imgcode = $("#imgcode").val();
            var newkey = $("#newkey").val();
            if ((paypwd == "") || (imgcode == "") || (newkey == "")) {
                alert("内容填写不全！");
                return;
            }
            var sSource = '/user/Service/code.ashx?t=' + Math.random();
            var postData = 'paypwd=' + paypwd + '&newkey=' + newkey + '&imgcode=' + imgcode + '&name=upkey';
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: sSource,
                data: postData,
                success: function (json) {
                    if (json.result == 'ok') {
                        alert("密钥修改成功！");
                        window.location.href = "/user/api";
                    } else {
                        alert(json.msg);
                    }
                }
            })
        };
        //验证码
        function reloadimage() {
            document.getElementById("captchaImg").src = "/CodeImage.aspx?t=" + Math.random();
        }
    </script>
</asp:Content>