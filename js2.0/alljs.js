//jQuery
document.write("<script src='/js2.0/jquery.min.js' type='text/javascript'></script>");
document.write("<script src='/js2.0/jquery-ui.min.js' type='text/javascript'></script>");
document.write("<script src='/js2.0/jquery.easing.1.3.js' type='text/javascript'></script>");
document.write("<script src='/static/js/jquery.cookie.js' type='text/javascript'></script>");
document.write("<script src='/static/js/jquery.core.js' type='text/javascript'></script>");
document.write("<script src='/static/js/jquery.flexslider-min.js' type='text/javascript'></script>");
document.write("<script src='/static/js/jquery.form.js' type='text/javascript'></script>");
document.write("<script src='/static/js/jquery.ajaxsend.js' type='text/javascript'></script>");
//Bootstrap
document.write("<script src='/js2.0/bootstrap.min.js' type='text/javascript'></script>");
//Charts
document.write("<script src='/js2.0/charts/jquery.flot.js' type='text/javascript'></script>");
document.write("<script src='/js2.0/charts/jquery.flot.time.js' type='text/javascript'></script>");
document.write("<script src='/js2.0/charts/jquery.flot.animator.min.js' type='text/javascript'></script>");
document.write("<script src='/js2.0/charts/jquery.flot.resize.min.js' type='text/javascript'></script>");
document.write("<script src='/js2.0/charts/jquery.flot.orderBar.js' type='text/javascript'></script>");

document.write("<script src='/js2.0/sparkline.min.js' type='text/javascript'></script>");
document.write("<script src='/js2.0/easypiechart.js' type='text/javascript'></script>");
document.write("<script src='/js2.0/charts.js' type='text/javascript'></script>");
//Map
document.write("<script src='/js2.0/maps/jvectormap.min.js' type='text/javascript'></script>");
document.write("<script src='/js2.0/maps/usa.js' type='text/javascript'></script>");
//Form Related
document.write("<script src='/js2.0/icheck.js' type='text/javascript'></script>");
//UX
document.write("<script src='/js2.0/scroll.min.js' type='text/javascript'></script>");
//Other
document.write("<script src='/js2.0/calendar.min.js' type='text/javascript'></script>");
document.write("<script src='/js2.0/feeds.min.js' type='text/javascript'></script>");

//日历
document.write("<script src='/js2.0/bootstrap-datetimepicker.min.js' type='text/javascript'></script>");
document.write("<script src='/js2.0/locales/bootstrap-datetimepicker.zh-CN.js' type='text/javascript'></script>");

//自定义js脚本
document.write("<script src='/js2.0/user.js' type='text/javascript'></script>");

//All JS functions
//document.write("<script src='/js2.0/functions.js' type='text/javascript' ></script>");

//验证码
function reloadimage() {
    document.getElementById("captchaImg").src = "/CodeImage.aspx?t=" + Math.random();
}