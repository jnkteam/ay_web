<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="OriginalStudio.WebUI.User.Api.index_zft" %>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="charset" content="utf-8" />
    <meta http-equiv="Expires" content="0" /> 
    <meta http-equiv="Cache-Control" content="no-cache" /> 
    <meta http-equiv="Pragma" content="no-cache" /> 
    <title>接入中心 - 技术开发资料</title>
    <script src="/js2.0/alljs.js" type="text/javascript"></script>
    <script src="/js2.0/zft.js" type="text/javascript"></script>
    <link href="/css2.0/zft.css" rel="stylesheet" type="text/css" />
    <script src="/js2.0/user.js" type="text/javascript"></script>
    <script type="text/javascript">
        //验证码
        function reloadimage() {
    	    document.getElementById("captchaImg").src = "/CodeImage.aspx?t=" + Math.random();
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="topbar">
            <span class="sidebar-toggle" id="sidebar-toggle"><i class="icon icon-toggle"></i></span>
            <div class="top-greeting">
                <img src="/images/avatar.png" alt="" class="avatar" />您好，<span class="nickname"><%=UserName%></span>
            </div>
            <a href="#" class="top-message"><i class="icon icon-message"></i><span class="number">6</span></a>
            <div class="last-login">
                <i class="icon icon-time"></i>上次登录时间：<%=UserLastLoginTime %>
                <i class="icon icon-ip"></i>上次登录IP：<%=UserLastLoginIp %>
            </div>
            <div class="top-balance">
                <i class="icon icon-balance"></i>余额：<span class="amount"><%=UserBalance %></span>元<a href="javascript:;" onclick="getamt();" class="refresh">刷新</a>
            </div>
            <div class="top-time">
                <i class="icon icon-time"></i><span class="current-time" id="current-time"></span>
            </div>
            <a href="/user/loginout.aspx" class="btn btn-logout"><i class="icon icon-logout"></i>注销</a>
        </div>
        <div class="sidebar">
            <div class="sidebar-inner">
                <ul class="nav">
                    <li>
                        <i class="icon icon-home"></i>
                        <dl>
                            <dd><a href="/User/" class="active">商户首页</a></dd>
                        </dl>
                    </li>
                    <li>
                        <i class="icon icon-transaction"></i>
                        <dl>
                            <dt>交易管理</dt>
                            <dd><a href="/user/order/">网银订单</a></dd>
                        </dl>
                    </li>
                    <li>
                        <i class="icon icon-financial"></i>
                        <dl>
                            <dt>财务管理</dt>
                            <dd><a href="/user/money/">收支明细</a></dd>
                            <dd><a href="/user/withdrawal/batch.aspx">批量下发</a></dd>
                            <dd><a href="/user/withdrawal/">提现管理</a></dd>
                            <dd><a href="/user/cashcoupon/">结算记录</a></dd>
                            <dd><a href="/user/verify/">收款账户</a></dd>
                        </dl>
                    </li>
                    <li>
                        <i class="icon icon-security"></i>
                        <dl>
                            <dt>安全中心</dt>
                            <dd><a href="/user/password/">修改密码</a></dd>
                            <dd><a href="/user/mobile/">绑定手机</a></dd>
                            <dd><a href="/user/ip/">绑定IP</a></dd>
                            <dd><a href="/user/email/">安全邮箱</a></dd>
                            <dd><a href="/user/awalpassword/">支付密码</a></dd>
                        </dl>
                    </li>
                    <li>
                        <i class="icon icon-download"></i>
                        <dl>
                            <dt>接入中心</dt>
                            <dd><a href="/user/api/">资料下载</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <div class="mainbar">
            <div class="titlebar">
                <h1 class="title">技术开发资料</h1>
            </div>
            <div class="main m-form tabular-form">
                <form id="form1" runat="server"  style="width:99%">
                <div class="main">
                    <div class="form-group">
                        <label class="control-label">商户ID</label>
                        <div class="form-static"><%=gUserID %></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">商户密钥</label>
                        <a href="javascript:showpop();" class="btn btn-primary expand-key" id="showopen">展开密钥</a>
                        <div class="form-static">
                            <span class="merchant-key" id="spkey"></span>                            
                        </div>
                        <a href="modify.aspx" class="btn btn-primary modify-key">修改密钥</a>
                        <div class="form-warning">为了资金安全,请勿向第三方泄露密钥,如需修改请联系商务</div>
                    </div>

                    <div class="document-example">
                        <i class="icon icon-doc"></i>
                        <h3>技术开发文档例</h3>
                        <p>提供面向本站发起API支付的相关技术参数,接入说明等</p>
                        <a href="Demo.zip" class="btn btn-primary btn-download">点击下载</a>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    <div class="popup" style="left:50%;top:50%;margin-left:-400px;margin-top:-150px;  display:none;">
        <div class="popup-header">
            <h3 class="popup-title">展开密钥</h3>
            <span class="popup-close"><i class="icon-close"></i></span>
        </div>
        <div class="popup-body">
            <form action="" method="post" class="m-form popup-form">
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
                    <button type="button" class="btn btn-primary" onclick="ajaxSubmit();">确认展开</button>
                </div>
            </form>
        </div>
    </div>
    <div class="shade" style="display:none"></div>
    <script type="text/javascript">
        function ajaxSubmit() {
            var paypwd = $("#paypwd").val();
            var imgcode = $("#imgcode").val();
            if ((paypwd == "") || (imgcode == "")) {
                alert("内容填写不全！");
                return;
            }
            var sSource = '/user/Service/code.ashx?t=' + Math.random();
            var postData = 'paypwd=' + paypwd + '&imgcode=' + imgcode + '&name=showkey';
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: sSource,
                data: postData,
                success: function (json) {
                    if (json.result == 'ok') {
                        $("#spkey").html(json.msg);
                        $("#showopen").hide();
                        $(".popup").popup-close();
                        $(".popup").add(".shade").hide();
                    } else {
                        alert(json.msg);
                    }
                }
            })
        };
        function showpop() {
            $(".popup").show();
            $(".shade").show();
        };
        $(function () {
            $(".popup").on("click", ".popup-close", function () {
                $(".popup").add(".shade").hide();
            });
        });
    </script>
</body>
</html>