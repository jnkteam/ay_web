/*
$(function(){
	var timer;
	var width;
	var num;
	
	width = 900;
	num = $(".scroll .bank ul li").length;
	$(".scroll .bank ul").css('width',width*num);
	timer = setInterval(player,4000);
	//鼠标移动到图片上时停止滚动，移开则继续滚动
	$(".scroll").hover(
		function(){
			clearInterval(timer);
		},
		function(){
			timer = setInterval(player,4000);
		}
	);
	$(".scroll .btn_prev").click(function(){
		$(".scroll .bank ul").find('li:last').prependTo($(".scroll .bank ul"));
		$(".scroll .bank ul").css('left','-'+width+'px');
		$(".scroll .bank ul").animate({left:'0px'},'normal');	
	});
	$(".scroll .btn_next").click(function(){
		$(".scroll .bank ul").animate({left:'-'+width+'px'},'normal',function(){
			$(".scroll .bank ul").css('left','0px');
			$(".scroll .bank ul").find('li:first').appendTo($(".scroll .bank ul"));
		});	
	});
	
	//播放函数
	function player(){
		$obj = $(".scroll .bank ul");
		$obj.animate({left:'-'+width+'px'},'slow',function(){
			$obj.css('left','0px').find('li:first').appendTo($obj);	
		});	
	}
});
*/
$(function(){

    //登录切换
    $(".item_tab li").click(function(){
        $(this).addClass("on").siblings().removeClass("on");        
    });
    //返回顶部
    $(".contact").hover(
        function(){
            $(".tel_num").fadeIn(100);  
        },
        function(){
            $(".tel_num").fadeOut(100); 
        }
    );
    $(".weixin").hover(
        function(){
            $(".weixin_ewm").fadeIn(100);   
        },
        function(){
            $(".weixin_ewm").fadeOut(100);  
        }
    );
    $(".returntop").click(function(){
        $("html,body").animate({scrollTop:"0"},300);    
    });
});

$(function(){
	var loginForm = $("#loginForm");
	var errorMsg = '';
	var userName = $("#userName"),
		password = $("#password"),
		randCode = $("#randCode"),
		hash1;
	
	var userNameErrMsg = userName.attr("data-nullmsg"),
		passwordErrMsg = password.attr("data-nullmsg"),
		randCodeErrMsg = randCode.attr("data-nullmsg");
	
	
	loginForm.on("submit", function(event){
		event.preventDefault();
		event.stopPropagation();
		if (validateForm()) {
			hideError();
			hash1 = $.hashPwd(userName.val(), password.val());
			sendLoginRequest();
		} else {
			showError();
		}
		return false;
	});
	
	loginForm.on("keydown", function(e){
		var event = e || window.event;
		if (event.keyCode == 13){
			$('.btn-login').click();
		}
		//return false;
	});
	
	$("#do_login").on("click", function() {
		loginForm.submit();
		return false;
	});
	
	$("#captchaImg").on("click", function(){
		var url = $(this).attr("data-url");
		$(this).attr('src', url+'?t='+(new Date().getTime()));
		return false;
	});
	
	
	
	$("#changeCaptcha").on("click", function() {
		$("#captchaImg").click();
		return false;
	});
	
	function validateForm() {
		if (!$.trim(userName.val())) {
			errorMsg = userNameErrMsg;
			return false;
		} else if (!$.trim(password.val())) {
			errorMsg = passwordErrMsg;
			return false;
		} else if ($("#captchaZone").is(':visible') && !$.trim(randCode.val())) {
			errorMsg = randCodeErrMsg;
			return false;
		}
		return true;
	}
	
	function showError() {
		$("#errMsgZone").removeClass('hidden').text(errorMsg);
	}
	
	function hideError() {
		$("#errMsgZone").addClass('hidden').html('&nbsp;');
	}
	
	function sendLoginRequest() {
		$.ajax({
		  type: 'POST',
		  url: loginForm.attr('action'),
		  data: loginForm.serialize().replace(/\&password=.*\&/, '&password='+ hash1 + '&'),
		  dataType: 'json',
		  timeout: 6000,
		  tryCount: 0,
		  retryLimit: 1,
		  success: function(data){
		    if (data.success) {
		    	//debugger;
		    	if (data.status == 300) {
					winTop.x$.createWindow({
						 title : '修改密码',
						 //href : (jsCtx || '') + '/cms/sys/user/updatePwdUI',
						 content : document.getElementById('jq_pwd_update_div'),
						 width : 320,
						 height : 150,
						 resizable : false,
						 //dblclickHide : true,
						 esc : false,
						 //cancel : false,
						 button : [ {
							 name : '修改',
							 focus : true,
							 callback : function() {
								 var updateForm = winTop.x$.createWindow['jq_user_pwd_update_form'];
								 if (updateForm) {
									 updateForm.submitForm();
								 } else {
									 winTop.$.dialog({
										title: '消息',
									    width: 150,
									    content: '重置密码页面Validaform初始化异常，请检查！',
									    icon: 'error',
									    time: 5
									});
								 }
								 return false;
							 }
						 } ]
					 });
				} else {
					window.location.href = ctx + '/system/index';
				}
		    } else {
		    	errorMsg = data.msg;
		    	showError();
		    	$("#captchaImg").click();
		    	
		    	var loginCookieName = 'login_count';
				var loginCount = $.cookie(loginCookieName);
		    	if(parseInt(loginCount) >= 3){
		    		$('#captchaZone').removeClass('hide');
		    	}
		    }
		  },
		  error: function(xhr, textStatus, errorThrown){
			  if (textStatus == 'timeout') {
				  this.tryCount++;
				  if (this.tryCount < this.retryLimit) {
					  //try again
					  $.ajax(this);
					  return;
				  } else {
					  errorMsg = "系统出了点小问题，请稍后重试";
					  showError();
				  }         
				  return;
			  } else {
				  errorMsg = "系统出了点小问题，请稍后重试";
				  showError();
			  }
		  }
		});
	}
});

$(function() {

    function validatePwd(val) {
        var patten =  /^(?!\D+$)(?![^a-zA-Z]+$)\S{8,20}$/;  //必须包括数字、字母，长度8－20
        return patten.test(val);  
    }
   winTop.x$.createWindow['jq_user_pwd_update_form'] = $('#jq_user_pwd_update_form').Validform({
       beforeSubmit:function(curform){
           //在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
           //这里明确return false的话表单将不会提交;    
           var newPassword = $('#newPassword').val();
           if ($.trim(newPassword) == '') {
               winTop.$.dialog({
                   title: '消息',
                   width: 150,
                   content: '请输入新密码',
                   icon: 'warning',
                   time: 3
               });
               return false;
           }
           /* if (!validatePwd(newPassword)) {
               //alert("密码必须包括数字、字母，长度8－20位");
               winTop.$.dialog({
                   title: '消息',
                   width: 150,
                   content: '密码必须包括数字、字母，长度8－20位',
                   icon: 'warning',
                   time: 3
               });
               return false;
           } */
           var repeatPwd = $('#repeatPwd').val();
           if ($.trim(repeatPwd) == '') {
               winTop.$.dialog({
                   title: '消息',
                   width: 150,
                   content: '请输入重复密码',
                   icon: 'warning',
                   time: 3
               });
               return false;
           }
           
           if ($.trim(repeatPwd) != $.trim(newPassword)) {
               winTop.$.dialog({
                   title: '消息',
                   width: 150,
                   content: '两次输入的密码不一致',
                   icon: 'warning',
                   time: 3
               });
               return false;
           }
           return true;
       },
       callback:function(result){
       	//debugger;
           try {
               if (result.success) {
                   winTop.$.dialog({
                       lock: true,
                       title: '消息',
                       opacity : 0.3,
                       width: 200,
                       content: '初始密码重置成功，请重新登录！',
                       icon: 'face-smile',
                       okVal: '重新登录',
                       esc : false,
                       cancel : false,
                       ok: function() {
                           window.location.href = ctx + '/system/index';
                       }
                   });
                   if (winTop.x$.createWindow.handler) {
                       winTop.x$.createWindow.handler.close();
                       winTop.x$.createWindow.handler = undefined;
                   }
               } else {
                   winTop.$.dialog({
                       title: '消息',
                       width: 150,
                       content: result.msg,
                       icon: 'face-sad',
                       time: 3
                   });
               }
           } catch(e) {
               winTop.$.dialog({
                   title: '消息',
                   width: 150,
                   content: '系统出了点小问题，请稍后重试！',
                   icon: 'error',
                   time: 3
               });
           }
       }
   });
   $('#jq_user_pwd_update_form input').focus(function() {
       $(this).addClass('textbox-focused');
   }).blur(function() {
       $(this).removeClass('textbox-focused');
   });
});
$(document).ready(function() {
	var host = document.domain;
	if (host == 'cibmcha.swiftpass.cn') {
	} else {
		$('#jq_login_fixed_img').show();
	}
});