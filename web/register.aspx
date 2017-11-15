﻿<!DOCTYPE html>
<html>
<head>
    <title>爱扬网络_用户登录</title>
    <meta name="KeyWords" content="API,支付接口,点卡回收,游戏支付 " />
    <meta name="description" content="爱扬网络是全国领先的游戏点卡回收API接口提供商，拥有多条稳定的游戏支付回收接口渠道，包括盛大、骏网、网易、久游、腾讯Q币卡、完美、征途、金山、光宇等一卡通消耗渠道，与多家游戏平台合作，专业提供安全稳定高效的游戏API支付回收接口平台，是您运营网站及游戏的首要合作伙伴。" />
    <meta name="author" content="爱扬网络销卡平台">
    <link rel="shortcut icon" href="/favicon.ico" />

    <link href="../Content/web/style/newstyle.css" rel="stylesheet" type="text/css" />
    <link href="../Content/web/style/css.css" rel="stylesheet" type="text/css" />
    <link href="../Content/web/style/shouye.css" rel="stylesheet" type="text/css" />
    <script src="../Content/web/js/jQuery.js" type="text/javascript"></script>
    <script src="../Content/web/js/jquery.min.js" type="text/javascript"></script>
    <script src="../Content/web/js/jquery.smoove.js" type="text/javascript"></script>
</head>
<body>
    
<div class="nav1-box">
    <div class="top-box">
        <ul class="top-box3">
           <li><a href="service.aspx">在线客服</a></li>
            <li><a href="jrwm.aspx">人才招聘</a> </li>
            <li><a href="company.aspx">公司资质</a></li>
            <li><a href="contact.aspx">帮助中心</a></li>
            <li><a href="join.aspx">加盟爱扬</a></li>
            <li><a href="javascript:void(0);" onclick="AddFavorite('爱扬网络','http://www.0n2.com')">添加收藏</a></li>
            <li><a href="javascript:void(0);" onclick="SetHome(this,'http://www.0n2.com');">设为首页</a></li>
        </ul>
        <script type="text/javascript">
            //设为首页 
            function SetHome(obj, url) {
                try {
                    obj.style.behavior = 'url(#default#homepage)';
                    obj.setHomePage(url);
                } catch (e) {
                    if (window.netscape) {
                        try {
                            netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                        } catch (e) {
                            alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
                        }
                    } else {
                        alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【" + url + "】设置为首页。");
                    }
                }
            }
            //收藏本站
            function AddFavorite(title, url) {
                try {
                    window.external.addFavorite(url, title);
                }
                catch (e) {
                    try {
                        window.sidebar.addPanel(title, url, "");
                    }
                    catch (e) {
                        alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请进入新网站后使用Ctrl+D进行添加");
                    }
                }
            }
        </script>
        <div class="top-box2">

        </div>
        <div class="top-box1">全国热线电话：0535-3317567</div>
    </div>
    <div style="clear: both;"></div>
    <div class="logo-box">
        <img src="../Content/Web/images/logo1.png">
    </div>
   <ul class="nav-ul">
            <li><a href="contact.aspx">联系我们</a></li>
            <li><a href="solution.aspx">行业解决方案</a></li>
            <li><a href="news.aspx">公  告</a></li>
            <li><a href="product.aspx">产品介绍</a></li>
            <li><a href="about.aspx">平台介绍</a></li>
            <li><a href="../index.aspx">首页</a></li>
        </ul>
</div>
<script>
    $(".nav-box ul.nav-ul li a").click(function () {
        var c = $(".nav-box ul.nav-ul li a").index(this)
        $(".nav-box ul.nav-ul li a").removeClass("on1");
        $(".nav-box ul.nav-ul li a").eq(c).addClass("on1");
    })
</script>

<div class="new-user">
    <div class="user-name">签约申请成功后，我们会安排专人与您取得联系，请提供真实的联系人和联系方式。</div>
    <form id="myform" method="post" action="/web/UserRegSub">
        <ul>
            <li>
                <div class="user-tit">登录账号：</div>
                <div class="user-input">
                    <input name="newusername" type="text" class="user-input-button" id="newusername"
                        size="40" placeholder="请输入登录帐号" onblur="CheckValue('newusername','mesnewname');" />
                </div>
            </li>
            <li style="margin-bottom: 10px;">
                <div class="user-tit">登录密码：</div>
                <div class="user-input">
                    <input name="password1" type="password"
                        class="user-input-button" id="password1" size="40" placeholder="请输入登陆密码" onkeyup="pwStrength(this.value)" onblur="pwStrength(this.value)" />
                </div>
            </li>

            <li style="margin: 0;">
                <div class="user-tit"></div>
                <div class="user-input user-input-mm">
                    <span id="strength_L">弱</span>
                    <span id="strength_M">中</span>
                    <span id="strength_H">强</span>
                </div>
            </li>
            <li style="margin-top: 20px;">
                <div class="user-tit">重复密码：</div>
                <div class="user-input">
                    <input name="password2" type="password" class="user-input-button" id="password2"
                        size="40" placeholder="请输入重复密码" />
                </div>
            </li>
            <li>
                <div class="user-tit">真实姓名：</div>
                <div class="user-input">
                    <input name="newfullname" type="text" class="user-input-button" id="newfullname"
                        size="40" placeholder="请输入真实姓名" />
                </div>
            </li>
            <li>
                <div class="user-tit">电子邮箱：</div>
                <div class="user-input">
                    <input name="newemail" type="text" class="user-input-button" id="newemail" size="40"
                        placeholder="请输入电子邮箱" />
                </div>
            </li>
            <li>
                <div class="user-tit">手机号码：</div>
                <div class="user-input">
                    <input name="newmobile" type="text" class="user-input-button" id="newmobile" size="40"
                        placeholder="请输入手机号码" />
                </div>
            </li>
            <li>
                <div class="user-tit">联系QQ：</div>
                <div class="user-input">
                    <input name="newqq" type="text" class="user-input-button" id="newqq" size="40" placeholder="请输入联系QQ" />
                </div>
            </li>
            <li>
                <div class="user-tit">验证码：</div>
                <div class="user-input user-input-1">
                    <input type="text" name="txtvcode" id="txtvcode" class="user-input-button user-input-button1" placeholder="请输入验证码" />
                </div>
                <div class="yzm3">
                    <img id='imgValidateCode' src="/CodeImage.aspx" width="67" height="32" onclick="this.src='/CodeImage.aspx?' + Math.random()" />
                </div>
            </li>
            <li>
                <div class="user-tit"></div>
                <div class="user-input user-input2">
                    <input id="tyck" name="tyck" type="checkbox" /><a href="/web/Viewinfo?newsid=5" target="_blank">已阅读并同意《爱扬网络注册协议》</a>
                </div>
                <div class="user-ts"></div>
            </li>
            <li>
                <div class="user-tit"></div>
                <a>
                    <div class="user-input user-input1">
                        <input name="subbtn" id="subbtn" type="submit" class="sydl" value="立即注册" />
                    </div>
                </a>
                <div class="user-ts"></div>
            </li>
        </ul>
    </form>
</div>


    <div class="bottom-box2">
        <div class="bottom">
            <ul class="bottom-subnav">
                <li><a href="/web/about.aspx">关于爱扬</a></li>
                <li><a href="/web/solution.aspx">安全保障</a></li>
                <li><a href="/web/company.aspx">公司资质</a></li>
                <li><a href="/web/privacy.html">隐私保护</a></li>
                <li><a href="/web/privacy.html">免责说明</a></li>
            </ul>
            <div class="address">
                <span>烟台爱扬网络科技有限公司</span>
                <span>电话：0535-3317567</span>
                
                <span>地址：山东省海阳市东风大道南路附近</span>
                <span>凤翔家园4座-4单元-501号</span>
            </div>
            <div class="guanzhu">
                <div class="guanzhu-txt">
                    爱扬网络：Www.0N2.Com.是国内领先的充值卡收购平台<br>
                    中华人民共和国工业与信息化ICP备案：鲁ICP备16036145号-7
                </div>
                <div class="guanzhu-women">
                    <span>关注我们</span>
                    <div class="weibo"></div>
                    <div class="weixin"></div>
                </div>
            </div>
        </div>
        <div class="bottom-2">
            <ul>
                <li><a >
                    <img src="../Content/Web//images/bottom-1.png"></a></li>
                <li>
                    <script language="JavaScript" type="text/javascript" src="https://seal.wosign.com/tws.js"></script>
                    </li>
                 <li><a >
                    <img src="../Content/Web//images/bottom-3.png"></a></li>
                <li><a href="http://sq.ccm.gov.cn:80/ccnt/sczr/service/business/emark/toDetail/af818c3857f64b81a8c614cd52c4f997" target="_blank" title="网络文化经营单位">
                    <img src="../Content/Web//images/bottom-4.png"></a></li>
            </ul>
        </div>
    </div>
    <div class="footer-box2">
        <div class="footer">
            <span>Copyright  &copy; 2015 爱扬网络 Www.Ri.Gl 鲁ICP备16036145号-7 网络文化经营许可证号:鲁网文〔2016〕5998-043号</span>
            <div>

            </div>
        </div>
    </div>
</body>
</html>
