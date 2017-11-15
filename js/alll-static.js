
/******************************** vbill静态主页面的首页动态效果 ******************************/
//主页banner轮播
$(document).ready(function(){
	 $('.carousel').carousel({
	      interval: 4000,
	      pause:'hover'
	  });
//		  $('.carousel').carousel('pause');
//		  $('#myCarousel').hover(function () { 
//			  $(this).carousel('pause'); 
//			});

	});

$(function(){
//	$('#myCarouseltemp').click(function () {
//		//alert('1');
//		  $(this).carousel('pause'); 
//		});
	//鼠标移上商家动态向左移动按扭
	$("#mySelfPrev").hover(
	  function () {
		$("#mySelfPrev").attr("src","/images/arrow_business_overleft.jpg");
		// alert("1");
	  },
	  function () {
		$("#mySelfPrev").attr("src","/images/arrow_business_left.jpg");
	  }
	);
	
	//鼠标移上商家动态向右移动按扭
	$("#mySelfNext").hover(
	  function () {
		$("#mySelfNext").attr("src","/images/arrow_business_overright.jpg");
		// alert("1");
	  },
	  function () {
		$("#mySelfNext").attr("src","/images/arrow_business_right.jpg");
	 });
	 
	 //用户名获取焦点
	 $("#username").focus(function(){
			var name = $("#username").val();
			if(trim(name)=="商户编号/别名"){
				$("#username").val("");
			}
	});
	
	 //用户名失去焦点
	 $("#username").blur(function(){
			var name = trim($("#username").val());
			if(name==""){
				$("#username").val("商户编号/别名");
				$("#error").text("请输入用户名");
				return;
			}
			if(checkPhone(name)){
				$("#error").text("");
			}else{
				$("#error").text("用户名为正确的电话号码");	
			}
	});	
	
	 //密码获取焦点
	 $("#password").focus(function(){
			var name = $("#password").val();
			if(trim(name)=="这是一个密码"){
				$("#password").val("");
			}
	});
	 //密码失去焦点
	 $("#password").blur(function(){
			var name = $("#password").val();
			if(trim(name)==""){
				$("#password").val("这是一个密码");
				$("#error").text("请输入密码");
				return;
			}
			if(checkPassword(name)){
				$("#error").text("");
			}else{
				$("#error").text("密码为8-16位大小写英文字母、数字、特殊字符（如@）组成");
			}
	});	
	
	 //验证码获取焦点
	 $("#imageCode").focus(function(){
			var name = $("#imageCode").val();
			if(trim(name)=="右侧验证码"){
				$("#imageCode").val("");
			}
	});
	 //验证码失去焦点
	 $("#imageCode").blur(function(){
			var name = $("#imageCode").val();
			if(trim(name)==""){
				$("#imageCode").val("右侧验证码");
				$("#error").text("请输入验证码");
				return;
			}else{
				$("#error").text("");
			}
	});	
	//去除字符串两端的空格
	function trim(a)   
	{   
		return a.replace(/(^\s*)|(\s*$)/g, "");
	} 

});
//商家动态轮播
$(function(){	
	$('#slides_two').slides({
		preload: true,
		preloadImage: '/images/loading.gif',
		effect: 'fade, slide',
		crossfade: true,
		generateNextPrev: false,
		generatePagination: false,
		play: 8000,
		hoverPause: false,
		start: 1
	});
});

//检查用户名是否输入正确
function checkPhone(phone){
	return true;
}

//检查密码是赤输入正确
function checkPassword(password){
	if(password.length<6||password.length>15){
		return false;//不匹配
		//$("#error").text("密码为6-16位组成");
	}else{
		return true;//匹配
		// $("#error").text("");
	}
}

//去除字符串两端的空格
function trim(a)   
{   
	return a.replace(/(^\s*)|(\s*$)/g, "");
} 



//登录的时候执行的JS函数
	function loginFunction(){
		//判断有没有输入商户登录信息
		var username = trim($("#username").val());
		var password = trim($("#password").val());
		var imageCode = trim($("#imageCode").val());
		//alert(username+password+imageCode);
		if(username=="用户名" && password =="这是一个密码" && imageCode=="验证码"){
			$("#error").text("请输入商户登录信息");
			errorMsg1="请输入商户登录信息";
			return false;
		}
		if(!checkPhone(username)){
			$("#error").text("用户名输入不正确");
			return false;	
		}
		if(!checkPassword(password)){
			$("#error").text("密码为8-16位大小写英文字母、数字、特殊字符（如@）组成");
			return false;
		}
		if(imageCode=="验证码"){
			$("#error").text("请输入验证码");
			return false;
		}
		var error = $("#error").text();
		//alert(error);
		if(error==null||error==""){
			//如果错误提示信息有内容 则不能登录
			//alert("可以登录");
			return true;
				//登录以后去的地方
		}else{
			//alert("不可以登录");
			return false;
		}
	}
	
	//点击验证码看不清换一张的时候执行的函数
	function changeImageCode(){
		 	var timenow = new Date().getTime(); 
		 	$("#randomImageCode").attr("src", "/manager/common/random_code.htm?d=" + timenow );
	}
