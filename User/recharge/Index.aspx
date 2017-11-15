<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.User.Recharge.index" %>
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
</head>
<body>
    <div class="container">
        <div class="topbar">
            <span class="sidebar-toggle" id="sidebar-toggle"><i class="icon icon-toggle"></i></span>
            <div class="top-greeting">
                <img src="/images/avatar.png" alt="" class="avatar" />您好，<span class="nickname"><%=UserName%></span>
            </div>
            <a href="#" class="top-message"><i class="icon icon-message"></i><span class="number"><%=UserMsgCount%></span></a>
            <div class="last-login">
                <i class="icon icon-time"></i>上次登录时间：<%=UserLastLoginTime %>
                <i class="icon icon-ip"></i>上次登录IP：<%=UserLastLoginIp %>
            </div>
            <div class="top-balance">
                <i class="icon icon-balance"></i>余额：<span class="amount"><%=UserBalance %></span>元<a href="javascript:;" onclick="ajaxSubmit();" class="refresh">刷新</a>
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
        <div class="titlebar">
            <h1 class="title">自动充值</h1>
        </div>
        <form id="paypost" action="post.aspx" method="post" target="_blank">
        <div class="main m-form tabular-form">
            <div class="form-group">
                <label class="control-label">账户类型</label>
                <label class="radio"><input type="radio" checked="checked" />银行卡</label>
            </div>
            <div class="form-group">
                <label class="control-label">银行卡</label>
                <div class="choose-bank">
                    <ul class="cashier-banks">
                        <li class="cashier-bank"><label><input type="radio" value="967" name="bankName"/><img class="bank" src="/images/bank-1002.png" alt="" /></label></li>
                        <li class="cashier-bank"><label><input type="radio" value="964" name="bankName"/><img class="bank" src="/images/bank-1005.png" alt="" /></label></li>
                        <li class="cashier-bank"><label><input type="radio" value="963" name="bankName"/><img class="bank" src="/images/bank-1026.png" alt="" /></label></li>
                        <li class="cashier-bank"><label><input type="radio" value="965" name="bankName"/><img class="bank" src="/images/bank-1003.png" alt="" /></label></li>
                        <li class="cashier-bank"><label><input type="radio" value="970" name="bankName"/><img class="bank" src="/images/bank-1001.png" alt="" /></label></li>
                        <li class="cashier-bank"><label><input type="radio" value="978" name="bankName"/><img class="bank" src="/images/bank-1010.png" alt="" /></label></li>                       
                        <li class="cashier-bank"><label><input type="radio" value="986" name="bankName"/><img class="bank" src="/images/bank-1022.png" alt="" /></label></li>
                        <li class="cashier-bank"><label><input type="radio" value="962" name="bankName"/><img class="bank" src="/images/bank-1021.png" alt="" /></label></li>
                        <li class="cashier-bank"><label><input type="radio" value="980" name="bankName"/><img class="bank" src="/images/bank-1006.png" alt="" /></label></li>
                        <li class="cashier-bank"><label><input type="radio" value="971" name="bankName"/><img class="bank" src="/images/bank-1066.png" alt="" /></label></li>
                        <li class="cashier-bank"><label><input type="radio" value="989" name="bankName"/><img class="bank" src="/images/bank-1030.png" alt="" /></label></li>
                        <li class="cashier-bank"><label><input type="radio" value="985" name="bankName"/><img class="bank" src="/images/bank-1027.png" alt="" /></label></li>
                    </ul>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label">金额</label>
                <input type="text" name="money"  class="form-control input-sm" onkeypress="keyPress(this);" />
                <span class="unit">（单位：元）</span>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-primary" onclick="dopaypost();">提 &nbsp; 交</button>
            </div>
        </div>
        </form>
        <script type="text/javascript" language="javascript">
            function keyPress(ob) {
                if (!ob.value.match(/^[\+\-]?\d*?\.?\d*?$/)) ob.value = ob.t_value; else ob.t_value = ob.value; if (ob.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/)) ob.o_value = ob.value;
            }
            function dopaypost() {
                document.getElementById("paypost").submit();
            }  
        </script>    
    </div>
</body>
</html>