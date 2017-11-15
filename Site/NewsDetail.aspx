<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsDetail.aspx.cs" Inherits="KuaiCard.WebUI.News.NewsDetail" EnableViewState="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"  content="webkit"/>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>新闻公告</title>
    <meta name="KeyWords" content="API,支付接口,点卡回收,游戏支付,微信支付接口，支付宝扫码接口，支付宝接口，微信支付，网银支付，快捷支付，扫码支付 " />
    <meta name="description" content="爱扬网络是全国领先的游戏点卡回收API接口提供商，拥有多条稳定的游戏支付回收接口渠道，包括盛大、骏网、网易、久游、腾讯Q币卡、完美、征途、金山、光宇等一卡通消耗渠道，与多家游戏平台合作，专业提供安全稳定高效的游戏API支付回收接口平台，是您运营网站及游戏的首要合作伙伴。" />
    <meta name="author" content="爱扬网络销卡平台" />
    <link href="../static/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="../static/css/header.css" rel="stylesheet" type="text/css" />
    <link href="../static/css/main.css" rel="stylesheet" type="text/css" />
    <link href="../static/css/lunbo.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.flexslider-min.js"></script>
    <script type="text/javascript" src="../static/js/menu.js"></script>
</head>
<body class="bg_white">
<div class="main100">
    <div class="w_header mainFixed">
        <div class="w_left fl">
            <a href="../Index.aspx"><img src="../static/img/w_logo.png"/></a>
        </div>
        <div class="w_right t_r fr">
            <div class="fr">
                <a href="Login.aspx" class="fl f_blue">登录</a>
                <a href="Reg.aspx" class="w_register disBlock f_blue t_c fr">注册</a>
            </div>
            <ul class="fr">
                <li>
                    <a href="../Index.aspx">首页</a>
                </li>
                <li>
                    <a href="Introduce.html">产品介绍</a>
                </li>
                <li  class="active">
                    <a href="NewsList.aspx">新闻公告</a>
                </li>
                <li>
                    <a href="Contact.html">联系我们</a>
                </li>
            </ul>

        </div>
    </div>
    <div class="mainFixed w_details">
        <div class="xs_title">
            <a href="NewsList.aspx" class="f_18">新闻公告</a>
            <span class="w_xj">></span>
            <span class="f_18 f_blue">新闻详情</span>
        </div>
        <form id="form1" runat="server">
        <div class="w_details_c">
            <h4 class="t_c f_24 f_3"><%# NewsTitle %></h4>
            <span class="disBlock t_c f_6">发布时间：<%# NewsTime %></span>
            <%# NewsContent %>
        </div>
        </form>
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
                        <span class="disBlock f_6">山东省海阳市御景公馆313室</span>
                    </div>
                    <div class="w_one fl">
                        <h4 class="f_6">企业邮箱</h4>
                        <span class="disBlock f_6">admin@0n2.com</span>
                    </div>
                </div>
                <div class="w_news">
                    <a href="#">GeoTrust国际认证</a>
                    <span>|</span>
                    <a href="#">渠道管理平台</a>
                    <span>|</span>
                    <a href="#">公司资质</a>
                    <span>|</span>
                    <a href="#">商户合作</a>
                    <span>|</span>
                    <a href="#">人才招聘</a>
                    <span>|</span>
                    <a href="#">关于我们</a>
                    <span>|</span>
                    <a href="#">商户服务协议</a>
                </div>
            </div>
            <div class="w_right fr t_c">
                <img src="../static/img/w_ewm.png"/>
                <span class="disBlock">扫一扫</span>
                <span class="disBlock">关注我们</span>
            </div>
        </div>
        <div class="xs_bottom">
            <p class="f_6 fl">烟台爱扬网络科技有限公司 Power by @ 版权所有 鲁B2-20170010号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">鲁网文〔2016〕5998-043号</a></p>
            <div class="fl w_of">
                <img src="../static/img/w_footer.png" class="fl"/>
                <span class="f_12 f_9 fl"><a href="#">鲁公网安备 37068702000009号</a></span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
