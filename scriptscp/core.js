var LongMaxValue=9007199254740992;
var RSAPublicKey="C4E4B9345F5BA44DDE717385660EBF6A217CF2D59145A3DA3B57D460A285242E04D7CF57969E77749BC6D325B1381E29BD827F90F13909A97256B4B6B217141F";
function $P(a){
	return document.getElementById(a)
}
$.fn.outerHTML=function(){
	var a=(!this.length)?this:(this[0].outerHTML||(function(b){
		var d=document.createElement("div");
		d.appendChild(b.cloneNode(true));
		var c=d.innerHTML;
		d=null;
		return c
	})(this[0]));
	a=a.replace(/\sjQuery\d+\s*=\s*[^\s\>]+/gi,"");
	return a
};
$.getSync=function(a){
	return jQuery.ajax({
		type:"GET",url:a,async:false,dateType:'json'
	}).responseText
};
$.postSync=function(a,b){
	return jQuery.ajax({
		type:"POST",url:a,data:b,async:false,dateType:'json'
	}).responseText
};
$.getJsonSync=function(url){
	var responseText=$.getSync(url);
	eval("var jsonData="+responseText);
	return jsonData
};
$.postJsonSync=function(url,data){
	var responseText=$.postSync(url,data);
	eval("var jsonData="+responseText);
	return jsonData
};
$.setClipboard=function(a){
	if(window.clipboardData){
		window.clipboardData.setData("Text",a);
		$.showMsgBox("复制成功!")
	}
	else{
		$("<div class='comm_dialog_cont'><p class='f12 fblod mt8'>你使用的是非IE核心浏览器,请按下Ctrl+C复制代码到剪切板</p><textarea id='selectersecond' class='mt8' style='width:340px; height:60px; padding:5px; font-size:12px;'>"+a+"</textarea>").dialog({
			title:" 温馨提示",modal:true,width:380,height:180
		});
		$("#selectersecond").focus().select()
	}
};
$.getEditedParamUrl=function(b,d){
	var e=d&&d!=undefined?d:window.location.href;
	var a="";
	var c=e.indexOf("#");
	if(c>=0){
		a=e.substring(c);
		e=e.substring(0,c)
	}
	e=e.replace(/&+$/,"");
	$.each(b,function(f){
		var h=b[f];
		if(h==null){
			h=""
		}
		h=h+"";
		h=encodeURIComponent(h);
		var g=new RegExp("(^[\\w\\W]*?[\\?\\&])("+f+")=([^\\&]*)([\\w\\W]*)$","igm");
		if(g.test(e)){
			e=e.replace(g,"$1"+f+"="+h+"$4")
		}
		else{
			if(!((/.*\?$/.test(e))||(/.*#$/.test(e)))){
				e+=e.indexOf("?")<0?"?":"&"
			}
			e+=f+"="+h
		}
	});
	e+=a;
	return e
};
$.reloadUrl=function(){
	var a=$.getEditedParamUrl({
		t:new Date().getTime()
	});
	window.location.href=a;
	return false
};
$.editUrlParam=function(a){
	var b=$.getEditedParamUrl(a);
	window.location.href=b;
	return false
};
$.setUrlParam=function(a){
	var b=$.getEditedParamUrl(a,"?");
	window.location.href=b;
	return false
};
$.getQueryString=function(c,b){
	b=b||location.href;
	var d=new RegExp("(\\?|&|^)"+c+"=([^&#]+)","i");
	var a=d.exec(b);
	if(a==null||a.length<1){
		return""
	}
	var e=a[2];
	e=decodeURIComponent(e);
	return e
};
$.getParamterNames=function(){
	var b=location.search.match(new RegExp("[?&]([^=]+)=","g"));
	var d=new Array();
	if(b==null||b.length<1){
		return d
	}
	for(var a=0;a<b.length;a++){
		var c=b[a];
		if(c.length>2){
			c=c.substr(1,c.length-2)
		}
		d.push(c)
	}
	return d
};
$.getUrlParams=function(b){
	var c="";
	var g=location.search.match(new RegExp("[?&]([^=]+)=","g"));
	if(g==null||g.length<1){
		return c
	}
	var f=new Array();
	if(b){
		if(typeof b=="string"){
			f.push(b)
		}
		else{
			if(typeof b=="object"&&b instanceof Array){
				f=b
			}
		}
	}
	var e=true;
	for(var h=0;h<g.length;h++){
		var a=g[h];
		if(a.length>2){
			a=a.substr(1,a.length-2)
		}
		var k=false;
		for(var d=0;d<f.length;d++){
			if(f[d]==a){
				k=true;
				break
			}
		}
		if(k){
			continue
		}
		if(!e){
			c+="&"
		}
		var l=$.getQueryString(a);
		c+=a+"="+window.encodeURIComponent(l);
		e=false
	}
	return c
};
$.doUrlRedirt=function(a,b){
	if(!b||b==undefined){
		b="_self"
	}
	a=$.getEditedParamUrl({
		t:new Date().getTime()
	}
	,a);
	if(b=="_self"){
		window.location.href=a
	}
	else{
		window.open(a,b)
	}
	return false
};
$.shake=function(e,a,f){
	var d=0,b=false,g="";
	f=f||2;
	if(b){
		return
	}
	b=setInterval(function(){
		d++;
		g=d%2?a:"";
		e.attr("class",g);
		if(d==2*f){
			clearInterval(b);
			e.removeClass(a)
		}
	}
	,200)
};
$.isSupportFlash=function(){
	var a=false;
	try{
		if(new ActiveXObject("ShockwaveFlash.ShockwaveFlash")){
			a=true
		}
	}
	catch(b){
		var c="application/x-shockwave-flash";
		if(navigator.mimeTypes&&navigator.mimeTypes[c]&&navigator.mimeTypes[c].enabledPlugin&&navigator.mimeTypes[c].enabledPlugin.description){
			a=true
		}
	}
	return a
};
$.isSupportHtml5Upload=function(){
	if(window.FormData&&XMLHttpRequest){
		var a=new XMLHttpRequest();
		return a&&("upload" in a)&&("onprogress" in a.upload)
	}
	return false
};
$.showMsgBox=function(d,b,c){
	var a=$("<div class='comm_dialog_cont'><div class=\"ui-mainmsg\">"+d+"</div></div>");
	a.dialog({
		title:"提示信息",modal:true,buttons:[{
			text:"确定","class":"comm_dialog_btn_save",click:function(){
				if($.isFunction(b)){
					b()
				}
				$(this).dialog("destroy")
			}
		}
		]
	});
	if($.isFunction(c)){
		a.parent().find(".ui-dialog-titlebar-close").click(function(){
			c()
		})
	}
	return a
};
$.showConfirmBox=function(d,c,b,a){
	objDialog=$("<div class='comm_dialog_cont'>"+d+"</div>");
	objDialog.dialog({
		title:"温馨提示",modal:true,width:400,buttons:[{
			text:"确定","class":"comm_dialog_btn_save",click:function(){
				if($.isFunction(c)){
					c()
				}
				$(this).dialog("destroy")
			}
		}
		,{
			text:"取消","class":"comm_dialog_btn_cancel",click:function(){
				if($.isFunction(b)){
					b()
				}
				$(this).dialog("destroy")
			}
		}
		]
	});
	if($.isFunction(a)){
		objDialog.parent().find(".ui-dialog-titlebar-close").click(function(){
			a()
		})
	}
	return objDialog
};
$.showDialogPhoto=function(g,f,c,a){
	f=f||"图片显示";
	a=a||680;
	if(String.isNullOrEmpty(g)||g.indexOf("www/defaultpic.jpg")>-1||g.indexOf("manage/loginbg.jpg")>-1){
		return
	}
	var d=g.replace("/m_","/x_").replace("/n_","/x_");
	var b=g.replace("/upload/","/backup/").replace("/m_","/").replace("/n_","/");
	var e="<div class='comm_dialog_cont'><div class='dialog_photo'><img src='"+d+"'/></div><a href='"+b+"' target='_blank'>查看原图</a></div>";
	if(c!=null&&c!=undefined){
		$(e).dialog({
			title:f,modal:true,height:c,width:a,buttons:[{
				text:"确定","class":"comm_dialog_btn_save",click:function(){
					$(this).dialog("destroy")
				}
			}
			]
		})
	}
	else{
		$(e).dialog({
			title:f,modal:true,width:a,buttons:[{
				text:"确定","class":"comm_dialog_btn_save",click:function(){
					$(this).dialog("destroy")
				}
			}
			]
		})
	}
};
$.getArrayChk=function(a){
	if(String.isNullOrWhiteSpace(a)){
		a="chk_list"
	}
	var b=[];
	$("input:checkbox[name="+a+"][checked]").each(function(){
		b.push($(this).val())
	});
	return b
};
Object.isElement=function(a){
	return(typeof HTMLElement==="object"?a instanceof HTMLElement:a&&typeof a==="object"&&a.nodeType===1&&typeof a.nodeName==="string")
};
String.format=function(){
	if(arguments.length==0){
		return null
	}
	var c=arguments[0];
	for(var a=1;a<arguments.length;a++){
		var b=new RegExp("\\{"+(a-1)+"\\}","gm");
		c=c.replace(b,arguments[a])
	}
	return c
};
String.prototype.format=function(){
	var a=arguments;
	return this.replace(/\{(\d+)\}/g,function(b,c){
		return a[c]
	})
};
String.prototype.trim=function(){
	return this.replace(/(^\s*)|(\s*$)/g,"")
};
String.prototype.ltrim=function(b){
	if(b==null||b==""){
		b="\\s"
	}
	var a=new RegExp("(^"+b+"*)");
	return this.replace(a,"")
};
String.prototype.rtrim=function(b){
	if(b==null||b==""){
		b="\\s"
	}
	var a=new RegExp("("+b+"*$)");
	return this.replace(a,"")
};
String.prototype.startsWith=function(a){
	if(a==null||a.length==0||this.length<a.length){
		return false
	}
	return this.substr(0,a.length)==a
};
String.prototype.endsWith=function(a){
	if(a==null||a.length==0||this.length<a.length){
		return false
	}
	return this.substr(this.length-a.length)==a
};
String.isNullOrEmpty=function(a){
	return a==null||(typeof a=="string"&&a.length==0)
};
String.isNullOrWhiteSpace=function(a){
	return a==null||(typeof a=="string"&&a.trim().length==0)
};
Date.getMonthOffset=function(b,a){
	return(a.getFullYear()-b.getFullYear())*12+a.getMonth()-b.getMonth()
};
Date.prototype.addSeconds=function(c){
	var b=this.getTime();
	b+=c*1000;
	var a=new Date(b);
	return a
};
Date.prototype.addMinutes=function(a){
	return this.addSeconds(a*60)
};
Date.prototype.addHours=function(a){
	return this.addMinutes(a*60)
};
Date.prototype.addDays=function(a){
	return this.addHours(a*24)
};
Date.prototype.addMonths=function(a){
	var c=new Date(this.getTime());
	var b=c.getDate();
	c.setDate(1);
	c.setMonth(c.getMonth()+a);
	c.setDate(Math.min(b,c.getMonthMaxDay()));
	return c
};
Date.prototype.addYears=function(a){
	return this.addMonths(a*12)
};
Date.prototype.getMonthMaxDay=function(){
	var a=new Date(this.getFullYear(),this.getMonth()+1,0).getDate();
	return a
};
Date.prototype.getMonthOffset=function(a){
	return Date.getMonthOffset(this,a)
};
Date.fromJson=function(b){
	b=(b+"").replace("/Date(","").replace(")/","");
	var c=b.indexOf("+");
	if(c<0){
		c=b.indexOf("-")
	}
	if(c>=0){
		b=b.substr(b,c)
	}
	var a=new Date(parseInt(b,10));
	return a
};
Date.fromFormat=function(a){
	if(a==null||typeof(a)=="undefined"||a==""){
		return null
	}	
	return new Date(Date.parse(a.replace(/-/g,"/")))
};
Date.getNowFormatDate=function(){
	var c=new Date();
	var d=c.getMonth()+1;
	var a=c.getDate();
	var b=c.getFullYear()+"-"+(d<10?"0":"")+d+"-"+(a<10?"0":"")+a;
	return b
};
Date.getToday=function(){
	var a=new Date();
	a.setHours(0,0,0,0);
	return a
};
Date.prototype.format=function(p){
	var b=this.getFullYear();
	var c=b.toString().substring(2);
	p=p.replace(/yyyy/,b);
	p=p.replace(/yy/,c);
	var r=this.getMonth()+1;
	var m=r;
	var j=r.toString().length;
	if(j==1){
		m="0"+m
	}
	p=p.replace(/MM/,m);
	p=p.replace(/M/,r);
	var i=this.getDate();
	var d=i;
	var l=i.toString().length;
	if(l==1){
		d="0"+i
	}
	p=p.replace(/dd/,d);
	p=p.replace(/d/,i);
	var n=this.getHours();
	var o=n;
	var q=n.toString().length;
	if(q==1){
		o="0"+n
	}
	p=p.replace(/HH/,o);
	p=p.replace(/H/,n);
	var k=this.getMinutes();
	var a=k;
	var f=k.toString().length;
	if(f==1){
		a="0"+k
	}
	p=p.replace(/mm/,a);
	p=p.replace(/m/,k);
	var h=this.getSeconds();
	var e=h;
	var g=h.toString().length;
	if(g==1){
		e="0"+h
	}
	p=p.replace(/ss/,e);
	p=p.replace(/s/,h);
	return p
};
Number.prototype.toFixed=function(fractionDigits){
	with(Math){
		return round(this*pow(10,fractionDigits))/pow(10,fractionDigits)
	}
};
Number.prototype.format=function(r){
	if(r==null||r.length==0){
		return this+""
	}
	var s=new Number(this);
	var a=r.endsWith("%");
	if(a){
		s*=100;
		s=s.toFixed(2);
		r=r.substr(0,r.length-1)
	}
	s=s.toString();
	var f=r,l="",o=s,m="",d,q;
	d=r.indexOf(".");
	if(d>=0){
		f=r.substr(0,d);
		l=r.substr(d+1)
	}
	d=s.indexOf(".");
	if(d>=0){
		o=s.substr(0,d);
		m=s.substr(d+1)
	}
	var e="",k="";
	var g=f.indexOf("0")>=0;
	var n=f.indexOf(",")>=0;
	if(!g&&new Number(o)==0){
		o=""
	}
	if(!n){
		e=o
	}
	else{
		q=o.length;
		var b=0;
		for(var p=q-1;p>=0;p--){
			if(b>0&&(b%3)==0){
				e=","+e
			}
			b++;
			e=o.substr(p,1)+e
		}
	}
	q=l.length;
	for(var p=0;p<q;p++){
		var j=l.substr(p,1);
		var h=m.length>p?m.substr(p,1):"0";
		if(j=="0"){
			k+=h
		}
		else{
			k+=(h=="0")?"#":h
		}
	}
	k=k.rtrim("#");
	k=k.replace(new RegExp("#"),"0");
	var c=e;
	if(k.length>0){
		c+="."+k
	}
	if(a){
		c+="%"
	}
	return c
};
$.HTMLEncode=function(c){
	var b=$("<div></div>");
	b.text(c);
	var a=b.html();
	b.remove();
	a=a.replace(/"/g,"&quot;");
	return a
};
$.HTMLDecode=function(c){
	c=c.replace(/&quot;/g,'"');
	var b=$("<div></div>");
	b.html(c);
	var a=b.text();
	b.remove();
	return a
};
$.SetInputSelectText=function(g,e){
	if(String.isNullOrWhiteSpace(e)){
		return false
	}
	var f=document.getElementById(g),c=f.value;
	var b=c.indexOf(e);
	if(b==-1){
		return false
	}
	var a=b+e.length;
	if(typeof f.createTextRange!="undefined"){
		var d=f.createTextRange();
		d.collapse(true);
		d.moveEnd("character",a);
		d.moveStart("character",b);
		d.select()
	}
	else{
		if(typeof f.selectionStart!="undefined"){
			f.setSelectionRange(b,a);
			f.focus()
		}
	}
	return false
};
$.Cookie={
	setCookie:function(f,g,b,c,a,e){
		var d=f+"="+g;
		if(b){
			d+="; expires="+b.toGMTString()
		}
		if(c){
			d+="; path="+c
		}
		else{
			d+="; path=/"
		}
		if(a){
			d+="; domain="+a
		}
		if(e){
			d+="; secure"
		}
		document.cookie=d
	}
	,getCookieByName:function(b){
		var a=new RegExp("(^|\\s)"+b+"=([^\\s$]*)");
		if(a.test(document.cookie)){
			return RegExp["$2"]
		}
		else{
			return""
		}
	}
	,getCookieParamValue:function(e,d){
		var c=$.Cookie.getCookieByName(e);
		var b="(^|&)"+d+"=([^(&|$)]+)";
		var a=new RegExp(b);
		if(a.test(c)){
			return decodeURIComponent(RegExp["$2"])
		}
		else{
			return""
		}
	}
	,deleteCookie:function(d,b,a){
		var c=d+"=; expires="+(new Date(0)).toGMTString();
		if(b){
			c+="; path="+b
		}
		if(a){
			c+="; domain="+a
		}
		document.cookie=c
	}
};
function Countdown(a,b,c){
	this.timerId=null;
	this.obj=b;
	this.timeout=a;
	this.overEvent=c
}
Countdown.prototype.start=function(){
	this.timeCount=this.timeout;
	this.dotimer()
};
Countdown.prototype.dotimer=function(){
	this.timeCount--;
	window.clearTimeout(this.timerId);
	if(this.obj){
		this.obj.html(this.timeCount)
	}
	if(this.timeCount>0){
		var a=this;
		this.timerId=window.setTimeout(function(){
			a.dotimer(a.timeCount)
		}
		,1000)
	}
	else{
		if(this.overEvent){
			this.overEvent()
		}
	}
};
var Geography={
	getCityListUrl:"/Member/Index/getcitylist?provinceCode=",getAreaListUrl:"/Member/Index/getarealist?cityCode=",bind:function(a){
		$("#selProvince_"+a).bind("change",Geography.onProvinceChange);
		if($("#selArea_"+a).length>0){
			$("#selCity_"+a).bind("change",Geography.onCityChange)
		}
	}
	,syncLoadCityList:function(g){
		var d=$("#selProvince_"+g).val();
		var c=$.postJsonSync(Geography.getCityListUrl+d,{});
		if(c.resultCode==1){
			var b="<option value='0'>请选择</option>";
			for(var a=0;a<c.data.length;a++){
				var e=c.data[a];
				b+="<option value='"+e.code+"'>"+e.name+"</option>"
			}
			var f=$("#selCity_"+g);
			f.empty();
			f.append(b)
		}
	}
	,onProvinceChange:function(){
		var d=$(this);
		var a=d.attr("id").substr("selProvince_".length);
		var e=$("#selCity_"+a);
		var c=$("#selArea_"+a);
		var b=d.val();
		if(b==""||b=="0"){
			e.empty(),c.empty();
			e.append("<option value='0'>请选择</option>");
			c.append("<option value='0'>请选择</option>");
			return
		}
		$.post(Geography.getCityListUrl+b,{},function(h){
			if(h.resultCode==1){
				var g="<option value='0'>请选择</option>";
				for(var f=0;f<h.data.length;f++){
					var i=h.data[f];
					g+="<option value='"+i.code+"'>"+i.name+"</option>"
				}
				var j=$("#selCity_"+a);
				j.empty();
				j.append(g);
				j.focus();
				if(h.data!=null&&h.data.length==1){
					j.hide();
					j.val(h.data[0].code)
				}
				else{
					j.show()
				}
				j.change()
			}
			else{
				$("<div class='comm_dialog_cont'>"+h.resultMsg+"</div>").dialog({
					title:"错误提示",modal:true,buttons:[{
						text:"确定","class":"comm_dialog_btn_save",click:function(){
							$(this).dialog("destroy")
						}
					}
					]
				})
			}
		},'json')
	}
	,onCityChange:function(){
		var d=$(this);
		var a=d.attr("id").substr("selCity_".length);
		var c=$("#selArea_"+a);
		var b=d.val();
		if(c.length==0){
			return
		}
		if(b==""||b=="0"){
			c.empty();
			c.append("<option value='0'>请选择</option>");
			return
		}
		$.post(Geography.getAreaListUrl+b,{},function(g){
			if(g.resultCode==1){
				var f="<option value='0'>请选择</option>";
				for(var e=0;e<g.data.length;e++){
					var h=g.data[e];
					f+="<option value='"+h.code+"'>"+h.name+"</option>"
				}
				var i=$("#selArea_"+a);
				i.empty();
				i.append(f);
				i.focus()
			}
			else{
				$("<div class='comm_dialog_cont'>"+g.resultMsg+"</div>").dialog({
					title:"错误提示",modal:true,buttons:[{
						text:"确定","class":"comm_dialog_btn_save",click:function(){
							$(this).dialog("destroy")
						}
					}
					]
				})
			}
		},'json')
	}
};
var SmsVCSender={
	mobileObj:null,btnSendSms:null,btnSendVoice:null,overEvent:null,selfMobile:false,uniqueMobile:true,smsSendHtml:"<span class=\"fgray bgray_middle smssendertimer\"><span name='spanTimer'>60</span>秒后可重发短信 </span>",smsSendHtml1:'<span class="fgray bgray_middle smssendertimer">重发短信验证码</span>',init:function(a,c,d,b){
		SmsVCSender.mobileObj=a;
		SmsVCSender.btnSendSms=c;
		SmsVCSender.btnSendVoice=d;
		if(b){
			if($.isFunction(b.overEvent)){
				SmsVCSender.overEvent=b.overEvent
			}
			if(typeof(b.selfMobile)=="boolean"){
				SmsVCSender.selfMobile=b.selfMobile
			}
			if(typeof(b.uniqueMobile)=="boolean"){
				SmsVCSender.uniqueMobile=b.uniqueMobile
			}
		}
	}
	,sendSms:function(){
		SmsVCSender.send(0)
	}
	,sendVoice:function(){
		SmsVCSender.send(1)
	}
	,send:function(c){
		var b=SmsVCSender.mobileObj.val();
		if(!Validator.validateObject(SmsVCSender.mobileObj,false)){
			return
		}
		var a=c;
		$.post("/Member/Index/doSendSMS",{
			mobile:b,type:c,selfMobile:SmsVCSender.selfMobile,uniqueMobile:SmsVCSender.uniqueMobile
		}
		,function(e){
			if(e.resultCode==1){
				SmsVCSender.btnSendSms.hide();
				SmsVCSender.btnSendVoice.hide();
				if(a==1){
					//$(SmsVCSender.voiceSendHtml).insertBefore(SmsVCSender.btnSendVoice);
					$(SmsVCSender.smsSendHtml1).insertBefore(SmsVCSender.btnSendSms)
				}
				else{
					//$(SmsVCSender.voiceSendHtml1).insertBefore(SmsVCSender.btnSendVoice);
					$(SmsVCSender.smsSendHtml).insertBefore(SmsVCSender.btnSendSms)
				}
				var d=new Countdown(a==1?120:60,$("span[name=spanTimer]"),function(){
					$(".smssendertimer").remove();
					$(".smssendertimer").remove();
					SmsVCSender.btnSendVoice.show();
					SmsVCSender.btnSendSms.show();
					if(SmsVCSender.overEvent){
						SmsVCSender.overEvent()
					}
				});
				d.start()
			}
			else{
				$.showMsgBox(e.resultMsg)
			}
		},'json')
	}
};

$.SmsVCSender=function(a,c,e,f,d){
	this.mobileObj=a;
	this.validCodeObj=c;
	this.btnSendSms=e;
	this.btnSendVoice=f;
	if(d){
		if($.isFunction(d.overEvent)){
			this.overEvent=d.overEvent
		}
	}
	var b=this;
	this.validCodeObj.parent().parent("div").find(".yzm img, .validcode_change a").unbind("click").bind("click",function(){
		b.changeVC(true)
	});
	this.selfMobile=d&&typeof(d.selfMobile)=="boolean"&&d.selfMobile;
	this.uniqueMobile=d&&typeof(d.uniqueMobile)=="boolean"&&d.uniqueMobile;
	this.smsSendHtml=d&&d.smsSendHtml?d.smsSendHtml:'<a href="###" class="fbgray sgbtn smssendertimer" style="display: inline-block;"><span><em name=\'spanTimer\'>60</em>秒后可重发短信</span> </a>';
	this.smsSendHtml1=d&&d.smsSendHtml1?d.smsSendHtml1:'<a href="###" class="fbgray sgbtn smssendertimer" style="display: inline-block;"><span>重发短信验证码</span></a>';
	this.voiceSendHtml=d&&d.voiceSendHtml?d.voiceSendHtml:'<a href="###" class="fbgray sgbtn smssendertimer" style="display: inline-block;"><span><em name=\'spanTimer\'>120</em>秒后重获语音验证码</span></a>';
	this.voiceSendHtml1=d&&d.voiceSendHtml1?d.voiceSendHtml1:'<a href="###" class="fbgray sgbtn smssendertimer" style="display: inline-block;"><span>免费语音获取验证码</span></a>'
};
$.SmsVCSender.prototype.changeVC=function(a){
	$(".yzm img").attr("src","/Api/Checkcode/index.html?t="+new Date().getTime());
	this.validCodeObj.val("");
	this.validCodeObj.attr("require",a);
	return false
};
$.SmsVCSender.prototype.sendSms=function(){
	this.send(0)
};
$.SmsVCSender.prototype.sendVoice=function(){
	this.send(1)
};
$.SmsVCSender.prototype.send=function(e){
	if(!Validator.validateObject(this.mobileObj,false)||!Validator.validateObject(this.validCodeObj,false)){
		return
	}
	var d=this.mobileObj.val();
	var a=this.validCodeObj.val();
	var c=e;
	var b=this;
	$.post("/Member/Index/sendsmsvc.htm",{
		mobile:d,validCode:a,type:e,selfMobile:b.selfMobile,uniqueMobile:b.uniqueMobile
	}
	,function(g){
		if(g.resultCode==1){
			b.btnSendSms.hide();
			b.btnSendVoice.hide();
			if(c==1){
				//$(b.voiceSendHtml).insertBefore(b.btnSendVoice);
				$(b.smsSendHtml1).insertBefore(b.btnSendSms)
			}
			else{
				//$(b.voiceSendHtml1).insertBefore(b.btnSendVoice);
				$(b.smsSendHtml).insertBefore(b.btnSendSms)
			}
			var f=new Countdown(c==1?120:60,$("em[name=spanTimer]"),function(){
				$(".smssendertimer").remove();
				$(".smssendertimer").remove();
				b.btnSendVoice.show();
				b.btnSendSms.show();
				if(b.overEvent){
					b.overEvent()
				}
				b.changeVC(false)
			});
			f.start()
		}
		else{
			$.showMsgBox(g.resultMsg);
			if(g.resultCode==20001){
				b.changeVC(true)
			}
		}
	},'json')
};


$.ScrollUlList=function(e,f){
	this.target=e;
	this.target.css("overflow","hidden");
	this.target.scrollTop(0);
	var d=this.target.find("li");
	this.lineCount=d.length;
	if(this.lineCount<=1){
		return
	}
	this.currentIndex=0;
	this.lineHeight=$(d[0]).height();
	if(this.lineHeight*this.lineCount<this.target.height()){
		return
	}
	for(var b=0;b<this.lineCount;b++){
		this.target.append($(d[b]).clone())
	}
	this.scrollDelay=10;
	if(f&&f.scrollDelay){
		this.scrollDelay=f.scrollDelay
	}
	this.screenDelay=5000;
	if(f&&f.screenDelay){
		this.screenDelay=f.screenDelay
	}
	this.timer=null;
	var c=this;
	d.hover(function(){
		c.suspended()
	}
	,function(){
		c.resume()
	});
	var a=this;
	this.timer=window.setTimeout(function(){
		a.start()
	}
	,this.screenDelay)
};
$.ScrollUlList.prototype.start=function(){
	if(this.currentIndex>=this.lineCount){
		this.currentIndex=0;
		this.target.scrollTop(0)
	}
	var b=this.target.scrollTop();
	if(b<(this.currentIndex+1)*this.lineHeight){
		this.target.scrollTop(b+1);
		var a=this;
		this.timer=window.setTimeout(function(){
			a.start()
		}
		,this.scrollDelay)
	}
	else{
		this.currentIndex++;
		var a=this;
		this.timer=window.setTimeout(function(){
			a.start()
		}
		,this.screenDelay)
	}
};
$.ScrollUlList.prototype.dispose=function(){
	window.clearTimeout(this.timer);
	var d=this.target.find("li");
	var b=d.length;
	var a=b/2;
	for(var c=b-1;c>a-1;c--){
		$(d[c]).remove()
	}
};
$.ScrollUlList.prototype.suspended=function(){
	window.clearTimeout(this.timer)
};
$.ScrollUlList.prototype.resume=function(){
	this.start()
};
$.Combobox=function(d,e){
	if(d.length==0){
		return
	}
	this.target=d;
	this.hasMouseFocus=false;
	this.focusIndex=-1;
	this.comboboxId="_Combobox_"+new Date().getTime();
	this.parentObj=this.target.parents(".item");
	if(e&&e.parentObj){
		this.parentObj=e.parentObj
	}
	var c=$('<ul id="'+this.comboboxId+'" class="yui-ac-bd"></ul>');
	this.parentObj.append(c);
	this.position();
	this.getValueHandler=null;
	this.setValueHandler=null;
	if(e){
		if(e.getValueHandler&&$.isFunction(e.getValueHandler)){
			this.getValueHandler=e.getValueHandler
		}
		if(e.setValueHandler&&$.isFunction(e.setValueHandler)){
			this.setValueHandler=e.setValueHandler
		}
	}
	var b=this;
	c.hover(function(){
		b.hasMouseFocus=true
	}
	,function(){
		b.hasMouseFocus=false
	});
	this.target.hover(function(){
		b.hasMouseFocus=true
	}
	,function(){
		b.hasMouseFocus=false
	});
	$(document.body).click(function(){
		if(!b.hasMouseFocus){
			b.hide()
		}
	});
	var a=this.target;
	if(!this.target.is("input")){
		a=this.target.find("input[type=text]")
	}
	a.bind("keyup",function(f){
		b.keyup(f)
	}).bind("focus",function(){
		b.show()
	})
};
$.Combobox.prototype.position=function(){
	var a=this.parentObj;
	var b=$("#"+this.comboboxId);
	b.css("left",this.target.offset().left-a.offset().left);
	b.css("top",this.target.offset().top-a.offset().top+this.target.height())
};
$.Combobox.prototype.show=function(){
	if($("#"+this.comboboxId+" li").length>0){
		$("#"+this.comboboxId).show();
		if($("#"+this.comboboxId+" li:visible").length==0){
			$("#"+this.comboboxId).hide()
		}
		else{
			this.position()
		}
	}
};
$.Combobox.prototype.hide=function(){
	$("#"+this.comboboxId).hide()
};
$.Combobox.prototype.clear=function(){
	var a=$("#"+this.comboboxId);
	a.empty();
	this.hide()
};
$.Combobox.prototype.filter=function(b){
	var a=$("#"+this.comboboxId+" li");
	a.hide().removeClass("ac_over").filter(":contains('"+b.trim()+"')").show().eq(0).addClass("ac_over");
	this.show();
	a=$("#"+this.comboboxId+" li:visible");
	var c=0;
	a.removeClass("ac_even").removeClass("ac_odd").each(function(){
		$(this).addClass(c%2==0?"ac_even":"ac_odd");
		c++
	});
	this.focusIndex=a.length>0?0:-1
};
$.Combobox.prototype.keyup=function(e){
	var d=$("#"+this.comboboxId+" li:visible");
	if(e.keyCode==13&&this.focusIndex>=0&&d.length>this.focusIndex){
		e.preventDefault();
		this.selectedItem(d[this.focusIndex])
	}
	else{
		if((e.keyCode==38||e.keyCode==40)&&d.length>1){
			e.preventDefault();
			if(e.keyCode==38){
				this.focusIndex--;
				if(this.focusIndex<0){
					this.focusIndex=d.length-1
				}
			}
			else{
				if(e.keyCode==40){
					this.focusIndex++;
					if(this.focusIndex>=d.length){
						this.focusIndex=0
					}
				}
			}
			d.removeClass("ac_over");
			if(d.length>0){
				$(d[this.focusIndex]).addClass("ac_over");
				var f=$("#"+this.comboboxId);
				var c=f.height();
				var b=d.eq(0).height();
				var a=b*(this.focusIndex+1);
				if(c<a){
					f.scrollTop(a-c)
				}
				else{
					f.scrollTop(0)
				}
			}
		}
	}
};
$.Combobox.prototype.getValue=function(){
	if(this.getValueHandler){
		return this.getValueHandler()
	}
	if(this.target.is("input")){
		return this.target.val()
	}
	else{
		return this.target.find("input[type=text]").val()
	}
};
$.Combobox.prototype.setValue=function(a){
	a=$(a);
	if(this.setValueHandler){
		return this.setValueHandler(a)
	}
	var b=a.attr("val");
	if(!(b)){
		b=a.html()
	}
	if(this.target.is("input")){
		return this.target.val(b)
	}
	else{
		return this.target.find("input[type=text]").val(b)
	}
};
$.Combobox.prototype.selectedItem=function(a,b){
	this.setValue(a);
	if(this.target.is("input")){
		this.target.blur()
	}
	else{
		this.target.find("input[type=text]").blur()
	}
	if(b){
		return
	}
	this.hide()
};
$.Combobox.prototype.bindData=function(h,a,m,c){
	var i=this.getValue();
	var f=$("#"+this.comboboxId);
	f.empty();
	var l=0;
	this.focusIndex=0;
	for(var g=0;g<h.length;g++){
		var e=h[g];
		if(!(e[a])){
			continue
		}
		var j=$("<li/>");
		j.html(e[a]);
		j.addClass(l%2==0?"ac_even":"ac_odd");
		if(e[m]){
			j.attr("val",e[m])
		}
		for(var b in e){
			if(b==a||b==m){
				continue
			}
			j.attr(b,e[b])
		}
		f.append(j);
		if((e.value&&i==e.value)||(!(e.value)&&i==e.html)){
			this.focusIndex=l
		}
		l++
	}
	var k=f.find("li");
	var d=this;
	k.click(function(){
		d.selectedItem(this)
	});
	k.bind("mouseenter",function(){
		var n=$("#"+d.comboboxId+" li");
		n.removeClass("ac_over");
		$(this).addClass("ac_over");
		d.focusIndex=$(this).parents("ul").find("li:visible").index($(this))
	});
	if(c){
		if(k.length>0){
			$(k[this.focusIndex]).addClass("ac_over");
			this.show()
		}
		else{
			this.focusIndex=-1;
			this.hide()
		}
	}
};
$.BankCardNo=function(a){
	this.target=a;
	this.tip=$('<span id="_BankCardNo_Tip_'+new Date().getTime()+'" class="cardno_tip"><span></span><iframe style="display:none;_display:block;position:absolute;top:-1px;left:-1px;z-index:-1; filter:mask();  width:150px;height:30px; "></iframe></span>');
	$(window.document.body).append(this.tip);
	var b=this;
	this.target.focus(function(){
		b.showTip()
	}).blur(function(){
		b.tip.hide()
	}).keyup(function(d){
		var e=b.target.val();
		e=e.replace(/[ ]/g,"");
		var c=e.substring(0,4);
		e=e.substring(4);
		while(e&&e.length>0){
			c+=" "+e.substring(0,4);
			e=e.substring(4)
		}
		b.target.val(c);
		b.showTip()
	})
};
$.BankCardNo.prototype.showTip=function(){
	var a=this.target.val();
	if(a.length>0){
		this.tip.find("span").html(a);
		if(this.tip.is(":hidden")){
			this.tip.css({
				top:this.target.offset().top-this.tip.height()-22,left:this.target.offset().left
			});
			this.tip.show()
		}
	}
	else{
		this.tip.hide()
	}
};
var ScrollVertical=function(a,d,c){
	this.con=a;
	this.idx=1;
	this.time=500;
	this.count=a.find("li").length;
	var b=this;
	d.click(function(){
		b.doPre()
	});
	c.click(function(){
		b.doNext()
	})
};
ScrollVertical.prototype.doPre=function(){
	if(this.idx>1){
		this.idx=this.idx-1;
		var a=-(this.idx-1)*20;
		this.con.animate({
			top:a+"px"
		}
		,this.time)
	}
};
ScrollVertical.prototype.doNext=function(){
	if(this.idx<this.count){
		this.idx=this.idx+1;
		var a=-(this.idx-1)*20;
		this.con.animate({
			top:a+"px"
		}
		,this.time)
	}
};
var ImageUpload=function(b,a){
	if(!a||!a.category||typeof(a.category)!="number"||!(typeof(a.owner)=="number"||(typeof(a.owner)=="string"&&/^\d+$/.test(a.owner)))||(!a.handler&&!a.successHandler)||(!$.isFunction(a.handler)&&!$.isFunction(a.successHandler))){
		$.showMsgBox("上传控件参数非法");
		return
	}
	this.id=b;
	this.thisPanel=$("#divUpload_"+this.id);
	if(this.thisPanel.length==0){
		return
	}
	this.handler=a.handler;
	this.successHandler=a.successHandler;
	this.imgExtensions=[".bmp",".png",".gif",".jpg",".jpeg"];
	this.targetUrl=a.targetUrl||"/Member/info/changeHead.html";
	this.targetUrl+="?category={0}&owner={1}".format(a.category,a.owner);
	if($.isSupportHtml5Upload()){
		this.html5Upload()
	}
	else{
		if($.isSupportFlash()){
			this.swfUpload()
		}
		else{
			this.normalUpload()
		}
	}
};
ImageUpload.prototype.fileIsImage=function(b){
	if(b==null||b.length<=0){
		return false
	}
	if(b.indexOf(".")<0){
		return false
	}
	var c=b.substr(b.lastIndexOf("."));
	c=c.toLowerCase();
	var d=false;
	for(var a in this.imgExtensions){
		if(c==this.imgExtensions[a]){
			d=true;
			break
		}
	}
	return d
};
ImageUpload.prototype.html5Upload=function(){
	var thisUpload=this;
	this.thisPanel.find("input[type=file]").change(function(){
		var filePath=$(this).val();
		if(filePath.length==0){
			return
		}
		if(!thisUpload.fileIsImage(filePath)){
			$.showMsgBox("请选择正确的图片文件上传!");
			return
		}
		thisUpload.createProgress();
		var formData=new FormData();
		formData.append("file",this.files[0]);
		var xhr=new XMLHttpRequest();
		xhr.open("post",thisUpload.targetUrl,true);
		xhr.upload.addEventListener("progress",function(event){
			if(event.lengthComputable){
				thisUpload.updateProgress(event.loaded,event.total)
			}
		}
		,false);
		xhr.addEventListener("load",function(event){
			eval("var jsonData="+event.target.responseText);
			if($.isFunction(thisUpload.handler)){
				thisUpload.handler(thisUpload.id,jsonData)
			}
			else{
				if(jsonData.resultCode==1){
					thisUpload.successHandler(thisUpload.id,jsonData)
				}
				else{
					$.showMsgBox(jsonData.resultMsg)
				}
			}
			thisUpload.resetUpload()
		}
		,false);
		xhr.addEventListener("error",function(event){
			$.showMsgBox("上传图片过程出错!");
			thisUpload.cancelUpload()
		}
		,false);
		xhr.send(formData);
		thisUpload.requestUpload=xhr
	})
};
ImageUpload.prototype.swfUpload=function(){
	var thisUpload=this;
	var strButtonText=this.thisPanel.find(".uploadsfz").text();
	this.thisPanel.css("height","28px");
	this.thisPanel.find("div[name=upload]").html('<div id="divSwfUpload_'+this.id+'"></div>');
	var strUploadUrl="{0}//{1}{2}{3}".format(window.location.protocol,window.location.hostname,window.location.port.length==0?"":(":"+window.location.port),this.targetUrl);
	var settings={
		flash_url:Config.ScriptHomeSite+"/swfupload/swfupload.swf",upload_url:strUploadUrl,post_params:{},file_post_name:"file",file_size_limit:"10 MB",file_types:"*.jpg;*.jpeg;*.gif;*.png;*.bmp",file_types_description:"Image File",file_upload_limit:100,file_queue_limit:0,debug:false,button_text:'<span class="uploadsfz">'+strButtonText+"</span>",button_text_style:".uploadsfz { color: #0169bc; }",button_image_url:Config.ImageHomeSite+"/www/swfupload-button.png",button_width:"105",button_height:"28",button_text_top_padding:4,button_text_left_padding:strButtonText.length==4?26:7,button_cursor:SWFUpload.CURSOR.HAND,button_action:SWFUpload.BUTTON_ACTION.SELECT_FILE,button_placeholder_id:"divSwfUpload_"+this.id,button_window_mode:SWFUpload.WINDOW_MODE.TRANSPARENT,file_dialog_complete_handler:function(selectedNumber,queuedNumber,totalQueuedNumber){
			if(selectedNumber>0){
				thisUpload.swfRequestUpload.startUpload()
			}
		}
		,upload_start_handler:function(file){
			thisUpload.createProgress()
		}
		,upload_progress_handler:function(file,bytesLoaded,bytesTotal){
			thisUpload.updateProgress(bytesLoaded,bytesTotal)
		}
		,upload_error_handler:function(file,errorCode,message){
			$.showMsgBox("上传图片过程出错!");
			thisUpload.cancelUpload()
		}
		,upload_success_handler:function(file,serverData){
			eval("var jsonData="+serverData);
			if($.isFunction(thisUpload.handler)){
				thisUpload.handler(thisUpload.id,jsonData)
			}
			else{
				thisUpload.successHandler(thisUpload.id,jsonData)
			}
			thisUpload.resetUpload()
		}
		,upload_complete_handler:function(file){
			thisUpload.updateProgress(1,1)
		}
	};
	this.swfRequestUpload=new SWFUpload(settings)
};
ImageUpload.prototype.normalUpload=function(){
	var a=this;
	this.thisPanel.find("input[type=file]").change(function(){
		var b=$(this).val();
		if(b.length==0){
			return
		}
		if(!a.fileIsImage(b)){
			$.showMsgBox("请选择正确的图片文件上传!");
			return
		}
		a.createProgress();
		this.requestUpload=$.ajaxFileUpload({
			url:a.targetUrl,secureuri:false,fileObj:a.thisPanel.find("input[type=file]"),dataType:"json",data:{},success:function(d,c){
				if($.isFunction(a.handler)){
					a.handler(a.id,d)
				}
				else{
					if(d.resultCode==1){
						a.successHandler(a.id,d)
					}
					else{
						$.showMsgBox(d.resultMsg)
					}
				}
				a.resetUpload()
			}
			,error:function(d,c,f){
				$.showMsgBox("上传图片过程出错!");
				a.cancelUpload()
			}
		})
	})
};
ImageUpload.prototype.createProgress=function(){
	if(this.thisPanel.find("div[name=progress]").length>0){
		return
	}
	var b=$('<div name="progress" class="uploadbox"><div name="progressing" class="uploadbox1">&nbsp;</div><a href="###" class="uploadtxt">取消上传</a></div>');
	b.insertBefore(this.thisPanel.find("div[name=upload]"));
	var a=this;
	b.find("a").click(function(){
		a.cancelUpload()
	})
};
ImageUpload.prototype.updateProgress=function(b,a){
	this.thisPanel.find("div[name=progressing]").css("width",(a<=0?0:(b*100/a))+"%")
};
ImageUpload.prototype.cancelUpload=function(){
	if(this.requestUpload){
		this.requestUpload.abort()
	}
	if(this.swfRequestUpload){
		this.swfRequestUpload.cancelUpload(null,null)
	}
	this.resetUpload()
};
ImageUpload.prototype.resetUpload=function(){
	this.thisPanel.find("div[name=progress]").remove()
};
$.PagerBuilder={
	bindGo:function(c,a,b){
		$("#btnGo_"+c).click(function(){
			var e=$("#txtGo_"+c).val();
			var d=/^\d+$/.test(e);
			if(!d){
				$.showMsgBox("请输入正确的跳转页码");
				return
			}
			e=Number(e);
			if(e>a){
				$.showMsgBox("输入的跳转页码不能大于"+e+"!");
				return
			}
			$.doUrlRedirt(b.replace("__0__",e))
		});
		$("#txtGo_"+c).keyup(function(d){
			if(d.keyCode==13){
				d.preventDefault();
				$("#btnGo_"+c).click()
			}
		})
	}
};
var CellCombobox=function(d,c,b){
	this.inpCell=d;
	this.selCity=c;
	this.selArea=b;
	this.combobox=new $.Combobox(d.parent());
	var a=this;
	d.bind("keyup",function(e){
		a.keyup(e)
	}).bind("focus",function(){
		a.combobox.show()
	});
	c.bind("change",function(){
		a.filter(false)
	});
	b.bind("change",function(){
		a.filter(false)
	})
};
CellCombobox.prototype.keyup=function(a){
	if(a.keyCode==13||(a.keyCode>=37&&a.keyCode<=40)){
		return
	}
	this.filter(true)
};
CellCombobox.prototype.filter=function(d){
	var e=this.selCity.val();
	var c=this.selArea.val();
	var a=this.inpCell.val();
	if(String.isNullOrWhiteSpace(e)||String.isNullOrWhiteSpace(a)){
		this.combobox.hide()
	}
	else{
		if(this.reqCellList){
			this.reqCellList.abort()
		}
		var b=this;
		this.reqCellList=$.post("/Member/Index/getcelltoplist.htm",{
			cityCode:e,areaCode:c,cellName:a
		}
		,function(h){
			if(h.resultCode!=1){
				b.combobox.clear();
				return
			}
			var i=b.inpCell.val();
			for(var g=0;g<h.data.length;g++){
				var f=h.data[g];
				f.html=f.name.replace(new RegExp(i,"g"),'<span class="fred fbold">'+i+"</span>")
			}
			b.combobox.bindData(h.data,"html","name",d)
		},'json')
	}
};
var SubbranchCombobox=function(c,a,e,f,d){
	this.divSubbranch=c;
	this.selBank=a;
	this.selProvince=e;
	this.selCity=f;
	this.autoShow=d;
	this.combobox=new $.Combobox(c.find(".branch-info"));
	var b=this;
	this.selBank.bind("change",function(){
		b.bind(false)
	});
	this.selCity.bind("change",function(){
		b.bind(false)
	});
	c.find(".branch-icon").click(function(){
		b.show()
	});
	this.divSubbranch.find("input").bind("keyup",function(g){
		b.keyup(g)
	}).bind("blur",function(){
		b.blur()
	})
};
SubbranchCombobox.prototype.bind=function(f){
	if(this.divSubbranch.length==0){
		return
	}
	var a=this.selBank.val();
	var c=this.selProvince.val();
	var d=this.selCity.val();
	var e=this.selBank.find("option:selected");
	if(this.autoShow&&(e.attr("hassubbranch")!="true"||a=="0"||c=="0"||d=="0")){
		this.combobox.clear();
		this.divSubbranch.hide();
		return
	}
	this.divSubbranch.show();
	if(this.reqSubbranchList){
		this.reqSubbranchList.abort()
	}
	var b=this;
	this.reqSubbranchList=$.post("/Member/Index/getsubbanklist.htm",{
		bankId:a,provinceCode:c,cityCode:d
	}
	,function(k){
		if(k.resultCode!=1){
			return
		}
		if(!f){
			var h=b.divSubbranch.find("input").val();
			if(!String.isNullOrWhiteSpace(h)){
				var g="";
				for(var j=0;j<k.data.length;j++){
					if(k.data.name==h){
						g=h;
						break
					}
				}
				if(String.isNullOrWhiteSpace(g)){
					b.divSubbranch.find("input").val("")
				}
			}
		}
		b.combobox.bindData(k.data,"name","name")
	})
};
SubbranchCombobox.prototype.show=function(){
	this.combobox.show()
};
SubbranchCombobox.prototype.keyup=function(a){
	if(a.keyCode!=13&&a.keyCode!=38&&a.keyCode!=40){
		this.combobox.filter(this.divSubbranch.find("input").val())
	}
};
SubbranchCombobox.prototype.blur=function(){
	var a=this.divSubbranch.find("input").val();
	var c=$("#"+this.combobox.comboboxId);
	if(c.find("li").length==0){
		return
	}
	if(a.length>0){
		var e=null;
		c.find("li").each(function(){
			if($(this).text()==a){
				e=this
			}
		});
		if(e!=null){
			return
		}
	}
	var d=c.find("li:visible");
	var b=null;
	if(d.length>0&&this.combobox.focusIndex>=0&&this.combobox.focusIndex<d.length){
		b=d[this.combobox.focusIndex]
	}
	else{
		if(d.length>0){
			b=d[0]
		}
	}
	if(b==null){
		this.divSubbranch.find("input").val("");
		this.combobox.filter("");
		this.combobox.hide()
	}
	else{
		this.combobox.selectedItem(b,true)
	}
};
var EnumJS={
	fromValue:function(a,c){
		var b={
			key:"",value:0,desc:""
		};
		c=c+"";
		$.each(a,function(d){
			if(d==c||(a[d].value+"")==c){
				b={
					key:d,value:a[d].value,desc:a[d].desc
				};
				return b
			}
		});
		return b
	}
	,OrderState:{
		Normal:{
			value:1,desc:"等待付款"
		}
		,Auditing:{
			value:2,desc:"审核中"
		}
		,AuditedPass:{
			value:4,desc:"审核通过"
		}
		,AuditedNotPass:{
			value:8,desc:"审核不通过"
		}
		,UserCancel:{
			value:16,desc:"用户取消"
		}
		,SystemCancel:{
			value:32,desc:"系统取消"
		}
	}
	,OrderCapitalState:{
		Normal:{
			value:1,desc:"未支付"
		}
		,Recharged:{
			value:2,desc:"已充值"
		}
		,UserPayed:{
			value:8,desc:"已支付"
		}
		,Withdrawing:{
			value:16,desc:"退款中"
		}
		,Withdrawed:{
			value:32,desc:"已退款"
		}
		,PayOuting:{
			value:64,desc:"已支付给房东"
		}
	}
	,EarnestStatus:{
		NotPay:{
			value:1,desc:"未支付"
		}
		,Payed:{
			value:2,desc:"已支付"
		}
		,Auditing:{
			value:4,desc:"申退审核中"
		}
		,AuditPass:{
			value:8,desc:"审核通过"
		}
		,NotPass:{
			value:16,desc:"审核不通过"
		}
		,Withdrawed:{
			value:32,desc:"退款成功"
		}
	}
	,EarnestOperateType:{
		RentUesrPay:{
			value:1,desc:"支付真实租房保证金"
		}
		,Forfeit:{
			value:2,desc:"逾期扣保证金"
		}
		,Recharge:{
			value:4,desc:"补交保证金"
		}
		,Back:{
			value:8,desc:"退还保证金"
		}
	}
	,UserRole:{
		Renter:{
			value:1,desc:"租客"
		}
		,LandLord:{
			value:2,desc:"房东"
		}
		,Broker:{
			value:4,desc:"经纪人"
		}
		,MediumStore:{
			value:8,desc:"中介门店"
		}
		,MerchantPersonal:{
			value:16,desc:"二房东"
		}
		,MerchantCompany:{
			value:32,desc:"公司"
		}
	}
	,RentPayModel:{
		Month:{
			value:1,desc:"按月付"
		}
		,Season:{
			value:2,desc:"按季付"
		}
		,HalfYear:{
			value:4,desc:"按半年付"
		}
		,Year:{
			value:8,desc:"按年付"
		}
	}
	,ImgCategory:{
		HouseCertificate:{
			value:1,desc:"房产证照片"
		}
		,LandlordCredentialNo:{
			value:2,desc:"房东身份证照片"
		}
		,RentContract:{
			value:4,desc:"租房合同照片"
		}
		,SelfCredentialNo1:{
			value:8,desc:"本人身份证照片正面"
		}
		,SelfCredentialNo2:{
			value:9,desc:"本人身份证照片反面"
		}
		,RentBill:{
			value:16,desc:"账单类型照片"
		}
		,MediumCompany:{
			value:32,desc:"中介公司照片"
		}
		,PersonalPhoto:{
			value:64,desc:"个人头像"
		}
		,BusinessLicense:{
			value:128,desc:"营业执照"
		}
		,TaxRegistrationCertificate:{
			value:256,desc:"税务登记证"
		}
		,AccountCredentialNo1:{
			value:258,desc:"所有人认证头部照片"
		}
		,AccountCredentialNo2:{
			value:259,desc:"所有人认证上半身照片"
		}
		,UserOther:{
			value:260,desc:"用户其它图片"
		}
		,Qualifications1:{
			value:261,desc:"资格认证照片1"
		}
		,Qualifications2:{
			value:262,desc:"资格认证照片2"
		}
		,Qualifications3:{
			value:263,desc:"资格认证照片3"
		}
		,Other:{
			value:1024,desc:"其他"
		}
	}
	,UserFrom:{
		ZuFangBao:{
			value:1,desc:"租房宝用户"
		}
		,Sina:{
			value:2,desc:"新浪用户"
		}
		,QQ:{
			value:4,desc:"QQ用户"
		}
		,AliPay:{
			value:8,desc:"支付宝用户"
		}
		,Partner:{
			value:16,desc:"合作商户"
		}
	}
	,ChargePackage:{
		MerchantAccountCharge:{
			value:1,desc:"公司账户充值"
		}
		,MerchantPersonalAccountCharge:{
			value:2,desc:"个人二房东账户充值"
		}
	}
	,RentType:{
		House:{
			value:1,desc:"住宅"
		}
		,ShopsOffice:{
			value:2,desc:"商铺/写字楼"
		}
	}
	,PayeeType:{
		Personal:{
			value:1,desc:"个人"
		}
		,Company:{
			value:2,desc:"公司"
		}
	}
	,ScoreLotteryAwardType:{
		Virtual:{
			value:1,desc:"虚拟"
		}
		,Physical:{
			value:2,desc:"实物"
		}
	}
};
var Config={
	ScriptHomeSite:"/tpl/imtron/Public/scriptscp",ScriptVersion:"",StyleHomeSite:"/tpl/imtron/Public/styles",StyleVersion:"",ImageHomeSite:"/tpl/imtron/Public/images",StaticDomain:"/tpl/imtron/Public/",PortalSite:"",MerchantSite:""
};
