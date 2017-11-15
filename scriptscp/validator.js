var Validator={
	theObj:"",Require:/.+/,Empty:/^$/,Email:/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,Phone:/^0\d{2,3}-?[1-9]\d{5,7}$/,Mobile:/^((13)|(14)|(15)|(18))\d{9}$/,MPhone:/(^((13)|(14)|(15)|(18))\d{9}$)|(^0\d{2,3}-?[1-9]\d{5,7}$)/,AlipayAccount:/(^((13)|(14)|(15)|(18))\d{9}$)|(^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)/,Url:/^(https?|ftp|mms):\/\/([A-Za-z0-9]+[_-]?[A-z0-9]*\.)+([A-Za-z0-9]+)(:[0-9]+)?\/?.*$/,Currency:/^\d+(\.\d+)?$/,Number:/^\d+$/,Year:/^\d{4}$/,Rate:/^[-\+]?\d+(\.\d+)?(%)?$/,Zip:/^[1-9]\d{5}$/,QQ:/^[1-9]\d{4,20}$/,Integer:/^[-\+]?\d+$/,Double:/^[-\+]?\d+(\.\d+)?$/,English:/^[A-Za-z]+$/,Chinese:/^[\u0391-\uFFE5]+$/,CompanyName:"/^([\u0391-\uFFE5]|[a-zA-Z0-9]){4,50}$/.test(theObj.val()) && /[\u0391-\uFFE5]+/.test(theObj.val())",General:/^([\u0391-\uFFE5]|\w)+$/,CustomNo:/^[a-zA-Z0-9._\-]{3,30}$/,Account:/^[a-z]\w{3,15}$/i,MAccount:/.+/,LoginAccount:/^([a-z]\w{3,15})|(\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)|(((13)|(14)|(15)|(18))\d{9})$/i,UserName:/^[\u0391-\uFFE5]{2,10}$/,Password:/^.{6,16}$/,ValidCode:/^[0-9]{4,6}$/,UnSafe:/^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/,IsSafe:function(a){
		return !this.UnSafe.test(a)
	}
	,IdCard:"this.isIdCard(theObj.val().trim())",CreditCard:/^[1-9]\d{3}(\s\d{4}){2,3}(\s\d{1,4})?$/,SafeString:"this.isSafe(theObj.val().trim())",Filter:"this.doFilter(theObj.val().trim(), theObj.attr('accept'))",Limit:"this.limit(theObj.val().trim().length,theObj.attr('min'),  theObj.attr('max'))",LimitB:"this.limit(this.LenB(theObj.val().trim()), theObj.attr('min'), theObj.attr('max'))",LimitNum:"this.limitNum(theObj.val().trim(), theObj.attr('min'), theObj.attr('max'))",Date:"this.isDate(theObj.val().trim(), theObj.attr('min'), theObj.attr('format'))",Repeat:"theObj.val().trim() == document.getElementsByName(theObj.attr('to'))[0].value",Range:"Number(theObj.attr('min')) <= Number(theObj.val().trim()) && Number(theObj.val().trim()) <= Number(theObj.attr('max'))",Compare:"this.compare(theObj.val().trim(),theObj.attr('operator'),theObj.attr('to'))",Custom:"this.exec(theObj.val().trim(), theObj.attr('regexp'))",Group:"this.mustChecked(theObj.attr('name'), theObj.attr('min'), theObj.attr('max'))",bind:function(b){
		var a;
		var c;
		if(b&&b instanceof jQuery){
			a=b.find("input[dataType],textarea[dataType],select[dataType]");
			c=b.find("input[placeholder],textarea[placeholder]")
		}
		else{
			if(b&&typeof b=="string"){
				a=$("#"+b).find("input[dataType],textarea[dataType],select[dataType]");
				c=$("#"+b).find("input[placeholder],textarea[placeholder]")
			}
			else{
				if(Object.isElement(b)){
					a=$(b).find("input[dataType],textarea[dataType],select[dataType]");
					c=$(b).find("input[placeholder],textarea[placeholder]")
				}
				else{
					a=$("input[dataType],textarea[dataType],select[dataType]");
					c=$("input[placeholder],textarea[placeholder]")
				}
			}
		}
		a.unbind("focus",Validator.remind).bind("focus",Validator.remind);
		a.unbind("blur",Validator.validate).bind("blur",Validator.validate);
		var d=document.createElement("input");
		var e="placeholder" in d;
		if(!e){
			c.each(Validator.placeholder)
		}
	}
	,validateForm:function(c){
		var b;
		if(c&&c instanceof jQuery){
			b=c.find("input[dataType]:visible,textarea[dataType]:visible,select[dataType]:visible")
		}
		else{
			if(c&&typeof c=="string"){
				b=$("#"+c).find("input[dataType]:visible,textarea[dataType]:visible,select[dataType]:visible")
			}
			else{
				if(Object.isElement(c)){
					b=$(c).find("input[dataType]:visible,textarea[dataType]:visible,select[dataType]:visible")
				}
				else{
					b=$("input[dataType]:visible,textarea[dataType]:visible,select[dataType]:visible")
				}
			}
		}
		for(var d=0;d<b.length;d++){
			if($(b[d]).attr("isValidateFaild")){
				return false
			}
		}
		Validator.clearMsgCon(b);
		var a=true;
		b.each(function(){
			var f=$(this);
			if(!Validator.validateObject(f,true)){
				a=false;
				var e=f.attr("msgConId");
				if(!String.isNullOrWhiteSpace(e)){
					return a
				}
			}
		});
		return a
	}
	,remind:function(){
		var c=$(this);
		Validator.clearState(c,false);
		var b=c.attr("rig");
		if(String.isNullOrWhiteSpace(b)){
			return
		}
		var d=c.attr("useNewClass")!=undefined&&c.attr("useNewClass")=="true"?"remindmessage_nob":"remindmessage";
		var a=$("<div id='__RemindMessagePanel' class='{0}'></div>".format(d));
		a.attr("targetId",c.attr("id"));
		a.text(b);
		c.parent().parent().append(a)
	}
	,validate:function(){
		var a=$(this);
		if(a.val()!=""){
			Validator.validateObject(a)
		}
	}
	,validateObject:function(obj,clientValid,isDepend,dataTypeTag){
		var flag=true;
		var serverMsg=false;
		Validator.clearState(obj,clientValid);
		var dataTypes=obj.attr(dataTypeTag||"dataType");
		if(String.isNullOrWhiteSpace(dataTypes)){
			return true
		}
		var inputValue=obj.val().trim();
		obj.val(inputValue);
		if(!isDepend&&obj.attr("require")!="true"&&(inputValue.lenght==0||new Number(inputValue)==0)){
			return true
		}
		dataTypes=dataTypes.split("|");
		try{
			for(var index=0;index<dataTypes.length;index++){
				var dataType=dataTypes[index];
				switch(dataType){
					case"IdCard":case"Date":case"Repeat":case"Range":case"Compare":case"Custom":case"Group":case"Limit":case"LimitB":case"LimitNum":case"SafeString":case"Filter":case"CompanyName":theObj=obj;
					flag=eval(this[dataType]);
					break;
					case"StartEndTime":var startTime=$("[name="+obj.attr("dependName")+"]").val();
					var dtStartTime=Date.fromFormat(startTime);
					var dtEndTime=Date.fromFormat(obj.val());
					flag=dtEndTime>=dtStartTime;
					break;
					case"Depend":var depandObjs=$("[name="+obj.attr("dependName")+"]");
					for(var i=0;i<depandObjs.length;i++){
						var depandObj=$(depandObjs[i]);
						if(depandObj.is(":hidden")){
							continue
						}
						var dependFlag=Validator.validateObject($(depandObjs[i]),clientValid,true,dataTypeTag);
						if(!dependFlag){
							flag=false;
							break
						}
					}
					break;
					default:flag=this[dataType].test(obj.val().trim());
					break
				}
				if(!flag){
					break
				}
			}
			if(flag&&!clientValid&&!obj.attr("isValidateFaild")){
				var serverValidName=obj.attr("serverValid");
				if(serverValidName){
					var serverValidFlag=Validator.serverValidate(obj,serverValidName);
					if(!serverValidFlag){
						flag=serverValidFlag;
						serverMsg=true
					}
				}
			}
		}
		catch(e){
			$("<div class='comm_dialog_cont'>"+e+"</div>").dialog({
				title:"错误提示",modal:true,buttons:[{
					text:"确定","class":"comm_dialog_btn_save",click:function(){
						$(this).dialog("destroy")
					}
				}
				]
			})
		}
		if(flag){
			Validator.showSuccessMsg(obj);
			if(!isDepend&&obj.attr("name")){
				$("[dependName="+obj.attr("name")+"]").each(function(){
					Validator.clearState($(this),false)
				})
			}
		}
		else{
			Validator.showFaildMsg(obj,clientValid,serverMsg)
		}
		return flag
	}
	,clearState:function(b,d){
		if(!d){
			var a=b.attr("msgConId");
			if(!String.isNullOrWhiteSpace(a)){
				return
			}
		}
		var c=b.attr("id");
		$("div[id=__ServerMessagePanel][targetId="+c+"],div[id=__ErrorMessagePanel][targetId="+c+"],div[id=__RemindMessagePanel][targetId="+c+"],div[id=__AllRightMessagePanel][targetId="+c+"]").remove();
		b.removeAttr("isValidateFaild");
		b.removeAttr("markedSuccess");
		if(b.attr("dependName")){
			Validator.clearState($("[name="+b.attr("dependName")+"]"),d)
		}
	}
	,showFaildMsg:function(f,g,c){
		if(f.attr("isValidateFaild")){
			return
		}
		Validator.clearState(f,g);
		var d=f.attr("msgConId");
		var h=f.attr("id");
		var e=f.attr("msg");
		if(c&&f.attr("serverMsg")){
			e=f.attr("serverMsg")
		}
		var b=f.attr("useNewClass")!=undefined&&f.attr("useNewClass")=="true"?"error_nob":"error";
		var i=$("<div id='__ErrorMessagePanel' class='{0}'></div>".format(b));
		i.text(e);
		i.attr("targetId",f.attr("id"));
		if(d&&h){
			if(!c&&!g){
				return
			}
			var a=$("#"+d);
			if(a.length>0){
				$("div[id=__ErrorMessagePanel]").remove();
				a.append(i);
				a.show();
				return
			}
		}
		f.attr("isValidateFaild","true");
		f.parent().parent().append(i)
	}
	,showSuccessMsg:function(e){
		var b=e.attr("isNeedSuccessImg");
		if(b!=undefined&&typeof(b)=="string"&&b=="false"){
			return
		}
		if(e.attr("isValidateFaild")){
			return
		}
		if(e.attr("markedSuccess")){
			return
		}
		var d=e.attr("rig");
		if(String.isNullOrWhiteSpace(d)){
			return
		}
		e.attr("markedSuccess","true");
		var a=e.attr("msgConId");
		if(a){
			return
		}
		var f=e.attr("useNewClass")!=undefined&&e.attr("useNewClass")=="true"?"allright_nob":"allright";
		var c=$("<div id='__AllRightMessagePanel' class='{0}'/>".format(f));
		c.attr("targetId",e.attr("id"));
		e.parent().parent().append(c)
	}
	,showMsg:function(g,c,b){
		if(g&&g instanceof jQuery){}else{
			if(g&&typeof g=="string"){
				g=$("#"+g)
			}
			else{
				if(Object.isElement(g)){
					g=$(con)
				}
				else{
					return
				}
			}
		}
		Validator.clearState(g,true);
		var a=g.attr("msgConId");
		var f=g.attr("id");
		var d=$("<div id='__ServerMessagePanel' class='{0}'></div>".format(b?"right":"error"));
		d.text(c);
		d.attr("targetId",g.attr("id"));
		if(a&&f){
			var e=$("#"+a);
			if(e.length>0){
				$("div[id=__ServerMessagePanel][targetId="+f+"]").remove();
				e.append(d);
				e.show();
				return
			}
		}
		g.parent().parent().append(d)
	}
	,clearMsgCon:function(a){
		a.each(function(){
			var d=$(this);
			var b=d.attr("msgConId");
			var c=d.attr("id");
			if(b&&c){
				$("#"+b).hide();
				$("div[id=__ErrorMessagePanel][targetId="+c+"],div[id=__RemindMessagePanel][targetId="+c+"]").remove()
			}
		})
	}
	,scrollToError:function(){
		var a=$("#__ErrorMessagePanel");
		if(a.length==0){
			return
		}
		var b=a.offset();
		window.scrollTo(0,b.top-100)
	}
	,placeholder:function(){
		var e=$(this);
		var d=e.attr("placeholder");
		if(d.trim().length==0){
			return
		}
		var a=e.parent();
		a.removeClass("show-text,focus-text,hide-text");
		var c=a.find(".text-tips");
		if(c.length==0){
			var f=$('<label class="text-tips"></label>');
			f.text(d);
			f.insertBefore(e);
			f.click(function(){
				e.focus()
			})
		}
		var b=e.val();
		if(b.trim().length==0){
			if($("*:focus")==e){
				a.addClass("focus-text")
			}
			else{
				a.addClass("show-text")
			}
		}
		else{
			a.addClass("hide-text")
		}
		e.unbind("focus",Validator.holderFocus).bind("focus",Validator.holderFocus);
		e.unbind("keyup",Validator.holderFocus).bind("keyup",Validator.holderFocus);
		e.unbind("blur",Validator.holderBlur).bind("blur",Validator.holderBlur)
	}
	,holderFocus:function(){
		var c=$(this);
		var a=c.parent();
		a.removeClass("show-text");
		a.removeClass("focus-text");
		a.removeClass("hide-text");
		var b=c.val();
		if(b.trim().length==0){
			a.addClass("focus-text")
		}
		else{
			a.addClass("hide-text")
		}
	}
	,holderBlur:function(){
		var c=$(this);
		var a=c.parent();
		a.removeClass("show-text");
		a.removeClass("focus-text");
		a.removeClass("hide-text");
		var b=c.val();
		if(b.trim().length==0){
			a.addClass("show-text")
		}
		else{
			a.addClass("hide-text")
		}
	}
	,isIdCard:function(d){
		d=d.toUpperCase();
		var e={
			11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"
		};
		var f,b;
		var c,g;
		if(String.isNullOrEmpty(d)){
			return false
		}
		var a=new Array();
		a=d.split("");
		if(e[parseInt(d.substr(0,2))]==null){
			return false
		}
		if(d.length==18){
			if(parseInt(d.substr(6,4))%4==0||(parseInt(d.substr(6,4))%100==0&&parseInt(d.substr(6,4))%4==0)){
				ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9XxAa]$/
			}
			else{
				ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9XxAa]$/
			}
			if(ereg.test(d)){
				c=(parseInt(a[0])+parseInt(a[10]))*7+(parseInt(a[1])+parseInt(a[11]))*9+(parseInt(a[2])+parseInt(a[12]))*10+(parseInt(a[3])+parseInt(a[13]))*5+(parseInt(a[4])+parseInt(a[14]))*8+(parseInt(a[5])+parseInt(a[15]))*4+(parseInt(a[6])+parseInt(a[16]))*2+parseInt(a[7])*1+parseInt(a[8])*6+parseInt(a[9])*3;
				f=c%11;
				g="F";
				b="10X98765432";
				g=b.substr(f,1);
				if(g==a[17]){
					return true
				}
				else{
					if(a[17]=="A"){
						return true
					}
					else{
						return false
					}
				}
			}
			else{
				return false
			}
		}
		else{
			return false
		}
	}
	,limit:function(b,c,a){
		c=c||0;
		a=a||Number.MAX_VALUE;
		return c<=b&&b<=a
	}
	,limitNum:function(c,d,a){
		d=d||0;
		a=a||Number.MAX_VALUE;
		var b="^[0-9]{"+d+","+a+"}$";
		return new RegExp(b,"i").test(c)
	}
	,lenB:function(a){
		return a.replace(/[^\x00-\xff]/g,"**").length
	}
	,exec:function(b,a){
		return new RegExp(a,"g").test(b)
	}
	,compare:function(c,a,b){
		c=parseFloat(c);
		b=parseFloat(b);
		if(isNaN(c)){
			c=1
		}
		switch(a){
			case"NotEqual":return(c!=b);
			case"GreaterThan":return(c>b);
			case"GreaterThanEqual":return(c>=b);
			case"LessThan":return(c<b);
			case"LessThanEqual":return(c<=b);
			default:return(c==b)
		}
	}
	,mustChecked:function(d,f,b){
		var a=document.getElementsByName(d);
		var c=0;
		f=f||1;
		b=b||a.length;
		for(var e=a.length-1;e>=0;e--){
			if(a[e].checked){
				c++
			}
		}
		return f<=c&&c<=b
	}
	,doFilter:function(a,b){
		return new RegExp("^.+.(?=EXT)(EXT)$".replace(/EXT/g,b.split(/\s*,\s*/).join("|")),"gi").test(a)
	}
	,isDate:function(g,f,d){
		d=d||"ymd";
		var c,i,h,j;
		switch(d){
			case"dmy":c=g.match(new RegExp("^(\\d{1,2})([-./])(\\d{1,2})\\2((\\d{4})|(\\d{2}))$"));
			if(c==null){
				return false
			}
			j=c[1];
			h=c[3]*1;
			i=(c[5].length==4)?c[5]:(parseInt(c[6],10)+1900);
			break;
			default:c=g.match(new RegExp("^((\\d{4})|(\\d{2}))([-./])(\\d{1,2})\\4(\\d{1,2})$"));
			if(c==null){
				return false
			}
			j=c[6];
			h=c[5]*1;
			i=(c[2].length==4)?c[2]:(parseInt(c[3],10)+1900);
			break
		}
		if(!parseInt(h)){
			return false
		}
		h=h==0?12:h;
		var b=new Date(i,h-1,j);
		var a=(typeof(b)=="object"&&i==b.getFullYear()&&h==(b.getMonth()+1)&&j==b.getDate());
		if(a&&!String.isNullOrWhiteSpace(f)){
			var e=Date.fromFormat(f);
			a=e<=b
		}
		return a
	}
	,serverValidate:function(c,a){
		switch(a){
			case"UniqueMobile":var b=$.postJsonSync("/Member/Index/chkMobile",{
				mobile:c.val()
			});
			return b.resultCode!=1||!b.data;
			case"UniqueEmail":var b=$.postJsonSync("/Member/Index/chkEmail",{
				email:c.val()
			});
			return b.resultCode!=1||!b.data;
			case"UniqueAccount":var b=$.postJsonSync("/Member/Index/chkAccount",{
				loginCode:c.val()
			});
			return b.resultCode!=1||!b.data;
			case"UniqueIdCard":var b=$.postJsonSync("/Member/Index/chkCard",{
				idCard:c.val()
			});
			return b.resultCode!=1||!b.data;
			case"smsvc":var b=$.postJsonSync("/Member/Index/checksmsvc",{
				mobile:$("[name="+c.attr("dependName")+"]").val(),vcString:c.val()
			});
			return b.resultCode==1&&b.data;
			case"UniqueLinkMobile":var b=$.postJsonSync("/isexistlinkmobile.htm",{
				linkMobile:c.val()
			});
			return b.resultCode!=1||!b.data;
			default:break
		}
		return true
	}
};
$(Validator.bind);