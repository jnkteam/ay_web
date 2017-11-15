/** Windows IE32 * */
var PGEdit_IE32_CLASSID="5A711318-7623-4346-B153-370D2DC9933B";
var PGEdit_IE32_CAB="";
var PGEdit_IE32_EXE="PassGuardX.exe";
/** Windows IE64 * */
var PGEdit_IE64_CLASSID="5A711318-7623-4346-B153-370D2DC9933B";
var PGEdit_IE64_CAB="";
var PGEdit_IE64_EXE="PassGuardX64.exe";
/** Windows 非IE * */
var PGEdit_FF="PassGuardXFF.exe";
var PGEdit_FF_VERSION="1.0.0.3";
/** Edge/Chrome42+ * */
var PGEdit_Edge="PassGuardEdge.exe";
var PGEdit_Edge_VERSION="1.0.0.1";
var PGEdit_Edge_Mac="PassGuardEdgeMac.pkg";
var PGEdit_Edge_Mac_VERSION="1.0.0.1";
/** Linux * */
var PGEdit_Linux32="";
var PGEdit_Linux64="";
var PGEdit_Linux_VERSION="";
/** Mac * */
var PGEdit_MacOs="PassGuardX.pkg";
var PGEdit_MacOs_VERSION="1.0.0.5";
var PGEdit_MacOs_Safari="PassGuardX.pkg";
var PGEdit_MacOs_Safari_VERSION="1.0.0.5";
/** 非IE控件是否强制升级 1强制升级,0不强制升级 * */
var PGEdit_Update="0";
/** Edge/Chrome42+环境下用到的一些变量 * */
//控件服务地址
var urls = "";
//检查控件是否安装json串
var CIJSON = {"interfacetype":0,"data":{"switch":3}};
//实例化控件json串
var ICJSON = {"interfacetype":0,"data":{"switch":2}};
//初始化控件参数json串
var INCJSON = {"interfacetype":1,"data":{}};
//开启控件保护json串
var OPJSON = {"interfacetype":0,"data":{"switch":0}};
//心跳监测json串
var XTJSON = {"interfacetype":0,"data":{"switch":5}};
//关闭控件保护json串
var CPJSON = {"interfacetype":0,"data":{"switch":1}};
//获取值类json串
var OUTJSON = {"interfacetype":2,"data":{}};
//清空密码json串
var CLPJSON = {"interfacetype":0,"data":{"switch":4}};
//心跳监听变量、集合
var interv;
var onceInterv={};
var iterArray=[];
//控件返回值集合
var outs = {};
//控制是否能输入
var inFlag = {};
//是否初始化成功
var isInit = {};
/**get_time()*/
function get_time() {
	return new Date().getTime();
}
/**license**/
var license = "bXVaajdmd0lPVEpWTnFmL1B5MktZTFFkUG5ONHJuVWhaRDZHNHIvaDFwVTBCallOREdLNHZvTUFpekxnUG1GOTNLTTQwckY2R1VJbnZHeTZTZThnU2VlWGJwZHpOTURuT2JyN0xHODU0NHZYMkhlakNtMkZvbTN1Yk5hcWVRQUdyQllZSG5ZcW1ZY2lPeTRmQmN3WTdGU0tGUE5DK2hRSVFQdklHRGJ4ZEVnPXsiaWQiOjAsInR5cGUiOiJwcm9kdWN0IiwicGFja2FnZSI6WyIiXSwiYXBwbHluYW1lIjpbInd3dy52YmlsbC5jbiJdLCJwbGF0Zm9ybSI6NH0=";
if(navigator.userAgent.indexOf("MSIE")<0){
	   navigator.plugins.refresh();
}
(function(jQuery) {
	jQuery.pge = function (options) {
		this.settings = jQuery.extend(true, {}, jQuery.pge.defaults, options);
		this.init();
	};
	jQuery.extend(jQuery.pge, {
		defaults: {
			pgePath: "./ocx/",
			pgeId: "",
			pgeEdittype: 0,
			pgeEreg1: "",
			pgeEreg2: "",
			pgeMaxlength: 12,
			pgeTabindex: 2,
			pgeClass: "ocx_style",
			pgeInstallClass: "ocx_style",
			passLoginStyle:"passLoginStyle",
			pgeOnkeydown:"",
			pgeFontName:"",
			pgeFontSize:"",
			tabCallback:"",
			pgeBackColor:"",
			pgeForeColor:"",
			pgeUrls:"/windows10.microdone.cn",
			pgePort:5082,
			pgeWindowID:"password"+new Date().getTime()
		},
		prototype: {
			init: function() {
				//初始化控件返回值集合
				outs[this.settings.pgeWindowID] = {
					"length" : 0,
					"version" : 0,
					"mac" : "",
					"hard" : "",
					"cpu" : "",
					"aes" : "",
					"valid" : 1,
					"hash" : "",
					"rsa" : "",
					"pin" : "",
					"sign":"",
					"charNum":"",
					"hardList":""
				};
			    this.pgeDownText="请点此安装控件";
			    this.osBrowser = this.checkOsBrowser();
				this.pgeVersion = this.getVersion();			    			
				this.isInstalled = this.checkInstall();
			},
			checkOsBrowser: function() {
				var userosbrowser;
				var regStr_chrome = /chrome\/[\d.]+/gi ;
				if((navigator.platform =="Win32") || (navigator.platform =="Windows")){
					if(navigator.userAgent.indexOf("MSIE")>0 || navigator.userAgent.indexOf("msie")>0 || navigator.userAgent.indexOf("Trident")>0 || navigator.userAgent.indexOf("trident")>0){
						if(navigator.userAgent.indexOf("ARM")>0){
							userosbrowser=9; // win8 RAM Touch
							this.pgeditIEExe="";
						}else{
							userosbrowser=1;// windows32ie32
							this.pgeditIEClassid=PGEdit_IE32_CLASSID;
							this.pgeditIECab=PGEdit_IE32_CAB;
							this.pgeditIEExe=PGEdit_IE32_EXE;
						}
					}else if(navigator.userAgent.indexOf("Edge")>0){
						userosbrowser = 10;
						this.pgeditFFExe = PGEdit_Edge;
					}else if(navigator.userAgent.indexOf("Chrome")>0){
						var chromeVersion = navigator.userAgent.match(regStr_chrome).toString();
						chromeVersion = parseInt(chromeVersion.replace(/[^0-9.]/gi,""));
						if(chromeVersion >= 42){
							userosbrowser = 10;
							this.pgeditFFExe = PGEdit_Edge;
						}else{
							userosbrowser=2;
							this.pgeditFFExe = PGEdit_FF;
						}
					}else{
						userosbrowser=2; // windowsff
						this.pgeditFFExe=PGEdit_FF;
					}
				}else if((navigator.platform=="Win64")){
					if(navigator.userAgent.indexOf("Windows NT 6.2")>0 || navigator.userAgent.indexOf("windows nt 6.2")>0){		
						userosbrowser=1;// windows32ie32
						this.pgeditIEClassid=PGEdit_IE32_CLASSID;
						this.pgeditIECab=PGEdit_IE32_CAB;
						this.pgeditIEExe=PGEdit_IE32_EXE;						
					}else if(navigator.userAgent.indexOf("MSIE")>0 || navigator.userAgent.indexOf("msie")>0 || navigator.userAgent.indexOf("Trident")>0 || navigator.userAgent.indexOf("trident")>0){
						userosbrowser=3;// windows64ie64
						this.pgeditIEClassid=PGEdit_IE64_CLASSID;
						this.pgeditIECab=PGEdit_IE64_CAB;
						this.pgeditIEExe=PGEdit_IE64_EXE;			
					}else if(navigator.userAgent.indexOf("Edge")>0){
						userosbrowser = 10;
						this.pgeditFFExe = PGEdit_Edge;
					}else if(navigator.userAgent.indexOf("Chrome")>0){
						var chromeVersion = navigator.userAgent.match(regStr_chrome).toString();
						chromeVersion = parseInt(chromeVersion.replace(/[^0-9.]/gi,""));
						if(chromeVersion >= 42){
							userosbrowser = 10;
							this.pgeditFFExe = PGEdit_Edge;
						}else{
							userosbrowser = 2;
							this.pgeditFFExe = PGEdit_FF;
						}
					}else{
						userosbrowser=2;// windowsff
						this.pgeditFFExe=PGEdit_FF;
					}
				}else if(navigator.userAgent.indexOf("Linux")>0){
					if(navigator.userAgent.indexOf("_64")>0){
						userosbrowser=4;// linux64
						this.pgeditFFExe=PGEdit_Linux64;
					}else{
						userosbrowser=5;// linux32
						this.pgeditFFExe=PGEdit_Linux32;
					}
					if(navigator.userAgent.indexOf("Android")>0){
                        userosbrowser=7;// Android
                    }					
				}else if(navigator.userAgent.indexOf("Macintosh")>0){
					if(navigator.userAgent.indexOf("Safari")>0 && (navigator.userAgent.indexOf("Version/5.1")>0 || navigator.userAgent.indexOf("Version/5.2")>0 || navigator.userAgent.indexOf("Version/6")>0)){
						userosbrowser=8;// macos Safari 5.1 more
						this.pgeditFFExe=PGEdit_MacOs_Safari;
					}else if(navigator.userAgent.indexOf("Firefox")>0 || navigator.userAgent.indexOf("Chrome")>0){
						var chromeVersion = navigator.userAgent.match(regStr_chrome);
						if( chromeVersion != null){
							chromeVersion = chromeVersion.toString();
							chromeVersion = parseInt(chromeVersion.replace(/[^0-9.]/gi,""));
							if(chromeVersion >= 42){
								userosbrowser = 11;
								this.pgeditFFExe = PGEdit_Edge_Mac;
							}else{
								userosbrowser=6;// macos
								this.pgeditFFExe = PGEdit_MacOs;		
							}
						}else{
							userosbrowser=6;// macos
							this.pgeditFFExe = PGEdit_MacOs;
						}
					}else if(navigator.userAgent.indexOf("Opera")>=0 && (navigator.userAgent.indexOf("Version/11.6")>0 || navigator.userAgent.indexOf("Version/11.7")>0)){
						userosbrowser=6;// macos
						this.pgeditFFExe=PGEdit_MacOs;						
					}else if(navigator.userAgent.indexOf("Safari")>=0){
						userosbrowser=6;// macos
						this.pgeditFFExe=PGEdit_MacOs;			
					}else{
						userosbrowser=0;// macos
						this.pgeditFFExe="";
					}
				}
				return userosbrowser;
			},
			getpgeHtml: function() {
				if (this.osBrowser==1 || this.osBrowser==3) {
					return '<span id="'+this.settings.pgeId+'_pge" class="'+this.settings.passLoginStyle+'"><OBJECT ID="' + this.settings.pgeId + '" CLASSID="CLSID:' + this.pgeditIEClassid + '" codebase="' 
					        +this.settings.pgePath+ this.pgeditIECab + '" onkeydown="if(13==event.keyCode || 27==event.keyCode)'+this.settings.pgeOnkeydown+';" onfocus="' + this.settings.pgeOnfocus + '" tabindex="'+this.settings.pgeTabindex+'" class="' + this.settings.pgeClass + '">' 
					        + '<param name="edittype" value="'+ this.settings.pgeEdittype + '"><param name="maxlength" value="' + this.settings.pgeMaxlength +'">' 
							+ '<param name="input2" value="'+ this.settings.pgeEreg1 + '"><param name="input3" value="'+ this.settings.pgeEreg2 + '"></OBJECT></span>'
							+ '<span id="'+this.settings.pgeId+'_down" class="'+this.settings.pgeInstallClass+'" style="text-align:center;display:none;"><a href="'+this.settings.pgePath+this.pgeditIEExe+'">'+this.pgeDownText+'</a></span>';
				} else if (this.osBrowser==2) {
					var pgeOcx='<embed ID="' + this.settings.pgeId + '"  maxlength="'+this.settings.pgeMaxlength+'" input_2="'+this.settings.pgeEreg1+'" input_3="'+this.settings.pgeEreg2+'" edittype="'+this.settings.pgeEdittype+'" type="application/pass-guard-x" tabindex="'+this.settings.pgeTabindex+'" class="' + this.settings.pgeClass + '" ';
					if(this.settings.pgeOnkeydown!=undefined && this.settings.pgeOnkeydown!="") pgeOcx+=' input_1013="'+this.settings.pgeOnkeydown+'"';
					if(this.settings.tabCallback!=undefined && this.settings.tabCallback!="") pgeOcx+=' input_1009="document.getElementById(\''+this.settings.tabCallback+'\').focus()"';
					if(this.settings.pgeFontName!=undefined && this.settings.pgeFontName!="") pgeOcx+=' FontName="'+this.settings.pgeFontName+'"';
					if(this.settings.pgeFontSize!=undefined && this.settings.pgeFontSize!="") pgeOcx+=' FontSize='+Number(this.settings.pgeFontSize)+'';					
					pgeOcx+=' >';
					return pgeOcx;
				} else if (this.osBrowser==6) {
					return '<embed ID="' + this.settings.pgeId + '" input2="'+ this.settings.pgeEreg1 + '" input3="'+ this.settings.pgeEreg2 + '" input4="'+Number(this.settings.pgeMaxlength)+'" input0="'+Number(this.settings.pgeEdittype)+'" type="application/microdone-passguardx-plugin" version="'+PGEdit_MacOs_VERSION+'" tabindex="'+this.settings.pgeTabindex+'" class="' + this.settings.pgeClass + '">';
				} else if (this.osBrowser==8) {
					return '<embed ID="' + this.settings.pgeId + '" input2="'+ this.settings.pgeEreg1 + '" input3="'+ this.settings.pgeEreg2 + '" input4="'+Number(this.settings.pgeMaxlength)+'" input0="'+Number(this.settings.pgeEdittype)+'" type="application/microdone-passguardx-plugin" version="'+PGEdit_MacOs_Safari_VERSION+'" tabindex="'+this.settings.pgeTabindex+'" class="' + this.settings.pgeClass + '">';
				} else if (this.osBrowser == 10 || this.osBrowser == 11){
					var isInstall = false;
					this.settings.pgeWindowID = "password"+new Date().getTime()+1;
					CIJSON.id = this.settings.pgeWindowID;
					//初始化控件返回值集合
					outs[this.settings.pgeWindowID] = {
						"length" : 0,
						"version" : 0,
						"mac" : "",
						"hard" : "",
						"cpu" : "",
						"aes" : "",
						"valid" : 1,
						"hash" : "",
						"rsa" : "",
						"pin" : "",
						"sign":"",
						"charNum":"",
						"hardList":""
					};
					jQuery.ajax( {
						timeout : 1000,
						url : urls,
						dataType : "jsonp",
						data : {
							"str" : JSON.stringify(CIJSON)
						},
						contentType : "application/json;utf-8",
						jsonp : "jsoncallback",
						success : function(x) {
							isInstall = true;
						},
						error : function(jqXHR, textStatus, errorThrown) {
							isInstall = false;
						},
						complete: function(XMLHttpRequest,status){
							if(status=='timeout'){// 超时,status还有success,error等值的情况
						　　		isInstall = false;
							}
						}
					});
					//获得input框id值
					var id = this.settings.pgeId;
					//获得控件窗口id值
					var winId = this.settings.pgeWindowID;
					//获得安装包路径
					var winPath = this.settings.pgePath+this.pgeditFFExe;
					//获得当前指向对象
					var obj = this;
					//异步ajax需要延时处理结果，此处延时1秒
					setTimeout(function(){
						//给当前对象赋值
						obj.isInstalled = isInstall;
						if(!isInstall){
							$("#winA").html("请点此安装");
							$("#winA").attr("href",winPath);
						}else{
							$("#"+id+"_down").parent().html('<input type="password"	onfocus="pgeCtrl.openProt(\''+winId+'\',this.id);pgeCtrl.setCX(this);" autocomplete="off" onkeydown="pgeCtrl.setSX(event,\''+obj.settings.pgeOnkeydown+'\');"  onclick="pgeCtrl.setCX(this)"  onblur="pgeCtrl.closeProt(\''+winId+'\',this.id)" id="'+id+'" style="ime-mode:disabled" tabindex="2" class="ocx_style" value="" />');
							var o = document.getElementById(id);
							if(o != null){
								if(obj.osBrowser == 11){
									$("#"+id).attr("type","text");
									o.onkeypress = function(e){
										var chrTyped, chrCode=0, evt=e?e:event;
										chrCode = evt.which;
										var x = String.fromCharCode(chrCode);
										var maxlength = parseInt(obj.settings.pgeMaxlength);
										if(this.value.length > (maxlength-1)){
											return false;
										}
										if(chrCode>=32 && chrCode<=126){
											var reg1 = obj.settings.pgeEreg1.replace("*","");
											reg1 = new RegExp(reg1);
											if(reg1.test(x)){
												this.value+='*';
											}
											return false;
										}else{
											return true;
										}
									}
								}
								if(obj.osBrowser == 10){
									o.onkeypress = function(){
										return inFlag[winId].flag;
									}
								}
							}
							//实例化密码控件窗口 
							obj.instControl(winId);
						}
					},1000)
					this.pgeDownText = "正在检测....";
					return '<span style="'+this.settings.pgeInstallClass+'" id="'+this.settings.pgeId+'_down" class="'+this.settings.pgeInstallClass+'" style="text-align:center;"><a id="winA" href="javascript:void(0);">'+this.pgeDownText+'</a></span>';
				} else {
					return '<div id="'+this.settings.pgeId+'_down" class="'+this.settings.pgeInstallClass+'" style="text-align:center;">暂不支持此浏览器</div>';
				}				
			},
			getDownHtml: function() {
				if (this.osBrowser==1 || this.osBrowser==3) {
					return '<span id="'+this.settings.pgeId+'_down" class="'+this.settings.pgeInstallClass+'" style="text-align:center;"><a href="'+this.settings.pgePath+this.pgeditIEExe+'">'+this.pgeDownText+'</a></span>';
				} else if (this.osBrowser==2 || this.osBrowser==6 || this.osBrowser==8) {
					return '<span id="'+this.settings.pgeId+'_down" class="'+this.settings.pgeInstallClass+'" style="text-align:center;"><a href="'+this.settings.pgePath+this.pgeditFFExe+'">'+this.pgeDownText+'</a></span>';
				} else if (this.osBrowser == 10 || this.osBrowser == 11){
					this.pgeDownText = "正在检测....";
					return '<span style="'+this.settings.pgeInstallClass+'" id="'+this.settings.pgeId+'_down" class="'+this.settings.pgeInstallClass+'" style="text-align:center;"><a id="winA" href="javascript:void(0);">'+this.pgeDownText+'</a></span>';
				} else {
					return '<div id="'+this.settings.pgeId+'_down" class="'+this.settings.pgeInstallClass+'" style="text-align:center;">暂不支持此浏览器</div>';
				}				
			},
			load: function() {				
				if (!this.isInstalled) {
					return this.getDownHtml();
				}else{		
				   if(this.osBrowser==2){  
						if(this.pgeVersion!=PGEdit_FF_VERSION && PGEdit_Update==1){
							this.setDownText();
							return this.getDownHtml();	
						}
					} else if (this.osBrowser==6) {
						if(this.pgeVersion!=PGEdit_MacOs_VERSION && PGEdit_Update==1){
							this.setDownText();
							return this.getDownHtml();	
						}
					}else if (this.osBrowser==8) {
						if(this.pgeVersion!=PGEdit_MacOs_Safari_VERSION && PGEdit_Update==1){
							this.setDownText();
							return this.getDownHtml();	
						}
					}else if (this.osBrowser == 10 || this.osBrowser == 11){
						if(this.isInstalled==false){
							return document.write(this.getDownHtml());	
						}else if(this.pgeVersion!=PGEdit_MacOs_Safari_VERSION && PGEdit_Update==1){
							this.setDownText();
							return document.write(this.getDownHtml());
						}
					}					
					return this.getpgeHtml();
				}
			},
			generate: function() {
				   if(this.osBrowser==2){
					   if(this.isInstalled==false){
						   return document.write(this.getDownHtml());	 
					   }else if(this.pgeVersion!=PGEdit_FF_VERSION && PGEdit_Update==1){
							this.setDownText();
							return document.write(this.getDownHtml());	
						}
					} else if (this.osBrowser==6) {
						if(this.isInstalled==false){
							return document.write(this.getDownHtml());	
						}else if(this.pgeVersion!=PGEdit_MacOs_VERSION && PGEdit_Update==1){
							this.setDownText();
							return document.write(this.getDownHtml());	
						}
					}else if (this.osBrowser==8) {
						if(this.isInstalled==false){
							return document.write(this.getDownHtml());	
						}else if(this.pgeVersion!=PGEdit_MacOs_Safari_VERSION && PGEdit_Update==1){
							this.setDownText();
							return document.write(this.getDownHtml());
						}
					}else if (this.osBrowser == 10 || this.osBrowser == 11){
						if(this.isInstalled==false){
							return document.write(this.getDownHtml());	
						}else if(this.pgeVersion!=PGEdit_MacOs_Safari_VERSION && PGEdit_Update==1){
							this.setDownText();
							return document.write(this.getDownHtml());
						}
					}
					return document.write(this.getpgeHtml());				
			},
			/** ***********功能性接口**************** */
			/** 清空密码* */
			pwdclear: function() {
				if (this.isInstalled) {
					if(this.osBrowser == 10 || this.osBrowser == 11){
						var id = this.settings.pgeWindowID;
						var inputID = this.settings.pgeId;
						$("#"+inputID).val("");
						CLPJSON.id = id;
						jQuery.ajax( {
							url : urls,
							dataType : "jsonp",
							data : {
								"str" : JSON.stringify(CLPJSON)
							},
							contentType : "application/json;utf-8",
							jsonp : "jsoncallback",
							success : function(x) {
								//alert("清空成功");
							}
						});
					}else{
						var control = document.getElementById(this.settings.pgeId);
						control.ClearSeCtrl();
					}
				}				
			},
			/** ***********设置性接口**************** */
			/** 设置随机数 * */
			pwdSetSk: function(s,callf,sj) {
				if (this.isInstalled) {
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3 || this.osBrowser==6 || this.osBrowser==8) {
							control.input1=s;
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							control.input(1,s);
						} else if (this.osBrowser == 10 || this.osBrowser == 11){
							var id = this.settings.pgeWindowID;
							var INCJSON = {"interfacetype":1,"data":{}};
							INCJSON.id = id;
							INCJSON.data.reg1 = this.settings.pgeEreg1;
							INCJSON.data.aeskey = s;
							jQuery.ajax( {
								url : urls,
								dataType : "jsonp",
								data : {
									"str" : JSON.stringify(INCJSON)
								},
								contentType : "application/json;utf-8",
								jsonp : "jsoncallback",
								success : function(x) {
									//alert(x.code);
									if(!sj&&callf) eval("("+callf+"())");
									if(sj&&callf) eval("("+callf+"('"+sj+"'))");
								}
							});
						}					
					} catch (err) {
						console.log(err);
					}
				}				
			},
			pwdResultHash: function() {
				var code = '';
				if (!this.isInstalled) {
					code = '';
				}
				else{	
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3) {
							code = control.output;
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							code = control.output(7);
						}else if (this.osBrowser==6 || this.osBrowser==8) {
							// code = control.get_output1();
						}					
					} catch (err) {
						code = '';
					}
				}
				return code;
			},
			/** ***********获取性接口**************** */
			/** 获得AES密文 * */
			pwdResult: function(callf) {
				var code = '';
				if (!this.isInstalled) {
					code = '';
				}else{	
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3) {
							code = control.output1;
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							code = control.output(7);
						} else if (this.osBrowser==6 || this.osBrowser==8) {
							code = control.get_output1();
						} else if (this.osBrowser == 10 || this.osBrowser == 11){
							OUTJSON.id = this.settings.pgeWindowID;
							OUTJSON.data.datatype = 7;
							OUTJSON.data.encrypttype = 0;
							var id = OUTJSON.id;
							jQuery.ajax({
								url : urls,
								dataType : "jsonp",
								data : {
									"str" : JSON.stringify(OUTJSON)
								},
								contentType : "application/json;utf-8",
								jsonp : "jsoncallback",
								success : function(x) {
									outs[id].aes = x.data;
									console.log("x.data:"+x.data+",x.code:"+x.code);
									if(callf) eval("("+callf+"())");
								}
							});
						}		
					} catch (err) {
						code = '';
					}
				}
				return code;
			},
			/** 获得密码hash值 * */
			pwdHash: function(callf) {
				var code = '';
				if (!this.isInstalled) {
					code = 0;
				}
				else{
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3) {
							code = control.output2;
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							code = control.output(2);
						}else if (this.osBrowser==6 || this.osBrowser==8) {
							code = control.get_output2();
						} else if (this.osBrowser == 10 || this.osBrowser == 11){
							var id = this.settings.pgeWindowID;
							OUTJSON.id = id;
							OUTJSON.data.datatype = 2;
							OUTJSON.data.encrypttype = 1;
							jQuery.ajax( {
								url : urls,
								dataType : "jsonp",
								data : {
									"str" : JSON.stringify(OUTJSON)
								},
								contentType : "application/json;utf-8",
								jsonp : "jsoncallback",
								success : function(x) {
									outs[id].hash = x.data;
									if(callf) eval("("+callf+"())");
								}
							});
						}
					} catch (err) {
						code = 0;
					}
				}
				return code;
			},		
			/** 获得密码长度 * */
			pwdLength: function(callf) {
				var code = '';
				if (!this.isInstalled) {
					code = 0;
				}
				else{
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3) {
							code = control.output3;
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							code = control.output(3);
						}else if (this.osBrowser==6 || this.osBrowser==8) {
							code = control.get_output3();
						}else if (this.osBrowser == 10 || this.osBrowser == 11){
							var id = this.settings.pgeWindowID;
							OUTJSON.id = id; 
							OUTJSON.data.datatype = 3;
							OUTJSON.data.encrypttype = 0;
							jQuery.ajax( {
								url : urls,
								dataType : "jsonp",
								data : {
									"str" : JSON.stringify(OUTJSON)
								},
								contentType : "application/json;utf-8",
								jsonp : "jsoncallback",
								success : function(x) {
									outs[id].length = x.data;
									if(callf) eval("("+callf+"())");
								}
							});
						}
					} catch (err) {
						//alert(err);
						code = 0;
					}
				}
				return code;
			},
			/** 获得密码字符类型个数 * */
			pwdNum: function() {
				var code = '';
				if (!this.isInstalled) {
					code = 0;
				}
				else{
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3) {
							code = control.output4;
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							code = control.output(4);
						}else if (this.osBrowser==6 || this.osBrowser==8) {
							code = control.get_output4();
						}else if (this.osBrowser == 10 || this.osBrowser == 11){
							var id = this.settings.pgeWindowID;
							OUTJSON.id = id; 
							OUTJSON.data.datatype = 4;
							OUTJSON.data.encrypttype = 0;
							jQuery.ajax( {
								url : urls,
								dataType : "jsonp",
								data : {
									"str" : JSON.stringify(OUTJSON)
								},
								contentType : "application/json;utf-8",
								jsonp : "jsoncallback",
								success : function(x) {
									outs[id].charNum = x.data;
									//alert(outs[id].charNum);
								}
							});
						}
					} catch (err) {
						code = 0;
					}
				}
				return code;
			},
			/** 获得密码控件版本号 * */
			getVersion: function() {
				try {
					if (this.osBrowser==1 || this.osBrowser==3) {
						var comActiveX = new ActiveXObject("PassGuardX.PassGuard.1"); 
						return comActiveX.output35;
					}else if(this.osBrowser == 2 || this.osBrowser == 6 || this.osBrowser == 8 ){
						var arr=new Array();
					    if(this.osBrowser==6){
					    	var pge_info=navigator.plugins['PassGuardX'].description;
					    }else if(this.osBrowser==8){
					    	var pge_info=navigator.plugins['PassGuardX'].description;					    	
					    }else{
					    	var pge_info=navigator.plugins['PassGuardX'].description;
					    }
						if(pge_info.indexOf(":")>0){
							arr=pge_info.split(":");
							var pge_version = arr[1];
						}else{
							var pge_version = "";
						}
					} else if (this.osBrowser == 10 || this.osBrowser == 11){
						var id = this.settings.pgeWindowID;
						OUTJSON.id = id;
						OUTJSON.data.datatype = 12;
						OUTJSON.data.encrypttype = 0;
						jQuery.ajax( {
							url : urls,
							dataType : "jsonp",
							data : {
								"str" : JSON.stringify(OUTJSON)
							},
							contentType : "application/json;utf-8",
							jsonp : "jsoncallback",
							success : function(x) {
								if(id != undefined){
									outs[id].version = x.data;
									//alert(outs[id].version);
								}
							}
						});
					}
					return pge_version;
				}catch(err){
					return "";
				}					
			},
			/** 获得硬件信息列表密文 * */
			pwdHardList: function(callf){
				var code = '';
				if (!this.isInstalled) {
					code = '';
				}else{	
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3) {
							code = control.output58;
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							code = control.output(15);
						}else if (this.osBrowser==6 || this.osBrowser==8) {
							code = control.get_output20();
						} else if (this.osBrowser == 10 || this.osBrowser == 11){
							var id = this.settings.pgeWindowID;
							OUTJSON.id = id;
							OUTJSON.data.datatype = 15;
							OUTJSON.data.encrypttype = 0;
							jQuery.ajax( {
								url : urls,
								dataType : "jsonp",
								data : {
									"str" : JSON.stringify(OUTJSON)
								},
								contentType : "application/json;utf-8",
								jsonp : "jsoncallback",
								success : function(x) {
									outs[id].hardList = x.data;
									if(callf) eval("("+callf+"())");
								}
							});
						}				
					} catch (err) {
						code = '';
					}
				}
				return code;
			},
			/** 获得MAC信息密文 * */
			machineNetwork: function(callf) {
				var code = '';
				if (!this.isInstalled) {
					code = '';
				}
				else{
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3) {
							code = control.GetIPMacList();
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							code = control.output(9);
						}else if (this.osBrowser==6 || this.osBrowser==8) {
							code = control.get_output7(0);
						}else if (this.osBrowser == 10 || this.osBrowser == 11){
							var id = this.settings.pgeWindowID;
							OUTJSON.id = id;
							OUTJSON.data.datatype = 9;
							OUTJSON.data.encrypttype = 0;
							jQuery.ajax( {
								url : urls,
								dataType : "jsonp",
								data : {
									"str" : JSON.stringify(OUTJSON)
								},
								contentType : "application/json;utf-8",
								jsonp : "jsoncallback",
								success : function(x) {
									outs[id].mac = x.data;
									if(callf) eval("("+callf+"())");
								}
							});
						}
					} catch (err) {
						code = '';
					}
				}
				return code;
			},
			/** 获得硬盘信息密文 * */
			machineDisk: function(callf) {
				var code = '';
				if (!this.isInstalled) {
					code = '';
				}
				else{
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3) {
							code = control.GetNicPhAddr(1);
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							code = control.output(11);
						}else if (this.osBrowser==6 || this.osBrowser==8) {
							code = control.get_output7(2);
						}else if (this.osBrowser == 10 || this.osBrowser == 11){
							var id = this.settings.pgeWindowID;
							OUTJSON.id = id;
							OUTJSON.data.datatype = 11;
							OUTJSON.data.encrypttype = 0;
							jQuery.ajax( {
								url : urls,
								dataType : "jsonp",
								data : {
									"str" : JSON.stringify(OUTJSON)
								},
								contentType : "application/json;utf-8",
								jsonp : "jsoncallback",
								success : function(x) {
									outs[id].hard = x.data;
									if(callf) eval("("+callf+"())");
								}
							});
						}
					} catch (err) {
						code = '';
					}
				}
				return code;
			},
			/** 获得CPU信息密文 * */
			machineCPU: function(callf) {
				var code = '';
				if (!this.isInstalled) {
					code = '';
				}
				else{
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3) {
							code = control.GetNicPhAddr(2);
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							code = control.output(10);
						}else if (this.osBrowser==6 || this.osBrowser==8) {
							code = control.get_output7(1);
						} else if (this.osBrowser == 10 || this.osBrowser == 11){
							var id = this.settings.pgeWindowID;
							OUTJSON.id = id;
							OUTJSON.data.datatype = 10;
							OUTJSON.data.encrypttype = 0;
							jQuery.ajax( {
								url : urls,
								dataType : "jsonp",
								data : {
									"str" : JSON.stringify(OUTJSON)
								},
								contentType : "application/json;utf-8",
								jsonp : "jsoncallback",
								success : function(x) {
									outs[id].cpu = x.data;
									if(callf) eval("("+callf+"())");
								}
							});
						}
					} catch (err) {
						code = '';
					}
				}
				return code;
			},
			pwdSimple: function() {
				var code = '';
				if (!this.isInstalled) {

					code = '';
				}
				else{
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3) {
							code = control.output44;
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							code = control.output(13);
						}else if (this.osBrowser==6 || this.osBrowser==8) {
							code = control.get_output10();
						}
					} catch (err) {
						code = '';
					}
				}
				return code;
			},			
			pwdStrength: function() {
				var code = 0;
				if (!this.isInstalled) {
					code = 0;
				}
				else{
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3) {
							var l=control.output3;
							var n=control.output4;
							var z=control.output54;
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							var l=control.output(3);
							var n=control.output(4);
							var z=control.output(4,1);
						}else if (this.osBrowser==6 || this.osBrowser==8) {
							var l=control.get_output3();
							var n=control.get_output4();
							var z=control.get_output16();
						}
						if(l==0){
							code = 0;
						}else if(n==1 || l<6){
							code = 1;// 弱
						}else if(n==2 && l>=6){
							code = 2;// 中
						}else if(n==3 && l>=6){
							code = 3;// 强
						}
					} catch (err) {
						code = 0;
					}
				}		
				return code;
			},	
			getConvertVersion:function(version) {
				try {
					if(version==undefined || version==""){
						return 0;
					}else{
						var m=version.split(".");
						var v=parseInt(m[0]*1000)+parseInt(m[1]*100)+parseInt(m[2]*10)+parseInt(m[3]);
						return v;
					}
					return v;
				}catch(e){
					return 0;
				}			
			},
			setColor: function() {
				var code = '';
				if (!this.checkInstall()) {
					code = '';
				}
				else{
					try {
						var control = document.getElementById(this.settings.pgeId);
						if(this.settings.pgeBackColor!=undefined && this.settings.pgeBackColor!="") control.BackColor=this.settings.pgeBackColor;
						if(this.settings.pgeForeColor!=undefined && this.settings.pgeForeColor!="") control.ForeColor=this.settings.pgeForeColor;
					} catch (err) {
						code = '';
					}
				}
			},
			/** ***********检测性接口**************** */
			/** 检查控件是否已安装 * */
			checkInstall: function() {
				try {
					if (this.osBrowser==1) {
						var comActiveX = new ActiveXObject("PassGuardX.PassGuard.1"); 
					} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5 || this.osBrowser==6 || this.osBrowser==8) {
					    var arr=new Array();
					    if(this.osBrowser==6){
					    	var pge_info=navigator.plugins['PassGuardX'].description;
					    }else if(this.osBrowser==8){
					    	var pge_info=navigator.plugins['PassGuardX'].description;
					    }else{
					    	var pge_info=navigator.plugins['PassGuardX'].description;
					    }
						if(pge_info.indexOf(":")>0){
							arr=pge_info.split(":");
							var pge_version = arr[1];
						}else{
							var pge_version = "";
						}
					} else if (this.osBrowser==3) {
						var comActiveX = new ActiveXObject("PassGuardX.PassGuard.1");
					} else if (this.osBrowser == 10 || this.osBrowser == 11){
						var isInstall = false;
						//指定检查是否安装的id值
						CIJSON.id = this.settings.pgeWindowID;
						//初始化https地址
						urls = this.settings.pgeUrls+":"+this.settings.pgePort+"/"
						jQuery.ajax( {
							timeout : 1000,
							url : urls,
							dataType : "jsonp",
							data : {
								"str" : JSON.stringify(CIJSON)
							},
							contentType : "application/json;utf-8",
							jsonp : "jsoncallback",
							success : function(x) {
								isInstall = true;
							},
							error : function(jqXHR, textStatus, errorThrown) {
								isInstall = false;
							},
							complete: function(XMLHttpRequest,status){
								if(status=='timeout'){// 超时,status还有success,error等值的情况
							　　		isInstall = false;
								}
							}
						});
						//获得input框id值
						var id = this.settings.pgeId;
						//获得控件窗口id值
						var winId = this.settings.pgeWindowID;
						//获得安装包路径
						var winPath = this.settings.pgePath+this.pgeditFFExe;
						//获得当前指向对象
						var obj = this;
						//异步ajax需要延时处理结果，此处延时1秒
						setTimeout(function(){
							//给当前对象赋值
							obj.isInstalled = isInstall;
							if(!isInstall){
								$("#winA").html("请点此安装");
								$("#winA").attr("href",winPath);
							}else{
								$("#"+id+"_down").parent().html('<input type="password"	onfocus="pgeCtrl.openProt(\''+winId+'\',this.id);pgeCtrl.setCX(this);" autocomplete="off" onkeydown="pgeCtrl.setSX(event,\''+obj.settings.pgeOnkeydown+'\');"  onclick="pgeCtrl.setCX(this)"  onblur="pgeCtrl.closeProt(\''+winId+'\',this.id)" id="'+id+'" style="ime-mode:disabled" tabindex="2" class="ocx_style" value="" />');
								var o = document.getElementById(id);
								if(o != null){
									if(obj.osBrowser == 11){
										$("#"+id).attr("type","text");
										o.onkeypress = function(e){
											var chrTyped, chrCode=0, evt=e?e:event;
											chrCode = evt.which;
											var x = String.fromCharCode(chrCode);
											var maxlength = parseInt(obj.settings.pgeMaxlength);
											if(this.value.length > (maxlength -1)){
												return false;
											}
											if(chrCode>=32 && chrCode<=126){
												var reg1 = obj.settings.pgeEreg1.replace("*","");
												reg1 = new RegExp(reg1);
												if(reg1.test(x)){
													this.value+='*';
												}
												return false;
											}else{
												return true;
											}
										}
									}
									if(obj.osBrowser == 10){
										o.onkeypress = function(){
											return inFlag[winId].flag;
										}
									}
								}
								//实例化密码控件窗口 
								obj.instControl(winId);
							}
						},1200)
						return isInstall;
					}
				}catch(e){
					return false;
				}
			    return true;
			},
			/** 检查密码是否匹配正则2 * */
			pwdValid: function(callf) {
				var code = '';
				if (!this.isInstalled) {
					code = 1;
				}else{
					try {
						var control = document.getElementById(this.settings.pgeId);
						if (this.osBrowser==1 || this.osBrowser==3) {
							if(control.output1) code = control.output5;
						} else if (this.osBrowser==2 || this.osBrowser==4 || this.osBrowser==5) {
							code = control.output(5);
						}else if (this.osBrowser==6 || this.osBrowser==8) {
							code = control.get_output5();
						} else if ( this.osBrowser == 10 || this.osBrowser == 11){
							var id = this.settings.pgeWindowID;
							OUTJSON.id = id;
							OUTJSON.data.datatype = 5;
							OUTJSON.data.encrypttype = 0;
							jQuery.ajax( {
								url : urls,
								dataType : "jsonp",
								data : {
									"str" : JSON.stringify(OUTJSON)
								},
								contentType : "application/json;utf-8",
								jsonp : "jsoncallback",
								success : function(x) {
									outs[id].valid = x.data;
									if(callf) eval("("+callf+"())");
								}
							});
						}
					} catch (err) {
						code = 1;
					}
				}
				return code;
			},			
			setDownText:function(){
				if(this.pgeVersion!=undefined && this.pgeVersion!=""){
						this.pgeDownText="请点此升级控件";
				}
			},			
			pgInitialize:function(){
				if(this.isInstalled){
					if(this.osBrowser==1 || this.osBrowser==3){ 
			            jQuery('#'+this.settings.pgeId).show(); 
					}
					var control = document.getElementById(this.settings.pgeId);
					if(this.settings.pgeBackColor!=undefined && this.settings.pgeBackColor!="") control.BackColor=this.settings.pgeBackColor;
					if(this.settings.pgeForeColor!=undefined && this.settings.pgeForeColor!="") control.ForeColor=this.settings.pgeForeColor;
				}else{
					jQuery('#'+this.settings.pgeId+'_pge').hide();	
					if(this.osBrowser==1 || this.osBrowser==3){
						jQuery('#'+this.settings.pgeId+'_down').show();
					}	
				}
			},
			/** ***********https方案相关接口**************** */
			/** 当按enter键时，提交 * */
			setSX : function(e,m){
				var keynum;
				// IE
				if(window.event){
					keynum = e.keyCode
				// Netscape/Firefox/Opera
				}else if(e.which) {
					keynum = e.which
				}
				if(keynum == 13){
					eval("("+m+"())");
				}
			},
			/** 控制不能从中间编辑 * */
			setCX : function(ctrl) {
				var caretPos = 0; 
				// IE Support
				if (document.selection) {
					var sel = document.selection.createRange();
					sel.moveStart('character', -ctrl.value.length);
					caretPos = sel.text.length;
				// Firefox support
				}else if (ctrl.selectionStart || ctrl.selectionStart == '0'){
					caretPos = ctrl.selectionStart;
				}
				var len = ctrl.value.length;
				if (caretPos <= len) {
					// 设置光标位置函数
					if (ctrl.setSelectionRange) {
						setTimeout(function(){
							ctrl.setSelectionRange(len, len);
						},1);
					} else if (ctrl.createTextRange) {
						var range = ctrl.createTextRange();
						range.collapse(true);
						range.moveEnd('character', len);
						range.moveStart('character', len);
						range.select();
					}
				}
			},
			/** 实例化密码控件窗口 * */
			instControl : function(id) {
				ICJSON.id = id;
				//获得当前指向对象
				var obj = this;
				jQuery.ajax( {
					url : urls,
					dataType : "jsonp",
					data : {
						"str" : JSON.stringify(ICJSON)
					},
					contentType : "application/json;utf-8",
					jsonp : "jsoncallback",
					success : function(x) {
						console.log("id:"+id);
						console.log("x.data:"+x.data+",x.code:"+x.code);
						if (x.code == 0) {
							console.info("实例化成功");
						} else {
							console.info("实例化失败");
							console.info("data:" + x.data);
						}
						//初始化密码控件窗口参数
						obj.initControl(id);
						//获得控件版本
						obj.getVersion();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(errorThrown);
					}
				});
				//初始化是否能输入
				inFlag[id] = {"flag":false};
			},
			/** 初始化密码控件窗口参数 * */
			initControl : function(id) {
				INCJSON.id = id;
				INCJSON.data.edittype = this.settings.pgeEdittype;
				INCJSON.data.maxlength = this.settings.pgeMaxlength;
				INCJSON.data.reg1 = this.settings.pgeEreg1;
				INCJSON.data.reg2 = this.settings.pgeEreg2;
				INCJSON.data.lic = {"liccode":license,"url":"aHR0cDovL3d3dy52YmlsbC5jbi9tc3MvbG9naW4vbG9naW4uaHRt"};
				jQuery.ajax( {
					url : urls,
					dataType : "jsonp",
					data : {
						"str" : JSON.stringify(INCJSON)
					},
					contentType : "application/json;utf-8",
					jsonp : "jsoncallback",
					success : function(x) {
						console.log("id:"+id);
						console.log("x.data:"+x.data+",x.code:"+x.code);
						isInit[id] = true;
						if (x.code == 0) {
							console.info("设置参数成功");
						} else {
							console.info("data:" + x.data);
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(errorThrown);
					}
				});
				//初始化对应id心跳值
				onceInterv[id]="";
			},
			/** 开启密码控件保护 * */
			openProt : function(id,inputID) {
				//设置控制输入为false
				inFlag[id].flag = false;
				OPJSON.id = id;
				jQuery.ajax({
					url : urls,
					dataType : "jsonp",
					data : {
						"str" : JSON.stringify(OPJSON)
					},
					contentType : "application/json;utf-8",
					jsonp : "jsoncallback",
					success : function(x) {
						console.log("成功开启保护");
						console.log("x.data:"+x.data+",x.code:"+x.code);
						//设置控制输入为true
						inFlag[id].flag = true;
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(errorThrown);
					}
				});
				// 监听焦点切出
				if(typeof onceInterv[id] == "string"){
					for(var i = 0;i < iterArray.length;i++){
						window.clearInterval(iterArray[i]);
					}
					onceInterv[id] = window.setInterval("pgeCtrl.intervlOut(\""+id+"\",\""+inputID+"\")",800);	
					iterArray.push(onceInterv[id]);
				}
				this.ajaxOnce(id);
			},
			/** 密码控件保护心跳监测 * */
			intervlOut : function(id,inputID) {
				XTJSON.id = id;
				jQuery.ajax( {
					url : urls,
					dataType : "jsonp",
					data : {
						"str" : JSON.stringify(XTJSON)
					},
					contentType : "application/json;utf-8",
					jsonp : "jsoncallback",
					success : function(x) {
						 var va = document.getElementById(inputID);
						 var len = va.value.length;
						 console.log(id+"的长度："+len);
						 console.log("x.data(长度)："+x.data+",x.code:"+x.code);
						 var y = "";
						 if(len != x.data){
							 for(var i =0;i<x.data;i++){
								 y +="*";
							 }
							 va.value=y;
						 }
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(errorThrown);
					}
				});
			},
			/** 关闭密码控件保护 * */
			closeProt : function(id,inputID) {
				CPJSON.id = id;
				jQuery.ajax( {
					url : urls,
					dataType : "jsonp",
					data : {
						"str" : JSON.stringify(CPJSON)
					},
					contentType : "application/json;utf-8",
					jsonp : "jsoncallback",
					success : function(x) {
						console.log("关闭密码控件保护成功");
						console.log("x.data:"+x.data+",x.code:"+x.code);
						inFlag[id].flag = false;
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(errorThrown);
					}
				});
				if(typeof onceInterv[id] == "number"){
					 for(var i = 0;i < iterArray.length;i++){
						 window.clearInterval(iterArray[i]);
					 }
					 onceInterv[id] = "";
				}
				this.ajaxOnce(id);
			},
			/** 发一次ajax * */
			ajaxOnce : function(key){
				var str = "012345"+get_time()+key;
				jQuery.ajax( {
					url : urls,
					dataType : "jsonp",
					data : {
						"str" : str
					},
					contentType : "application/json;utf-8",
					jsonp : "jsoncallback",
					success : function(x) {
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(errorThrown);
					}
				});
			}
		}
	});	
})(jQuery);
var pgeCtrl = new $.pge();