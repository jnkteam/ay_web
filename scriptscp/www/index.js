var IndexJS={
	adCount:0,adIndex:0,adTimer:0,init:function(b){
		$(".index_detail").height($(document.body).height()+50);
		LoginJS.init();
		$("#aRent").click(function(){
			return $.doUrlRedirt(b&&b.isLogined?"/payrent/rentprofile.htm":"/payrent/?from_page=index")
		});
		$("#aCharge").click(function(){
			return $.doUrlRedirt(b&&b.isLogined?"/chargerent/rentprofile.htm":"/chargerent/?from_page=index")
		});
		var a=$("#ulAd li");
		IndexJS.adCount=a.length;
		IndexJS.playAd();
		$(".webcontent .qh").click(function(){
			var c=$(".webcontent .qh").index($(this));
			window.clearInterval(IndexJS.adTimer);
			IndexJS.adIndex=c-1;
			IndexJS.changeAd();
			IndexJS.playAd()
		});
		a.hover(function(){
			window.clearInterval(IndexJS.adTimer)
		}
		,function(){
			IndexJS.playAd()
		});
		new $.ScrollUlList($(".webtop ul"));
		$(".web_product .productmiddle").hover(function(){
			$(this).addClass("hover")
		}
		,function(){
			$(this).removeClass("hover")
		})
	}
	,playAd:function(){
		IndexJS.adTimer=window.setInterval(IndexJS.changeAd,6000)
	}
	,changeAd:function(){
		IndexJS.adIndex++;
		IndexJS.adIndex=IndexJS.adIndex%IndexJS.adCount;
		$(".webcontent .qh").removeClass("changebtn-on").eq(IndexJS.adIndex).addClass("changebtn-on").blur();
		if($.browser.msie&&($.browser.version=="6.0")&&!$.support.style){
			$("#ulAd li").hide().eq(IndexJS.adIndex).show()
		}
		else{
			$("#ulAd li").hide().eq(IndexJS.adIndex).fadeIn("slow")
		}
	}
};
var LeaveMsgJs={
	init:function(){
		$(".me_box textarea").bind("keyup",LeaveMsgJs.checkLen).bind("change",LeaveMsgJs.checkLen);
		$(".me_box .btn input[type=button]").bind("click",LeaveMsgJs.doSubmit)
	}
	,checkLen:function(){
		var a=$(".me_box textarea").val();
		$(".me_box p strong").text(" "+(1000-a.length)+" ")
	}
	,doSubmit:function(){
		if(LeaveMsgJs.doSubmiting){
			return
		}
		if(!Validator.validateForm()){
			return
		}
		var c="";
		if($("#txtUserInfo").is(":visible")){
			c=$("#txtUserInfo").val().trim();
			if(!Validator.MPhone.test(c)&&!Validator.Email.test(c)){
				Validator.showMsg($(".me_box textarea"),"请输入您正确的电话或邮箱");
				return
			}
		}
		var b=$(".me_box textarea").val();
		var a=$("#txtUserName").val();
		if(b.trim().length<6){
			Validator.showMsg($(".me_box textarea"),"您的意见太短了^_^");
			return
		}
		if(b.length>1000){
			Validator.showMsg($(".me_box textarea"),"反馈内容字数请控制在1000以内");
			return
		}
		LeaveMsgJs.doSubmiting=true;
		$.post("/leavemessage/submitleavemsg.html",{
			userName:a,userInfo:c,msg:b
		}
		,function(d){
			LeaveMsgJs.doSubmiting=false;
			if(d.resultCode==1){
				$.showMsgBox("感谢您提供的宝贵意见，我们将尽快答复！",function(){
					$(".me_box textarea").val("").change();
					$("#txtUserName").val("");
					$("#txtUserInfo").val("");
					if($("#txtUserName:visible").length>0){
						return $.reloadUrl()
					}
					else{
						$(this).dialog("destroy")
					}
				})
			}
			else{
				$.showMsgBox(d.resultMsg)
			}
		},'json')
	}
};
var Help={
	init:function(){
		var a=$(".help_title dl");
		a.find("dt").click(function(){
			a.removeClass("activeitem").addClass("citem");
			$(this).parent("dl").removeClass("citem").addClass("activeitem")
		})
	}
};
var LinksJS={
	init:function(){
		$("input[type=button]").each(function(){
			var a=$(this);
			var b=new ZeroClipboard(a,{
				moviePath:Config.ScriptHomeSite+"/zeroclipboard/zeroclipboard.swf",trustedDomains:"*",allowScriptAccess:"always"
			});
			b.on("noflash",function(c){
				a.unbind("click").bind("click",function(){
					$.setClipboard($("#"+a.attr("data-clipboard-target")).val())
				})
			});
			b.on("complete",function(c,d){
				$.showMsgBox("复制成功!")
			})
		})
	}
};