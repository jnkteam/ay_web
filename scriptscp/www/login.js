var LoginJS={
	loggedHandler:null,isLogged:false,isRealMobile:false,isRealEmail:false,isRealName:false,init:function(a){
		$(".login_cont img,.qlogin_cont img,.zymcgtxt a").click(LoginJS.changeVC);
		$(".loginbtn input,.loginbtn a, .loginbtn input").click(LoginJS.doLogin);
		LoginJS.bindEnter();
		LoginJS.bindParams(a)
	}
	,bindParams:function(a){
		if(a){
			LoginJS.isLogged=a.isLogged;
			LoginJS.isRealMobile=a.isRealMobile;
			LoginJS.isRealEmail=a.isRealEmail;
			LoginJS.isRealName=a.isRealName
		}
	}
	,bindEnter:function(){
		$("#txtLoginCode,#txtPassword,#txtVerifyCode").unbind("keydown",LoginJS.keyDownHandler).bind("keydown",LoginJS.keyDownHandler)
	}
	,keyDownHandler:function(a){
		if(a.keyCode==13){
			a.preventDefault();
			LoginJS.doLogin()
		}
	}
	,doLogin:function(){
		if(!Validator.validateForm($(".mpay-left,.login_cont,.qlogin_cont"))){
			return
		}
		var b=$("#txtLoginCode").val();
		var d=$("#txtPassword").val();
		var c=$("#txtVerifyCode").val();
		//var a=new RSAKey();
		//a.setPublic(RSAPublicKey,"10001");
		//d=a.encrypt(d);
		jQuery.post("/Member/Index/dologin.htm",{
			loginCode:b,password:d,vc:c
		}
		,function(h){
			if(h.resultCode==1){
				$(".quick_login").dialog("destroy");
				if(LoginJS.loggedHandler&&$.isFunction(LoginJS.loggedHandler)){
					LoginJS.refreshUserInfo();
					LoginJS.loggedHandler();
					return
				}
				var f=$.getQueryString("tourl");
				if(f==null||f.length==0){
					f="/Member/userintegrity.html"
				}
				return $.doUrlRedirt(f)
			}
			else{
				$("#txtPassword").val("");
				var g=$("#txtVerifyCode");
				if(h.data&&g.length==0){
					var e;
					if($(".quick_login").length>0){
						e=$(OriginalStringJS.loginVerifyCode.format(new Date().getTime()));
						e.insertBefore($(".loginbtn").parents(".item"))
					}
					else{
						e=$(OriginalStringJS.newLoginVerifyCode.format(new Date().getTime()));
						e.insertBefore($(".loginbtn"))
					}
					$(".zymcgtxt a").click(LoginJS.changeVC);
					Validator.bind();
					LoginJS.bindEnter();
					e.find("img").click(LoginJS.changeVC)
				}
				else{
					$("#txtVerifyCode").val("");
					LoginJS.changeVC()
				}
				Validator.showMsg($("#txtLoginCode"),h.resultMsg)
			}
		},'json')
	}
	,changeVC:function(){
		$(".login_cont img,.qlogin_cont img").attr("src","/Api/Checkcode/index?t="+new Date().getTime());
		return false
	}
	,showLoginPanel:function(){
		var a=$.postJsonSync("/Member/Index/isneedvc.htm",{});
		var b=OriginalStringJS.loginPanelHtml.format(a.data?OriginalStringJS.loginVerifyCode.format(new Date().getTime()):"");
		$(b).dialog({
			title:"用户登录",modal:true,width:480
		});
		Validator.bind($(".quick_login"));
		LoginJS.init()
	}
	,refreshUserInfo:function(){
		var a=$.postJsonSync("/getloginuserinfo.htm",{});
		LoginJS.isLogged=a.resultCode==1;
		LoginJS.isRealMobile=LoginJS.isLogged&&a.data.isRealMobile;
		LoginJS.isRealEmail=LoginJS.isLogged&&a.data.isRealEmail;
		LoginJS.isRealName=LoginJS.isLogged&&a.data.isRealName
	}
};