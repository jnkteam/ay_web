<!DOCTYPE html>
<html>
<head>
    <title>爱扬网络_点卡回收_API支付接口_游戏点卡消耗_游戏支付平台接口提供商</title>
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

<div class="banner4-box">
    <div class="banner4-con">
        <img src="../Content/Web/images/04_1.png">
    </div>
</div>
<div class="platform-con">
    <div class="platform3-con-tit">
        <div class="tit1 current3 tt">行业解决方案</div>
        <div class="tit2 tt">接口示例图</div>
        <div class="tit2 tt">商务合作</div>
        <div class="tit2 tt">友情链接</div>
    </div>
    <!--行业解决方案 -->
    <div class="tit1-txt t-t">
        <div class="palt5-bg">
            <div style="width: 100%; background: #ffffff;">
                <div class="platform-con-txt">
                    <div class="dong1">
                        <span>网页游戏在近几年发展迅猛，2008年中国网页游戏的市场规模已经上亿元，预计在未来4到5年，还将继续保持20%以上的增幅，到目前为止还没有
任何 一种够代替网游的新型娱乐形式出现，玩家对网游的需求如同一辆飞速开动着的列车。面对如此大的发展，网银在线消费销售模式太单一已经不能
满足网游 厂商及玩家的需求了。</span>
                        <span style="margin-top: 30px;">爱扬网络采取“集成多种卡、统一调度、按时结算”的原则，API卡类接口是迅速帮助商家销售掉手上多余的点卡，减少压货，降低商家的资金压力
跟风 险性。为商家提供有力的多种充值卡付费方式，充值卡流通广，购卡即可充值，非常便捷，这种消费以后一定会实现必然性并且规模式发展。</span>
                    </div>
                </div>
            </div>
            <div class="aqbj">
                <div class="aqbj-con">
                    <div class="pro-t block" data-move-y="100px"><span style="font-size: 2em;">极速</span>点卡消耗</div>
                    <div class="pro-k block" data-move-y="100px" style="font-size: 0.875em; height: 27px; line-height: 27px;">为广大用户提供多渠道兑换服务</div>
                </div>
            </div>
            <div style="width: 100%; background: #ffffff;">
                <div class="platform-con-txt">
                    <div>
                        <span class="block" data-move-x="100px">客服需求</span>
                        <span class="block" data-move-x="100px">解决充值渠道单一，提高运营效率； 多种充值方式需求，覆盖更多玩家；系统智能化、人性化，财务对账方便； 充值卡交易安全保障，玩家放心充值；
T+1结算方式，资金回笼快； 结算费用低，提升利润空间。</span>
                        <span class="block" data-move-x="100px" style="margin-top: 30px;">商业效果:（选择爱扬网络）</span>
                        <span class="block" data-move-x="100px">10秒极速消耗，提高运营效率，结算费率低，提升利润空间；多种渠道充值，满足玩家充值需求，帮助您留住更多忠实玩家。</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--接口示例图 -->
    <div class="tit2-txt t-t">
        <div class="palt6-bg">
            <div style="width: 100%; background: #ffffff;">
                <div class="platform-con-txt">
                    <div>
                        <span style="color: #00baff;">接口流程如下：</span>
                        <span>（1）玩家选择充值卡</span>
                        <span>玩家在游戏充值页面选择充值卡充值渠道</span>
                        <span style="margin-top: 30px;">（2）接入运营商数据库</span>
                        <span>充值卡号，卡密进入游戏运营商程序数据库</span>
                    </div>
                </div>
            </div>
            <div class="aqbj">
                <div class="aqbj-con">
                    <div style="margin-left: 460px; margin-top: 120px;">
                        <img src="../Content/Web/images/04_2.png">
                    </div>
                </div>
            </div>
            <div style="width: 100%; background: #ffffff;">
                <div class="platform-con-txt">
                    <div>
                        <span>（3）通过API接口到爱扬</span>
                        <span>游戏运营商程序通过API接口将卡信息发送到爱扬网络处理程序</span>
                        <span style="margin-top: 30px;">（4）爱扬处理并结算</span>
                        <span>爱扬网络对卡进行处理后返回结果并进行结算给游戏运营商</span>
                        <span style="color: #00baff;">游戏运营商程序对处理结果进行判断处理发放物品</span>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -->
    <!--商务合作 -->
    <div class="tit3-txt t-t">
        <div class="palt7-bg">
            <div style="width: 100%; background: #ffffff;">
                <div class="platform-con-txt">
                    <div>
                        <span>爱扬网络作为国内领先的充值卡收购平台，我们拥有巨大的经销商资源；同时拥有成熟的API接口技术（全自动化、人性化），愿与国内各大网页游戏
研发 公司及游戏运营商合作，将解决您的游戏充值渠道单一，覆盖更多玩家，提高运营效率，是您的利润最大化，共创双赢局面！</span>

                    </div>
                </div>
            </div>
            <div class="aqbj">
                <div class="aqbj-con block" data-move-y="100px">
                    <div style="margin-left: 310px; margin-top: 70px;">
                        <img src="../Content/Web/images/04_4.png">
                    </div>
                </div>
            </div>
            <div style="width: 100%; background: #ffffff;">
                <div class="plat3-icon block" data-move-y="100px">
                    <div>
                        <img src="../Content/Web/images/04_3.png">
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
                    <div style="width: 100%; text-align: center; color: #00baff; line-height: 50px;">排名不分先后顺序</div>
                    <ul>
                        <li>
                            <div class="flink1"></div>
                        </li>
                        <li>
                            <div class="flink2"></div>
                        </li>
                        <li>
                            <div class="flink3"></div>
                        </li>
                        <li>
                            <div class="flink4"></div>
                        </li>
                        <li>
                            <div class="flink5"></div>
                        </li>
                        <li>
                            <div class="flink6"></div>

                        </li>
                        <li>
                            <div class="flink7"></div>
                        </li>
                        <li>
                            <div class="flink8"></div>
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
        $(".tt").eq(_index).addClass("current3").siblings(".tt").removeClass("current3");
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
            <span>Copyright  &copy; 2015 爱扬网络 Www.0N2.Com 鲁ICP备16036145号-7 网络文化经营许可证号:鲁网文〔2016〕5998-043号
		 		<a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=37068702000009" target="_blank" class="STYLE1" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="" 

style="float:left;"/>鲁公网安备 37068702000009号</p></a>		 	</div>
            <div>

            </div>
        </div>
    </div>
</body>
</html>
