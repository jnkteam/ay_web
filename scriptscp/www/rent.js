var PayRentJS={
	Index:{
		init:function(){
			new $.ScrollUlList($(".pnrecord ul"));
			var a=$.getQueryString("from_page");
			if(a=="index"||a=="events"){
				PayRentJS.Index.payRent()
			};	
					
		}
		,scrollLandlordPush:function(){
			if(this.landlordPushScroll){
				this.landlordPushScroll.dispose()
			}
			var a=new $.ScrollUlList($(".rent_box ul"));
			this.landlordPushScroll=a
		}
	}
	,RentProfile:{
		isNeedTipModifyPayeeT0:false,init:function(c){
			PayRentJS.RentProfile.isNeedTipModifyPayeeT0=c&&c.isNeedTipModifyPayeeT0;
			$(function(){
				$("input[name=txtPayeePhone]").blur(PayRentJS.RentProfile.verifySelfMobile);
				$("input[name=txtPayeeName]").blur(PayRentJS.RentProfile.verifyPayeeName);
				$("input[name=txtPayeeCardNo]").blur(PayRentJS.RentProfile.verifyPayeeCardNo)
			});
			$("input[name=idRentType]").change(PayRentJS.RentProfile.changedRentType);
			$("#txtRentDataBegin").bind("click",WdatePicker);
			$("input[name=idPayeeType]").change(PayRentJS.RentProfile.changedPayeeType);
			new CellCombobox($("#txtCellName"),$("#selCity_rent"),$("#selArea_rent"));
			var a=new SubbranchCombobox($("#divPersonalPayeeSubbranch"),$("#selPayeeBank1"),$("#selProvince_payeeBank1"),$("#selCity_payeeBank1"),true);
			a.bind(true);
			var b=new SubbranchCombobox($("#divCompanyPayeeSubbranch"),$("#selPayeeBank2"),$("#selProvince_payeeBank2"),$("#selCity_payeeBank2"),false);
			b.bind(true);
			new $.BankCardNo($("#txtPayeeCardNo1"));
			new $.BankCardNo($("#txtPayeeCardNo2"));
			$("#chkIsInformPayee").change(function(){
				$(this).is(":checked")?$("#divMessageContent").show():$("#divMessageContent").hide()
			});
			if(!PayRentJS.RentProfile.isNeedTipModifyPayeeT0){
				$(".bluebtn a").click(PayRentJS.RentProfile.saveProfile)
			}
			else{
				$(".bluebtn a").click(PayRentJS.RentProfile.confirmNeedTipModifyPayeeT0)
			}
			UserPayeeJS.init($("#aChoosePayee"),{
				chooseHandle:PayRentJS.RentProfile.chooseUserPayee,orderType:1
			})
		}
		,chooseUserPayee:function(a){
			if(a==null||a==undefined){
				return false
			}
			$("#idPayeeType{0}".format(a.payeeType)).attr("checked",true);
			PayRentJS.RentProfile.changedPayeeType();
			$("#txtPayeeName{0}".format(a.payeeType)).val(a.payeeName);
			$("#selPayeeBank{0}".format(a.payeeType)).val(a.payeeBank);
			$("#txtPayeeCardNo{0}".format(a.payeeType)).val(a.payeeCardNoSplit);
			$("#selProvince_payeeBank{0}".format(a.payeeType)).val(a.payeeBankProvince);
			Geography.syncLoadCityList("payeeBank{0}".format(a.payeeType));
			$("#selCity_payeeBank{0}".format(a.payeeType)).val(a.payeeBankCity);
			if(!String.isNullOrWhiteSpace(a.payeeSubBankName)||a.payeeType==2){
				$("#txtPayeeSubbranch{0}".format(a.payeeType)).val(a.payeeSubBankName);
				$("#divPersonalPayeeSubbranch").show()
			}
			else{
				$("#divPersonalPayeeSubbranch").hide()
			}
			$("#txtPayeePhone{0}".format(a.payeeType)).val(a.payeePhone);
			$("#txtPayeeCardNo{0}".format(a.payeeType)).blur()
		}
		,verifyPayeeCardNo:function(){
			var c=$(this);
			var b=c.val();
			if(String.isNullOrEmpty(b)){
				return
			}
			var a=$.postJsonSync("/payrent/Index/verifypayeecardno.htm",{
				payeeCardNo:b.replace(/\s/g,"")
			});
			if(a.resultCode==1){
				return
			}
			return $.showMsgBox(String.format("房东银行卡 {0} 无法通过租房宝收房租，请联系房东换张卡试试。<br/>如有疑问请联系客服400-008-2828咨询，感谢支持！",b))
		}
		,verifySelfMobile:function(){
			var c=$(this);
			var a=c.val();
			var d=c.attr("selfmobile");
			if(String.isNullOrEmpty(a)){
				return
			}
			if(a==d){
				Validator.showFaildMsg(c,true,true);
				return
			}
			var b=$.postJsonSync("/payrent/Index/verifylandlordphone.htm",{
				mobile:a
			});
			if(b.resultCode==1){
				return
			}
			Validator.showMsg(c,b.resultMsg,false)
		}
		,verifyPayeeName:function(){
			var c=$(this);
			var b=c.val();
			if(String.isNullOrEmpty(b)){
				return
			}
			var a=$.Cookie.getCookieParamValue("www_UserData","displayName");
			if(b==a){
				$("<div class='comm_dialog_cont'>收款人姓名和租客姓名相同，订单审核时可能无法通过。<br/>您确定输入吗？</div>").dialog({
					title:"温馨提示",modal:true,width:400,buttons:[{
						text:"重新填写","class":"comm_dialog_btn_save",click:function(){
							$(this).dialog("destroy");
							c.focus().val("")
						}
					}
					,{
						text:"确定","class":"comm_dialog_btn_cancel",click:function(){
							$(this).dialog("destroy")
						}
					}
					]
				})
			}
		}
		,changedRentType:function(){
			if($("input[name=idRentType]:checked").val()=="1"){
				$(".houseItem").show();
				$("#txtAddr").css("width","190px").attr("msg","请输入正确的小区地址").attr("rig","请输入小区地址").attr("placeholder","几幢几单元几室");
				$("#txtAddr").parent().css("width","21opx");
				$("#spanAddr").text("请填写真实的所租房屋地址，具体到XX小区XX幢XX单元XX室")
			}
			else{
				$(".houseItem").hide();
				$("#txtAddr").css("width","250px").attr("msg","请输入正确的商铺、写字楼地址").attr("rig","请输入详细的商铺、写字楼地址").attr("placeholder","详细地址");
				$("#txtAddr").parent().css("width","270px");
				$("#spanAddr").text("请填写真实的所租房屋地址，如万塘路8号黄龙时代广场A座905")
			}
			Validator.clearState($("#txtAddr"),true)
		}
		,changedPayeeType:function(){
			if($("input[name=idPayeeType]:checked").val()=="1"){
				$("#idPersonal_Panel").show();
				$("#idCompany_Panel").hide()
			}
			else{
				$("#idPersonal_Panel").hide();
				$("#idCompany_Panel").show()
			}
		}
		,confirmNeedTipModifyPayeeT0:function(){
			if(!Validator.validateForm()){
				return
			}
			if(!PayRentJS.RentProfile.isNeedTipModifyPayeeT0){
				PayRentJS.ModifyPayee.saveProfile();
				return false
			}
			$.post("/payrent/ismodifypayeet0.htm",{
				orderNo:$.getQueryString("id"),payeeBankId:$("input[name=idPayeeType]").length>0?$("select[name=selPayeeBank]:visible").val():1
			}
			,function(a){
				if(a.resultCode!=1){
					$.showMsgBox(a.resultMsg);
					return false
				}
				if(a.data){
					$.showConfirmBox("您修改后的银行不支持2小时到账，订单支付的2小时到账服务费将不予退还，请确认！",function(){
						PayRentJS.RentProfile.saveProfile()
					})
				}
				else{
					PayRentJS.RentProfile.saveProfile()
				}
			})
		}
		,saveProfile:function(){
			if(!Validator.validateForm()){
				return false
			}
			var b=$("input[name=idRentType]").length>0;
			var a=$("#txtRentExpense").length>0;
			var c=$("input[name=idPayeeType]").length>0;
			$.post("/payrent/Index/saverentprofile.html",{
				id:$.getQueryString("id"),rid:$.getQueryString("rid"),rentType:b?$("input[name=idRentType]:checked").val():2,roomCount:b&&$("#selRoomCount").is(":visible")?$("#selRoomCount").val():0,deck:b&&$("#selDeck").is(":visible")?$("#selDeck").val():0,acreage:b?$("#txtAcreage").val():1,rentExpense:a?$("#txtRentExpense").val():300,rentMonths:b&&a?$("#selRentMonths").val():12,rentBeginDate:b&&a?$("#txtRentDataBegin").val():new Date(),rentProvince:b?$("#selProvince_rent").val():"100000",rentCity:b?$("#selCity_rent").val():"100000",rentArea:b?$("#selArea_rent").val():"100000",cellName:b&&$("#txtCellName").is(":visible")?$("#txtCellName").val():"",addr:b?$("#txtAddr").val():"_",payeeType:c?$("input[name=idPayeeType]:checked").val():1,payeeName:c?$("input[name=txtPayeeName]:visible").val():"租房宝",payeeBankId:c?$("select[name=selPayeeBank]:visible").val():1,payeeCardNo:c?$("input[name=txtPayeeCardNo]:visible").val().replace(/\s/g,""):"11111111111111",payeeBankProvince:c?($("#selProvince_payeeBank1").is(":visible")?$("#selProvince_payeeBank1").val():$("#selProvince_payeeBank2").val()):"100000",payeeBankCity:c?($("#selProvince_payeeBank1").is(":visible")?$("#selCity_payeeBank1").val():$("#selCity_payeeBank2").val()):"100000",payeeSubbranch:c&&$("input[name=txtPayeeSubbranch]:visible").length>0?$("input[name=txtPayeeSubbranch]:visible").val():"",payeePhone:c?$("input[name=txtPayeePhone]:visible").val():"13000000000",isInformPayee:$("#chkIsInformPayee").is(":checked"),messageContent:$("#chkIsInformPayee").is(":checked")?$("#txtMessageContent").val().replace(/\s/g,""):""
			}
			,function(d){
				if(d.resultCode==1){
					if(d.data){
						return $.doUrlRedirt("/payrent/Index/rentoption.htm?id="+encodeURIComponent($.getQueryString("id"))+"&rid="+encodeURIComponent($.getQueryString("rid")))
					}
					else{
						return $.doUrlRedirt("/payrent/Index/rentdetail.htm?id="+encodeURIComponent($.getQueryString("id")))
					}
				}
				else{
					$.showMsgBox(d.resultMsg)
				}
			},'json')
		}
	}
	,BindMobileServlet:{
		payeePhone:"",isMustValidMobile:false,isSubmitServlet:false,smsVCSender:null,init:function(a){
			PayRentJS.BindMobileServlet.payeePhone=a.payeePhone;
			PayRentJS.BindMobileServlet.isMustValidMobile=a.isMustValidMobile;
			PayRentJS.BindMobileServlet.smsVCSender=new $.SmsVCSender($("#txtMobile"),$("#txtValidCode_0"),$("#divSendSmsVC_0 a,#btnSendSms_0"),$("#btnSendVoice_0"),{
				uniqueMobile:true,overEvent:function(){
					$("#divSendSmsVC_0").remove();
					$("#divSendSms_0").show()
				}
			});
			$("#divSendSmsVC_0 a,#btnSendSms_0").bind("click",PayRentJS.BindMobileServlet.checkSendSms);
			$("#btnSendVoice_0").bind("click",PayRentJS.BindMobileServlet.checkSendVoice);
			$("#aTipValidMobile").click(function(){
				PayRentJS.BindMobileServlet.isMustValidMobile=true;
				$("#divNeedValidMobile .iphdiv").show()
			});
			$("#cancelValidMobile").click(function(){
				PayRentJS.BindMobileServlet.isMustValidMobile=false;
				validMobile=0;
				$("#divNeedValidMobile .iphdiv").hide()
			})
		}
		,checkSendSms:function(){
			if(!PayRentJS.BindMobileServlet.isMustValidMobile||!Validator.validateForm($("#divNeedValidMobile .yzmdiv"))){
				return false
			}
			if(!String.isNullOrEmpty(PayRentJS.BindMobileServlet.payeePhone)&&PayRentJS.BindMobileServlet.payeePhone==$("#txtMobile").val().trim()){
				$.showMsgBox("绑定的手机号不能和收款人电话号码一致");
				return false
			}
			PayRentJS.BindMobileServlet.smsVCSender.sendSms()
		}
		,checkSendVoice:function(){
			if(!PayRentJS.BindMobileServlet.isMustValidMobile||!Validator.validateForm($("#divNeedValidMobile .yzmdiv"))){
				return false
			}
			if(!String.isNullOrEmpty(PayRentJS.BindMobileServlet.payeePhone)&&PayRentJS.BindMobileServlet.payeePhone==$("#txtMobile").val().trim()){
				$.showMsgBox("绑定的手机号不能和收款人电话号码一致");
				return false
			}
			PayRentJS.BindMobileServlet.smsVCSender.sendVoice()
		}
		,doBindMobile:function(){
			if(!PayRentJS.BindMobileServlet.isMustValidMobile){
				$("#divNeedValidMobile").hide();
				PayRentJS.RentOption.saveOption();
				return false
			}
			if(PayRentJS.BindMobileServlet.isSubmitServlet||!Validator.validateForm()){
				return false
			}
			var a=$("#txtMobile").val().trim();
			if(!String.isNullOrEmpty(PayRentJS.BindMobileServlet.payeePhone)&&PayRentJS.BindMobileServlet.payeePhone==a){
				$.showMsgBox("绑定的手机号不能和收款人电话号码一致");
				return false
			}
			PayRentJS.BindMobileServlet.isSubmitServlet=true;
			$.post("/payrent/index/dobindmobile.htm",{
				id:$.getQueryString("id"),rid:$.getQueryString("rid"),mobile:a,vsString:$("#txtNeedMobileValidCode").val()
			}
			,function(b){
				PayRentJS.BindMobileServlet.isSubmitServlet=false;
				if(b.resultCode==1){
					$("#divNeedValidMobile").hide();
					PayRentJS.BindMobileServlet.isMustValidMobile=false;
					PayRentJS.RentOption.saveOption();
					return false
				}
				else{
					$.showMsgBox(b.resultMsg)
				}
			},'json')
		}
	}
	,LoginAndMobileRegServlet:{
		payeePhone:"",init:function(b){
			PayRentJS.LoginAndMobileRegServlet.payeePhone=b.payeePhone;
			var a=$(".login_box");
			a.find(".close").click(function(){
				a.hide()
			});
			a.find("ul li").click(function(){
				a.find("ul li").removeClass("on");
				$(this).addClass("on");
				a.find(".rcont").hide();
				a.find(".rcont").eq($(this).index()).show()
			});
			PayRentJS.LoginAndMobileRegServlet.bindUserRegister.init();
			PayRentJS.LoginAndMobileRegServlet.bindLogin.init()
		}
		,showLoginBox:function(){
			var a=$(".login_box");
			a.show();
			var b=($(document).height()-a.height())/2+$(document).scrollTop();
			$(".box1_zz").css("height",$(document).height()+"px");
			a.css("top",b+"px")
		}
		,bindUserRegister:{
			isSubmitReg:false,smsVCSender:null,init:function(){
				PayRentJS.LoginAndMobileRegServlet.bindUserRegister.smsVCSender=new $.SmsVCSender($("#txtRegMobile"),$("#txtValidCode_1"),$("#divSendSmsVC_1 a,#btnSendSms_1"),$("#btnSendVoice_1"),{
					uniqueMobile:true,overEvent:function(){
						$("#divSendSmsVC_1").remove();
						$("#divSendSms_1").show()
					}
				});
				$("#divSendSmsVC_1 a,#btnSendSms_1").bind("click",PayRentJS.LoginAndMobileRegServlet.bindUserRegister.checkSendSms);
				$("#btnSendVoice_1").bind("click",PayRentJS.LoginAndMobileRegServlet.bindUserRegister.checkSendVoice);
				$("#regAndSubmitOrder").click(PayRentJS.LoginAndMobileRegServlet.bindUserRegister.doUserRegister)
			}
			,checkSendSms:function(){
				if(!String.isNullOrEmpty(PayRentJS.LoginAndMobileRegServlet.payeePhone)&&PayRentJS.LoginAndMobileRegServlet.payeePhone==$("#txtRegMobile").val().trim()){
					$.showMsgBox("注册的手机号不能和收款人电话号码一致");
					return false
				}
				PayRentJS.LoginAndMobileRegServlet.bindUserRegister.smsVCSender.sendSms()
			}
			,checkSendVoice:function(){
				if(!String.isNullOrEmpty(PayRentJS.LoginAndMobileRegServlet.payeePhone)&&PayRentJS.LoginAndMobileRegServlet.payeePhone==$("#txtRegMobile").val().trim()){
					$.showMsgBox("注册的手机号不能和收款人电话号码一致");
					return false
				}
				PayRentJS.LoginAndMobileRegServlet.bindUserRegister.smsVCSender.sendVoice()
			}
			,doUserRegister:function(){
				if(PayRentJS.LoginAndMobileRegServlet.bindUserRegister.isSubmitReg||!Validator.validateForm()){
					return
				}
				var b=$("#txtRegPassword").val();
				//var a=new RSAKey();
				//a.setPublic(RSAPublicKey,"10001");
				//b=a.encrypt(b);
				PayRentJS.LoginAndMobileRegServlet.bindUserRegister.isSubmitReg=true;
				$.post("/Member/index/doRegister.htm",{
					mobile:$("#txtRegMobile").val(),password:b,verifyCode:$("#txtRegMobileValidCode").val()
				}
				,function(c){
					PayRentJS.LoginAndMobileRegServlet.bindUserRegister.isSubmitReg=false;
					if(c.resultCode==1){
						PayRentJS.RentOption.saveOption();
						return false
					}
					else{
						$.showMsgBox(c.resultMsg)
					}
				},'json')
			}
		}
		,bindLogin:{
			init:function(){
				$("#divLoginValidCode a").bind("click",function(){
					PayRentJS.LoginAndMobileRegServlet.bindLogin.changeVC(true)
				});
				$("#doLogin").click(PayRentJS.LoginAndMobileRegServlet.bindLogin.doLogin);
				$("#divThirdPartyLogin a").click(function(){
					RentHelperJS.toThirdPartyLogin($(this).attr("to"),function(){
						PayRentJS.LoginAndMobileRegServlet.bindLogin.successHander()
					})
				})
			}
			,changeVC:function(a){
				$(".yzm img").attr("src","/Api/Checkcode/index?t="+new Date().getTime());
				if(a){
					$("#txtLoginValidCode").val("")
				}
				return false
			}
			,doLogin:function(){
				if(!Validator.validateForm($(".login_box .rcont").eq(1))){
					return
				}
				var b=$("#txtLoginCode").val();
				var d=$("#txtLoginPassword").val();
				var c=$("#txtLoginValidCode").val();
				//var a=new RSAKey();
				//a.setPublic(RSAPublicKey,"10001");
				//d=a.encrypt(d);
				jQuery.post("/Payrent/index/dologin.html",{
					loginCode:b,password:d,vc:c
				}
				,function(e){
					if(e.resultCode==1){
						if(e.data!=null&&e.data.isNeedRealMobile){
							$("#divNeedValidMobile").show();
							PayRentJS.BindMobileServlet.isMustValidMobile=e.data.isMustRealMobile;
							if(e.data.isMustRealMobile){
								$("#divNeedValidMobile .iphdiv").show();
								$("#cancelValidMobile, #aTipValidMobile").hide()
							}
						}
						PayRentJS.LoginAndMobileRegServlet.bindLogin.successHander();
						RentHelperJS.loginChangeNav();
						PayRentJS.LoginAndMobileRegServlet.bindLogin.changeVC(true);
						return false
					}
					else{
						$("#txtLoginPassword").val("");
						if(e.data!=null&&e.data.isNeedVC){
							$("#divLoginValidCode").show();
							PayRentJS.LoginAndMobileRegServlet.bindLogin.changeVC(true)
						}
						else{
							$("#divLoginValidCode").hide()
						}
						$.showMsgBox(e.resultMsg);
						return false
					}
				},'json')
			}
			,successHander:function(){
				PayRentJS.RentOption.calculateRentData(false);
				$(".login_box").hide()
			}
		}
	}
	,RentOption:{
		minRentImgAmount:50000,rentExpense:0,isHasInsure:false,isRealNamed:false,insureId:0,isSubmitOption:false,init:function(b){
			PayRentJS.RentOption.minRentImgAmount=b.minRentImgAmount;
			PayRentJS.RentOption.offsetMonths=b.offsetMonths;
			PayRentJS.RentOption.rentBeginDate=new Date(b.rentBeginDate);
			PayRentJS.RentOption.rentMonths=b.rentMonths;
			PayRentJS.RentOption.rentExpense=b.rentExpense;
			PayRentJS.RentOption.isHasInsure=b.isHasInsure;
			PayRentJS.RentOption.insureId=b.insureId;
			PayRentJS.RentOption.isRealNamed=b.isRealNamed;
			$("#selPayMonths").change(PayRentJS.RentOption.changedPayMonths);
			$("#selMonthBegin").change(PayRentJS.RentOption.changedMonthBegin);
			$("input[name=chkArriveAccountType]").change(function(){
				PayRentJS.RentOption.calculateRentData(false)
			});
			$("#txtRentPayed, #txtDeposit").change(function(){
				PayRentJS.RentOption.calculateRentData(false)
			});
			$(".bluebtn a").click(PayRentJS.RentOption.saveOption);
			var c={
				successHandler:function(e,d){
					PayRentJS.RentOption.addRentOptionImg(d.data)
				}
				,category:b.imgCategory,owner:b.dataId
			};
			new ImageUpload("order",c);
			PayRentJS.RentOption.bindOrderImg($("#divOrderImg ul.upimg"));
			PayRentJS.RentOption.bindInsure();
			var a={
				payeePhone:b&&b.payeePhone?b.payeePhone:"",isMustValidMobile:b&&b.isMustValidMobile
			};
			PayRentJS.BindMobileServlet.init(a);
			PayRentJS.LoginAndMobileRegServlet.init(a);
			$("span[name=mboxtip]").hover(function(){
				$(this).attr("inmbox","1");
				$(this).find(".mbox").show()
			}
			,function(){
				var d=$(this);
				$(this).attr("inmbox","0");
				window.setTimeout(function(){
					if(d.attr("inmbox")!="1"){
						d.find(".mbox").hide()
					}
				}
				,350)
			})
		}
		,bindInsure:function(){
			if(!PayRentJS.RentOption.isHasInsure){
				return false
			}
			$(".institle .txt").hover(function(){
				$(this).find(".insurance_box").show()
			}
			,function(){
				$(this).find(".insurance_box").hide()
			});
			$(".insurance_list li:last-child").addClass("line");
			$("#chkIsInsured").change(function(){
				PayRentJS.RentOption.calculateRentData(false);
				if($(this).is(":checked")){
					$(".insurance_cont").show()
				}
				else{
					$(".insurance_cont").hide()
				}
			});
			$("input[name=insurePlan]").change(PayRentJS.RentOption.changePlan);
			$("input[name=insurePlanMonth]").change(PayRentJS.RentOption.changePlanMonth);
			var a=$("#divInsuredRecord");
			a.find("p span a").click(function(){
				var b=$(this).parents("span");
				b.hide();
				if(b.hasClass("t1")){
					a.find(".pay_insurance").show();
					a.find("p .t2").show()
				}
				else{
					a.find(".pay_insurance").hide();
					a.find("p .t1").show()
				}
			})
		}
		,changePlan:function(){
			if(PayRentJS.RentOption.reqPlanMonthsList){
				PayRentJS.RentOption.reqPlanMonthsList.abort()
			}
			PayRentJS.RentOption.reqPlanMonthsList=$.post("/payrent/getplanmonths.htm",{
				planId:$(this).val()
			}
			,function(d){
				if(d.resultCode!=1){
					$.showMsgBox("获取保险期限异常，请稍候再试");
					return false
				}
				var f=d.data.insurePlanMonthList;
				if(f==undefined||f==null){
					$.showMsgBox("获取保险期限异常，请稍候再试");
					return false
				}
				var b=new Array();
				for(var c=0,a=f.length;c<a;c++){
					var e=f[c];
					b.push('<span class="tt"><input type="radio" name="insurePlanMonth" fee="{0}" id="insurePlanMonth{1}" value="{1}" month="{2}"{3}>&nbsp;<label style="cursor:pointer" for="insurePlanMonth{1}">{4}个月</label>&nbsp;&nbsp;&nbsp;&nbsp;</span>'.format(e.insureFee,e.monthId,e.planMonths,c==0?' checked="checked"':"",e.planMonths))
				}
				$("#divPlanMonth").html(b.join(""));
				$("#insureFee").text(d.data.defaultInsureFee.format("0.##"));
				PayRentJS.RentOption.calculateRentData(false);
				PayRentJS.RentOption.bindInsure()
			})
		}
		,changePlanMonth:function(){
			$("#insureFee").text(Number($(this).attr("fee")).format("0.##"));
			PayRentJS.RentOption.calculateRentData(false)
		}
		,bindOrderImg:function(a){
			a.find("img").click(function(){
				$.showDialogPhoto($(this).attr("src"),"资料照片")
			});
			a.find("a").click(PayRentJS.RentOption.removeRentOptionImg)
		}
		,addRentOptionImg:function(a){
			$.post("addrentoptionimg.htm",{
				id:$.getQueryString("id"),rid:$.getQueryString("rid"),imgId:a.fileId,filePath:a.filePath,fileName:a.fileName
			}
			,function(c){
				if(c.resultCode==1){
					var d="{0}{1}n_{2}".format(a.staticDomain,a.filePath,a.fileName);
					var b=$('<li><p class="pic"><img src="{1}" title="查看大图" /></p><p><a href="javascript:;" imgid="{0}">删除</a></p></li>'.format(a.fileId,d));
					$("#divOrderImg .upimg").append(b);
					PayRentJS.RentOption.bindOrderImg(b)
				}
				else{
					$.showMsgBox(c.resultMsg)
				}
			})
		}
		,removeRentOptionImg:function(){
			var b=$(this);
			var a=b.attr("imgid");
			$.showConfirmBox("您确定要删除当前图片吗？",function(){
				$.post("removerentoptionimg.htm",{
					id:$.getQueryString("id"),rid:$.getQueryString("rid"),imgId:a
				}
				,function(c){
					if(c.resultCode==1){
						b.parents("li").remove()
					}
					else{
						$.showMsgBox(c.resultMsg)
					}
				})
			})
		}
		,changedPayMonths:function(){
			var d=Number($("#selPayMonths").val());
			var e=$("#selMonthBegin");
			var b=e.val();
			var g=new Array();
			for(var c=PayRentJS.RentOption.offsetMonths;c<PayRentJS.RentOption.rentMonths-d+1;c++){
				var f=PayRentJS.RentOption.rentBeginDate.addMonths(c);
				var a=f.format("yyyy-MM-dd");
				g.push('<option value="{0}"{1}>{0}</option>'.format(a,a==b?' selected="selected"':""))
			}
			$("#divRentPayed .paymonths").text(d+"个月租金总额：");
			e.html(g.join(""));
			PayRentJS.RentOption.changedMonthBegin();
			PayRentJS.RentOption.calculateRentData(true)
		}
		,changedMonthBegin:function(){
			var e=Number($("#selPayMonths").val());
			var d=Date.fromFormat($("#selMonthBegin").val());
			var f=PayRentJS.RentOption.rentBeginDate.getMonthOffset(d);
			var a=PayRentJS.RentOption.rentBeginDate.addMonths(e+f);
			var c="["+d.format("yyyy-MM-dd")+"至"+a.format("yyyy-MM-dd")+"]";
			if(jQuery.browser.msie&&jQuery.browser.version=="9.0"){
				var b=window.document.getElementById("spanPayMonthTip");
				b.innerText=c
			}
			else{
				$("#spanPayMonthTip").text(c)
			}
		}
		,calculateRentData:function(k){
			var g=Number($("#selPayMonths").val());
			var y=g*PayRentJS.RentOption.rentExpense;
			var c=Number($("#txtRentPayed").val()).toFixed(2);
			if(k||c<PayRentJS.RentOption.rentExpense||c>y){
				c=y;
				$("#txtRentPayed").val(c.format("0.##"))
			}
			$("#txtRentPayed").attr("rig","请输入租金总额，范围在"+PayRentJS.RentOption.rentExpense.format("0.##")+"-"+y.format("0.##")+"之间").attr("msg","请输入租金总额，范围在"+PayRentJS.RentOption.rentExpense.format("0.##")+"-"+y.format("0.##")+"之间").attr("max",y.format("0.##"));
			Validator.clearState($("#txtRentPayed"),true);
			var i=Number($("#txtDeposit").val()).toFixed(2);
			var n=Date.fromFormat($("#selMonthBegin").val());
			var t=PayRentJS.RentOption.rentBeginDate.getMonthOffset(n);
			var j=PayRentJS.RentOption.rentBeginDate.addMonths(g+t);
			var p=$.postJsonSync("/payrent/Index/getrentearnestrateandhandlemoneyrate.html",{
				id:$.getQueryString("id"),rid:$.getQueryString("rid"),monthBegin:n,monthEnd:j,orderMoney:c+i
			},{},'json');
			if(p.resultCode!=1){
				$.showMsgBox(p.resultMsg);
				return false
			}
			var l=p.data.rentHandleMoneyRateAndEarnestRate;
			var m=p.data.bankSupportT0;
			var q=l.earnestRate;
			var f=l.handleMoneyRateT1;
			var h=l.handleMoneyRateT0;
			var s=l.handleMoneyRateT1Discount;
			var e=l.handleMoneyRateT0Discount;
			var d=l.earnestRateDiscount;
			var b=l.isNormalUserLevel;
			var a=l.levelName;
			$("#spanT1HandleFeeRate").html(f>0?(f.format("0.##%")+"服务费"):"免费");
			$("#spanT0HandleFeeRate").text(h.format("0.##%"));
			$("#spanRentEarnestRate").text(q.format("#,##0.##%"));
			var z=0;
			var x=PayRentJS.RentOption.isHasInsure&&$("#chkIsInsured").is(":checked");
			if(x){
				z=Number($("#insureFee").text()).toFixed(2)
			}
			var w=x?0:((c+i)*q).toFixed(2);
			if(!b&&w>0){
				w=(w*d).toFixed(4)
			}
			if(w>0){
				$("#divEarnestMoney").show()
			}
			else{
				$("#divEarnestMoney").hide()
			}
			$("#divEarnestMoney strong").text(w.format("#,##0.##"));
			if(m.serviceBegin.length>0&&m.serviceEnd.length>0){
				$("#spanT0ServiceTime").text("({0}-{1})".format(m.serviceBegin,m.serviceEnd))
			}
			if(m.isSupportT0){
				$("#chkArriveAccountType2").attr("disabled",false);
				$("#labArriveAccountType2").removeClass("fgray")
			}
			else{
				$("#chkArriveAccountType2").attr("disabled",true);
				$("#chkArriveAccountType1").attr("checked",true);
				if(!$("#labArriveAccountType2").hasClass("fgray")){
					$("#labArriveAccountType2").addClass("fgray")
				}
			}
			var o=f;
			var v=s;
			if($("#chkArriveAccountType2").is(":checked")){
				o=h;
				v=e
			}
			if(b){
				$("#spanEarnestRateDiscount,#spanHandleRateDiscount").html("")
			}
			else{
				$("#spanEarnestRateDiscount").html("({0}{1})".format(a,d!=0?(d*10).toFixed(1)+"折":"免费"));
				$("#spanHandleRateDiscount").html("({0}{1})".format(a,v!=0?(v*10).toFixed(1)+"折":"免费"))
			}
			var u=0;
			u=((c+i)*o).toFixed(2);
			if(!b){
				u=(u*v).toFixed(2)
			}
			$("#divHandleMoney strong").text(u.format("#,##0.##"));
			var r=c+i+w+u+z;
			$("#divAmountMoney .forange").text(r.format("#,##0.##"));
			if(r>=PayRentJS.RentOption.minRentImgAmount){
				$("#divOrderImg").show()
			}
			else{
				$("#divOrderImg").hide()
			}
		}
		,saveOption:function(){
			if(PayRentJS.BindMobileServlet.isMustValidMobile){
				PayRentJS.BindMobileServlet.doBindMobile();
				return false
			}
			if(PayRentJS.RentOption.isSubmitOption||!Validator.validateForm()){
				return false
			}
			var a=PayRentJS.RentOption.isHasInsure&&$("#chkIsInsured").is(":checked");
			if(a&&!$("#chkConfirmInsure").is(":checked")){
				$.shake($("#chkConfirmInsure").next(),"shakered",3);
				return false
			}
			var b=$("input[name=insurePlan]:checked").val();
			if(b==undefined||!b){
				b=$("input[name=insurePlan]:eq(0)").val()
			}
			PayRentJS.RentOption.isSubmitOption=true;
			$.post("/payrent/Index/rentoption.html",{
				id:$.getQueryString("id"),rid:$.getQueryString("rid"),payMonths:$("#selPayMonths").val(),payMonthBegin:$("#selMonthBegin").val(),rentPayed:$("#txtRentPayed").val(),deposit:$("#txtDeposit").val(),arriveAccountType:$("#chkArriveAccountType1").attr("checked")=="checked"?1:2,comment:$("#txtComment").val(),isInsured:a,insureId:PayRentJS.RentOption.insureId,insurePlanId:b,insurePlanMonthId:$("input[name=insurePlanMonth]:checked").val(),insurePlanMonths:$("input[name=insurePlanMonth]:checked").attr("month"),applicantName:PayRentJS.RentOption.isRealNamed?$("#spanUserName").text():$("#txtName").val(),credentialNo:PayRentJS.RentOption.isRealNamed?$("#spanIdCard").text():$("#txtIdCard").val(),isValidMobile:validMobile
			}
			,function(c){
				if(c.resultCode==1){
					return $.doUrlRedirt("onlinepay.htm?id="+encodeURIComponent(c.data))
				}
				else{
					PayRentJS.RentOption.isSubmitOption=false;
					if(c.resultCode==-1){
						PayRentJS.LoginAndMobileRegServlet.showLoginBox()
					}
					else{
						if(c.resultCode==-2){
							$("#divNeedValidMobile, #divNeedValidMobile .iphbox").show()
						}
						$.showMsgBox(c.resultMsg)
					}
				}
			},"json")
		}
	}
	,OnlinePay:{
		isAllowInstallment:false,isOnlyInstallment:false,amountMoney:0,unpayMoney:0,init:function(b){
			if(b){
				PayRentJS.OnlinePay.isAllowInstallment=b.isAllowInstallment;
				PayRentJS.OnlinePay.isOnlyInstallment=b.isOnlyInstallment;
				PayRentJS.OnlinePay.amountMoney=b.amountMoney;
				PayRentJS.OnlinePay.unpayMoney=b.unpayMoney
			}
			$(".linepay_btn a").click(PayRentJS.OnlinePay.showRechargePannel);
			$(".pm_title ul li").click(PayRentJS.OnlinePay.changeTab);
			$("#divPayChannel li").hover(function(){
				$(this).find(".btxt-box").show()
			}
			,function(){
				$(this).find(".btxt-box").hide()
			});
			$(".pm_cont img,.selectpayimg").click(function(){
				$(this).parents("li").eq(0).find("input[type=radio]").click()
			});
			$(".pm_cont input[type=radio]").click(function(){
				$(this).parents(".pm_cont").eq(0).find(".selectpayimg").removeClass("on");
				$(this).parents("li").eq(0).find(".selectpayimg").addClass("on")
			});
			$("#linkMoreQuickPayment2").click(function(){
				PayRentJS.OnlinePay.showMoreBank(2,2)
			});
			$("#linkMoreOnlineBank2").click(function(){
				PayRentJS.OnlinePay.showMoreBank(2,4)
			});
			$("#linkMoreQuickPayment4").click(function(){
				PayRentJS.OnlinePay.showMoreBank(4,2)
			});
			$("#linkMoreOnlineBank4").click(function(){
				PayRentJS.OnlinePay.showMoreBank(4,4)
			});
			$(".bluebtn a").click(PayRentJS.OnlinePay.doConfirmPay);
			if(PayRentJS.OnlinePay.isAllowInstallment){
				var a=$("#divInstalmentPlan");
				a.find("input[type=radio]").change(function(){
					var c=a.find("input[type=radio]:checked");
					if(c.length==0){
						return
					}
					a.find(".paystaging dl dt").text(c.parents("li").find("img").attr("alt"));
					PayRentJS.OnlinePay.changedInstallmentBank(c,a.find(".paystaging select"),$(".paystaging dl .tt1 .forange"),$(".paystaging dl .tt p .forange"))
				});
				a.find(".paystaging select").change(function(){
					PayRentJS.OnlinePay.calculateInstallment($(".paystaging select"),$(".paystaging dl .tt1 .forange"),$(".paystaging dl .tt p .forange"))
				})
			}
			PayRentJS.OnlinePay.defaultChannel=$("#divPayChannel,#divCreditCard,#divDepositCard").find("input[type=radio]:checked").parents("li").eq(0);
			if($(".pm_title ul li.on").length==0){
				$(".pm_title ul li").eq(0).click()
			}
			if($(".pm_cont:visible input[type=radio]:checked").length==0){
				$(".pm_cont:visible input[type=radio]").eq(0).attr("checked",true).click()
			}
			PayRentJS.OnlinePay.ansyLoadUserBankCard()
		}
		,ansyLoadUserBankCard:function(){
			if($(".pay-bank-loading").length>0){
				PayRentJS.OnlinePay.reqUserBankCard=$.post("/payrent/getuserbankcardlist.htm",{},function(a){
					var b=null;
					if(a.resultCode==1){
						b=a.data
					}
					PayRentJS.OnlinePay.parseUserBankCard(b)
				});
				PayRentJS.OnlinePay.reqUserBankCardTimer=window.setTimeout(function(){
					PayRentJS.OnlinePay.parseUserBankCard(null)
				}
				,2000)
			}
		}
		,parseUserBankCard:function(a){
			PayRentJS.OnlinePay.reqUserBankCard&&PayRentJS.OnlinePay.reqUserBankCard.abort();
			PayRentJS.OnlinePay.reqUserBankCard=null;
			PayRentJS.OnlinePay.reqUserBankCardTimer&&window.clearTimeout(PayRentJS.OnlinePay.reqUserBankCardTimer);
			PayRentJS.OnlinePay.reqUserBankCardTimer=null;
			if(a==null||a.length==0){
				$("ul[name=quickPayChannel]").show();
				$(".pay-bank-loading").remove()
			}
			else{
				var d=new Array();
				var e=new Array();
				for(var c=0;c<a.length;c++){
					var b=a[c];
					if(b.gatewayType==2){
						d.push("<li>");
						d.push('<span class="fl radio"><input type="radio" name="idNetPay4" gatewaytype="2" channeltype="2" channelid="{0}" bankid="{1}" bankcode="{2}" insticode="{3}"></span>'.format(b.channelId,b.bankId,b.bankCode,b.instiCode));
						d.push('<div class="selectpayimg"><img src="{0}{1}" alt="{2}" width="113" height="35"><span class="txtcon">**{3}</span></div>'.format(Config.StaticDomain,b.logoUrl,b.bankName,b.cardNo));
						d.push("</li>")
					}
					else{
						if(b.gatewayType==4){
							e.push("<li>");
							e.push('<span class="fl radio"><input type="radio" name="idNetPay2" gatewaytype="4" channeltype="2" channelid="{0}" bankid="{1}" bankcode="{2}" insticode="{3}"></span>'.format(b.channelId,b.bankId,b.bankCode,b.instiCode));
							e.push('<div class="selectpayimg"><img src="{0}{1}" alt="{2}" width="113" height="35"><span class="txtcon">**{3}</span></div>'.format(Config.StaticDomain,b.logoUrl,b.bankName,b.cardNo));
							e.push("</li>")
						}
					}
				}
				if(d.length>0){
					$("#divCreditCard ul[name=quickPayChannel] input").parents("li").remove();
					$(d.join("")).insertBefore($("#divCreditCard ul[name=quickPayChannel] li").eq(0));
					$("#divCreditCard img,#divCreditCard .selectpayimg").click(function(){
						$(this).parents("li").eq(0).find("input[type=radio]").click()
					});
					$("#divCreditCard input[type=radio]").click(function(){
						$(this).parents(".pm_cont").eq(0).find(".selectpayimg").removeClass("on");
						$(this).parents("li").eq(0).find(".selectpayimg").addClass("on")
					});
					$("#divCreditCard  ul[name=quickPayChannel] input[type=radio]").eq(0).attr("checked",true).click()
				}
				if(e.length>0){
					$("#divDepositCard ul[name=quickPayChannel] input").parents("li").remove();
					$(e.join("")).insertBefore($("#divDepositCard ul[name=quickPayChannel] li").eq(0));
					$("#divDepositCard img,#divDepositCard .selectpayimg").click(function(){
						$(this).parents("li").eq(0).find("input[type=radio]").click()
					});
					$("#divDepositCard input[type=radio]").click(function(){
						$(this).parents(".pm_cont").eq(0).find(".selectpayimg").removeClass("on");
						$(this).parents("li").eq(0).find(".selectpayimg").addClass("on")
					});
					$("#divDepositCard  ul[name=quickPayChannel] input[type=radio]").eq(0).attr("checked",true).click()
				}
				$("ul[name=quickPayChannel]").show();
				$(".pay-bank-loading").remove()
			}
		}
		,changeTab:function(){
			var a=$(this);
			if(a.hasClass("on")){
				return
			}
			$(".pm_title ul li").removeClass("on");
			a.addClass("on");
			$(".payment .pm_cont").hide();
			var b=$("#"+a.attr("target"));
			b.show();
			if(b.find("input[type=radio]:checked").length==0){
				b.find("input[type=radio]").eq(0).click()
			}
		}
		,showMoreBank:function(c,a,b,d){
			$.post("getmorebank.html",{
				gatewayType:c,channelType:a
			}
			,function(h){
				if(h.resultCode==1){
					var f="";
					for(var g=0;g<h.data.length;g++){
						var k=h.data[g];
						f+=OriginalStringJS.payRentMoreBankItem.format(c,a,k.channelId,k.bankId,$.HTMLEncode(k.bankCode),$.HTMLEncode(k.instiCode),Config.StaticDomain+k.logoUrl,$.HTMLEncode(k.name),a==2?"网银":"")
					}
					if(!b){
						b="确认支付"
					}
					var j=OriginalStringJS.payRentMoreBankHtml.format(f,b);
					var e=$(j);
					e.dialog({
						title:"更多{0}银行".format(a==2?"快捷支付":"网上"),modal:true,width:635
					});
					e.find("img,.selectpayimg").click(function(){
						$(this).parents("li").eq(0).find("input[type=radio]").click()
					});
					e.find("input[type=radio]").click(function(){
						$(this).parents(".pm_cont").eq(0).find(".selectpayimg").removeClass("on");
						$(this).parents("li").eq(0).find(".selectpayimg").addClass("on")
					});
					e.find("input[type=radio]").eq(0).click();
					e.find(".bluebtn a").click(function(){
						var i=e.find("input[type=radio]:checked");
						if(i.length==0){
							$.showMsgBox("请先选择支付方式！");
							return
						}
						if(d&&$.isFunction(d)){
							d(i);
							e.dialog("destroy");
							return
						}
						var l=0;
						PayRentJS.OnlinePay.doNetPay(2,i.attr("gatewayType"),i.attr("channelType"),i.attr("channelId"),i.attr("bankId"),i.attr("instiCode"),i.attr("bankCode"),l,PayRentJS.OnlinePay.unpayMoney);
						e.dialog("destroy")
					})
				}
				else{
					$.showMsgBox(h.resultMsg)
				}
			},'json')
		}
		,showRechargePannel:function(){
			if(!PayRentJS.OnlinePay.isOnlyInstallment){
				PayRentJS.OnlinePay.showNormalRechargePannel()
			}
			else{
				PayRentJS.OnlinePay.showInstallmentRechargePannel()
			}
		}
		,showNormalRechargePannel:function(){
			var e='<div class="pm_cont pm_cont1 fl" style="width:570px;margin:0"><ul class="pay-bank clearfix" style="margin-bottom:0">';
			var a=$("#divPayChannel ul li");
			a.each(function(){
				e+=$(this).outerHTML()
			});
			if(PayRentJS.OnlinePay.defaultChannel.length>0){
				var h=PayRentJS.OnlinePay.defaultChannel.find("input");
				var c=h.attr("channelId"),j=h.attr("bankId");
				if($("#divPayChannel ul li input[channelId={0}][bankId={1}]".format(c,j)).length==0){
					e+=PayRentJS.OnlinePay.defaultChannel.outerHTML()
				}
			}
			e=e.replace(/idNetPay\d+/g,"idNetPay0");
			if($("#divCreditCard,#divDepositCard").length>0){
				e+='<li><a id="linkMoreBank" class="f12" href="###">更多银行&gt;&gt;</a></li></ul></div>'
			}
			var g=(PayRentJS.OnlinePay.amountMoney-PayRentJS.OnlinePay.unpayMoney).toFixed(2);
			var k=OriginalStringJS.payRentRechargeBoxHtml.format(PayRentJS.OnlinePay.amountMoney.format("#,##0.##"),$("#spanRechargeAccount").html(),g.format("#,##0.##"),PayRentJS.OnlinePay.unpayMoney.format("0.##"),PayRentJS.OnlinePay.unpayMoney>5000?OriginalStringJS.payRentRecharge5000Tip:"",e,PayRentJS.OnlinePay.unpayMoney>5000?"5000":PayRentJS.OnlinePay.unpayMoney.format("0.##"));
			var f=$(k);
			f.dialog({
				title:"付房租充值",modal:true,width:740
			});
			f.find("li").hover(function(){
				$(this).find(".btxt-box").show()
			}
			,function(){
				$(this).find(".btxt-box").hide()
			});
			f.find("img,.selectpayimg").click(function(){
				$(this).parents("li").eq(0).find("input[type=radio]").click()
			});
			f.find("input[type=radio]").click(function(){
				$(this).parents(".pm_cont").eq(0).find(".selectpayimg").removeClass("on");
				$(this).parents("li").eq(0).find(".selectpayimg").addClass("on")
			});
			var d=f.find("input[type=radio]:checked");
			if(d.length==0){
				f.find("input[type=radio]").eq(0).attr("checked",true).click()
			}
			else{
				if(d.length>1){
					for(var b=0;b<d.length-1;b++){
						d.eq(b).attr("checked",false)
					}
					d.eq(d.length-1).click()
				}
				else{
					d.click()
				}
			}
			$("#linkMoreBank").click(PayRentJS.OnlinePay.showRechargeMoreBank);
			Validator.bind($(".recharge_box"));
			f.find(".rent_btn a").click(PayRentJS.OnlinePay.doRecharge)
		}
		,showRechargeMoreBank:function(){
			var j='<div class="rechargemorebank"><div class="rtitle clearfix"><ul>{0}</ul></div>{1}<div class="bluebtn" style="margin-bottom:20px;"><span class="bluebtn_left"></span><a class="bluebtn_middle" href="###">确定</a><span class="bluebtn_right"></span></div></div>';
			var d="";
			var h=$(".payment .pm_title ul li");
			var f=0;
			h.each(function(){
				var i=$(this);
				if(i.attr("target")!="divPayChannel"&&i.attr("target")!="divInstalmentPlan"){
					d+='<li class="{0}{1}" target="{2}01">{3}</li>'.format(i.hasClass("on")?"on":"",f==0?" lline":"",i.attr("target"),i.html());
					f++
				}
			});
			var a="";
			$(".payment .pm_cont").each(function(){
				if($(this).attr("id")!="divPayChannel"&&$(this).attr("id")!="divInstalmentPlan"){
					var i=$($(this).outerHTML());
					if(i.find("ul li a").length>0){
						i.find("ul li a").each(function(){
							var n=$(this).parents("ul").eq(0);
							var m=n.find("li");
							var l=m.length;
							if(l>6){
								for(var k=l-3;k>3;k--){
									m.eq(k-1).remove()
								}
							}
						})
					}
					i.attr("id",i.attr("id")+"01");
					a+=i.outerHTML()
				}
			});
			a=a.replace(/idNetPay/g,"idNetPay0");
			var g=$(j.format(d,a));
			if(g.find(".rtitle ul li.on").length==0){
				var b=g.find(".rtitle ul li").eq(0);
				b.addClass("on");
				g.find("[id={0}]".format(b.attr("target"))).show()
			}
			g.dialog({
				title:"更多充值银行",modal:true,width:680
			});
			g.find(".rtitle ul li").click(function(){
				var i=$(this);
				if(i.hasClass("on")){
					return
				}
				g.find(".rtitle ul li").removeClass("on");
				i.addClass("on");
				g.find(".pm_cont").hide();
				var k=$("#"+i.attr("target"));
				k.show();
				if(k.find("input[type=radio]:checked").length==0){
					k.find("input[type=radio]").eq(0).click()
				}
			});
			$("#divPayChannel01 li").hover(function(){
				$(this).find(".btxt-box").show()
			}
			,function(){
				$(this).find(".btxt-box").hide()
			});
			g.find(".pm_cont img,.selectpayimg").click(function(){
				$(this).parents("li").eq(0).find("input[type=radio]").click()
			});
			g.find(".pm_cont input[type=radio]").click(function(){
				$(this).parents(".pm_cont").eq(0).find(".selectpayimg").removeClass("on");
				$(this).parents("li").eq(0).find(".selectpayimg").addClass("on")
			});
			g.find(".pm_cont:visible input[type=radio]:checked").click();
			g.find("[id=linkMoreQuickPayment2]").click(function(){
				PayRentJS.OnlinePay.showMoreBank(2,2,"确定",function(i){
					g.dialog("destroy");
					PayRentJS.OnlinePay.confirmMoreRechargeChannel(i)
				})
			});
			g.find("[id=linkMoreOnlineBank2]").click(function(){
				PayRentJS.OnlinePay.showMoreBank(2,4,"确定",function(i){
					g.dialog("destroy");
					PayRentJS.OnlinePay.confirmMoreRechargeChannel(i)
				})
			});
			g.find("[id=linkMoreOnlineBank4]").click(function(){
				PayRentJS.OnlinePay.showMoreBank(4,4,"确定",function(i){
					g.dialog("destroy");
					PayRentJS.OnlinePay.confirmMoreRechargeChannel(i)
				})
			});
			var e=g.find(".pm_cont:visible input[type=radio]:checked");
			if(e.length==0){
				g.find(".pm_cont:visible input[type=radio]").eq(0).attr("checked",true).click()
			}
			else{
				if(e.length>1){
					for(var c=0;c<e.length-1;c++){
						e.eq(c).attr("checked",false)
					}
					e.eq(e.length-1).click()
				}
				else{
					e.click()
				}
			}
			g.find(".bluebtn a").click(function(){
				var i=g.find(".pm_cont:visible input[type=radio]:checked");
				if(i.length==0){
					$.showMsgBox("请先选择支付方式！");
					return
				}
				PayRentJS.OnlinePay.confirmMoreRechargeChannel(i);
				g.dialog("destroy")
			})
		}
		,confirmMoreRechargeChannel:function(d){
			var e=false;
			var a=d.attr("channelId");
			targetBankId=d.attr("bankId");
			targetBankCode=d.attr("bankCode");
			$(".recharge_box .pm_cont ul li input[type=radio]").each(function(){
				var f=$(this);
				if(f.attr("channelId")==a&&f.attr("bankId")==targetBankId&&f.attr("bankCode")==targetBankCode){
					f.attr("checked",true).click();
					e=true
				}
			});
			if(e){
				return
			}
			var c=$(".recharge_box .pm_cont ul li");
			if(c.length>=6){
				c.eq(3).remove()
			}
			c.find("input[type=radio]").attr("checked",false);
			var b=$(d.parents("li").eq(0).outerHTML());
			b.find("input").attr("name","idNetPay0");
			b.insertBefore(c[c.length-1]);
			b.find("img,.selectpayimg").click(function(){
				$(this).parents("li").eq(0).find("input[type=radio]").click()
			});
			b.find("input[type=radio]").click(function(){
				$(this).parents(".pm_cont").eq(0).find(".selectpayimg").removeClass("on");
				$(this).parents("li").eq(0).find(".selectpayimg").addClass("on")
			});
			b.find("input").attr("checked",true).click()
		}
		,genInstallmentSelectOptions:function(f,c){
			var b=f.split(",");
			var e=c.split(",");
			var d="";
			for(var a=0;a<b.length;a++){
				if(a>=e.length){
					break
				}
				var g=Number(b[a]);
				var h=Number(e[a]);
				d+='<option value="'+g+'" rate="'+h+'">'+g+"期</option>"
			}
			return d
		}
		,showInstallmentRechargePannel:function(){
			var g="";
			var a=$("#divInstalmentPlan ul li");
			var f=a.find("input:checked").parents("li");
			var k=f.find("input");
			var b=f.find("img");
			var i=PayRentJS.OnlinePay.genInstallmentSelectOptions(k.attr("count"),k.attr("rate"));
			var e=Number(k.attr("count").split(",")[0]);
			var d=Number(k.attr("rate").split(",")[0]);
			var j=PayRentJS.OnlinePay.amountMoney*(1+d).toFixed(2);
			var c=(j/e).toFixed(2);
			a.each(function(){
				var m=$(this).find("input");
				var n=$(this).find("img");
				g+=OriginalStringJS.payRentInstallmentRechargeChannel.format(m.attr("instiCode"),m.attr("bankCode"),m.attr("bankName"),n.attr("src"),m.attr("count"),m.attr("rate"),m.attr("gatewayType"),m.attr("channelType"),m.attr("channelId"),m.attr("bankId"))
			});
			var h=PayRentJS.OnlinePay.amountMoney-PayRentJS.OnlinePay.unpayMoney;
			var l=OriginalStringJS.payRentInstallmentRechargeBoxHtml.format(PayRentJS.OnlinePay.amountMoney.format("#,##0.##"),$("#spanRechargeAccount").html(),h.format("#,##0.##"),PayRentJS.OnlinePay.unpayMoney.format("0.##"),PayRentJS.OnlinePay.unpayMoney>5000?OriginalStringJS.payRentRecharge5000Tip:"",b.attr("src"),k.attr("bankName"),k.attr("instiCode"),k.attr("bankCode"),k.attr("count"),k.attr("rate"),k.attr("gatewayType"),k.attr("channelType"),k.attr("channelId"),k.attr("bankId"),i,c.format("#,##0.##"),j.format("#,##0.##"),g,PayRentJS.OnlinePay.unpayMoney>5000?"5000":PayRentJS.OnlinePay.unpayMoney.format("0.##"));
			$(l).dialog({
				title:"付房租分期充值",modal:true,width:700
			});
			$(".recharge_box .codeimg01").click(function(){
				$(".bank_staging").toggle()
			});
			$(".bank_staging li img").click(function(){
				var n=$(this);
				var q=$(".recharge_box .codeimg01 .codetxt1 img");
				$(".bank_staging").hide();
				if(q.attr("instiCode")==n.attr("instiCode")&&q.attr("bankCode")==n.attr("bankCode")){
					return
				}
				var p=["instiCode","bankCode","alt","src","count","rate","gatewayType","channelType","channelId","bankId"];
				for(var o=0;o<p.length;o++){
					q.attr(p[o],n.attr(p[o]))
				}
				var m=$(".recharge_box .codeimg .statxt span .forange");
				PayRentJS.OnlinePay.changedInstallmentBank(n,$(".recharge_box .codeimg .statxt select"),$(m[1]),$(m[0]),$("#idRechargeMoney"))
			});
			$("#idRechargeMoney").change(function(){
				var m=$(".recharge_box .codeimg .statxt span .forange");
				PayRentJS.OnlinePay.calculateInstallment($(".recharge_box .codeimg .statxt select"),$(m[1]),$(m[0]),$("#idRechargeMoney"))
			});
			$("#idRechargeMoney").change();
			$(".recharge_box .codeimg .statxt select").change(function(){
				var m=$(".recharge_box .codeimg .statxt span .forange");
				PayRentJS.OnlinePay.calculateInstallment($(".recharge_box .codeimg .statxt select"),$(m[1]),$(m[0]),$("#idRechargeMoney"))
			});
			Validator.bind($(".recharge_box"));
			$(".recharge_box .rent_btn a").click(PayRentJS.OnlinePay.doRecharge)
		}
		,changedInstallmentBank:function(b,f,e,c,a){
			var d=PayRentJS.OnlinePay.genInstallmentSelectOptions(b.attr("count"),b.attr("rate"));
			f.html(d);
			PayRentJS.OnlinePay.calculateInstallment(f,e,c,a)
		}
		,calculateInstallment:function(i,h,a,b){
			var g=i.val();
			var e=i.find("option:[value="+g+"]");
			var f=e.attr("rate");
			f=Number(f);
			g=Number(g);
			var d=PayRentJS.OnlinePay.unpayMoney;
			if(b){
				d=Number(b.val())
			}
			var j=(d*(1+f)).toFixed(2);
			var c=(j/g).toFixed(2);
			a.text(c.format("#,##0.##"));
			h.text(j.format("#,##0.##"))
		}
		,doConfirmPay:function(){
			var b=$(".pm_cont:visible");
			var a=b.find("input[type=radio]:checked");
			if(a.length==0){
				$.showMsgBox("请先选择支付方式！");
				return
			}
			var c=0;
			if(b.attr("id")=="divInstalmentPlan"){
				c=b.find(".paystaging select").val()
			}
			PayRentJS.OnlinePay.doNetPay(2,a.attr("gatewayType"),a.attr("channelType"),a.attr("channelId"),a.attr("bankId"),a.attr("instiCode"),a.attr("bankCode"),c,PayRentJS.OnlinePay.unpayMoney)
		}
		,doRecharge:function(){
			if(!Validator.validateForm($(".recharge_box"))){
				return
			}
			var a;
			var c=0;
			var b=Number($("#idRechargeMoney").val());
			if(b<0||b>PayRentJS.OnlinePay.unpayMoney){
				$.showMsgBox("请输入正确的充值金额！");
				return
			}
			if(!PayRentJS.OnlinePay.isOnlyInstallment){
				a=$(".recharge_box input[type=radio]:checked");
				if(a.length==0){
					$.showMsgBox("请先选择充值方式！");
					return
				}
			}
			else{
				a=$(".recharge_box .codeimg .codeimg01 .codetxt1 img");
				c=$(".recharge_box .codeimg .statxt select").val()
			}
			PayRentJS.OnlinePay.doNetPay(1,a.attr("gatewayType"),a.attr("channelType"),a.attr("channelId"),a.attr("bankId"),a.attr("instiCode"),a.attr("bankCode"),c,b)
		}
		,doNetPay:function(i,h,e,d,f,b,a,g,c){
			PayRentJS.OnlinePay.checkRealName(b,e,function(){
				var k=OriginalStringJS.payRentDoNetPayForm.format($.getQueryString("id"),i,h,e,d,f,window.encodeURIComponent(b),window.encodeURIComponent(a),g,c,new Date().getTime());
				var j=$(k);
				$(window.document.body).append(j);
				var l=$(OriginalStringJS.payRentPayedTip);
				l.dialog({
					title:"温馨提示",modal:true,width:500,height:230
				});
				l.find("a").click(function(){
					return $.reloadUrl()
				});
				j.submit();
				j.remove()
			})
		}
		,checkRealName:function(d,b,e){
			var c=$(".bluebtn");
			if(c.attr("realNameChannelCode")==d&&c.attr("needInputRealName")=="true"&&(b=="1"||b=="2")){
				var f='<div class="netpayrealname"><div class="netpayrealname_cont"><div class="netpayrealname_tip">首次支付请先补充您的资料，支付完成后即完成实名认证！</div><div id="divRealNameMsg" style="display:none; padding-left:130px;"></div><div class="item clearfix"><label class="lab">姓名：</label><div class="element"><input type="text" id="txtUserName" class="text" dataType="UserName" require="true" msg="请输入您的真实姓名" msgConId="divRealNameMsg" placeholder="如:张三" value="{0}" /></div></div><div class="item clearfix"><label class="lab">身份证号：</label><div class="element"><input type="text" id="txtIdCardNo" class="text" dataType="IdCard" require="true" msg="请输入您的身份证号" msgConId="divRealNameMsg" value="{1}" /></div></div><div class="item clearfix"><label class="lab">&nbsp;</label><div class="realname_btn fl"><span class="rbtn_left"></span><a class="rbtn_middle" href="javascript:void(0)">确定</a><span class="rbtn_right"></span></div></div></div></div>';
				var a=$(f.format(c.attr("userName"),c.attr("idCardNo")));
				a.dialog({
					title:"补充信息",modal:true,width:480
				});
				Validator.bind(a);
				a.find(".realname_btn").bind("click",function(){
					if(!Validator.validateForm(a)){
						return
					}
					var g=$("#txtUserName").val().trim();
					var i=$("#txtIdCardNo").val().trim();
					var h=$.postJsonSync("/account/saveusernameidcard.htm",{
						userName:g,idCardNo:i
					});
					if(h.resultCode!=1){
						Validator.showMsg($("#txtUserName"),h.resultMsg);
						return
					}
					c.attr("userName",g).attr("idCardNo",i);
					a.dialog("destroy");
					e()
				})
			}
			else{
				e()
			}
		}
	}
	,AnonymPay:{
		id:null,init:function(a){
			$("img[name=imgVerifyCode]").click(PayRentJS.AnonymPay.changeVC);
			$("img[name=imgVerifyCode]").parent().parent().find("a").click(PayRentJS.AnonymPay.changeVC);
			$(".mpay-left .bluebtn a").click(LoginJS.doLogin);
			$(".mpay-right .bluebtn a").click(PayRentJS.AnonymPay.verifyCode);
			LoginJS.init();
			LoginJS.loggedHandler=function(){
				return $.reloadUrl()
			};
			if(a){
				PayRentJS.AnonymPay.id=a.id
			}
		}
		,changeVC:function(){
			$("img[name=imgVerifyCode]").attr("src","/Api/Checkcode/index?t="+new Date().getTime());
			return false
		}
		,verifyCode:function(){
			if(!Validator.validateForm($(".mpay-right"))){
				Validator.showMsg($(".mpay-right input"),"验证码错误");
				return
			}
			var b=$.postJsonSync("/Member/index/checkimgvc.htm",{
				vcString:$(".mpay-right input").val()
			});
			var a=b.resultCode==1&&b.data;
			if(!a){
				$(".mpay-right input").val("");
				PayRentJS.AnonymPay.changeVC();
				Validator.showMsg($(".mpay-right input"),"验证码错误");
				return
			}
			return $.doUrlRedirt("/payrent/onlinepay.htm?id="+encodeURIComponent(PayRentJS.AnonymPay.id))
		}
	}
	,AnonymPaysh:{
		init:function(a){
			PayRentJS.AnonymPaysh.isAllowAnonymCharge=a.isAllowAnonymCharge;
			$(".rent_btn a").click(function(){
				var b=$(this).attr("orderNo");
				PayRentJS.AnonymPaysh.doVerifyNetPay(b)
			})
		}
		,doVerifyNetPay:function(a){
			if(!PayRentJS.AnonymPaysh.isAllowAnonymCharge&&!LoginJS.isLogged){
				LoginJS.loggedHandler=function(){
					PayRentJS.ChargeRentPush.doVerifyNetPay(a)
				};
				LoginJS.showLoginPanel()
			}
			else{
				if(!PayRentJS.AnonymPaysh.isAllowAnonymCharge&&!LoginJS.isRealMobile){
					$(OriginalStringJS.unBindMobileTip).dialog({
						title:"温馨提示",modal:true,width:400,buttons:[{
							text:"立即绑定手机号","class":"comm_dialog_btn_save",click:function(){
								return $.doUrlRedirt("/Member/safe/bindmobile.htm")
							}
						}
						]
					})
				}
				else{
					PayRentJS.ChargeRentPush.doNetPay(a)
				}
			}
		}
		,doNetPay:function(a){
			return $.doUrlRedirt("/payrent/onlinepay.htm?id="+window.encodeURIComponent(a))
		}
	}
	,ConfirmRent:{
		isRealNamed:true,init:function(a){
			if(a){
				PayRentJS.ConfirmRent.isRealNamed=a.isRealNamed
			}
			$(".bluebtn a").click(PayRentJS.ConfirmRent.doConfirmRent);
			$(".fblack").click(function(){
				$("#chkConfirm").attr("checked",$("#chkConfirm").attr("checked")!="checked")
			})
		}
		,doConfirmRent:function(){
			if(!$(".con-bank input").is(":checked")){
				$(".con-bank .tt").removeClass("fred").addClass("fred");
				return
			}
			if(PayRentJS.ConfirmRent.isRealNamed){
				PayRentJS.ConfirmRent.saveConfirmRent()
			}
			else{
				$(OriginalStringJS.unRealNameTip).dialog({
					title:"温馨提示",modal:true,width:400,buttons:[{
						text:"立即实名认证","class":"comm_dialog_btn_save",click:function(){
							return $.doUrlRedirt("/account/safe/realname.htm")
						}
					}
					,{
						text:"稍后认证，继续支付","class":"comm_dialog_btn_cancel",click:function(){
							PayRentJS.ConfirmRent.saveConfirmRent()
						}
					}
					]
				})
			}
		}
		,saveConfirmRent:function(){
			$.post("/Payrent/Index/doconfirmrent.htm",{
				id:$.getQueryString("id")
			}
			,function(a){
				if(a.resultCode==1){
					return $.doUrlRedirt("onlinepay.htm?id="+encodeURIComponent($.getQueryString("id")))
				}
				else{
					$.showMsgBox(a.resultMsg)
				}
			})
		}
	}
	,RentDetail:{
		init:function(a){
			$(".txtmore a").click(function(){
				$("#ulPayDetails li").show();
				$(this).parents("p").eq(0).remove()
			});
			var b={
				successHandler:function(f,d){
					var e=d.data.staticDomain+d.data.filePath+"n_"+d.data.fileName;
					var c=$('<li><p class="pic"><img src="{1}" title="查看大图" /></p><p><a href="javascript:;" imgid="{0}">删除</a></p></li>'.format(d.data.fileId,e));
					$(".upimg").append(c);
					PayRentJS.RentDetail.bindOrderImg(c)
				}
				,category:a.imgCategory,owner:a.dataId
			};
			new ImageUpload("orderImg",b);
			PayRentJS.RentDetail.bindOrderImg($(".upimg"))
		}
		,bindOrderImg:function(a){
			a.find("img").click(function(){
				$.showDialogPhoto($(this).attr("src"),"证件资料照片")
			});
			a.find("a").click(PayRentJS.RentDetail.removeOrderImg)
		}
		,removeOrderImg:function(){
			var b=$(this);
			var a=b.attr("imgid");
			$.showConfirmBox("您确定要删除当前图片吗？",function(){
				$.post("/payrent/removeorderimg.htm",{
					id:$.getQueryString("id"),imgId:a
				}
				,function(c){
					if(c.resultCode==1){
						b.parents("li").remove()
					}
					else{
						$.showMsgBox(c.resultMsg)
					}
				})
			})
		}
	}
	,RentVoucher:{
		init:function(){
			$(".printbtn a").click(PayRentJS.RentVoucher.doPrint)
		}
		,doPrint:function(){
			window.print();
			return false
		}
	}
	,ChargeRentPush:{
		init:function(){
			$(".rent_btn a").click(function(){
				var a=$(this).attr("orderNo");
				PayRentJS.ChargeRentPush.doVerifyNetPay(a)
			})
		}
		,doVerifyNetPay:function(a){
			if(!LoginJS.isLogged){
				LoginJS.loggedHandler=function(){
					PayRentJS.ChargeRentPush.doVerifyNetPay(a)
				};
				LoginJS.showLoginPanel()
			}
			else{
				if(!LoginJS.isRealMobile){
					$(OriginalStringJS.unBindMobileTip).dialog({
						title:"温馨提示",modal:true,width:400,buttons:[{
							text:"立即绑定手机号","class":"comm_dialog_btn_save",click:function(){
								return $.doUrlRedirt("/Member/safe/bindmobile.htm")
							}
						}
						]
					})
				}
				else{
					PayRentJS.ChargeRentPush.doNetPay(a)
				}
			}
		}
		,doNetPay:function(a){
			return $.doUrlRedirt("/payrent/onlinepay.htm?id="+window.encodeURIComponent(a))
		}
	}
	,ModifyPayee:{
		init:function(b){
			$(function(){
				$("#txtPayeeCardNo").blur(PayRentJS.ModifyPayee.verifyPayeeCardNo)
			});
			PayRentJS.ModifyPayee.payeeType=b.payeeType;
			var a=new SubbranchCombobox($("#divPayeeSubbranch"),$("#selPayeeBank"),$("#selProvince_payeeBank"),$("#selCity_payeeBank"),PayRentJS.ModifyPayee.payeeType==1);
			a.bind(true);
			new $.BankCardNo($("#txtPayeeCardNo"));
			$(".bluebtn a").click(PayRentJS.ModifyPayee.confirmSavePayee)
		}
		,verifyPayeeCardNo:function(){
			var c=$(this);
			var b=c.val();
			if(String.isNullOrEmpty(b)){
				return
			}
			var a=$.postJsonSync("/payrent/verifypayeecardno.htm",{
				payeeCardNo:b.replace(/\s/g,"")
			});
			if(a.resultCode==1){
				return
			}
			return $.showMsgBox(String.format("房东银行卡 {0} 无法通过租房宝收房租，请联系房东换张卡试试。<br/>如有疑问请联系客服400-008-2828咨询，感谢支持！",b))
		}
		,confirmSavePayee:function(){
			if(!Validator.validateForm()){
				return
			}
			$.post("/payrent/ismodifypayeet0.htm",{
				orderNo:$.getQueryString("id"),payeeBankId:$("#selPayeeBank").val()
			}
			,function(a){
				if(a.resultCode!=1){
					$.showMsgBox(a.resultMsg);
					return false
				}
				if(a.data){
					$.showConfirmBox("您修改后的银行不支持2小时到账，订单支付的2小时到账服务费将不予退还，请确认！",function(){
						PayRentJS.ModifyPayee.savePayee()
					})
				}
				else{
					PayRentJS.ModifyPayee.savePayee()
				}
			})
		}
		,savePayee:function(){
			if(!Validator.validateForm()){
				return
			}
			$.post("/payrent/savepayee.htm",{
				id:$.getQueryString("id"),payeeType:PayRentJS.ModifyPayee.payeeType,payeeName:$("#txtPayeeName").val(),payeeBankId:$("#selPayeeBank").val(),payeeCardNo:$("#txtPayeeCardNo").val().replace(/\s/g,""),payeeBankProvince:$("#selProvince_payeeBank").val(),payeeBankCity:$("#selCity_payeeBank").val(),payeeSubbranch:$("#txtPayeeSubbranch").is(":visible")?$("#txtPayeeSubbranch").val():"",payeePhone:""
			}
			,function(a){
				if(a.resultCode==1){
					return $.doUrlRedirt("/account/payrentlist.htm")
				}
				else{
					$.showMsgBox(a.resultMsg)
				}
			})
		}
	}
};
var ChargeRentJS={
	Index:{
		init:function(){
			new $.ScrollUlList($(".pnrecord ul"))			
		}
	}
	,RentProfile:{
		init:function(){
			$(function(){
				$("#txtPayeeCardNo").blur(ChargeRentJS.RentProfile.verifyPayeeCardNo)
			});
			$("input[name=idRentType]").change(PayRentJS.RentProfile.changedRentType);
			new CellCombobox($("#txtCellName"),$("#selCity_rent"),$("#selArea_rent"));
			var a=new SubbranchCombobox($("#divPayeeSubbranch"),$("#selPayeeBank"),$("#selProvince_payeeBank"),$("#selCity_payeeBank"),true);
			a.bind(true);
			new $.BankCardNo($("#txtPayeeCardNo"));
			$(".rent_btn a").click(ChargeRentJS.RentProfile.saveProfile);
			UserPayeeJS.init($("#aChoosePayee"),{
				chooseHandle:ChargeRentJS.RentProfile.chooseUserPayee,orderType:2
			})
		}
		,verifyPayeeCardNo:function(){
			var c=$(this);
			var b=c.val();
			if(String.isNullOrEmpty(b)){
				return
			}
			var a=$.postJsonSync("/Payrent/Index/verifypayeecardno.html",{
				payeeCardNo:b.replace(/\s/g,"")
			});
			if(a.resultCode==1){
				return
			}
			return $.showMsgBox(String.format("您的银行卡 {0} 无法通过租房宝收房租，请换张卡试试。<br/>如有疑问请联系客服400-008-2828咨询，感谢支持！",b))
		}
		,chooseUserPayee:function(a){
			if(a==null||a==undefined){
				return false
			}
			PayRentJS.RentProfile.changedPayeeType();
			if($("#txtPayeeName").length>0){
				$("#txtPayeeName").val(a.payeeName)
			}
			$("#selPayeeBank").val(a.payeeBank);
			$("#txtPayeeCardNo").val(a.payeeCardNoSplit);
			$("#selProvince_payeeBank").val(a.payeeBankProvince);
			Geography.syncLoadCityList("payeeBank");
			$("#selCity_payeeBank").val(a.payeeBankCity);
			if(!String.isNullOrWhiteSpace(a.payeeSubBankName)){
				$("#txtPayeeSubbranch").val(a.payeeSubBankName);
				$("#divPayeeSubbranch").show()
			}
			else{
				$("#divPayeeSubbranch").hide()
			}
			$("#txtPayeeCardNo").blur()
		}
		,saveProfile:function(){
			if(!Validator.validateForm()){
				return
			}
			var a=$.getQueryString("id");
			$.post("/Chargerent/Index/saverentprofile.html",{
				id:a,rentType:$("input[name=idRentType]:checked").val(),roomCount:$("#selRoomCount").is(":hidden")?"0":$("#selRoomCount").val(),deck:$("#selDeck").is(":hidden")?"0":$("#selDeck").val(),acreage:$("#txtAcreage").val(),rentProvince:$("#selProvince_rent").val(),rentCity:$("#selCity_rent").val(),rentArea:$("#selArea_rent").val(),cellName:$("#txtCellName").is(":hidden")?"":$("#txtCellName").val(),addr:$("#txtAddr").val(),payeeName:$("#txtPayeeName").length>0?$("#txtPayeeName").val():$("#spanPayeeName").text(),payeeMobile:$("#txtPayeeMobile").length>0?$("#txtPayeeMobile").val():$("#spanPayeeMobile").text(),idCard:$("#txtIdCard").length>0?$("#txtIdCard").val():$("#spanIdCard").text(),payeeBankId:$("#selPayeeBank").val(),payeeCardNo:$("#txtPayeeCardNo").val().replace(/\s/g,""),payeeBankProvince:$("#selProvince_payeeBank").val(),payeeBankCity:$("#selCity_payeeBank").val(),payeeSubbranch:$("#txtPayeeSubbranch").is(":visible")?$("#txtPayeeSubbranch").val():"",isInformPayee:$("#txtIsInform").is(":checked")
			}
			,function(b){
				if(b.resultCode==1){
					if(String.isNullOrEmpty(b.data.cid)||b.data.cid=="0"){
						return $.doUrlRedirt("/Chargerent/Index/addrenter.html")
					}
					else{
						return $.doUrlRedirt("/Chargerent/Index/rentdetail.html?id="+encodeURIComponent(b.data.cid))+"&t="+new Date().getTime()
					}
				}
				else{
					$.showMsgBox(b.resultMsg)
				}
			},'json')
		}
	}
	,AddRenterServlet:{
		target:null,currLoginCode:null,currMobile:null,payeeMobile:null,saveSuccessHandler:null,init:function(a){
			ChargeRentJS.AddRenterServlet.bindParams(a);
			Validator.bind();
			$(function(){
				$("#txtRenterLoginCode").change(ChargeRentJS.AddRenterServlet.checkLoginCode)
			});
			$("span[name=mboxtip]").hover(function(){
				$(this).attr("inmbox","1");
				$(this).find(".mbox").show()
			}
			,function(){
				var b=$(this);
				$(this).attr("inmbox","0");
				window.setTimeout(function(){
					if(b.attr("inmbox")!="1"){
						b.find(".mbox").hide()
					}
				}
				,350)
			});
			$("#txtRentExpense").change(ChargeRentJS.AddRenterServlet.calculateRentData);
			$("#txtRentBeginDate").click(function(){
				var b=$(this);
				WdatePicker({
					onpicked:function(){
						b.change()
					}
				})
			});
			$("#selRentMonths,#txtRentBeginDate").change(ChargeRentJS.AddRenterServlet.changedRentMonths);
			$("#selRentPayModel").change(ChargeRentJS.AddRenterServlet.changedPayModel);
			$("#selPayMonths").change(ChargeRentJS.AddRenterServlet.changedPayMonths);
			$("#selPayMonthBegin").change(ChargeRentJS.AddRenterServlet.changedPayMonthBegin);
			$("#txtDeposit").change(ChargeRentJS.AddRenterServlet.calculateRentData);
			$("input[name=chkArriveAccountType]").change(ChargeRentJS.AddRenterServlet.calculateRentData);
			$("#chkIsRentHandleMoney").change(ChargeRentJS.AddRenterServlet.updateRentPayableDesc);
			if(ChargeRentJS.AddRenterServlet.target){
				ChargeRentJS.AddRenterServlet.target.find(".rent_btn a").click(ChargeRentJS.AddRenterServlet.saveRenter)
			}
			else{
				$(".rent_btn a").click(ChargeRentJS.AddRenterServlet.saveRenter)
			}
		}
		,bindParams:function(a){
			if(a){
				ChargeRentJS.AddRenterServlet.currLoginCode=a.loginCode;
				ChargeRentJS.AddRenterServlet.currMobile=a.mobile;
				ChargeRentJS.AddRenterServlet.payeeMobile=a.payeeMobile;
				ChargeRentJS.AddRenterServlet.saveSuccessHandler=a.saveSuccessHandler
			}
		}
		,checkLoginCode:function(){
			if(!Validator.validateObject($("#txtRenterLoginCode"),true,false)){
				return
			}
			var a=$(this).val();
			if(a==ChargeRentJS.AddRenterServlet.currLoginCode||a==ChargeRentJS.AddRenterServlet.currMobile||a==ChargeRentJS.AddRenterServlet.payeeMobile){
				$("#txtRenterLoginCode").val("");
				Validator.showMsg($("#txtRenterLoginCode"),"您不能对自己收房租，请输入真实的租客租房宝账户");
				return
			}
			$("#txtRenterName").attr("readonly",false);
			$.post("/Chargerent/Index/getrenterinfo.htm",{
				loginCode:a,houseId:$.getQueryString("id")
			}
			,function(b){
				if(b.resultCode==1){
					$("#txtRenterName").val(b.data.name);
					$("#txtRenterName").blur();
					ChargeRentJS.AddRenterServlet.calculateRentData();
					$("#txtRentExpense").focus();
					if(!String.isNullOrWhiteSpace(b.data.name)){
						$("#txtRenterName").attr("readonly",true)
					}
				}
				else{
					$("#txtRenterName").val("");
					$("#txtRenterLoginCode").val("");
					Validator.showMsg($("#txtRenterLoginCode"),b.resultMsg)
				}
				return false
			},"json")
		}
		,changedRentMonths:function(){
			var c=Number($("#selRentMonths").val());
			var d=Date.fromFormat($("#txtRentBeginDate").val());
			var b=Date.getToday();
			if(d.addMonths(c)<=b){
				$.showMsgBox("合约租期截止日期不能小于当前日期");
				$("#txtRentBeginDate").val(b.format("yyyy-MM-dd")).focus().change();
				return
			}
			var f=Number($("#selRentPayModel").val());
			var j="";
			var i=1;
			for(var a in EnumJS.RentPayModel){
				var g=EnumJS.RentPayModel[a];
				var e=g.value==1?1:g.value/2*3;
				if(e>c){
					break
				}
				j+='<option value="{0}"{1}>{2}</option>'.format(g.value,f==g.value?' selected="selected"':"",g.desc);
				i=g.value
			}
			$("#selRentPayModel").html(j);
			var h=Number($("selRentPayModel").val())!=f;
			if(h){
				$("selRentPayModel").val(i)
			}
			ChargeRentJS.AddRenterServlet.changedPayModel()
		}
		,changedPayModel:function(){
			var d=Number($("#selRentMonths").val());
			var f=Number($("#selRentPayModel").val());
			var c=Number($("#selPayMonths").val());
			var e=f==1?1:f/2*3;
			var a="";
			for(var b=e;b<=d&&b<=12;b++){
				a+='<option value="{0}">{0}个月</option>'.format(b,b==c?' selected="selected"':"")
			}
			$("#selPayMonths").html(a);
			var g=Number($("#selPayMonths").val())!=c;
			if(g){
				$("#selPayMonths").val(e)
			}
			ChargeRentJS.AddRenterServlet.changedPayMonths()
		}
		,changedPayMonths:function(){
			var d=Number($("#selRentMonths").val());
			var f=Date.fromFormat($("#txtRentBeginDate").val());
			var c=Number($("#selPayMonths").val());
			var a=Date.fromFormat($("#selPayMonthBegin").val()).format("yyyy-MM");
			var g="";
			for(var b=-3;b<=d-c;b++){
				var e=f.addMonths(b);
				g+='<option value="{0}"{1}>{0}</option>'.format(e.format("yyyy-MM-dd"),a==e.format("yyyy-MM")?' selected="selected"':"")
			}
			$("#selPayMonthBegin").html(g);
			ChargeRentJS.AddRenterServlet.changedPayMonthBegin();
			ChargeRentJS.AddRenterServlet.calculateRentData()
		}
		,changedPayMonthBegin:function(){
			var b=Number($("#selPayMonths").val());
			var d=Date.fromFormat($("#txtRentBeginDate").val());
			var c=Date.fromFormat($("#selPayMonthBegin").val());
			var a=d.getMonthOffset(c);
			$("#spanPayMonthTip").text("[{0}至{1}]".format(c.format("yyyy-MM-dd"),d.addMonths(b-a).format("yyyy-MM-dd")))
		}
		,calculateRentData:function(){
			var m=Number($("#txtRentExpense").val());
			var e=Date.fromFormat($("#selPayMonthBegin").val());
			var h=Number($("#selPayMonths").val());
			var j=Number($("#txtDeposit").val());
			var r=m*h+j;
			var q=0;
			var o=$.postJsonSync("/Chargerent/Index/getrenthandlemoneyrate.html",{
				houseId:$.getQueryString("id"),loginCode:$("#txtRenterLoginCode").val(),monthBegin:e,monthEnd:e.addMonths(h),orderMoney:r
			});
			if(o.resultCode!=1){
				$.showMsgBox(o.resultMsg);
				return false
			}
			var k=o.data.rentHandleMoneyRateAndEarnestRate;
			var l=o.data.bankSupportT0;
			var g=k.handleMoneyRateT1;
			var i=k.handleMoneyRateT0;
			var b=k.renterIsVip;
			var p=k.handleMoneyRateT1Discount;
			var f=k.handleMoneyRateT0Discount;
			var c=k.isNormalUserLevel;
			var d=k.levelName;
			$("#spanT1HandleFeeRate").html(g>0?(g.format("0.##%")+"服务费"):"免费");
			$("span[name=spanVipUserT0]").text(b?"(VIP用户)":"");
			$("#spanT0HandleFeeRate").text(i.format("0.##%"));
			if(l.serviceBegin.length>0&&l.serviceEnd.length>0){
				$("#spanT0ServiceTime").text("({0}-{1})".format(l.serviceBegin,l.serviceEnd))
			}
			if(l.isSupportT0){
				$("#chkArriveAccountType2").attr("disabled",false);
				$("#labArriveAccountType2").removeClass("fgray")
			}
			else{
				$("#chkArriveAccountType2").attr("disabled",true);
				$("#chkArriveAccountType1").attr("checked",true);
				if(!$("#labArriveAccountType2").hasClass("fgray")){
					$("#labArriveAccountType2").addClass("fgray")
				}
			}
			var a=g;
			var n=p;
			if($("#chkArriveAccountType2").is(":checked")){
				a=i;
				n=f
			}
			if(c){
				$("#spanHandleRateDiscount").html("")
			}
			else{
				$("#spanHandleRateDiscount").html("({0}{1})".format(d,n!=0?(n*10).toFixed(1)+"折":"免费"))
			}
			$("#spanRentHandleMoneyRate").text(a.format("0.##%"));
			q=(r*a).toFixed(2);
			if(!c){
				q=(q*n).toFixed(2)
			}
			$("#spanHandleMoney strong").text(q.format("#,##0.##"));
			$("#spanRentPayable strong").text(r.format("#,##0.##"));
			ChargeRentJS.AddRenterServlet.updateRentPayableDesc()
		}
		,updateRentPayableDesc:function(){
			if($("#chkIsRentHandleMoney").is(":checked")){
				var b=$("#spanRentPayable strong").text();
				var a=$("#spanHandleMoney strong").text();
				b=Number(b.replace(/,/g,""));
				a=Number(a.replace(/,/g,""));
				$("#spanRentPayableDesc").html('(您实收<span class="forange">{0}</span>元，服务费{1}元)'.format((b-a).format("#,##0.##"),a.format("#,##0.##")))
			}
			else{
				$("#spanRentPayableDesc").text("")
			}
		}
		,saveRenter:function(){
			if(!Validator.validateForm()){
				return
			}
			var a=$("#spanHandleMoney strong").text();
			a=Number(a.replace(/,/g,""));
			$.post("/Chargerent/Index/saverentrenter.html",{
				id:$.getQueryString("id"),dataIndex:Number($("#idDataIndex").val()),renterLoginCode:$("#txtRenterLoginCode").val(),renterName:$("#txtRenterName").val(),rentExpense:Number($("#txtRentExpense").val()),rentMonths:Number($("#selRentMonths").val()),rentBeginDate:$("#txtRentBeginDate").val(),rentPayModel:Number($("#selRentPayModel").val()),payMonths:Number($("#selPayMonths").val()),payMonthBegin:$("#selPayMonthBegin").val(),deposit:Number($("#txtDeposit").val()),arriveAccountType:$("input[name=chkArriveAccountType]:checked").val(),isRentHandleMoney:a>0&&$("#chkIsRentHandleMoney").is(":checked")
			}
			,function(b){
				if(b.resultCode==1){
					if($.isFunction(ChargeRentJS.AddRenterServlet.saveSuccessHandler)){
						ChargeRentJS.AddRenterServlet.saveSuccessHandler()
					}
					else{
						return $.doUrlRedirt("confirmrent.htm?id="+encodeURIComponent($.getQueryString("id")))
					}
				}
				else{
					if(b.resultCode==-1&&$(".login_box").length>0){
						ChargeRentJS.LoginAndMobileRegServlet.showLoginBox()
					}
					else{
						$.showMsgBox(b.resultMsg)
					}
				}
			},'json')
		}
	}
	,LoginAndMobileRegServlet:{
		init:function(b){
			var a=$(".login_box");
			a.find(".close").click(function(){
				a.hide()
			});
			a.find("ul li").click(function(){
				a.find("ul li").removeClass("on");
				$(this).addClass("on");
				a.find(".rcont").hide();
				a.find(".rcont").eq($(this).index()).show()
			});
			ChargeRentJS.LoginAndMobileRegServlet.bindUserRegister.init();
			ChargeRentJS.LoginAndMobileRegServlet.bindLogin.init()
		}
		,showLoginBox:function(){
			var a=$(".login_box");
			a.show();
			var b=($(document).height()-a.height())/2+$(document).scrollTop();
			$(".box1_zz").css("height",$(document).height()+"px");
			a.css("top",b+"px")
		}
		,bindUserRegister:{
			isSubmitReg:false,smsVCSender:null,init:function(){
				var a=new $.SmsVCSender($("#txtRegMobile"),$("#txtValidCode_0"),$("#divSendSmsVC_0 a,#btnSendSms_0"),$("#btnSendVoice_0"),{
					uniqueMobile:true,overEvent:function(){
						$("#divSendSmsVC_0").remove();
						$("#divSendSms_0").show()
					}
				});
				$("#divSendSmsVC_0 a,#btnSendSms_0").bind("click",function(){
					a.sendSms()
				});
				$("#btnSendVoice_0").bind("click",function(){
					a.sendVoice()
				});
				$("#regAndSubmitOrder").click(ChargeRentJS.LoginAndMobileRegServlet.bindUserRegister.doUserRegister)
			}
			,doUserRegister:function(){
				if(ChargeRentJS.LoginAndMobileRegServlet.bindUserRegister.isSubmitReg||!Validator.validateForm()){
					return
				}
				var b=$("#txtRegPassword").val();
				//var a=new RSAKey();
				//a.setPublic(RSAPublicKey,"10001");
				//b=a.encrypt(b);
				ChargeRentJS.LoginAndMobileRegServlet.bindUserRegister.isSubmitReg=true;
				$.post("/Member/Index/doRegister.htm",{
					mobile:$("#txtRegMobile").val(),password:b,verifyCode:$("#txtRegMobileValidCode").val()
				}
				,function(c){
					ChargeRentJS.LoginAndMobileRegServlet.bindUserRegister.isSubmitReg=false;
					if(c.resultCode==1){
						ChargeRentJS.AddRenterServlet.saveRenter();
						return false
					}
					else{
						$.showMsgBox(c.resultMsg)
					}
				},'json')
			}
		}
		,bindLogin:{
			init:function(){
				$("#divLoginValidCode a").bind("click",function(){
					ChargeRentJS.LoginAndMobileRegServlet.bindLogin.changeVC(true)
				});
				$("#doLogin").click(ChargeRentJS.LoginAndMobileRegServlet.bindLogin.doLogin);
				$("#divThirdPartyLogin a").click(function(){
					RentHelperJS.toThirdPartyLogin($(this).attr("to"),function(){
						ChargeRentJS.LoginAndMobileRegServlet.bindLogin.successHander()
					})
				})
			}
			,changeVC:function(a){
				$(".yzm img").attr("src","/Api/Checkcode/index?t="+new Date().getTime());
				if(a){
					$("#txtLoginValidCode").val("")
				}
				return false
			}
			,doLogin:function(){
				if(!Validator.validateForm($(".login_box .rcont").eq(1))){
					return
				}
				var b=$("#txtLoginCode").val();
				var d=$("#txtLoginPassword").val();
				var c=$("#txtLoginValidCode").val();
				var a=new RSAKey();
				a.setPublic(RSAPublicKey,"10001");
				d=a.encrypt(d);
				jQuery.post("/chargerent/dologin.htm",{
					loginCode:b,password:d,vc:c
				}
				,function(e){
					if(e.resultCode==1){
						if(e.data!=null&&e.data.isNeedGoBack){
							$.showMsgBox("已登录的帐号信息和收租人信息不一致，请返回第一步修改！",function(){
								return $.doUrlRedirt("rentprofile.htm?t="+new Date().getTime())
							}
							,function(){
								return $.doUrlRedirt("rentprofile.htm?t="+new Date().getTime())
							});
							return false
						}
						ChargeRentJS.LoginAndMobileRegServlet.bindLogin.successHander();
						RentHelperJS.loginChangeNav();
						return false
					}
					else{
						$("#txtLoginPassword").val("");
						if(e.data!=null&&e.data.isNeedVC){
							$("#divLoginValidCode").show();
							ChargeRentJS.LoginAndMobileRegServlet.bindLogin.changeVC(true)
						}
						else{
							$("#divLoginValidCode").hide()
						}
						$.showMsgBox(e.resultMsg);
						return false
					}
				})
			}
			,successHander:function(){
				ChargeRentJS.AddRenterServlet.calculateRentData();
				$(".login_box").hide()
			}
		}
	}
	,AddRenter:{
		init:function(b){
			var a=$("#txtRenterLoginCode");
			ChargeRentJS.AddRenterServlet.init({
				loginCode:a.attr("selflogincode"),mobile:a.attr("selfmobile"),payeeMobile:b&&b.payeeMobile?b.payeeMobile:""
			});
			$(".upbtn a").click(function(){
				return $.doUrlRedirt("rentprofile.htm?id="+encodeURIComponent($.getQueryString("id")))
			});
			ChargeRentJS.LoginAndMobileRegServlet.init()
		}
	}
	,ConfirmRent:{
		init:function(){
			var a=$(".total_tab1 ul");
			ChargeRentJS.AddRenterServlet.bindParams({
				loginCode:a.attr("selflogincode"),mobile:a.attr("selfmobile")
			});
			$(".rent_btn a").click(ChargeRentJS.ConfirmRent.saveChargeRent);
			$(".bluebtn1 a").click(ChargeRentJS.ConfirmRent.showAddRenter);
			$(".total1 .tdelete a").click(ChargeRentJS.ConfirmRent.removeAllRenter);
			$(".modifyrenter").click(ChargeRentJS.ConfirmRent.showEditRenter);
			$(".removerenter").click(ChargeRentJS.ConfirmRent.removeRenter)
		}
		,showAddRenter:function(){
			var g=$.postJsonSync("/Chargerent/Index/getbanksupportt.html",{
				houseId:$.getQueryString("id"),orderMoney:0
			});
			if(g.resultCode!=1){
				$.showMsgBox(g.resultMsg);
				return false
			}
			var k=g.data;
			var c=Date.getToday();
			var h=c.format("yyyy-MM-dd");
			var f=new Array();
			f.push('<div id="idPanelRenter"><div class="pay_item"><div class="remind">温馨提醒：只能对已注册并绑定手机号的租房宝用户收租,如果对方是租房宝的VIP会员，将免收服务费</div>');
			f.push('<input type="hidden" id="idDataIndex" value="-1"/><div class="item clearfix" style="padding-bottom:2px;"><label class="lab">对方租房宝账户：</label><div class="element"><input type="text" class="text" id="txtRenterLoginCode" value="" require="true" dataType="LoginAccount" rig="请输入租客的租房宝帐号手机号邮箱" msg="请输入对方正确的租房宝帐户手机号邮箱"></div></div>');
			f.push('<div style="padding:0px;" class="item clearfix"><label class="lab">&nbsp;</label><span class="f12 fgray">租房宝账户是注册用户名或手机号或邮箱，若是第三方账号登录用户请填写其绑定的手机号</span></div>'); 
			f.push('<div class="item clearfix"><label class="lab">租客姓名：</label><div class="element"><input type="text" class="text" id="txtRenterName" value="" require="true" dataType="Require" msg="请输入对方正确的租房宝帐户或手机号"></div></div>');
			f.push('<div class="item clearfix"><label class="lab">租&nbsp;&nbsp;金：</label><div class="element" style="width:100px;"><input type="text" class="text" id="txtRentExpense" value="" require="true" dataType="Compare|Currency" msg="请输入正确的租金金额，月租金≥300元" rig="请输入正确的租金金额，月租金≥300元" operator="GreaterThanEqual" to="300" style="width:80px;"></div><div class="fl f12 fgray">元/月 </div></div>');
			f.push('<div class="item clearfix"><label class="lab">合约租期：</label><div class="fl"><select id="selRentMonths" require="true" dataType="Compare" msg="超过72个月" operator="LessThanEqual" to="72">');
			for(var e=1;e<=36;e++){
				f.push('<option value="{0}"{1}>{0}个月</option>'.format(e,e==12?' selected="selected"':""))
			}
			for(var e=4;e<=6;e++){
				f.push('<option value="{0}">{1}年</option>'.format(e*12,e))
			}
			f.push('</select>&nbsp;<span class="fgray">从</span>&nbsp;</div>');
			f.push('<div class="element" style="width:120px;"><input type="text" class="text" id="txtRentBeginDate" value="');
			f.push(h);
			f.push('" require="true" dataType="Date" format="ymd" msg="请选择租期开始时间" rig="请选择租期开始时间" style="width:100px;" /></div><div class="fl fgray">开始</div></div>');
			f.push('<div class="item clearfix"><label class="lab">收款方式：</label><div class="fl"><select id="selRentPayModel">');
			for(var a in EnumJS.RentPayModel){
				var j=EnumJS.RentPayModel[a];
				f.push('<option value="{0}"{1}>{2}</option>'.format(j.value,j.value==2?' selected="selected"':"",j.desc))
			}
			f.push("</select></div></div>");
			f.push('<div class="item clearfix"><label class="lab">本次收租：</label><div class="fl"><select id="selPayMonths">');
			for(var e=3;e<=12;e++){
				f.push('<option value="{0}"{1}>{0}个月</option>'.format(e,e==3?' selected="selected"':""))
			}
			f.push('</select><span class="fgray">&nbsp;从&nbsp;</span><select id="selPayMonthBegin">');
			for(var e=-3;e<=12-3;e++){
				var b=c.addMonths(e);
				f.push('<option value="{0}"{1}>{0}</option>'.format(b.format("yyyy-MM-dd"),e==0?'selected="selected"':""))
			}
			f.push('</select><span class="fgray">&nbsp;开始&nbsp;</span><span class="fblue" id="spanPayMonthTip">[');
			f.push(h);
			f.push("至");
			f.push(c.addMonths(3).format("yyyy-MM-dd"));
			f.push("]</span></div></div>");
			f.push('<div class="item clearfix"><label class="lab">房东押金：</label><div class="element" style="width:100px;"><input type="text" class="text" id="txtDeposit" value="" require="false" msg="请输入正确的押金金额,范围在0-100000之间" rig="若押金已交，则无需填写" dataType="Range|Currency" min="0" max="100000" style="width:80px;"></div><div class="fl f12 fgray">元</div></div>');
			f.push('<div class="item clearfix"><label class="lab">到账时间：</label><div class="fl tserve"><div class="t1"><label><input type="radio" name="chkArriveAccountType" id="chkArriveAccountType1" value="1" checked="checked" />&nbsp;次日到账</label>');
			f.push('<span name="mboxtip" style="position:relative;"><a href="javascript:void(0)"><img src="');
			f.push(Config.ImageHomeSite);
			f.push('/www/quicon.jpg" alt=""></a><div class="mbox" style="display:none;">审核通过后1-2工作日到房东账户<p></p></div></span>&nbsp;&nbsp;');
			f.push('<span class="fgray f12"><span id="spanT1HandleFeeRate">1%</span><span name="spanVipUserT0"></span></span></div>');
			f.push('<div class="t0"><label id="labArriveAccountType2"{0}><input type="radio" name="chkArriveAccountType" id="chkArriveAccountType2" value="2" {1} />&nbsp;当日到账<span id="spanT0ServiceTime">{2}</span></label>'.format(k.isSupportT0?"":' class="fgray"',k.isSupportT0?"":' disabled="disabled"',k.isSupportT0?"({0}-{1})".format(k.serviceBegin,k.serviceEnd):""));
			f.push('<span name="mboxtip" style="position:relative;"><a href="javascript:void(0)"><img src="');
			f.push(Config.ImageHomeSite);
			f.push('/www/quicon.jpg" alt=""></a><div class="mbox" style="display:none;">审核通过后2小时到房东账户<p></p></div></span>&nbsp;&nbsp;');
			f.push('<span class="fgray f12"><span id="spanT0HandleFeeRate">1.5%</span>服务费<span name="spanVipUserT0"></span></span><span class="f12">&nbsp;&nbsp;<a href="/help/" target="_blank">详细说明&gt;&gt;</a></span></div></div></div>');
			f.push('<div class="item clearfix" style=" position:relative;"><label class="lab">服务费：</label><span id="spanHandleMoney"><strong>0</strong>&nbsp;元</span><span id="spanHandleRateDiscount" class="fgray"></span>&nbsp;&nbsp;<span id="spanIsRentHandleMoney" class="f12"><input type="checkbox" id="chkIsRentHandleMoney" /><label for="chkIsRentHandleMoney">&nbsp;我付服务费</label>&nbsp;<span name="mboxtip" style="position:relative;"><a href="javascript:void(0)"><img src="');
			f.push(Config.ImageHomeSite);
			f.push('/www/quicon.jpg" alt=""/></a><div class="mbox" style="display:none">租客支付房租时需支付<span id="spanRentHandleMoneyRate">1%</span>的服务费<p></p></div></div></span></span>');
			f.push('<div style="clear:both;"></div></div><div class="pay_title1 clearfix"><span style="height:13px;line-height:13px;"></span></div>');
			f.push('<div class="pay_item" style="margin-top:0px;"><div class="item clearfix"><label class="lab">房租：</label><span id="spanRentPayable"><strong class="fred f16">0</strong>&nbsp;元&nbsp;<span class="f12" id="spanRentPayableDesc"></span></span></div>');
			f.push('<div class="item clearfix" style="height:36px;padding:0 0 16px;"><label class="lab">&nbsp;</label><div class="rent_btn fl"><span class="rbtn_left"></span><a class="rbtn_middle" href="javascript:void(0)">添加租客</a><span class="rbtn_right"></span></div></div></div></div>');
			var d=$(f.join(""));
			d.dialog({
				title:"新增租客",modal:true,width:760
			});
			ChargeRentJS.AddRenterServlet.target=d;
			ChargeRentJS.AddRenterServlet.init()
		}
		,showEditRenter:function(){
			var id = $(this).attr("id");
			var d=$(".modifyrenter").index($(this));
			var B=$(".renter").eq(d);
			var a=B.find(">span");
			var O=a.eq(1).text();
			var K=a.eq(0).text().trim();
			var J=a.eq(2).text().replace(/,/g,"");
			var l=Number(J);
			var x=Number(a.eq(3).find("[name=spanRentMonths]").text());
			var z=a.eq(3).find("[name=spanRentBeginDate]").text();
			var N=Date.fromFormat(z);
			var P=Number(a.eq(4).find("span").attr("model"));
			var v=Number(a.eq(5).find("[name=spanPayMonths]").text());
			var u=a.eq(5).find("[name=spanMonthBegin]").text();
			var F=Date.fromFormat(u);
			var r=a.eq(6).text().replace(/,/g,"");
			var Q=Number(r);
			var M=a.eq(6).attr("isRentHandleMoney")=="true";
			var m=a.eq(6).attr("arriveAccountType");
			var R=N.getMonthOffset(F);
			var j=N.addMonths(v-R);
			var k=(l*v+Q).toFixed(2);
			var y=$.postJsonSync("/chargerent/Index/getrenthandlemoneyrate.html",{
				houseId:$.getQueryString("id"),loginCode:O,monthBegin:F,monthEnd:j,orderMoney:k
			});
			if(y.resultCode!=1){
				$.showMsgBox(y.resultMsg);
				return false
			}
			var L=y.data.rentHandleMoneyRateAndEarnestRate;
			var H=y.data.bankSupportT0;
			var b=L.handleMoneyRateT1;
			var c=L.handleMoneyRateT0;
			var t=L.renterIsVip;
			var q=L.handleMoneyRateT1Discount;
			var e=L.handleMoneyRateT0Discount;
			var n=L.isNormalUserLevel;
			var o=L.levelName;
			var S=new Array();
			S.push('<div id="idPanelRenter"><div class="pay_item"><div class="remind">温馨提醒：只能对已注册并绑定手机号的租房宝用户收租,如果对方是租房宝的VIP会员，将免收服务费</div><input type="hidden" id="idDataIndex" value="{0}"/>'.format(id));
			S.push('<div class="item clearfix" style="padding-bottom:2px;"><label class="lab">对方租房宝账户：</label><div class="element"><input type="text" class="text" id="txtRenterLoginCode" value="{0}" require="true" dataType="LoginAccount" rig="请输入租客的租房宝帐号手机号邮箱" msg="请输入对方正确的租房宝帐户手机号邮箱"></div></div>'.format($.HTMLEncode(O)));
			S.push('<div style="padding:0px;" class="item clearfix"><label class="lab">&nbsp;</label><span class="f12 fgray">租房宝账户是注册用户名或手机号或邮箱，若是第三方账号登录用户请填写其绑定的手机号</span></div>');
			S.push('<div class="item clearfix"><label class="lab">租客姓名：</label><div class="element"><input type="text" class="text" id="txtRenterName" value="{0}" require="true" dataType="Require" msg="请输入对方正确的租房宝帐户或手机号"></div></div>'.format($.HTMLEncode(K)));
			S.push('<div class="item clearfix"><label class="lab">租&nbsp;&nbsp;金：</label><div class="element" style="width:100px;"><input type="text" class="text" id="txtRentExpense" value="{0}" require="true" dataType="Compare|Currency" msg="请输入正确的租金金额，月租金≥300元" rig="请输入正确的租金金额，月租金≥300元" operator="GreaterThanEqual" to="300" style="width:80px;"></div>'.format(J));
			S.push('<div class="fl f12 fgray">元/月 </div></div>');
			S.push('<div class="item clearfix"><label class="lab">合约租期：</label><div class="fl"><select id="selRentMonths" require="true" dataType="Compare" msg="超过72个月" operator="LessThanEqual" to="72">');
			for(var I=1;I<=36;I++){
				S.push('<option value="{0}"{1}>{0}个月</option>'.format(I,I==x?' selected="selected"':""))
			}
			for(var I=4;I<=6;I++){
				S.push('<option value="{0}"{1}>{2}年</option>'.format(I*12,(I*12)==x?' selected="selected"':"",I))
			}
			S.push('</select>&nbsp;<span class="fgray">从</span>&nbsp;</div>');
			S.push('<div class="element" style="width:120px;"><input type="text" class="text" id="txtRentBeginDate" value="{0}" require="true" dataType="Date" format="ymd" msg="请选择租期开始时间" rig="请选择租期开始时间" style="width:100px;" /></div><div class="fl fgray">开始</div></div>'.format(z));
			S.push('<div class="item clearfix"><label class="lab">收款方式：</label><div class="fl"><select id="selRentPayModel">');
			for(var E in EnumJS.RentPayModel){
				var g=EnumJS.RentPayModel[E];
				if((g.value==1?1:(g.value/2*3))>x){
					break
				}
				S.push('<option value="{0}"{1}>{2}</option>'.format(g.value,g.value==P?' selected="selected"':"",g.desc))
			}
			S.push("</select></div></div>");
			S.push('<div class="item clearfix"><label class="lab">本次收租：</label><div class="fl"><select id="selPayMonths">');
			var D=P==1?1:(P/2*3);
			for(var I=D;I<=12&&I<=x;I++){
				S.push('<option value="{0}"{1}>{0}个月</option>'.format(I,I==v?' selected="selected"':""))
			}
			S.push('</select><span class="fgray">&nbsp;从&nbsp;</span><select id="selPayMonthBegin">');
			for(var I=-3;I<=x-v;I++){
				var s=N.addMonths(I);
				S.push('<option value="{0}"{1}>{0}</option>'.format(s.format("yyyy-MM-dd"),s.format("yyyy-MM-dd")==u?'selected="selected"':""))
			}
			S.push('</select><span class="fgray">&nbsp;开始&nbsp;</span><span class="fblue" id="spanPayMonthTip">[{0}至{1}]</span></div></div>'.format(u,j.format("yyyy-MM-dd")));
			S.push('<div class="item clearfix"><label class="lab">房东押金：</label><div class="element" style="width:100px;"><input type="text" class="text" id="txtDeposit" value="{0}" require="false" msg="请输入正确的押金金额,范围在0-100000之间" rig="若押金已交，则无需填写" dataType="Range|Currency" min="0" max="100000" style="width:80px;"></div><div class="fl f12 fgray">元</div></div>'.format(r));
			S.push('<div class="item clearfix"><label class="lab">到账时间：</label><div class="fl tserve"><div class="t1"><label><input type="radio" name="chkArriveAccountType" id="chkArriveAccountType1" value="1"{0} />&nbsp;次日到账</label>'.format(m=="1"||!H.isSupportT0?' checked="checked"':""));
			S.push('<span name="mboxtip" style="position:relative;"><a href="javascript:void(0)"><img src="');
			S.push(Config.ImageHomeSite);
			S.push('/www/quicon.jpg" alt=""></a><div class="mbox" style="display: none;">审核通过后1-2工作日到房东账户<p></p></div></span>&nbsp;&nbsp;');
			S.push('<span class="fgray f12"><span id="spanT1HandleFeeRate">{0}</span><span name="spanVipUserT0">{1}</span></span></div>'.format(b>0?(b.format("#,##0.##%")+"服务费"):"免费",t?"(VIP用户)":""));
			S.push('<div class="t0"><label id="labArriveAccountType2" {0}><input type="radio" name="chkArriveAccountType" id="chkArriveAccountType2" value="2"{1}{2} />&nbsp;当日到账<span id="spanT0ServiceTime">{3}</span></label>'.format(H.isSupportT0?"":' class="fgray"',m=="2"&&H.isSupportT0?' checked="checked"':"",H.isSupportT0?"":' disabled="disabled"',H.isSupportT0&&H.serviceBegin!=""&&H.serviceEnd!=""?"({0}-{1})".format(H.serviceBegin,H.serviceEnd):""));
			S.push('<span name="mboxtip" style="position:relative;"><a href="javascript:void(0)"><img src="');
			S.push(Config.ImageHomeSite);
			S.push('/www/quicon.jpg" alt=""></a><div class="mbox" style="display: none;">审核通过后2小时到房东账户<p></p></div></span>&nbsp;&nbsp;');
			S.push('<span class="fgray f12"><span id="spanT0HandleFeeRate">{0}</span>服务费<span name="spanVipUserT0">{1}</span></span><span class="f12">&nbsp;&nbsp;<a href="/help/171/" target="_blank">详细说明&gt;&gt;</a></span></div></div></div>'.format(c.format("#,##0.##%"),t?"(VIP用户)":""));
			var G=m=="1"||!H.isSupportT0;
			var w=G?b:c;
			var h=(k*w).toFixed(2);
			var f="";
			if(!n){
				var C=G?q:e;
				h=(h*C).toFixed(2);
				f="({0}{1})".format(o,C!=0?(C*10).toFixed(1)+"折":"免费")
			}
			S.push('<div class="item clearfix" style=" position:relative;"><label class="lab">服务费：</label><span id="spanHandleMoney"><strong>{0}</strong>&nbsp;元</span><span id="spanHandleRateDiscount" class="fgray">{1}</span>&nbsp;&nbsp;'.format(h.format("#,##0.##"),f));
			S.push('<span id="spanIsRentHandleMoney" class="f12"><input type="checkbox" id="chkIsRentHandleMoney" {0}/><label for="chkIsRentHandleMoney">&nbsp;我付服务费</label>&nbsp;'.format(M?' checked="checked"':""));
			S.push('<span style="position:relative;"><a href="javascript:void(0)"><img src="');
			S.push(Config.ImageHomeSite);
			S.push('/www/quicon.jpg" alt=""/></a><div class="mbox" style="display:none">租客支付房租时需支付<span id="spanRentHandleMoneyRate">{0}</span>的服务费<p></p></div></div></span></span><div style="clear:both;"></div></div>'.format(w.format("0.##%")));
			S.push('<div class="pay_title1 clearfix"><span style="height:13px;line-height:13px;"></span></div><div class="pay_item" style="margin-top:0px;"><div class="item clearfix"><label class="lab">房租：</label><span id="spanRentPayable"><strong class="fred f16">{0}</strong>&nbsp;元&nbsp;<span class="f12" id="spanRentPayableDesc">{1}</span></span></div>'.format(k.format("#,##0.##"),M?'(您实收<span class="forange">{0}</span>元，服务费{1}元)'.format((k-h).format("#,##0.##"),h.format("#,##0.##")):""));
			S.push('<div class="item clearfix" style="height:36px;padding:0 0 16px;"><label class="lab">&nbsp;</label><div class="rent_btn fl"><span class="rbtn_left"></span><a class="rbtn_middle" href="javascript:void(0)">{0}</a><span class="rbtn_right"></span></div></div></div></div>'.format("确定修改"));
			var A=$(S.join(""));
			A.dialog({
				title:"修改租客信息",modal:true,width:760
			});
			ChargeRentJS.AddRenterServlet.target=A;
			ChargeRentJS.AddRenterServlet.init()
		}
		,removeAllRenter:function(){
			if($(".renter").length==0){
				$.showMsgBox("当前没有需要删除的租客信息！");
				return
			}
			$.showConfirmBox("您确定要删除所有租客信息吗？",function(){
				$.post("/Chargerent/Index/removeallrenter.htm",{
					id:$.getQueryString("id")
				}
				,function(a){
					if(a.resultCode==1){
						return $.doUrlRedirt("confirmrent.htm?id="+encodeURIComponent($.getQueryString("id")))
					}
					else{
						$.showMsgBox(a.resultMsg)
					}
				},'json')
			})
		}
		,removeRenter:function(){
			var a=$(this).attr("id");
			if(a<0){
				$.showMsgBox("当前要删除的租客信息不存在，请刷新后重试！");
				return
			}
			$.showConfirmBox("您确定要删除当前租客信息吗？",function(){
				$.post("/Chargerent/Index/removerenter.htm",{
					id:$.getQueryString("id"),dataIndex:a
				}
				,function(b){
					if(b.resultCode==1){
						return $.doUrlRedirt("confirmrent.htm?id="+encodeURIComponent($.getQueryString("id")))
					}
					else{
						$.showMsgBox(b.resultMsg)
					}
				},'json')
			})
		}
		,saveChargeRent:function(){
			if($(".renter").length==0){
				$.showMsgBox("您还没有添加租客！");
				return
			}
			if(ChargeRentJS.ConfirmRent.isSubmitChargeRent){
				return false
			}
			ChargeRentJS.ConfirmRent.isSubmitChargeRent=true;
			$.post("/chargerent/Index/doconfirmrent.html",{
				id:$.getQueryString("id")
			}
			,function(a){
				if(a.resultCode==1){
					return $.doUrlRedirt("rentsuccess.htm?id="+encodeURIComponent(a.data.houseId)+"&minid="+encodeURIComponent(a.data.minOrderId)+"&maxid="+encodeURIComponent(a.data.maxOrderId))
				}
				else{
					ChargeRentJS.ConfirmRent.isSubmitChargeRent=false;
					$.showMsgBox(a.resultMsg)
				}
			},"json")
		}
	}
	,RentSuccess:{
		init:function(){
			var a=new ZeroClipboard($("input[type=button]"),{
				moviePath:Config.ScriptHomeSite+"/zeroclipboard/zeroclipboard.swf",trustedDomains:"*",allowScriptAccess:"always"
			});
			a.on("noflash",function(b){
				$("input[type=button]").unbind("click").bind("click",function(){
					$.setClipboard($("#txtPayRentUrl").val())
				})
			});
			a.on("complete",function(b,c){
				$.showMsgBox("复制成功!")
			})
		}
	}
	,RentDetail:{
		init:function(){
			$("#add_renter,.bluebtn1 a").click(function(){
				return $.doUrlRedirt("addrenter.htm?id="+encodeURIComponent($.getQueryString("id")))
			});
			$("a[name=linkRenterUrl]").click(ChargeRentJS.RentDetail.showRenterLink);
			$("a[name=linkCancelRent]").click(function(){
				RentHelperJS.cancelChargeRent($(this).attr("rentId"))
			})
		}
		,showRenterLink:function(){
			var a=$(this).parents("li").find("span[name=spanRenterName]").text();
			var e=$(this).attr("url");
			var d=OriginalStringJS.chargeRentPushUrl.format(a,e);
			var b=$(d);
			b.dialog({
				title:"您还可以通过以下方式告诉租客",modal:true,width:520,height:200
			});
			var c=new ZeroClipboard(b.find("input[type=button]"),{
				moviePath:Config.ScriptHomeSite+"/zeroclipboard/zeroclipboard.swf",trustedDomains:"*",allowScriptAccess:"always"
			});
			c.on("noflash",function(f){
				b.find("input[type=button]").unbind("click").bind("click",function(){
					$.setClipboard($("#txtPayRentUrl").val())
				})
			});
			c.on("complete",function(f,g){
				$.showMsgBox("复制成功!")
			})
		}
	}
};