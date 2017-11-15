$(function() {
    $.formValidator.initConfig({ formid: "Registerform", onerror: function(msg, obj) { } });
    $("input").blur(function() {
        $(this).val($(this).val().trim());

    });
    var loginNameErrorMsg = "该用户名不可用，请更换用户名";
    $("#newusername").formValidator({ tipid: "newusernameTip", onshow: "请输入帐户名", onfocus: "帐户长度为6-18字符", oncorrect: "该帐户名可以注册" }).inputValidator({ min: 6, max: 18, onError: "请输入正确的帐户名" }).regexValidator({ regexp: "username", datatype: "enum", onerror: "帐户名格式不正确" })
	    .ajaxValidator({
	        type: "get",
	        url: "/WebService/verifyuname.ashx?action=jc&censor=1&login_name=" + $("#newusername").val() + "&t=" + Math.random(),
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

    var type = $("#hfregtype").val();
    if (type == "1") {
        $("#newfullname").formValidator({ tipid: "newfullnameTip", onshow: "填入真实的名字", onfocus: "填入真实的姓名将利于您个人信息的找回", oncorrect: " " })
				.inputValidator({ min: 2, empty: false, onerror: "真实姓名至少两个字，且不能为空" })
				.regexValidator({ regexp: "nocharacters", datatype: "enum", onerror: "真实姓名包含非法字符，请重新输入" });
        $("#l_company").hide();
    }
    else {
        $("#l_fullname").hide();
        $("#companyName").formValidator({ tipid: "companyNameTip", onshow: "填入真实的企业名称", onfocus: "填入真实的企业名称将利于您个人信息的找回", oncorrect: " " })
				.inputValidator({ min: 2, empty: false, onerror: "企业名称至少两个字，且不能为空" })
				.regexValidator({ regexp: "nocharacters", datatype: "enum", onerror: "企业名称包含非法字符，请重新输入" });
    }


    $("#password1").formValidator({ tipid: "password1Tip", onshow: "8-20个字符，建议使用数字和字母组合密码，以便于您的账户安全。", onfocus: "8-20个字符，建议使用数字和字母组合密码，以便于您的账户安全。", oncorrect: " " })
    		.inputValidator({ min: 8, max: 20, empty: false, onerror: "登录密码只支持8-20位字母，及与数字或字符的组合" })

    $("#password2").formValidator({ tipid: "password2Tip", onshow: "两次填写的密码必须一致", onfocus: "两次填写的密码必须一致", oncorrect: " " })
    		.inputValidator({ min: 8, max: 20, empty: false, onerror: "确认登录密码和登录密码必须一致，且不能为空" })
    		.compareValidator({ desid: "password1", operateor: "=", onerror: "两次密码不一致,请确认" });

    $("#question").formValidator({ tipid: "questionTip", onshow: "安全保护问题可用于找回登录密码等", onfocus: "安全保护问题可用于找回登录密码等", oncorrect: " " })
    .inputValidator({ min: 1, empty: false, onerror: "请选择安全保护问题" });

    $("#txtanswer").formValidator({ tipid: "txtanswerTip", onshow: "由2-32个字符组成", onfocus: "由2-32个字符组成", oncorrect: " " })
     		    .inputValidator({ min: 2, max: 32, empty: false, onerror: "答案由2-32个字符组成且不能为空" })
     		    .regexValidator({ regexp: "nocharacters", datatype: "enum", onerror: "不能包含非法字符\"<\",\">\"" });

    $("#newemail").formValidator({ tipid: "newemailTip", onshow: "Email是您找回个人信息的主要途径之一", onfocus: "Email是您找回个人信息的主要途径之一", oncorrect: "该电子邮箱可使用" })
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

		   //$("#agree").formValidator({ tipid: "agreeTip", onshow: "", onfocus: " ", oncorrect: " " }).inputValidator({ min: 1, max: 20, empty: false, onerror: "您未接受安银用户注册协议 不能注册!" });

    //$(":checkbox[name='agree']").formValidator({ tipid: "agreeTip", onshow: "", onfocus: "&nbsp;", oncorrect: "&nbsp;" }).inputValidator({ min: 1, onerror: "&nbsp;" });
});