<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="OriginalStudio.WebUI.NewIndex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" content="webkit" />
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>爱扬科技-爱扬云计费_爱扬游戏服务网-游戏点卡消耗_支付平台接口提供商</title>
    <meta name="KeyWords" content="API,支付接口,点卡回收,游戏支付,微信支付接口，支付宝扫码接口，支付宝接口，微信支付，网银支付，快捷支付，扫码支付 " />
    <meta name="description" content="爱扬网络是全国领先的游戏点卡回收API接口提供商，拥有多条稳定的游戏支付回收接口渠道，包括盛大、骏网、网易、久游、腾讯Q币卡、完美、征途、金山、光宇等一卡通消耗渠道，与多家游戏平台合作，专业提供安全稳定高效的游戏API支付回收接口平台，是您运营网站及游戏的首要合作伙伴。" />
    <meta name="author" content="爱扬网络销卡平台" />
    <link href="static/css/reset.css" rel="stylesheet" type="text/css" /><!--清空样式 css-->
    <link href="static/css/header.css" rel="stylesheet" type="text/css" /><!--head footh css-->
    <link href="static/css/main.css" rel="stylesheet" type="text/css" />
    <link href="static/css/lunbo.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.flexslider-min.js"></script>
</head>
<body class="bg_white">
<form id="form1" runat="server"></form>
<div class="main100">
    <div class="w_header mainFixed">
        <div class="w_left fl">
            <a href="Index.aspx"><img alt="" src="static/img/w_logo.png"/></a>
        </div>
        <div class="w_right t_r fr">
            <div class="fr">
                <a href="Site/Login.aspx" class="fl f_blue">登录</a>
                <a href="Reg.aspx" class="w_register disBlock f_blue t_c fr">注册</a>
            </div>
            <ul class="fr">
                <li class="active">
                    <a href="Index.aspx">首页</a>
                </li>
                <li>
                    <a href="Site/Introduce.html">产品介绍</a>
                </li>
                <li>
                    <a href="Site/NewsList.aspx">新闻公告</a>
                </li>
                <li>
                    <a href="Site/Contact.html">联系我们</a>
                </li>
            </ul>

        </div>
    </div>
    <div class="flexslider">
        <ul class="slides">
            <li style="background: url(static/img/w_baner.jpg) 50% 0 no-repeat;"></li>
            <li style="background: url(static/img/w_baner1.jpg) 50% 0 no-repeat;"></li>
            <li style="background: url(static/img/w_baner2.jpg) 50% 0 no-repeat;"></li>
        </ul>
        <ol class="flex-control-nav flex-control-paging"></ol>
    </div>
    <div class="mainFixed w_service t_c w_of">
        <h5 class="f_blue f_30 t_c">我们能做什么？</h5>
        <h1 class="f_34 f_black t_c">我们提供最全面，最安全，最简单的支付方式</h1>
        <p class="f_16 f_6">聚合支付，一切才刚刚开始。你需要自由搭建灵活、强大的支付系统，
            <br/>来应对任何行业和场景的商业需求。</p>
        <ul>
            <li class="fl t_c">
                <img alt="" src="static/img/w_icon0.png"/>
                <span class="disBlock">清算机构管理平台</span>
            </li>
            <li class="fl t_c">
                <img alt="" src="static/img/w_icon1.png"/>
                <span class="disBlock">商户管理平台</span>
            </li>
            <li class="fl t_c">
                <img src="static/img/w_icon2.png"/>
                <span class="disBlock">渠道管理平台</span>
            </li>
            <li class="fl t_c">
                <img alt="" src="static/img/w_icon3.png"/>
                <span class="disBlock">商户前端服务接入</span>
            </li>
            <li class="fl t_c">
                <img alt="" src="static/img/w_icon4.png"/>
                <span class="disBlock">移动支付网关</span>
            </li>
        </ul>
    </div>
    <div class="main100 w_of w_partner">
        <div class="mainFixed">
            <h5 class="t_c f_30 f_3">合作伙伴</h5>
            <div class="t_c mainFixed">
                <img alt="" src="static/img/w_partner0.jpg"/>
                <img alt="" src="static/img/w_partner1.jpg"/>
                <img alt="" src="static/img/w_partner2.jpg"/>
                <img alt="" src="static/img/w_partner0.jpg"/>
                <img alt="" src="static/img/w_partner1.jpg"/>
            </div>
        </div>
    </div>
    <div class="w_footer mainFixed">
        <div class="w_of w_footer_t">
            <div class="w_left fl">
                <div class="w_of">
                    <div class="w_one fl">
                        <h4 class="f_6">服务热线</h4>
                        <span class="disBlock f_6 f_30">0535-3317567</span>
                    </div>
                    <div class="w_one fl">
                        <h4 class="f_6">公司地址</h4>
                        <span class="disBlock f_6">山东省海阳市御景公馆312-313室</span>
                    </div>
                    <div class="w_one fl">
                        <h4 class="f_6">企业邮箱</h4>
                        <span class="disBlock f_6">admin@0n2.com</span>
                    </div>
                </div>
                <div class="w_news">
                    <a href="https://sealsplash.geotrust.com/splash?&dn=www.0n2.com">GeoTrust国际认证</a>
                    <span>|</span>
                    <a href="login.aspx">渠道管理平台</a>
                    <span>|</span>
                    <a href="https://www.0n2.com/web/company.aspx">公司资质</a>
                    <span>|</span>
                    <a href="/Site/Contact.html">商户合作</a>
                    <span>|</span>
                    <a href="web/jrwm.aspx">人才招聘</a>
                    <span>|</span>
                    <a href="/Site/Contact.html">关于我们</a>
                    <span>|</span>
                    <a href="/web/about.aspx">商户服务协议</a>
                </div>
            </div>
            <div class="w_right fr t_c">
                <img alt="" src="static/img/w_ewm.png"/>
                <span class="disBlock">扫一扫</span>
                <span class="disBlock">关注我们</span>
            </div>
        </div>
        <div class="xs_bottom">
            <p class="f_6 fl">烟台爱扬网络科技有限公司 Power by @ 版权所有 鲁B2-20170010号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://sq.ccm.gov.cn/ccnt/sczr/service/business/emark/toDetail/af818c3857f64b81a8c614cd52c4f997">鲁网文〔2016〕5998-043号</a></p>
            <div class="fl w_of">
                <img alt="" src="static/img/w_footer.png" class="fl"/>
                <span class="f_12 f_9 fl"><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=37068702000009">鲁公网安备 37068702000009号</a></span>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" language="javascript">
    $(window).load(function () {
        $('.flexslider').flexslider({
            directionNav: false,
            pauseOnAction: false
        });
    });
</script>
</body>
</html>

