jQuery(document).ready(function(){
//�ύ����
     $('#form_postorder button[type="reset"]').click( function(){$("#form_postorder button.green").removeAttr("disabled");$("#callinfo").html("");});
		$("#form_postorder button.green").click( function(){
		  var channeltype=$("#xk_channelId").val();
		  var channelname=$("#xk_channelname").val();
		  var xkcardid=$("#xk_cardId").val();
		  var xkcardpass=$("#xk_cardPass").val();
		  var xkfacevalue=$("#xk_faceValue").val();
		  var cmgs="�����������";
		  var mmgs="�����������";
          if(xkcardid==''){$("#xk_cardId").focus();$("#callinfo").html(errico+"�����뿨��</span>");return false};
          if(xkcardpass==''){$("#xk_cardPass").focus();$("#callinfo").html(errico+"�����뿨����</span>");return false};
		  if(xkfacevalue==''){$("#xk_faceValue").focus();$("#callinfo").html(errico+"��������ȷ�Ŀ����</span>");return false};
		  switch (channeltype){
			case '4':
			  if(xkcardid.length!=9){$.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ9λ",lock: true,fixed:true,cancelVal: 'ȷ��',cancel: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}
			  else
			 {if(xkcardpass.length!=12){$.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ12λ",lock: true,fixed:true,cancelVal: 'ȷ��',cancel: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}
			  break;//��Ѷ��
			case '5':
			  if(xkcardid.length!=15){$.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ15λ",lock: true,fixed:true,cancelVal: 'ȷ��',cancel: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}
			  else
			 {if(xkcardpass.length!=8 && xkcardpass.length!=9){$.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ8��9λ",lock: true,fixed:true,cancelVal: 'ȷ��',cancel: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}
			  break;//ʢ��
			case '6':
			  if(xkcardid.length!=16){$.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ16λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}
			else
			{if(xkcardpass.length!=16){$.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ16λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}
			break;//����һ��ͨ
			case '7':
			  if(xkcardid.length!=10){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ10λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=15){$.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ15λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//����һ��ͨ
			case '8':
			  if(xkcardid.length!=20){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ20λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=12){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ12λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//�Ѻ�һ��ͨ
			case '9':
			  if(xkcardid.length!=16){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ16λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=8){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ8λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//��;��Ϸ��
			case '10':
			  if(xkcardid.length!=13){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ13λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=10){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ10λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//����һ��ͨ
			case '11':
			  if(xkcardid.length!=13){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ13λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=9){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ9λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//����һ��ͨ
			case '12':
			  if(xkcardid.length!=20){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ20λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=8){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ8λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//����һ��ͨ
			case '13':
			  if(xkcardid.length!=19){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ19λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=18){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ18λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//���ų�ֵ��
			case '14':
			  if(xkcardid.length!=17){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ17λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=18){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ18λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//�����г�ֵ��
			case '15':
			  if(xkcardid.length!=15){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ15λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=19){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ19λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//��ͨ��ֵ��
			case '16':
			  if(xkcardid.length!=15){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ15λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=15){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ15λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//����һ��ͨ
			case '17':
			  if(xkcardid.length!=10 && xkcardid.length!=12){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ10��12λ",lock:true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
				  if(xkcardpass.length!=10 && xkcardpass.length!=15){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ10��15λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//���һ��ͨ
			case '18':
			  if(xkcardid.length!=15){
			  $.dialog({title: lktitle,content:channelname+cmgs + "<br />����Ϊ15λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardId").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}else{
			if(xkcardpass.length!=8){
			  $.dialog({title: lktitle,content:channelname+mmgs + "<br />����Ϊ8λ",lock: true,fixed:true,okVal: 'ȷ��',ok: function () {$("#xk_cardPass").focus();},icon: 'warning',width:'250px',height:'90px'});return false;}}break;//����һ��ͨ
		
		  }//switch end	
		if(parseInt(xkfacevalue)<1||parseInt(xkfacevalue)>1000){$("#xk_faceValue").focus();$("#callinfo").html(errico+"��������ȷ�Ŀ����</span>");return false};
		var postorderdata=$("#form_postorder").serialize();$(".required").val("");
		$("#callinfo").css({color:"#666666"});$("#callinfo").html(ldico+"�����ύ</span>");
		$.ajax({
                    type: "get",
                    contentType: "text/html",
                    url: "set/",
                    data: postorderdata,
					error: function() {$("#callinfo").css({color:"red"});
                    $("#callinfo").html(errico+"�ύ���ִ���</span>");
                    },
                    success: function(result) {
                        if(result != "true"){
							$("#callinfo").html(errico+"�ύʧ�ܣ�"+result+"</span>");
					    }//ʧ��
						else
						{$("#callinfo").html(okico+"�ύ�ɹ�!</span>");}//�ɹ�
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
		$.dialog({title: lktitle,content: '�����ȡʧ��,���Ե�����',lock: true,fixed:true,ok: function () {window.location.reload();},icon: 'warning',width:'250px',height:'90px'});
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
                      $("#toporder").html("<tr><td colspan='10' class='nomsg'>�ύ���ִ���</td></tr>");
                    },
                    success: function(result) {
                        if(result != ""){
							$("#toporder").html(result);
					    }//ʧ��
                    }
                });
}