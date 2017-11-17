<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setpwd.aspx.cs" Inherits="OriginalStudio.WebUI.User.Forget.SetPwd" %>
<!doctype html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>找回密码——第四步:设置密码</title>
    <script src="/js2.0/zft.js" type="text/javascript"></script>
    <script src="/js2.0/alljs.js" type="text/javascript"></script>
    <link href="/css2.0/zft.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="container">
    <div class="header">
        <div class="layout">
            <img src="/images/logo.png" alt="" class="logo" />
            <div class="top-skype"><i class="icon icon-s"></i>客服Skype：zhifoopay.com &nbsp;&nbsp; 20630369 &nbsp;&nbsp; 7×24小时</div>
        </div>
    </div>
    <div class="content">
        <div class="layout">
            <div class="m-section">
                <div class="sec-header">
                    <h3 class="sec-title"><i class="icon icon-lock"></i>找回密码</h3>
                </div>
                <div class="sec-content">
                    <div class="retrieve-password">
                        <ol class="process-steps">
                            <li class="done">
                                <span class="step-no">1</span>
                                <span class="step-name">填写账号</span>
                            </li>
                            <li class="done">
                                <span class="step-no">2</span>
                                <span class="step-name">选择找回方式</span>
                            </li>
                            <li class="done">
                                <span class="step-no">3</span>
                                <span class="step-name">验证</span>
                            </li>
                            <li class="current">
                                <span class="step-no">4</span>
                                <span class="step-name">重设密码</span>
                            </li>
                        </ol>
                        <form runat="server" class="m-form retrieve-form">
                            <div class="form-group">
                                <label class="control-label">新密码：</label>
                                <input type="password"  runat="server" ID="txtPwd1" class="form-control" placeholder="请输入您的新密码">
                                <asp:TextBox  TextMode="Password" CssClass="form-control" placeholder="请输入您的新密码"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">确认密码：</label>
                                <input type="password"  runat="server" ID="txtPwd2" class="form-control" placeholder="请输入请再次输入您的新密码您的新密码">
                            </div>
                            <div class="form-group">
                                <label class="control-label">验证码：</label>
                                <div class="captcha-control">
                                    <input type="text"  runat="server" ID="txtImgCode" class="form-control" placeholder="请输入验证码">
                                    <img  alt="点击刷新验证码" id="captchaImg" data-url="/CodeImage.aspx" src="/CodeImage.aspx"  class="captcha" title="点我换一张" onclick="reloadimage();"/>
                                </div>
                            </div>
                            <div class="btn-group">
                                <asp:Button ID="btnNext" runat="server" CssClass="btn btn-primary" Text="提交修改"  OnClick="btnNext_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="layout">
            <div class="copyright">Copyright©2017 支付通版权所有 &nbsp; 网站备案/许可证号：沪ICP备17004246号-1</div>
        </div>
    </div>
</div>
</body>
</html>
