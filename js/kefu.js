document.writeln("<div class=\"openlogin\"><a href=\"javascript:void(0);\"></a></div>");
document.writeln("<div class=\"loginmask\"></div>");
document.writeln("<div id=\"loginalert\">");
document.writeln("	<div class=\"login_bar_tit\">");
document.writeln("    	<p><b>在线客服</b>（该服务需要通过QQ进行沟通，请确认启动QQ。）</p><b class=\"closealert\">&nbsp;</b><div class=\"clear\"></div>");
document.writeln("    </div>");
document.writeln("    <div class=\"zx_01 ggd\">");
document.writeln("    	<div class=\"zx_tit\"><p>24小时免费服务热线：</p><p style=\"color: #FD8503;\">400-111-1111</p><div class=\"clear\"></div></div>");
document.writeln("        <div class=\"lxkf f_l m_r20\"><span></span><div><p>客服2：97866928</p><a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=97866928&site=qq&menu=yes\" rel=\"nofollow\"><img border=\"0\" src=\"http://wpa.qq.com/pa?p=2:97866928:41\" alt=\"点击这里给我发消息\" title=\"点击这里给我发消息\"></a></div></div>");
document.writeln("        <div class=\"clear\"></div>");
document.writeln("    </div>");
document.writeln("    <div class=\"zx_02 ggd\">");
document.writeln("    	<div class=\"zx_tit\"><p>商务QQ</p><span>负责商户加盟咨询及后续服务跟进！</span><div class=\"clear\"></div></div>");
document.writeln("        <div style=\"width:100%\">");
document.writeln("        	<div class=\"lxkf f_l m_r20\"><span></span><div><p>商务①</p><a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=97866925&site=qq&menu=yes\" rel=\"nofollow\"><img border=\"0\" src=\"http://wpa.qq.com/pa?p=2:97866925:41\" alt=\"点击这里给我发消息\" title=\"点击这里给我发消息\"></a></div></div>");
document.writeln("            <div class=\"lxkf f_l m_r20\"><span></span><div><p>商务②</p><a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=97866926&site=qq&menu=yes\" rel=\"nofollow\"><img border=\"0\" src=\"http://wpa.qq.com/pa?p=2:97866926:41\" alt=\"点击这里给我发消息\" title=\"点击这里给我发消息\"></a></div></div>");
document.writeln("            <div class=\"lxkf f_l m_r20\"><span></span><div><p>商务③</p><a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=97866927&site=qq&menu=yes\" rel=\"nofollow\"><img border=\"0\" src=\"http://wpa.qq.com/pa?p=2:97866927:41\" alt=\"点击这里给我发消息\" title=\"点击这里给我发消息\"></a></div></div>");
document.writeln("        </div>");
document.writeln("    </div>");
document.writeln("</div>");






// 设置为主页 
function SetHome(obj,vrl){ 
try{ 
obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl); 
} 
catch(e){ 
if(window.netscape) { 
try { 
netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
} 
catch (e) { 
alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。"); 
} 
var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch); 
prefs.setCharPref('browser.startup.homepage',vrl); 
}else{ 
alert("您的浏览器不支持，请按照下面步骤操作：1.打开浏览器设置。2.点击设置网页。3.输入："+vrl+"点击确定。"); 
} 
} 
} 
// 加入收藏 兼容360和IE6 
function AddFavorite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, '');
        }
        catch (e)
        {
            alert('加入收藏失败，请使用Ctrl+D进行添加');
        }
    }
}