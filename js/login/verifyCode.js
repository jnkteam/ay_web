$(document).ready(function() {
	
	document.onkeydown = function(e){ 
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) {
	    	login();
	     }
	}
});

// 验证码图片更换 
function changeImg(){    
    var imgSrc = $("#imgObj");    
    var src = imgSrc.attr("src");    
    imgSrc.attr("src",chgUrl("VerifyCodeServle"))
};    

function changeMerchantImg() {
    var imgSrc = $("#imgObj");    
    var src = imgSrc.attr("src");   
    var timestamp = (new Date()).valueOf();   
    imgSrc.attr("src","/mss/login/VerifyCodeServle?timestamp" + timestamp)
}
//时间戳    
//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳    
function chgUrl(url){    
    var timestamp = (new Date()).valueOf();    
    url = url.substring(0,17);    
    if((url.indexOf("&")>=0)){    
        url = url + "×tamp=" + timestamp;    
    }else{    
        url = url + "?timestamp=" + timestamp;    
    }    
    return url;    
};    


// 登录
function login(){
	var userName = $("#username").val();
	var mcrypt_key = $("#srand_num").val();
    //获得密文
    var pwdResult=pgeditor.pwdResult();
    //将获得密文赋值给HTML表单中的隐藏域
    $("#password").val(pwdResult);
	
	var password = $("#password").val();
	var veryCode = $("#imageCode").val();
	var ipProvice = remote_ip_info['province'];
	var ipCity= remote_ip_info['city'];
	var lastedlgAd = document.referrer;
	if(lastedlgAd==null||lastedlgAd=="")
	{	lastedlgAd = "输入网址";
	}else
	{	lastedlgAd =lastedlgAd.toLowerCase();
	}
	
	
	if(lastedlgAd.indexOf("mss")!=-1)
	{	lastedlgAd = "输入网址";}
	if(lastedlgAd.indexOf("baidu.com")!=-1)
	{	lastedlgAd = "百度";}
	if(lastedlgAd.indexOf("haosou.com")!=-1)
	{	lastedlgAd = "好搜";}
	if(lastedlgAd.indexOf("bing.com")!=-1)
	{		lastedlgAd = "必应";}
	if(lastedlgAd.indexOf("google.com")!=-1)
	{		lastedlgAd = "谷歌";}
	if(lastedlgAd.indexOf("youdao.com")!=-1)
	{	lastedlgAd = "有道";}
	if(lastedlgAd.indexOf("souhu.com")!=-1)
	{		lastedlgAd = "搜狐";}
	if(lastedlgAd.indexOf("sogou.com")!=-1)
	{		lastedlgAd = "搜狗";}
	var flage ;
	var msg;
	var view;
	if(null == userName  || userName ==""){
		msg = "用户名或密码不能为空";
		errorMsg(msg);
		return  false;
	}
	if(null == password  || password ==""){
		msg = "用户名或密码不能为空";
		errorMsg(msg);
		return  false;
	}
	
    // 数据库验证码、用户名、密码验证
	
	    $.ajax({
	  		　　data:{
	              "userName":userName,
	              "password":password,
	              "ipProvice":ipProvice,
	              "ipCity":ipCity,
	              "lastedlgAd":lastedlgAd,
	              "veryCode":veryCode,
	              "mcrypt_key":mcrypt_key
	          	},
	             url : '/mss/login/loginCheck.htm',
	  		　　type : "POST",
	  		   dataType: "json",
	  		   async:false, 
	  		　　success : function(data) {
	  		　　　　if(data != "" && data.map.retInf !="isEmpty"){
//	  					alert(data.map.retInf);
		  				if(data.map.retInf !="mismatching"){
		  					if("00" == data.map.retInf){
			  					var  view =  data.map.reditViwe;
			  					window.location = view;
			  				}else{
			  					msg = data.map.retInf;
			  					changeImg();
			  	        		errorMsg(msg);
			  				}
		  				}else{
		  					msg="验证码错误";
							errorMsg(msg);
							changeMerchantImg();
							return;
		  				}
	  			 }else{
	  				msg="验证码不能为空";
					errorMsg(msg);
					return;
	  			 }
	  		　　}
	  	});
    
}

function errorMsg(msg){
	$("#error").html(msg); 	
}

