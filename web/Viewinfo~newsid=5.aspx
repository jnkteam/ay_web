<!DOCTYPE html>
<html>
<head>
    <title>爱扬网络用户服务协议-爱扬网络</title>
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
    
<!--banner-->
<div class="banner3-box">
    <div class="banner3-con">
        <img src="../Content/Web/images/03_1.png">
    </div>
</div>
<!---->

<div class="pl-container-box">
    <div class="pl-container">
        <div class="pl-con">
            <div class="page-box">
                <div class="ann-1" style="margin-top: 20px;">
                    <a class="ann-1-title" style="cursor: none; color: #000; font-size: 18px; text-align: center; margin: 20px 0;">
                        爱扬网络用户服务协议
                    </a>
                    
                    <div class="ann-contaier1-text">
                        <p>&nbsp; &nbsp; 烟台爱扬网络科技有限公司（以下简称“爱扬网络”），同意按照本协议的规定及其不时发布的操作规则提供基于互联网的相关服务（以下称“网络服务”），服务使用人（以下称“用户”）应当同意本协议的全部条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点“同意”按钮即表示个人完全接受本协议项下的全部条款。&nbsp;</p><p>服务内容</p><p>&nbsp; &nbsp; 爱扬网络网络服务的具体内容由爱扬网络根据实际情况提供，例如：点卡回收、网银支付等。爱扬网络保留随时变更、中断或终止部分或全部网络服务的权利。</p><p>使用规则</p><p>用户在申请使用爱扬网络网络服务时，必须向爱扬网络准确提供必要的资料。如资料有任何变动，请在爱扬网络产品网站上（www.0n2.com）及时更新。&nbsp;</p><p>&nbsp; &nbsp;用户注册成功后，爱扬网络将为其开通一个账户，该账户的登录名和密码由用户负责保管；用户应当对以其账户进行的所有活动和事件负法律责任。&nbsp;</p><p>&nbsp; &nbsp;用户必须同意接受爱扬网络通过电子邮件或其他方式向其发送的产品促销或其他相关商业信息。</p><p>用户在使用爱扬网络网络服务过程中，必须遵循以下原则：&nbsp;</p><p>(a) 遵守中国有关的法律和法规；&nbsp;</p><p>(b) 不得为任何非法目的而使用网络服务系统；&nbsp;</p><p>(c) 遵守所有与网络服务有关的网络协议、规定和程序；&nbsp;</p><p>(d) 不得利用爱扬网络网络服务系统进行任何可能对互联网的正常运转造成不利影响的行为；</p><p>(e) 不得利用爱扬网络网络服务系统传输任何骚扰性的、中伤他人的、辱骂性的、恐吓性的、庸俗淫秽的或其他任何非法的信息资料；&nbsp;</p><p>(f) 不得利用爱扬网络网络服务系统进行任何不利于爱扬网络的行为；&nbsp;</p><p>(g) 如发现任何非法使用用户账户或账户出现安全漏洞的情况，应立即通告爱扬网络。</p><p>&nbsp; &nbsp;如个人在使用网络服务时违反任何上述规定，爱扬网络或及其授权的人有权要求个人改正或直接采取一切必要的措施（包括但不限于更改或删除个人张贴的内容等、暂停或终止个人使用网络服务的权利）以减轻个人不当行为造成的影响。</p><p>资费</p><p>&nbsp; &nbsp;爱扬网络在提供网络服务时，可能会对部分网络服务的用户收取一定的费用。在此情况下，爱扬网络会在相关页面上做明确的提示。如用户拒绝支付该笔费用，则不能使用相关的网络服务。</p><p>爱扬网络仅提供相关的网络服务，除此之外与相关网络服务有关的设备（如电脑、调制解调器及其他与接入互联网有关的装置）及所需的费用（如为接入互联网而支付的电话费及上网费）均应由用户自行负担。&nbsp;</p><p>内容所有权&nbsp;</p><p>&nbsp; &nbsp;爱扬网络提供的网络服务内容可能包括：文字、软件、声音、图片、录像、图表等。所有这些内容受版权、商标和其它财产所有权法律的保护。&nbsp;</p><p>&nbsp; &nbsp;用户只有在获得爱扬网络或其他相关权利人的授权之后才能使用这些内容，而不能擅自复制这些内容、或制造与内容有关的派生产品。&nbsp;</p><p>隐私保护&nbsp;</p><p>&nbsp; &nbsp;保护个人隐私是爱扬网络的一项基本政策，爱扬网络保证不对外公开或向第三方提供用户注册资料及用户在使用网络服务时存储在爱扬网络的非公开内容，但下列情况除外：&nbsp;</p><p>(a) 事先获得用户的明确授权；&nbsp;</p><p>(b) 根据有关的法律法规要求；&nbsp;</p><p>(c) 按照相关政府主管部门的要求；&nbsp;</p><p>(d) 为维护社会公众的利益；&nbsp;</p><p>(e) 为维护爱扬网络的合法权益。&nbsp;</p><p>&nbsp; &nbsp;爱扬网络可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与爱扬网络同等的保护用户隐私的责任，则爱扬网络可将用户的注册资料等信息提供给该第三方。&nbsp;</p><p>&nbsp; &nbsp;在不透露单个用户隐私资料的前提下，爱扬网络有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。&nbsp;</p><p>免责声明&nbsp;</p><p>&nbsp; &nbsp;用户明确同意其使用爱扬网络网络服务所存在的风险将完全由其自己承担；因其使用爱扬网络网络服务而产生的一切后果也由其自行承担，爱扬网络对用户及其网上交易行为的影响不承担任何责任。&nbsp;</p><p>&nbsp; &nbsp;爱扬网络不担保网络服务一定能满足用户的要求，也不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。</p><p>爱扬网络不保证为向用户提供便利而设置的外部链接的准确性和完整性，同时，对于该外部链接指向的不由爱扬网络实际控制的任何网页上的内容，爱扬网络不承担任何责任。</p><p>服务变更、中断或终止 &nbsp; &nbsp;&nbsp;</p><p>&nbsp; &nbsp;如因系统维护或升级的需要而需暂停网络服务，爱扬网络将尽可能事先进行通告。&nbsp;</p><p>&nbsp; &nbsp;如发生下列任何一种情形，爱扬网络有权随时中断或终止向用户提供本协议项下的网络服务而无需通知用户：&nbsp;</p><p>&nbsp; &nbsp;用户提供的个人资料不真实；&nbsp;</p><p>&nbsp; &nbsp;用户违反本协议中规定的使用规则。&nbsp;</p><p>&nbsp; &nbsp;除前款所述情形外，爱扬网络同时保留在不事先通知用户的情况下随时中断或终止部分或全部网络服务的权利，对于所有服务的中断或终止而造成的任何损失，爱扬网络无需对用户或任何第三方承担任何责任。&nbsp;</p><p>违约赔偿&nbsp;</p><p>&nbsp; &nbsp;用户同意保障和维护爱扬网络及其他用户的利益，如因用户违反有关法律、法规或本协议项下的任何条款而给爱扬网络或任何其他第三方造成损失，用户同意承担由此造成的损害赔偿责任。&nbsp;</p><p>协议修改&nbsp;</p><p>&nbsp; &nbsp;爱扬网络将有权随时修改本协议的有关条款，一旦本协议的内容发生变动，爱扬网络将会通过适当方式向用户提示修改内容。&nbsp;</p><p>&nbsp; &nbsp;如果不同意爱扬网络对本协议相关条款所做的修改，用户有权停止使用网络服务。如果用户继续使用网络服务，则视为用户接受爱扬网络对本协议相关条款所做的修改。&nbsp;</p><p>法律管辖</p><p>&nbsp; &nbsp; 本协议的订立、执行和解释及争议的解决均应适用中国法律。&nbsp;</p><p>如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向爱扬网络所在地的人民法院提起诉讼。&nbsp;</p><p>通知和送达</p><p>本协议项下所有的通知均可通过重要页面公告、电子邮件或常规的信件传送等方式进行；该等通知于发送之日视为已送达收件人。&nbsp;</p><p>其他规定</p><p>&nbsp; &nbsp; 本协议构成双方对本协议之约定事项及其他有关事宜的完整协议，除本协议规定的之外，未赋予本协议各方其他权利。&nbsp;</p><p>&nbsp; &nbsp; 如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。</p><p><br/></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clear">
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
            <span>Copyright  &copy; 2015 爱扬网络 www.0n2.com 鲁ICP备16036145号-7 网络文化经营许可证号:鲁网文〔2016〕5998-043号</span>
            <div>

            </div>
        </div>
    </div>
</body>
</html>
