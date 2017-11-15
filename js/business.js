function trim(a) {   
	return a.replace(/(^\s*)|(\s*$)/g, "");
} 
		
$(function(){
	$('#submitForm').removeAttr("disabled");
	$('#submitForm').click(merchantSubmit);
	$('#addressProv').change(provinceChange);
	$('#addressCity').change(cityChange);
	queryProvince();
});

function queryProvince() {
	$.ajax({
	       url : "/mss/merchant/apply/query_province.htm",
	       type : "POST",
	       cache: false,
		   dataType: "json",
		   success : function(data) {
				if (data && data.code == '0000') {
					var resultList = data.resultParams.resultList;
					for (var index = 0; index < resultList.length; index++) {
						var result = resultList[index];
						$('#addressProv').append('<option value="' + result.areaId + '">' + result.areaName + '</option>');
					}
				} else {
					alert('省份信息加载失败！');
				}
		   }
	});
}


function provinceChange(){
	$('#addressArea').empty();
	$('#addressArea').append('<option value="">--请选择--</option>');
	$('#addressCity').empty();
	$('#addressCity').append('<option value="">--请选择--</option>');
	var pro_cd = $('#addressProv').val();
	if (pro_cd == '') {
		return;
	}
	$.ajax({
		   data:{superCode:pro_cd},
	       url : "/mss/merchant/apply/query_city.htm",
	       type : "POST",
	       cache: false,
		   dataType: "json",
		   success : function(data) {
				if (data && data.code == '0000') {
					var resultList = data.resultParams.resultList;
					for (var index = 0; index < resultList.length; index++) {
						var result = resultList[index];
						$('#addressCity').append('<option value="' + result.areaId + '">' + result.areaName + '</option>');
					}
				} else {
					alert('城市信息加载失败！');
				}
		   }
	});
}

function cityChange() {
	$('#addressArea').empty();
	$('#addressArea').append('<option value="">--请选择--</option>');
	var city_cd = $('#addressCity').val();
	if (city_cd == '') {
		return;
	}
	$.ajax({
		   data:{superCode:city_cd},
	       url : "/mss/merchant/apply/query_city.htm",
	       type : "POST",
	       cache: false,
		   dataType: "json",
		   success : function(data) {
				if (data && data.code == '0000') {
					var resultList = data.resultParams.resultList;
					if (resultList.length == 0){
						$('#addressArea').append('<option value="' + city_cd + '">其他</option>');
					}
					for (var index = 0; index < resultList.length; index++) {
						var result = resultList[index];
						$('#addressArea').append('<option value="' + result.areaId + '">' + result.areaName + '</option>');
					}
				} else {
					alert('城市信息加载失败！');
				}
		   }
	});
}

function checkForm(){
	var merchantIntention = $('#merchantIntention').val();
	if (merchantIntention == '') {
		alert('请选择客户意向');
		return false;
	}
	var merchantType = $('input[name="merchantType"]').filter(':checked').val();
	if (!merchantType || merchantType == '') {
		alert('请选择客户类型');
		return false;
	}
	var linkPhone = $('#linkPhone').val().trim();
	if (linkPhone == '') {
		alert('请填写联系号码');
		return false;
	}
	// 手机号码：13,14,15,17,18
	var mobileReg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1})|(14[0-9]{1}))+\d{8})$/; 
    var isMobile = !mobileReg.exec(linkPhone) || linkPhone.length != 11;
	if (linkPhone.substring(0, 1) == 1 && isMobile) {
		alert('请正确填写联系号码');
		return false;
	}
    var phoneReg = /^((0\d{2,3})-?)?(\d{7,8})(-(\d{3,}))?$/;
    var isPhone = !phoneReg.test(linkPhone);
    if (linkPhone.substring(0, 1) != 1 && isPhone) {
    	alert('请正确填写联系号码');
		return false;
    }
    var linkman = $('#linkman').val().trim();
	if (linkman != '' && linkman.length > 50) {
		alert('联系人请不要超过50个字符');
		return false;
	}
	var pattern = /^[a-z\u4E00-\u9FA5\u00B7]+$/i; 
	if ((linkman != '')& !pattern.test(linkman)) {
		alert('客户联系人只能输入汉字、字母，请重新输入！');
		return false;
	}
	var merchantName = $('#merchantName').val().trim();
	if (merchantName == '') {
		alert('请填写客户名称');
		return false;
	}
	if (merchantName.length > 50) {
		alert('客户名称请不要超过50个字符');
		return false;
	}
	if (!pattern.test(merchantName)) {
		alert('客户名称只能输入汉字、字母，请重新输入！');
		return false;
	}
	var addressProv = $('#addressProv').val();
	if (addressProv == '') {
		alert('请选择省份信息');
		return false;
	}
	var addressCity = $('#addressCity').val();
	if (addressCity == '') {
		alert('请选择城市信息');
		return false;
	}
	var addressArea = $('#addressArea').val();
	if (addressArea == '') {
		alert('请选择区县信息');
		return false;
	}
	var address = $('#address').val().trim();
	if (address != '' && address.length > 50) {
		alert('详细地址不要超过50个字符');
		return false;
	}
	var verifyCode = $('#verifyCode').val().trim();
	if (verifyCode == '') {
		alert('请填写验证码');
		return false;
	}
	return true;
}

function merchantSubmit(){
	if (! checkForm()) {
		return;
	}
	$('#submitForm').attr('disabled','disabled');
	var merchantIntention = $('#merchantIntention').val();
	var merchantType = $('input[name="merchantType"]').filter(':checked').val();
	var linkPhone = $('#linkPhone').val().trim();
	var linkman = $('#linkman').val().trim();
	var merchantName = $('#merchantName').val().trim();
	var addressProv = $('#addressProv').val();
	var addressProvNm = $("#addressProv").find("option:selected").text();
	var addressCity = $('#addressCity').val();
	var addressCityNm = $("#addressCity").find("option:selected").text();
	var addressArea = $('#addressArea').val();
	var addressAreaNm = $("#addressArea").find("option:selected").text();
	var address = $('#address').val().trim();
	var verifyCode = $('#verifyCode').val().trim();
	var formParams = {merchantIntention:merchantIntention, merchantType:merchantType,
			linkPhone:linkPhone, linkman:linkman, merchantName:merchantName,
			addressProv:addressProv, addressCity:addressCity,addressArea:addressArea,
			address:address,verifyCode:verifyCode, provNm:addressProvNm, cityNm:addressCityNm, areaNm:addressAreaNm }
	$.ajax({
		　　data:formParams,
	       url : "/mss/merchant/apply/add_merchant_apply.htm",
	       type : "POST",
	       cache: false,
		   dataType: "json",
		   success : function(data) {
				if (data && data.code == '0000') {
					$('#merchantIntention').val('');
					$('input[name="merchantType"]').filter(':checked').removeAttr("checked");
					$('#linkPhone').val('');
					$('#linkman').val('');
					$('#merchantName').val('');
					$('#addressProv').val('');
					$('#addressCity').val('');
					$('#addressArea').val('');
					$('#address').val('');
					$('#verifyCode').val('');
					changeMerchantImg();
					$('#submitForm').removeAttr("disabled");
					alert(data.msg);
				} else {
					$('#submitForm').removeAttr("disabled");
					if (data) {
						alert(data.msg);
						return;
					} 
					alert('商家申请接入填报失败！');
				}
		   }
	});
}
