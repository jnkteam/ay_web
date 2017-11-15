/**
 * 首页登录js
 */
$(function() {	
	//删除登录框中的账号
	var delLoginName = function(id) {
		$("#" + id).val("");
		$("#" + id).removeClass("gray");
	};

	$("#delCorpLoginName").click(function() {
		delLoginName("ctl00_ContentPlaceHolder1_txtloginName");
		$.login.cookie.del("ctl00_ContentPlaceHolder1_txtloginName");
	});
	
	//点击登录框中任意一个输入框去掉报销信息	
	$("#corp_loginForm input").click(function(){
		$("#ctl00_ContentPlaceHolder1_corp_errtipDiv").fadeOut();
});
			
	$(".ico_close").click(function(){
		$(".error").fadeOut();
	});
});

//商户登录面板
$(function() {
    $("#ctl00_ContentPlaceHolder1_txtpassWord").val("");
    var t = "请输入您的账号";
    $("#ctl00_ContentPlaceHolder1_txtloginName").focus(function() {
        if ($(this).val() == t) {
            $(this).val("");
            $(this).removeClass("gray");
        }
    }).blur(function() {
        if ($(this).val() != t && $(this).val() == "") {
            $(this).val(t);
            $(this).addClass("gray");
        }
    });

    $("#aspnetForm").submit(function() {
        var ln = $("#ctl00_ContentPlaceHolder1_txtloginName");
        if (ln.val() == t || ln.val() == "") {
            $("#ctl00_ContentPlaceHolder1_corp_errtipDiv").show();
            $("#ctl00_ContentPlaceHolder1_corp_errtips").html("商户账号不能为空");
            return false;
        }
        var pwd = $("#ctl00_ContentPlaceHolder1_txtpassWord");
        if (pwd.val() == "") {
            $("#ctl00_ContentPlaceHolder1_corp_errtipDiv").show();
            $("#ctl00_ContentPlaceHolder1_corp_errtips").html("密码不能为空");
            return false;
        }
        var code = $("#ctl00_ContentPlaceHolder1_txtcode");
        if (code.val() == "") {
            $("#ctl00_ContentPlaceHolder1_corp_errtips").html("验证码不能为空");
            $("#ctl00_ContentPlaceHolder1_corp_errtipDiv").show();
            return false;
        }       
        //cookie 保存loginName
        $.login.cookie.set("ctl00_ContentPlaceHolder1_txtloginName", ln.val());
    });

    $("#corp_loginbtn").click(function() {
        $("#aspnetForm").submit();
    });

    $("#code").click(function() {
        var d = new Date();
        var src = "/code.aspx?date=" + d.getTime();
        $("#code").attr("src", src);
        return false;
    });

    if ($("#corp_rand_Code").length > 0) {
        $("#corp_rand_Code").keypress(function(e) {
            if (e.which == 13) {
                $("#corp_loginForm").submit();
            }
        });
    }

    $("#corp_passWord").keypress(function(e) {
        if (e.which == 13) {
            $("#corp_loginForm").submit();
        }
    });

    //cookie 取loginName
    var c_ln = $.login.cookie.get("ctl00_ContentPlaceHolder1_txtloginName");
    if (!!c_ln && c_ln.length > 0) {
        $("#ctl00_ContentPlaceHolder1_txtloginName").val(c_ln);
        $("#ctl00_ContentPlaceHolder1_txtloginName").removeClass("gray");
    }
});
