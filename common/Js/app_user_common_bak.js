jQuery(document).ready(function(){
//提交销卡
     $('#form_postorder button[type="reset"]').click( function(){$("#form_postorder button.green").removeAttr("disabled");$("#callinfo").html("");});
		$("#form_postorder button.green").click( function(){
		  var channeltype=$("#xk_channelId").val();
		  var channelname=$("#xk_channelname").val();
		  var xkcardid=$("#xk_cardId").val();
		  var xkcardpass=$("#xk_cardPass").val();
		  var xkfacevalue=$("#xk_faceValue").val();
		  var cmgs="卡号输入错误！";
		  var mmgs="密码输入错误！";
          if(xkcardid==''){$("#xk_cardId").focus();$("#callinfo").html(errico+"请输入卡号</span>");return false};
          if(xkcardpass==''){$("#xk_cardPass").focus();$("#callinfo").html(errico+"请输入卡密码</span>");return false};
		  if(xkfacevalue==''){$("#xk_faceValue").focus();$("#callinfo").html(errico+"请输入正确的卡面额</span>");return false};
		  switch (channeltype){
			case '4':
			  if(xkcardid.length!=9){$.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为9位",lock: true,fixed:true,cancelVal: '确定',cancel: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}
			  else
			 {if(xkcardpass.length!=12){$.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为12位",lock: true,fixed:true,cancelVal: '确定',cancel: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}
			  break;//腾讯卡
			case '5':
			  if(xkcardid.length!=15){$.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为15位",lock: true,fixed:true,cancelVal: '确定',cancel: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}
			  else
			 {if(xkcardpass.length!=8 && xkcardpass.length!=9){$.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为8或9位",lock: true,fixed:true,cancelVal: '确定',cancel: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}
			  break;//盛大卡
			case '6':
			  if(xkcardid.length!=16){$.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为16位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}
			else
			{if(xkcardpass.length!=16){$.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为16位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}
			break;//骏网一卡通
			case '7':
			  if(xkcardid.length!=10){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为10位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=15){$.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为15位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//完美一卡通
			case '8':
			  if(xkcardid.length!=20){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为20位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=12){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为12位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//搜狐一卡通
			case '9':
			  if(xkcardid.length!=16){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为16位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=8){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为8位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//征途游戏卡
			case '10':
			  if(xkcardid.length!=13){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为13位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=10){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为10位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//久游一卡通
			case '11':
			  if(xkcardid.length!=13){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为13位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=9){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为9位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//网易一卡通
			case '12':
			  if(xkcardid.length!=20){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为20位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=8){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为8位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//光宇一卡通
			case '13':
			  if(xkcardid.length!=19){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为19位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=18){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为18位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//电信充值卡
			case '14':
			  if(xkcardid.length!=17){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为17位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=18){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为18位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//神州行充值卡
			case '15':
			  if(xkcardid.length!=15){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为15位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=19){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为19位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//联通充值卡
			case '16':
			  if(xkcardid.length!=15){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为15位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=15){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为15位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//纵游一卡通
			case '17':
			  if(xkcardid.length!=10 && xkcardid.length!=12){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为10或12位",lock:true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
				  if(xkcardpass.length!=10 && xkcardpass.length!=15){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为10或15位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//天宏一卡通
			case '18':
			  if(xkcardid.length!=15){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />卡号为15位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=8){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />密码为8位",lock: true,fixed:true,okVal: '确定',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//天下一卡通
		
		  }//switch end	
		if(parseInt(xkfacevalue)<1||parseInt(xkfacevalue)>1000){$("#xk_faceValue").focus();$("#callinfo").html(errico+"请输入正确的卡面额</span>");return false};
		var postorderdata=$("#form_postorder").serialize();$(".required").val("");
		$("#callinfo").css({color:"#666666"});$("#callinfo").html(ldico+"正在提交</span>");
		$.ajax({
                    type: "get",
                    contentType: "text/html",
                    url: "set/",
                    data: postorderdata,
					error: function() {$("#callinfo").css({color:"red"});
                    $("#callinfo").html(errico+"提交出现错误</span>");
                    },
                    success: function(result) {
                        if(result != "true"){
							$("#callinfo").html(errico+"提交失败："+result+"</span>");
					    }//失败
						else
						{$("#callinfo").html(okico+"提交成功!</span>");}//成功
                    }
                });
		queryOrder();
    });
})
function checkflag(oid){
		 $("#paymoney"+oid).html(ldico+"Loading</span>");
		 $("#orderzt"+oid).html(ldico+"Loading</span>");
		 postData= "oid="+oid+"&rnd="+Math.random();
         $.ajax({
		 type: "get",
        dataType: "json",
        timeout:10000,
        url: 'json/',
		async: false,
        data: postData ,  
        success: function(data) {
                $("#orderzt"+oid).html(data.Success);
                $("#paymoney"+oid).html(data.paymoney);
        },
		error: function (xmlHttpRequest, error) {
		$.dialog({title: lktitle,content: '结果获取失败,请稍等重试',lock: true,fixed:true,ok: function () {window.location.reload();},icon: 'warning',width:'250px',height:'90px'});
		}

        });
     }
function queryOrder(){
         $("#toporder").html("<tr><td colspan='10' class='nomsg'>"+ldico+"Loading..</span></td></tr>");
	 $.ajax({
                    type: "get",
                    contentType: "text/html",
                    url: "get/",
                    data: "",
					error: function() {
                      $("#toporder").html("<tr><td colspan='10' class='nomsg'>提交出现错误</td></tr>");
                    },
                    success: function(result) {
                        if(result != ""){
							$("#toporder").html(result);
					    }//失败
                    }
                });
}