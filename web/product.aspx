<!DOCTYPE html>
<html>
<head>
    <title>爱扬网络产品简介_点卡回收_API支付接口_游戏点卡回收_游戏支付平台接口提供商</title>
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
        <img src="../Content/Web//images/logo1.png">
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

<div class="banner2-box">
    <div class="banner2-con">
        <img src="../Content/Web//images/02_1.png">
    </div>
</div>
<div class="platform-con">
    <div class="platform2-con-tit">
        <div class="tit1 current2 tt">产品简介</div>
        <div class="tit2 tt">产品特点</div>
        <div class="tit2 tt">业务开通流程</div>
        <div class="tit2 tt">支持卡类</div>
        <div class="tit2 tt">点卡余额查询</div>
    </div>
    <!--产品简介 -->
    <div class="tit1-txt t-t">
        <div class="palt3-bg">
            <div style="width: 100%; background: #ffffff;">
                <div class="platform-con-txt">
                    <div class="dong1">
                        <span>“充值卡”收购是一种在线验证和接受用户提交的充值卡（手机充值卡、游戏充值卡），方便用户使用该种非银行卡消费方式进行网购消费或对爱扬网络账户充值。</span>
                        <span style="margin-top: 30px;">完全能保证在节假日期间也能稳定各类游戏充值点卡。平台可以多种支付渠道。支付、销售等过程系统自动记录，各种记录报表查询一目了然。</span>
                        <span>完全实行在线支付，实时提卡；在线充值，即时到帐的便捷功能。</span>
                    </div>
                </div>
            </div>
            <div class="aqbj">
                <div class="aqbj-con">
                    <div class="pro-t block" data-move-x="-100px">为广大用户提供多渠道兑换服务</div>
                    <div class="pro-k block" data-move-x="-100px">急速点卡消耗</div>
                </div>
            </div>
            <div style="width: 100%; background: #ffffff;">
                <div class="plat2-icon">
                    <div>充值卡 回收合作伙伴</div>
                    <ul>
                        <li class="block" data-move-y="100px"></li>
                        <li class="block" data-move-y="100px"></li>
                        <li class="block" data-move-y="100px"></li>
                        <li class="block" data-move-y="100px"></li>
                        <li class="block" data-move-y="100px"></li>
                        <li class="block" data-move-x="100px"></li>
                        <li class="block" data-move-x="100px"></li>
                        <li class="block" data-move-x="100px"></li>
                        <li class="block" data-move-x="100px"></li>
                        <li class="block" data-move-x="100px"></li>
                        <li class="block" data-move-y="100px"></li>
                        <li class="block" data-move-y="100px"></li>
                        <li class="block" data-move-y="100px"></li>
                        <li class="block" data-move-y="100px"></li>
                        <li class="block" data-move-y="100px"></li>
                        <li class="block" data-move-x="100px"></li>
                        <li class="block" data-move-x="100px"></li>
                        <li class="block" data-move-x="100px"></li>
                        <li class="block" data-move-x="100px"></li>
                        <li class="block" data-move-x="100px"></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--产品特点 -->
    <div class="tit2-txt t-t">
        <div class="palt4-bg">
            <div style="width: 100%; background: #ffffff;">
                <div class="platform-con-txt">
                    <div>
                        <span>（1）用户只需输入所持有的充值卡上标明的序列号和刮开的卡密码就可以完成兑换。无需输入银行卡卡号及密码，安全性高，不记名，不关联银行卡，一次 使用，尤其便于小额、频繁消费的方式；</span>
                        <span style="margin-top: 30px;">（2）爱扬网络可以提高充值卡付费功能，为商家吸引更多担心网银消费安全人群、无银行卡人群、小额付费频繁人群这类潜在的消费群体。</span>
                    </div>
                </div>
            </div>
            <div class="aqbj">
                <div class="aqbj-con">
                    <div style="margin-left: 460px; margin-top: 120px;">
                        <img src="../Content/Web//images/02_2.png">
                    </div>
                </div>
            </div>
            <div style="width: 100%; background: #ffffff;">
                <div style="width: 1000px; margin: 0 auto; overflow: hidden; padding-bottom: 30px;">
                    <div class="plat2-icon-1 block" data-move-y="100px">
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <span>安全高效</span>
                        <span>随时随地</span>
                        <span>广泛支持</span>
                        <span>费用更省</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -->
    <!--业务开通流程 -->
    <div class="tit3-txt t-t">
        <div class="palt4-bg">
            <div style="width: 100%; background: #ffffff;">
                <div class="platform-con-txt">
                    <div>
                        <span>（1） 个人/企业注册请与商务人员联系，我们了解您的需求后，帮助您顺利签约并开通服务；</span>
                        <span>（2）接口接入请您提供企业法人营业执照、织机构代码证、法人身份证复印件各一份；</span>
                        <span>（3） 一对一的服务人员审核好您的资料后，与您签订合作协议；</span>
                        <span>（4）合作协议签订日起1-5个工作日内，向您提供使用账号；</span>
                    </div>
                </div>
            </div>
            <div class="aqbj">
                <div class="aqbj-con block" data-move-y="100px">
                    <div style="margin-left: 310px; margin-top: 70px;">
                        <img src="../Content/Web//images/02_3.png">
                    </div>
                </div>
            </div>
            <div style="width: 100%; background: #ffffff;">
                <div class="plat3-icon block" data-move-y="100px">
                    <div>
                        <img src="../Content/Web//images/02_4.png">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -->
    <!--业务开通流程 -->
    <div class="tit4-txt t-t">
        <div class="palt4-bg">
            <div style="width: 100%; background: #ffffff;">
                <div class="card-all">
                    <ul>
                        <li>
                            <div class="card1"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card2"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card3"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card4"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card5"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card6"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card7"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card8"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card9"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card10"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card11"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card12"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card13"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card14"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card15"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card16"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card17"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card18"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card19"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                        <li>
                            <div class="card20"></div>
                            <div class="price">
                                <span>10元</span><span>20元</span><span>30元</span><span>50元</span><span>200元</span><span>300元</span><span>500元</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- -->
    <!--点卡余额查询 -->
    <div class="tit5-txt t-t">
        <div class="palt4-bg">
            <div style="width: 100%; background: #ffffff;">
                <div class="card-all">
                    <ul>
                        <li>
                            <div class="card1"></div>
                            <div class="price1">
                                <div class=""><a href="https://upay.10010.com/npfweb/npfcellweb/phone_recharge_fill.htm?menuId=000200010003" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://iservice.10010.com/e3/" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card2"></div>
                            <div class="price1">
                                <div class=""><a href="http://www.he.10086.cn/service/fee/paymentAction!initPaymentByCard.action" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://www.he.10086.cn/service/fee/paymentAction!cardQuery.action" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card3"></div>
                            <div class="price1">
                                <div class=""><a href="http://sh.189.cn/service/rechargeForward.do" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://sh.189.cn/service/cardUserfulLife.do?method=doQuery" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card4"></div>
                            <div class="price1">
                                <div class=""><a href="http://pay.qq.com/ipay/index.shtml?n=60&c=qqacct_save&ch=qqcard,kj,weixin&dc=qqcard" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://pay.qq.com/account/account_qqcard_query.shtml" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <!--2-->
                        <li>
                            <div class="card5"></div>
                            <div class="price1">
                                <div class=""><a href="http://www.jcard.cn/" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://www.jcard.cn/Bill/TradeSearch.aspx" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card6"></div>
                            <div class="price1">
                                <div class=""><a href="http://pay.9you.com/funpay/pay.php" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://pay.9you.com/funpay/index.php" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card7"></div>
                            <div class="price1">
                                <div class=""><a href="http://pay.ztgame.com:81/qfillcard.php" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://pay.ztgame.com:81/login/my_login.php?returnurl=http://pay.ztgame.com:81/m.php" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card8"></div>
                            <div class="price1">
                                <div class=""><a href="https://pay.sdo.com/deposit-g0-a0-pcard.htm" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="https://pay.sdo.com/" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <!---->
                        <li>
                            <div class="card9"></div>
                            <div class="price1">
                                <div class=""><a href="http://member.changyou.com" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://chong.changyou.com" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card10"></div>
                            <div class="price1">
                                <div class=""><a href="http://pay.163.com/index.jsp" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://pay.163.com/servlet/controller?operation=queryaccount" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card11"></div>
                            <div class="price1">
                                <div class=""><a href="http://kf.27399.com/login.aspx" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://kf.27399.com/login.aspx" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card12"></div>
                            <div class="price1">
                                <div class=""><a href="http://pay.wanmei.com/e" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://pay.wanmei.com/e/jsp/query/queryUsedCard.jsp" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <!---->
                        <li>
                            <div class="card13"></div>
                            <div class="price1">
                                <div class=""><a href="http://www.6186.com/SearchCard.aspx" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://www.6186.com/SearchCard.aspx" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card14"></div>
                            <div class="price1">
                                <div class=""><a href="http://www.txtong.com" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://www.txtong.com/txt_icard.php" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card15"></div>
                            <div class="price1">
                                <div class=""><a href="http://www.ofcard.com" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://www.ofcard.com" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card16"></div>
                            <div class="price1">
                                <div class=""><a href="http://www.sdo.com/go#https://pay.sdo.com/CouponHomePage.aspx" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://www.801335.com/status/index.htm" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <!---->
                        <li>
                            <div class="card17"></div>
                            <div class="price1">
                                <div class=""><a href="http://www.32ka.com/card/queryCard.html" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://www.32ka.com/card/queryCard.html" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card18"></div>
                            <div class="price1">
                                <div class=""><a href="http://pay.gyyx.cn/" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://reg.gyyx.cn/Login" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card19"></div>
                            <div class="price1">
                                <div class=""><a href="http://giftcard.jd.com/market/index.action" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="http://giftcard.jd.com/market/index.action" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                        <li>
                            <div class="card20"></div>
                            <div class="price1">
                                <div class=""><a href="http://pay.xoyo.com" target="_blank"><span>点卡充值</span></a></div>
                                <div class=""><a href="https://my.xoyo.com/login/login/%2Fusers%2FseeBalance" target="_blank"><span>余额查询</span></a></div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- -->
</div>

<script>
    $(".t-t").hide();
    $(".t-t").eq(0).show();
    $(".tt").click(function () {
        var _index = $(this).index();
        $(".t-t").hide();
        $(".t-t").eq(_index).show();
        $(".tt").eq(_index).addClass("current2").siblings(".tt").removeClass("current2");
    })
</script>


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
                <span>Email : admin@0n2.com</span>
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
