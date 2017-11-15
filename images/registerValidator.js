
var regtoactive=function(l){
	var ln;
	
	if(l==1){
		ln=$("#mobileLoginName").val();
		
	}else{
		ln=$("#emailLoginName").val();
	}
	window.location.href="logout.htm?method=out&mtype=1&ln="+ln;

}

var regtoactiveTemp=function(){
	var ln=$("#mobileLoginName").val();
	window.location.href="toActiveMember.htm?loginName="+ln;
}

var regtoactiveTemp2=function(){
	var ln=$("#emailLoginName").val();
	window.location.href="toActiveMember.htm?loginName="+ln;
}

$(function() {
    $.formValidator.initConfig({ formid: "aspform", onerror: function(msg, obj) { } });

    $("input").blur(function() {
        $(this).val($(this).val().trim());

    });

    $(":password").keyup(function() {
        $(this).val(ignoreSpaces($(this).val()));
    });

    /*
    var max = $('input[maxlength]');
    //对超出长度的字符不再允许key入
    max.keypress(function(e)
    {
    var len = $(this).attr('maxlength');
    if (len > 0 && len <= this.value.getBytes()) {
    this.value = this.value.substring(0, 8);
    }
    })
    //对其他方式输入【如中文输入法输入或键盘的ctrl+v】的长度进行截断
    max.keyup(function()
    {
    var len = $(this).attr('maxlength');
    if (len > 0 && len < this.value.getBytes()) {
    this.value = this.value.substring(0, 8);
    }
    })
    //对粘贴时的长度进行截断，粘贴事件发生后，文本才真正被粘贴到目标控件上，所以这里稍微处理了一下
    max.bind('paste',function()
    {
    window.setTimeout('$(\'#' + this.id + '\').trigger(\'keyup\')', 10)
    })*/



    var loginNameErrorMsg = "该用户名不可用，请更换用户名";


    $("#mobileLoginName").formValidator({ tipid: "mobileLoginNameTip", onshow: "请输入帐户名", onfocus: "帐户长度为6-18字符", oncorrect: "该帐户名可以注册" }).inputValidator({ min: 6, max: 18, onError: "请输入正确的帐户名" }).regexValidator({ regexp: "username", datatype: "enum", onerror: "帐户名格式不正确" })
	    .ajaxValidator({
	        type: "get",
	        url: "/WebService/verifyuname.ashx?action=jc&censor=1&login_name=" + $("#mobileLoginName").val() + "&t=" + Math.random(),
	        datatype: "html",
	        async: true,
	        success: function(data) {
	            if (data.indexOf("True") == 0) return true;
	            if (data.indexOf("False") == 0) return false;
	            return false;
	        },
	        buttons: $("[name$='regsubmit']"),
	        error: function(jqXHR, textStatus, errorThrown) { alert("服务器繁忙,请重试！" + errorThrown); },
	        onerror: "该帐户名已被注册",
	        onwait: "校验帐户名,请稍候.."
	    });

    //    $("#mobileLoginName").formValidator({ tipid: "mobileLoginNameTip", onshow: "帐户长度为6-18字符", onfocus: "帐户长度为6-18字符", oncorrect: "该帐户名已被注册" })
    //    				.inputValidator({ min: 1, empty: false, onerror: "帐户长度不能为空,请确认" })
    //			 	  .regexValidator({ regexp: "mobile", datatype: "enum", onerror: "帐户长度为6-18字符" })
    //			 	  .ajaxValidator({
    //			 	      type: "get",
    //			 	      url: "register.htm?method=checkStatusLoginName&regType=1",
    //			 	      datatype: "json",
    //			 	      success: function(data) {
    //			 	          if (data < 0) {
    //			 	              return true;
    //			 	          } else if (data == 0) {
    //			 	              loginNameErrorMsg = "您输入的手机号已经被注册尚未激活，请<a class='reds ml10' href=\"javascript:void(0);\" onclick=\"regtoactive(1);return false;\">立即激活</a>";
    //			 	              return false;
    //			 	          } else if (data == 5) {
    //			 	              loginNameErrorMsg = "您输入的手机号已经被注册尚未激活，请<a class='reds ml10' href=\"javascript:void(0);\" onclick=\"regtoactiveTemp();return false;\">立即激活</a>";
    //			 	              return false;
    //			 	          } else {
    //			 	              loginNameErrorMsg = "该用户名不可用，请更换用户名";
    //			 	              return false;
    //			 	          }
    //			 	      },
    //			 	      buttons: $("#btnSubmit"),
    //			 	      error: function() { alert("服务器没有返回数据，可能服务器忙，请重试"); },
    //			 	      onerror: "该用户名不可用，请更换用户名",
    //			 	      onerrorResult: function() { return loginNameErrorMsg },
    //			 	      onwait: "正在对用户名进行合法性校验，请稍候..."
    //			 	  });


    $("#emailLoginName").formValidator({ tipid: "emailLoginNameTip", onshow: "Email是您找回个人信息的主要途径之一", onfocus: "Email是您找回个人信息的主要途径之一", oncorrect: "该电子邮箱可使用" })
		   .inputValidator({ min: 1, empty: false, onerror: "Email不能为空,请确认" })
		   .regexValidator({ regexp: "email", datatype: "enum", onerror: "Email格式不正确" })
		   .ajaxValidator({
		       type: "get",
		       url: "/webservice/verifyuname.ashx?method=checkStatusLoginName&regType=2&math=" + Math.random(),
		       datatype: "json",
		       success: function(data) {
		           if (data < 0) {
		               return true;
		           } else if (data == 0) {
		               loginNameErrorMsg = "您输入的E-mail已经被注册尚未激活，请&nbsp;<a href=\"javascript:void(0);\" onclick=\"regtoactive(2);return false;\">立即激活</a>";
		               return false;
		           } else if (data == 5) {
		               loginNameErrorMsg = "您输入的E-mail已经被注册尚未激活，请<a class='reds ml10' href=\"javascript:void(0);\" onclick=\"regtoactiveTemp2();return false;\">立即激活</a>";
		               return false;
		           } else {
		               loginNameErrorMsg = "该用户名不可用，请更换用户名";
		               return false;
		           }
		       },
		       buttons: $("#btnSubmit"),
		       error: function() { alert("服务器没有返回数据，可能服务器忙，请重试"); },
		       onerror: "该用户名不可用，请更换用户名",
		       onerrorResult: function() { return loginNameErrorMsg },
		       onwait: "正在对用户名进行合法性校验，请稍候..."
		   });

    $("#realName").formValidator({ tipid: "realNameTip", onshow: "填入真实的姓名将利于您个人信息的找回及新生支付活动的奖品领取", onfocus: "填入真实的姓名将利于您个人信息的找回及新生支付活动的奖品领取", oncorrect: " " })
    				.inputValidator({ min: 2, empty: false, onerror: "真实姓名至少两个字，且不能为空" })
    				.regexValidator({ regexp: "nocharacters", datatype: "enum", onerror: "真实姓名包含非法字符，请重新输入" });
    if (!hasSecurityCtrl()) {
        $("#password").formValidator({ tipid: "passwordTip", onshow: "8-20个字符，建议使用数字和字母组合密码，以便于您的账户安全。", onfocus: "8-20个字符，建议使用数字和字母组合密码，以便于您的账户安全。", oncorrect: " " })
    		.inputValidator({ min: 8, max: 20, empty: false, onerror: "登录密码只支持8-20位字母，及与数字或字符的组合" })
        //.regexValidator({regexp:"loginpassword",datatype:"enum",onerror:"密码只支持8-20位字母加数字且至少要包含一个字符"})
    		.functionValidator({ fun: isLoginPassword });

        $("#passwordConfirm").formValidator({ tipid: "passwordConfirmTip", onshow: "两次填写的密码必须一致", onfocus: "两次填写的密码必须一致", oncorrect: " " })
    		.inputValidator({ min: 8, max: 20, empty: false, onerror: "确认登录密码和登录密码必须一致，且不能为空" })
    		.compareValidator({ desid: "password", operateor: "=", onerror: "两次密码不一致,请确认" });
    } else {
        $("#password").formValidator({ tipid: "passwordTip", onshow: "8-20个字符，建议使用数字和字母组合密码，以便于您的账户安全。", onfocus: "8-20个字符，建议使用数字和字母组合密码，以便于您的账户安全。", oncorrect: "&nbsp;" });

        $("#passwordConfirm").formValidator({ tipid: "passwordConfirmTip", onshow: "请再次输入您的登录密码", onfocus: "两次填写的密码必须一致", oncorrect: "&nbsp;" });
    }

    $("#contact").formValidator({ tipid: "contactTip", onshow: "Email是您找回个人信息的主要途径之一", empty: true, onfocus: "Email是您找回个人信息的主要途径之一", oncorrect: " " })
	   .regexValidator({ regexp: "email", datatype: "enum", onerror: "Email格式不正确" });




    $("#securityQuestion").formValidator({ tipid: "securityQuestionTip", onshow: "安全保护问题可用于找回登录密码等", onfocus: "安全保护问题可用于找回登录密码等", oncorrect: " " })
    .inputValidator({ min: 1, empty: false, onerror: "请选择安全保护问题" });

    $("#securityQuestion").change(function() {
        $("#securityAnswer").formValidator({ tipid: "securityAnswerTip", onshow: "由2-32个字符组成", onfocus: "由2-32个字符组成", oncorrect: " " })
     		    .inputValidator({ min: 2, max: 32, empty: false, onerror: "答案由2-32个字符组成且不能为空" })
     		    .regexValidator({ regexp: "nocharacters", datatype: "enum", onerror: "不能包含非法字符\"<\",\">\"" });

    });


    $("#greeting").formValidator({ tipid: "greetingTip", empty: true, onshow: "最多25个汉字，50个字符", onfocus: "最多25个汉字，50个字符", oncorrect: " " })
    .inputValidator({ max: 50, onerror: "最多25个汉字，50个字符" })
    .regexValidator({ regexp: "nocharacters", datatype: "enum", onerror: "登录后问候语不能包含非法字符\"<\",\">\"" });

    $("#certificateNo").formValidator(
            { tipid: "certificateNoTip",
                onshow: "请填写真实的证件号码可以为空。身份证号码是15位或18位",
                onfocus: "请填写真实的证件号码。身份证号码是15位或18位",
                empty: true,
                oncorrect: " "
            }).
            inputValidator({ min: 1, onerror: "请输入身份证号码!" }).
            functionValidator({ fun: isCardID });

    if ($("#certificateTypeHid").val() != 1) {
        $("#certificateNo").unFormValidator(true);
    }

    $("#certificateType").change(function() {

        if ($(this).val() == '1') {
            $("#certificateNoTip").show();
            $("#certificateNo").formValidator(
		                { tipid: "certificateNoTip",
		                    onshow: "请填写真实的证件号码可以为空。身份证号码是15位或18位",
		                    onfocus: "请填写真实的证件号码。身份证号码是15位或18位",
		                    empty: true,
		                    oncorrect: "输入正确"
		                }).
		                inputValidator({ min: 1, onerror: "请输入身份证号码!" }).
		                functionValidator({ fun: isCardID });

        } else {
            $("#certificateNo").unFormValidator(true);
        }
    });

    $("#tel").formValidator({ tipid: "telTip", empty: true, onshow: "请填写您的真实号码，方便今后客服与您联系", onfocus: "固定电话格式:021-61757203", oncorrect: "电话号码合法" })
  .regexValidator({ regexp: "tel", datatype: "enum", onerror: "电话号码格式不正确" });

    $("#fax").formValidator({ tipid: "faxTip", empty: true, onshow: "请填写您的真实传真号码，方便今后客服与您联系", onfocus: "传真格式:021-61757203", oncorrect: "传真合法" })
.regexValidator({ regexp: "tel", datatype: "enum", onerror: "传真号码格式不正确" });

    $("#qq").formValidator({ tipid: "qqTip", empty: true, onshow: "请填写您的真实QQ，方便今后客服与您联系，可以为空", onfocus: "如要填写请填写正确", oncorrect: " " })
	.regexValidator({ regexp: "qq", datatype: "enum", onerror: "QQ只能为数字" });

    $("#msn").formValidator({ tipid: "msnTip", empty: true, onshow: "请填写您的真实MSN，方便今后客服与您联系，可以为空", onfocus: "如要填写请填写正确", oncorrect: " " })
	.regexValidator({ regexp: "email", datatype: "enum", onerror: "MSN格式不正确与Email格式相同" });

    $("#address").formValidator({ tipid: "addressTip", empty: true, onshow: "请填写您的真实地址，最多输入32个汉字或64位字符", onfocus: "请填写你能收到礼品的地址", oncorrect: " " })
.inputValidator({ max: 64, onerror: "最多32个汉字，64位字符" })
.regexValidator({ regexp: "nocharacters", datatype: "enum", onerror: "不能输入非法字符\"<\",\">\"" });

    $("#zip").formValidator({ tipid: "zipTip", empty: true, onshow: "请填写您的真实邮编，方便投递，可以为空", onfocus: "如要填写请填写正确", oncorrect: " " })
	.regexValidator({ regexp: "zipcode", datatype: "enum", onerror: "邮编格式不正确，只能为6位数字" });

    $("#randCode").formValidator({ tipid: "randCodeTip", onshow: "请输入图中4位字符", onfocus: "请填写验证码", oncorrect: " " })
	.inputValidator({ min: 5, max: 5, empty: false, onerror: "请输入图中4位字符" });


    $("#refush").click(function() {
        var d = new Date();
        var src = "/code.aspx?date=" + d.getTime();
        $("#code").attr("src", src);
        return false;
    });

    $("#btnSubmit").click(function() {
        if (hasSecurityCtrl()) {
            if (getPwdCtrlStrLength("HnSafeEdit") == 0) {
                $.pay.alert("登录密码不能为空!");
                return false;
            }
            if (getPwdCtrlStrLength("HnSafeEdit1") == 0) {
                $.pay.alert("确认登录密码不能为空!");
                return false;
            }

            $("#password").val(getPwdCtrlVal("HnSafeEdit"));
            $("#passwordConfirm").val(getPwdCtrlVal("HnSafeEdit1"));
        }        
        //$("#btnSubmitServer").click();
        
    });

    $("#chk").click(function() {
        if (this.checked) {
            $("#spansub").show();
            $("#spansub1").show();
        } else {
            $("#spansub").hide();
            $("#spansub1").hide();
        }
    });



    $(":radio[name='regType']").click(function() {
        var rv = $(this).val();
        $("#emailLoginName").val("");
        $("#mobileLoginName").val("");
        $("#contact").val("");
        //alert("ttestet");
        if (rv == 2) {
            $("#loginMobile-li").hide();
            $("#loginEmail-li").show();
            $("#emailLoginName").unFormValidator(false);
            $("#emailLoginName").focus();
            // $("#mobileLoginName").unFormValidator(true);
            $("#contact-em").html("联系方式（手机号码）：");
            $("#contact").formValidator({ tipid: "contactTip", onshow: "请填写您的真实号码，找回个人信息的途径", empty: true, onfocus: "联系方式可以为空", oncorrect: " " })
	 	  		.regexValidator({ regexp: "mobile", datatype: "enum", onerror: "手机号码格式不正确且必须为11位数字" });

        } else {
            $("#loginMobile-li").show();
            $("#loginEmail-li").hide();
            $("#emailLoginName").unFormValidator(true);
            $("#mobileLoginName").unFormValidator(false);
            $("#mobileLoginName").focus();
            $("#contact-em").html("联系方式（E-mail）：");
            $("#contact").formValidator({ tipid: "contactTip", onshow: "Email是您找回个人信息的主要途径之一", empty: true, onfocus: "联系方式可以为空", oncorrect: " " })
    		   .regexValidator({ regexp: "email", datatype: "enum", onerror: "Email格式不正确" });

        }
    });


    $("#form_basic").click(function() {
        var ba = $("#form_basic").next();

        if ($(ba).css("display") == "none") {
            $(ba).show();
        } else {
            $(ba).hide();
        }
    });


    $("#password").pstrength();

    var province = $("#pv").attr("value");
    var city = $("#cy").attr("value");

    $("#province").load("province.htm?defaultProvince=" + province);
    if (province != '' && city != '') {
        $("#city").load("province.htm?method=city&provinceId=" + province + "&defaultCity=" + city);
    }

    $("#province").change(function() {
        $("#city").load("province.htm?method=city&provinceId=" + $(this).val() + "&defaultCity=" + city);
    });

    //$("#mobileLoginName").val("");
    //$("#emailLoginName").val("");
    $("#contact").val("");
});


function init(){
	   if($("#loginMobile-li").attr("class")!="hide")
	   			$("#mobileLoginName").blur();
	   else if($("#loginEmail-li").attr("class")!="hide")
		   $("#emailLoginName").blur();
	   }