<!DOCTYPE html>
<html>
<head>
    <title>爱扬网络客服中心_点卡回收_API支付接口_游戏点卡回收_游戏支付平台接口提供商</title>
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
            <li><a href="http://login.0n2.com">渠道管理平台</a></li>
                <li><a href="/index.aspx">首页</a></li>
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

</div>
<script>
    $(".nav-box ul.nav-ul li a").click(function () {
        var c = $(".nav-box ul.nav-ul li a").index(this)
        $(".nav-box ul.nav-ul li a").removeClass("on1");
        $(".nav-box ul.nav-ul li a").eq(c).addClass("on1");
    })
</script>

<div class="banner5-box">
    <div class="banner5-con">
        <img src="../Content/Web/images/05_1.png">
    </div>
</div>
<div class="platform-con">
    <div class="tit2-txt">
        <div style="width: 100%; background: #ffffff;">
            <div class="platform-con-txt">
                <div class="dong hellow-img">
                    <img src="../Content/Web/images/05_2.png">
                </div>
            </div>
        </div>
        <!-- -->
        <div class="contact-center">
            <ul class="con-cen">
                <li style="position: relative;">
                    <h3>销售</h3>
                    <div class="qq-wc">
                        <div class="qqwc">
                            <p>Email:kf@0n2.com</p>
                            <p>Tel:0535-3317567</p>
                        </div>
                        <div class="scan-code" style="position: absolute; top: 0; right: 30px;">
                            <img src="../Content/Web/images/ewm.jpg" />
                        </div>
                    </div>
                </li>
                <li style="position: relative;">
                    <h3>客服</h3>
                    <div class="qq-wc">
                        <div class="qqwc">
                            <p>Email:kf@0n2.com</p>
                            <p>Tel:0535-3317567</p>
                        </div>
                        <div class="scan-code" style="position: absolute; top: 0; right: 30px;">
                            <img src="../Content/Web/images/ewm.jpg" />
                        </div>
                    </div>
                </li>
                <li style="position: relative;">
                    <h3>技术</h3>
                    <div class="qq-wc">
                        <div class="qqwc">
                            <p>Email:kf@0n2.com</p>
                            <p>Tel:17030343434</p>
                        </div>
                        <div class="scan-code" style="position: absolute; top: 0; right: 30px;">
                            <img src="../Content/Web/images/ewm.jpg" />
                        </div>
                    </div>
                </li>
                <li style="border: none; position: relative;">
                    <h3> 警务协查</h3>
                    <div class="qq-wc">
                        <div class="qqwc">
                            <p>Email:kf@0n2.com</p>
                            <p>Tel:0535-3317567</p>
                        </div>
                        <div class="scan-code" style="position: absolute; top: 0; right: 30px;">
                            <img src="../Content/Web/images/ewm.jpg" />
                        </div>
                    </div>
                </li>
                <li style="position: relative;">
                    <h3>合作咨询</h3>
                    <div class="qq-wc">
                        <div class="qqwc">
                            <p>Email:kf@0n2.com</p>
                            <p>Tel:17895353531</p>
                        </div>
                        <div class="scan-code" style="position: absolute; top: 0; right: 30px;">
                            <img src="../Content/Web/images/ewm.jpg" />
                        </div>
                    </div>
                </li>
                <li>
                    <h3>热线电话</h3>
                    <div class="qq-wc">
                        <div class="qqwc">
                            <p>Tel:0535-3317567</p>
                            <p>Email:kf@0n2.com</p>
                        </div>
                    </div>
                </li>
                <li style="border: none;">
                    <h3>扫描二维码</h3>
                    <div class="qq-wc">
                        <div class="qqwc">
                            <p>进入微信公众平台</p>
                        </div>
                        <div class="scan-code">
                            <img src="../Content/Web/images/ewm1.jpg" />
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="map-sub" style="margin-bottom: 25px;">
            <h3 style="margin-bottom: 40px;">联系地址</h3>
            <div class="map-box">
                <div class="co-map-box">
                    <div class="dzmx">
                        <span>地址 ： 山东省海阳市御景公馆313室</span>
                        <span>邮编 ： 265100</span>
                    </div>

        </div>
    </div>
</div>



    <div class="bottom-box2">
        <div class="bottom">
            <ul class="bottom-subnav">
                <li><a href="#">关于爱扬</a></li>
                <li><a href="#">安全保障</a></li>
                <li><a href="#">公司资质</a></li>
                <li><a href="#">隐私保护</a></li>
                <li><a href="#">免责说明</a></li>
            </ul>
            <div class="address">
                <span>烟台爱扬网络科技有限公司</span>
                <span>电话：0535-3317567</span>
                
                <span>地址：山东省海阳市</span>
                <span>御景公馆313室</span>
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
