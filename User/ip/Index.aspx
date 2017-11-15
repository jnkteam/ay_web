<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.User.IP.index" Title="修改绑定邮箱" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">绑定IP</h1>
    </div>
    <div class="main m-form tabular-form">
        <div class="form-group">
            <label class="control-label">IP</label>
            <input type="text" id="newip" class="form-control" placeholder="请输入IP地址" />
            <a href="List.aspx" class="add-ip"><i class="icon icon-add"></i>已绑定列表</a>
        </div>
        <div class="form-group">
            <label class="control-label">IP验证</label>
            <label class="checkbox"><input type="checkbox" id="loginip" value="checked" />登录验证IP</label>
            <label class="checkbox"><input type="checkbox" id="noticeip" value=""/>下发API验证IP</label>            
        </div>
        <div class="form-group">
            <label class="control-label">支付密码</label>
            <input type="password" id="paypwd" class="form-control" placeholder="请输入支付密码" />
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
        <div class="handy-tips">
            <h4><i class="icon icon-warn"></i>温馨提示：</h4>
            <p>1、用户绑定IP，只有在指定的IP才可以登录，用户可以一次性绑定多个IP地址。</p>
            <p>2、如果本地宽带IP是动态IP的情况下请勿绑定，一旦绑定动态IP商户将无法登录或结算，如需要解绑请联系开户人员。</p>
        </div>
    </div>
    <script type="text/javascript">
        //验证码
        function reloadimage() {
            document.getElementById("captchaImg").src = "/CodeImage.aspx?t=" + Math.random();
        }

        function ajaxSubmit() {
            var newip = $("#newip").val();
            var loginip = "0";
            var noticeip = "0";
            if ($('#loginip').prop('checked')) {
                loginip = "1";
            }
            if ($('#noticeip').prop('checked')) {
                noticeip = "1";
            }
            var paypwd = $("#paypwd").val();
            var imgcode = $("#imgcode").val();
            if ((newip == "") || (paypwd == "") || (imgcode == "") || (loginip == "0") && (noticeip == "0")) {
                alert("内容填写不全！");
                return;
            }

            var sSource = '/user/Service/code.ashx?t=' + Math.random();
            var postData = 'newip=' + newip + '&loginip=' + loginip + '&noticeip=' + noticeip + '&paypwd=' + paypwd + '&imgcode=' + imgcode + '&name=newip';
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: sSource,
                data: postData,
                success: function (json) {
                    if (json.result == 'ok') {
                        alert(json.msg);
                        self.location = "/user/ip/";
                    } else {
                        alert(json.msg);
                    }
                }
            })
        };
    </script>
</asp:Content>