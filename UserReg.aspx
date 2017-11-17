<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZFTRegister.aspx.cs" Inherits="OriginalStudio.WebUI.User.ZFTRegister" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>商户注册</title>
    <script src="/js2.0/alljs.js" type="text/javascript"></script>
    <script src="/js2.0/zft.js" type="text/javascript"></script>
    <link href="/css2.0/zft.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        function CheckItem() {
            if (!$('#chkagree').is(':checked')) {
                return false;
            }

            if ($("#txtusername").val() == "") {
                alert("用户名为空！");
                return false;
            }
            if ($("#txtpassword").val() == "") {
                alert("登录密码为空！");
                return false;
            }
            if ($("#txtpassword2").val() == "") {
                alert("确认登录为空！");
                return false;
            }
            if ($("#txtpassword2").val() != $("#txtpassword").val()) {
                alert("两次密码不相同！");
                return false;
            }
            if ($("#txtfullname").val() == "") {
                alert("姓名为空！");
                return false;
            }
            if ($("#txtidCard").val() == "") {
                alert("身份证为空！");
                return false;
            }
            if ($("#txttel").val() == "") {
                alert("手机号码为空！");
                return false;
            }
            if ($("#txtemail").val() == "") {
                alert("电子邮箱为空！");
                return false;
            }
            if ($("#txtqq").val() == "") {
                alert("QQ为空！");
                return false;
            }
            if ($("#txtanswer").val() == "") {
                alert("密保答案为空！");
                return false;
            }
            if ($("#txtimgcode").val() == "") {
                alert("验证码为空！");
                return false;
            }

            return true;
        }
        function goreg(){  
            window.location.href="index.aspx";  
        }  
    </script>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="layout">
            <div class="top-skype"><i class="icon icon-s"></i>客服Skype：zhifoopay.com &nbsp;&nbsp;&nbsp;&nbsp; 7×24小时</div>
        </div>
    </div>
    <div class="content">
        <div class="layout">
            <div class="m-section">
                <div class="sec-header">
                    <h3 class="sec-title"><i class="icon icon-input"></i>商户注册</h3>
                </div>
                <div class="sec-content">
                    <form runat="server" class="m-form register-form">
                        <div class="form-group">
                            <label class="control-label">用户名：</label>
                            <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="请输入用户名" MaxLength="20"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label">登录密码：</label>
                            <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="请输入登录密码"  MaxLength="20"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label">确认登录密码：</label>
                            <asp:TextBox ID="txtpassword2" runat="server" CssClass="form-control" TextMode="Password" placeholder="请再次输入登录密码"  MaxLength="20"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="control-label">手机号码：</label>
                            <asp:TextBox ID="txttel" runat="server" CssClass="form-control" placeholder="请输入您的手机号码" MaxLength="11"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label">电子邮箱：</label>
                            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="请输入电子邮箱地址" MaxLength="50"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label">联系QQ：</label>
                            <asp:TextBox ID="txtqq" runat="server" CssClass="form-control" placeholder="请输入您的联系QQ" MaxLength="20"></asp:TextBox>
                        </div>

                            <asp:DropDownList ID="dlsquestion" runat="server" CssClass="form-control" DataValueField="id" DataTextField="question"  Visible="false"></asp:DropDownList>
                            <asp:TextBox ID="txtanswer" runat="server" CssClass="form-control" placeholder="请输入密保答案" MaxLength="100"  Visible="false"></asp:TextBox>
							                        <asp:TextBox ID="txtfullname" runat="server" CssClass="form-control" placeholder="请输入您的姓名"  Visible="false"></asp:TextBox>
                        <asp:TextBox ID="txtidCard" runat="server" CssClass="form-control" placeholder="请输入身份证号码" MaxLength="18"  Visible="false"></asp:TextBox>
                        <div class="form-group">
                            <label class="control-label">验证码：</label>
                            <div class="captcha-control">
                                <asp:TextBox ID="txtimgcode" runat="server" CssClass="form-control" placeholder="请输入验证码" MaxLength="10"></asp:TextBox>
                                <img  alt="点击刷新验证码" id="captchaImg" data-url="/CodeImage.aspx" src="/CodeImage.aspx"  class="captcha" title="点我换一张" onclick="reloadimage();"/>
                            </div>
                        </div>
                        <div class="register-agree">
                            <label class="checkbox"><input type="checkbox"  id="chkagree" checked="checked" />我已阅读并同意以下协议</label>
                        </div>
                        <div class="register-agreement">
                            <h3>本销售系统注册协议</h3>
                            <p>继续注册并请先阅读支付通商户服务平台合作协议</p>
                        </div>
                        <div class="btn-group">
                            <asp:Button ID="btnReg" runat="server" Text="提交注册" CssClass="btn btn-primary" 
                                OnClientClick="return CheckItem();" onclick="btnReg_Click" />　　　
                            <button type="button" class="btn btn-primary" onclick="goreg();">返回登录</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="layout">
            <div class="copyright">Copyright©2017 爱扬网络版权所有 &nbsp; 网站备案/许可证号：沪ICP备17004246号-1</div>
        </div>
    </div>
</div>
</body>
</html>
