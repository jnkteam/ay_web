//=============================切换验证码======================================
function ToggleCode(obj, codeurl) {
    $(obj).attr("src", codeurl + "?time=" + Math.random());
}
//Tab控制函数
function tabs(tabId, tabNum) {
    //设置点击后的切换样式
    $(tabId + " .tab_nav li").removeClass("selected");
    $(tabId + " .tab_nav li").eq(tabNum).addClass("selected");
    //根据参数决定显示内容
    $(tabId + " .tab_con").hide();
    $(tabId + " .tab_con").eq(tabNum).show();
}

var highlightcolor = '#eafcd5';
var clickcolor = '#51b2f6';
/*鼠标单击变色*/
function mouseclick(){
    source=event.srcElement; 
    if (source.tagName=="TR"||source.tagName=="TABLE")return; 
    while(source.tagName!="TD")
        source=source.parentElement;source=source.parentElement; 
   var ss=source.parentElement; 
   while(ss.tagName!="TABLE"){ 
    ss=ss.parentElement;sst=ss.getElementsByTagName("TD"); 
    for(k=0;k<sst.length;k++){
     sst[k].style.backgroundColor="";
    }
   }
   cs=source.children; 
   if(cs[1].style.backgroundColor!=clickcolor){
    for(i=0;i<cs.length;i++){
     cs[i].style.backgroundColor=clickcolor;
    }
   }else{
    for(i=0;i<cs.length;i++){
     cs[i].style.backgroundColor="";
    }}
} 
/*鼠标移动变色*/
function mouseover(){
    source = event.srcElement;
    if (source.tagName == "TR" || source.tagName == "TABLE")
        return;
    while (source.tagName != "TD")
        source = source.parentElement;
    source = source.parentElement;
    cs = source.children;
    if (cs[1].style.backgroundColor != highlightcolor && source.id != "nc" && cs[1].style.backgroundColor != clickcolor)
        for (i = 0; i < cs.length; i++) {
            cs[i].style.backgroundColor = highlightcolor;
        }
}
function mouseout(){    
    if (event.fromElement.contains(event.toElement) || source.contains(event.toElement) || source.id == "NC")
        return
    if (event.toElement != source && cs[1].style.backgroundColor != clickcolor)
        for (i = 0; i < cs.length; i++) {
            cs[i].style.backgroundColor = "";
        }
}

//验证身份证
function validateIdcard(idcard) {
var Errors=new Array( 
"", 
"身份证号码位数不对!", 
"身份证号码出生日期超出范围或含有非法字符!", 
"身份证号码校验错误!", 
"身份证地区非法!" 
); 
var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"} 

var Y,JYM; 
var S,M; 
var idcard_array = new Array(); 
idcard_array = idcard.split(""); 

//地区检验 
if(area[parseInt(idcard.substr(0,2))]==null) return Errors[4]; 

//身份号码位数及格式检验 
switch(idcard.length){ 
    case 15: 
        if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){ 
        ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性 
        } else { 
        ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性 
        }

        if (ereg.test(idcard)) 
            return Errors[0];
        else 
            return Errors[2]; 
        break; 
    case 18: 
    //18位身份号码检测 
    //出生日期的合法性检查 
    //闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9])) 
    //平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8])) 
    if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){ 
    ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式 
    } else { 
    ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式 
    } 
    if(ereg.test(idcard)){//测试出生日期的合法性 
        //计算校验位 
        S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7 
        + (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9 
        + (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10 
        + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5 
        + (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8 
        + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4 
        + (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2 
        + parseInt(idcard_array[7]) * 1 
        + parseInt(idcard_array[8]) * 6 
        + parseInt(idcard_array[9]) * 3 ; 
        Y = S % 11; 
        M = "F"; 
        JYM = "10X98765432"; 
        M = JYM.substr(Y,1);//判断校验位 
        if(M == idcard_array[17]) return Errors[0]; //检测ID的校验位 
        else return Errors[3]; 
    }
    else 
        return Errors[2]; 
    break; 
    default: 
    return Errors[1]; 
    break; 
    } 
} 

﻿//校验用户姓名：只能输入3-20个以字母和数字开头的字串
function isTrueName(s)
{
    var pattern=/^\w{3,20}$/;
    if(pattern.exec(s))
    {
    return true;
    }
    return false;
}
//校验普通电话、传真号码：可以“+”开头，除数字外，可含有“-”
function isTel(s)
{
    var pattern =/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
    if(pattern.exec(s))
    {
    return true;
    }
    return false;
}
//校验手机号码：必须以数字开头，除数字外，可含有“-”
function isMobile(s)
{
    //var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
    var patrn=/^((\(\d{0,3}\))|(\d{0,3}\-))?13|15|18\d{9}$/;
    if (!patrn.exec(s)){
    return false;
    }
    return true;
}
//校验(国内)邮政编码
function isPostalCode(s)
{
    var patrn=/^[0-9]{6}$/;
    //var patrn=/^[a-zA-Z0-9 ]{3,12}$/;
    if (!patrn.exec(s)){
    return false;
    }
    return true;
}
            
function isIP(s) //by zergling
{
    var patrn=/^[0-9.]{1,20}$/;
    if (!patrn.exec(s)) {
    return false;
    }
    return true;
}
//校验邮箱
function isEmail(s)
{
    var patrn=/^[a-zA-Z0-9_\-]{1,}@[a-zA-Z0-9_\-]{1,}\.[a-zA-Z0-9_\-.]{1,}$/;
    if (!patrn.exec(s)) {
    return false;
    }
    return true;
}
//校验日期
function isdate(s)
{
    var patrn=/^((\d{2}(([02468][048])|([13579][26]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\s(((0?[0-9])|([1-2][0-3]))\:([0-5]?[0-9])((\s)|(\:([0-5]?[0-9])))))?$/;
    if (!patrn.exec(s)){
    return false;
    }
    return true;
}
             
//校验货币格式
function isCurrency(s)
{
    var patrn=/^\d+(\.\d+)?$/;
    if (!patrn.exec(s)) {
    return false;
    }
    return true;
}
//校验搜索关键字
function isSearch(s)
{
    var patrn=/^[^`~!@#$%^&*()+=|\\\][\]\{\}:;\'\,.<>?]{1}[^`~!@$%^&()+=|\\\][\]\{\}:;\'\,.<>?]{0,19}$/;
    if (!patrn.exec(s)) {
    return false;
    }
    return true;
}
//检查是否数字
function isNum(s)
{
    var pattern = /^\d+(\.\d+)?$/;
    if(pattern.test(s))
    {
    return true;
    }
    return false;
}

//检查是否整数
function isInt(s)
{
    var pattern = /^-?\d+$/;
    if(s.search(pattern)!=0)
    {
    return false;
    }
    return true;
}

//打开新窗口
function openWin(URL, width, height, scrollbars)	
{
    var top, left, winHandle;
    var strFeatures;
    top = (window.screen.availHeight - height) / 2 - 100;
    left = (window.screen.availWidth - width) / 2;
    if (scrollbars != 1) scrollbars = 0;
    strFeatures = "height=" + height + " width=" + width + " top=" + top + " left=" + left + " scrollbars=" + scrollbars + " toolbar=0 status=0 resizeable=0"
    winHandle = window.open(URL, "win", strFeatures);
    winHandle.focus();
}

//模态对话框
function showDialog(URL, width, height)	
{
    var vReturnvalue;
    var strFeatures;
    var top, left;
    top = (window.screen.availHeight - height) / 2;
    left = (window.screen.availWidth - width) / 2;
    strFeatures = "dialogWidth:" + width + "px;dialogHeight:" + height + "px;dialogTop:" + top + "px;dialogLeft:" + left + "px;status:off;help:no;";
    vReturnvalue = window.showModalDialog(URL, window, strFeatures);
    return vReturnvalue;
}

//提示窗口
function showMsg(v_content){
    ymPrompt.alert({ title: '提示', message: v_content});
}

function SetTableColor(TableID) {    
    if (document.getElementById(TableID) == null) return;
    document.getElementById(TableID).className = "rpt_tab";
    var clickClass = "";        //点击样式名    
    var moveClass = "";      //鼠标经过样式名
    var clickTR = null;         //点击的行
    var moveTR = null;       //鼠标经过行
    var Ptr = document.getElementById(TableID).getElementsByTagName("tr");    
    Ptr[0].className = "rpt_header";
    for (i = 1; i < Ptr.length; i++) {
        Ptr[i].className = (i % 2 > 0) ? "item_tr" : "alt_item_tr";    }    //设置鼠标的动作事件
    for (var i = 1; i < Ptr.length; i++) {
        var Owner = Ptr[i].item;        
        //鼠标经过事件
        Ptr[i].onmouseover = function Move() {
            if (clickTR != this) {
                if (moveTR != this) {
                    moveClass = this.className; 
                    moveTR = this;
                    this.className = "rtp_tr_move";}}}        
         //鼠标离开事件
         Ptr[i].onmouseout = function Out() {
            if (clickTR != this) {
                moveTR = null;
                this.className = moveClass; }}        
         //鼠标单击事件
         Ptr[i].onclick = function Ck() {
            if (clickTR != this) {
                if (clickTR) {
                    clickTR.className = clickClass;}
                clickTR = this;
                clickClass = moveClass;} 
            this.className = "rpt_tr_click";}}
}  


//验证码
function reloadimage() {
    document.getElementById("code").src = "/verify_code.ashx?t=" + Math.random();
}

