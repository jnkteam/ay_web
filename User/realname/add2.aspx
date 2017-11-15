<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="add.aspx.cs" Inherits="KuaiCard.WebUI.User.realname.add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>VIP 认证 - </title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		
		<link href="/skin/css/common.css" rel="stylesheet" type="text/css" media="screen,projection" />
		<link href="/skin/user/user.css" rel="stylesheet" type="text/css" media="screen,projection" />
		<link href="/skin/user/css/verify_list.css" rel="stylesheet" type="text/css" media="screen,projection" />

		<script type="text/javascript" src="/javascript/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="/static/js/jquery.core.js"></script>
		<script type="text/javascript" src="/static/js/jquery.form.js"></script>
		<script type="text/javascript" src="/static/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="/static/dialog/jquery.dialog.js?skin=default"></script>
		<script type="text/javascript" src="/static/dialog/plugins/iframeTools.js"></script>
		<script type="text/javascript" src="/skin/user/js/user.js"></script>
		<script type="text/javascript" src="/skin/js/jquery.treeview.js"></script>
		<script type="text/javascript" src="/skin/user/js/menu.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		    //隔行变色
		    $(function() {
		        $(".td1").each(function(i) { this.style.backgroundColor = ['#fff', '#fafafa'][i % 2] })
		    })

		    //提交表单
		    $(function() {
		        $(".ajaxSubmit2").click(function() {
		            var auth_Type = $('input[name="auth_Type"]').val();
		            var auth_Name = $('[name="auth_Name2"]').val();
		            var auth_PaperworkNumb = $('[name="auth_PaperworkNumb"]').val();
		            var fileUp1 = $("#fileUp1").val();
		            var fileUp2 = $("#fileUp2").val();

		            if (auth_Type == 1) {
		                var errTxt1 = "个人姓名";
		                var errTxt2 = "身份证号码";
		                var errTxt3 = "身份证正面扫描件";
		            }
		            else {
		                var errTxt1 = "企业名称";
		                var errTxt2 = "(营业执照/组织机构)号码";
		                var errTxt3 = "(营业执照/组织机构)扫描件";
		            }

		            if (auth_Name == "" || auth_Name == null) {
		                core.tips("请填写" + errTxt1 + "！", 2, "error");
		                return false;
		            }
		            else {
		                var reg = /^[\u4E00-\u9FA5\uF900-\uFA2D]{2,20}$/;
		                if (!reg.test(auth_Name)) {
		                    core.tips(errTxt1 + "填写错误！", 2, "error");
		                    return false;
		                }
		            }

		            if (auth_PaperworkNumb == "" || auth_PaperworkNumb == null) {
		                core.tips("请填写" + errTxt2 + "！", 2, "error");
		                return false;
		            }
		            else {
		                var reg = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
		                if (auth_Type == 2) { reg = /^[\w\-]{10,25}$/; }
		                if (!reg.test(auth_PaperworkNumb)) {
		                    core.tips(errTxt2 + "填写错误！", 2, "error");
		                    return false;
		                }
		            }

		            if (fileUp1 == "" || fileUp1 == null) {
		                core.tips("请选择" + errTxt3 + "！", 2, "error");
		                return false;
		            }
		            else {
		                var tem = fileUp1.split(".")[1].toLowerCase();
		                if (tem != "jpg" && tem != "gif" && tem != "jpeg" && tem != "png") {
		                    core.tips(errTxt3 + "必须是 jpg/png 格式的图片！", 2, "error");
		                    return false;
		                }
		            }

		            if (auth_Type == 1) {
		                if (fileUp2 == "" || fileUp2 == null) {
		                    core.tips("请选择身份证反而扫描件！", 2, "error");
		                    return false;
		                }
		                else {
		                    var tem = fileUp2.split(".")[1].toLowerCase();
		                    if (tem != "jpg" && tem != "gif" && tem != "jpeg" && tem != "png") {
		                        core.tips("身份证反而扫描件必须是 jpg/png 格式的图片！", 2, "error");
		                        return false;
		                    }
		                }
		            }

		            var buttonText = $(".ajaxSubmit2").val();

		            $(".ajaxSubmit2").val("请稍候...").attr("disabled", "disabled");

		            var successI = 0;

		            $("#formFile1").ajaxSubmit({
		                success: function(data) {
		                    var json = eval('json = ' + data);
		                    if (json.result) {
		                        $('[name="attachments1"]').val(json.url);

		                        successI++;

		                        if (successI == 2 || auth_Type == 2) {
		                            submitForm();
		                        }
		                    } else {
		                        core.error(json.text);
		                        $(".ajaxSubmit2").val(buttonText).attr("disabled", false);
		                    }
		                },
		                error: function(XMLHttpRequest, textStatus, errorThrown) {
		                }
		            });


		            if (auth_Type == 1) {
		                $("#formFile2").ajaxSubmit({
		                    success: function(data) {
		                        var json = eval('json = ' + data);
		                        if (json.result) {
		                            $('[name="attachments2"]').val(json.url);
		                            successI++;
		                            if (successI == 2) {
		                                submitForm();
		                            }
		                        } else {
		                            core.error(json.text);
		                            $(".ajaxSubmit2").val(buttonText).attr("disabled", false);
		                        }
		                    },
		                    error: function(XMLHttpRequest, textStatus, errorThrown) {
		                    }
		                });
		            }
		        });
		    });

		    function submitForm() {
		        $("#form1").ajaxSubmit({
		            success: function(data) {
		                json = eval('json = ' + data);
		                if (json.result) {
		                    core.tips(json.text, 2, "success", function() {
		                        location.href = json.url;
		                    });
		                }
		                else {
		                    $(".ajaxSubmit2").val("提交审核");
		                    $(".ajaxSubmit2").attr("disabled", false);
		                    core.tips(json.text, 1.5, "error");
		                }
		            },
		            error: function(XMLHttpRequest, textStatus, errorThrown) {
		            }
		        });
		    }
		</SCRIPT>

</head>
<body>
    <table class="tab" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="64" colspan="2">
                <div class="head">
                    <a class="logo" href="/user/" onfocus="this.blur();">
                        <%=SiteName%></a>
                    <ul class="nav">
                        <li>上次登录时间：<asp:Literal ID="litLastLoginTime" runat="server"></asp:Literal>
                            上次登录IP：<asp:Literal ID="litLastLoginIp" runat="server"></asp:Literal>
                        </li>
                        <li>欢迎您，<asp:Literal ID="LitUserName" runat="server"></asp:Literal></li>
                        <li><a class="mess1">余额：</a><a id="money"><%=balancea%></a>&nbsp; <a href="javascript:"
                            onclick="ajaxSubmit();">刷新</a></li>
                        <li><a class="messHov" href="/user/message/">站内消息（<%=getmsgcount %>）</a></li>
                        <li><a class="mess2" href="/user/logout/">退 出</a></li>
                    </ul>
                </div>
            </td>
        </tr>
        <tr>
            <td class="l" width="180" valign="top">
                <div class="menu">
                    <h2>
                        		<h2><a href="/user/" onfocus="this.blur();">会员首页</a></h2>

		<ul class="menuList" id="tree">
		<li>
				<span class="l1"><a href="/user/">商户首页</a></span>
				
		
			</li>
			<li>
				<span class="l1">交易管理</span>
				<ul class="menuList2" style="display:none">
					<li><a href="/user/order/" onfocus="this.blur();">网银订单</a></li>
					<li><a href="/user/ordercard/" onfocus="this.blur();">点卡订单</a></li>

				</ul>
			</li>

			<li>
				<span class="l2">财务管理</span>
								<ul class="menuList2" style="display:none">
					<li><a href="/user/money/" onfocus="this.blur();">收支明细</a></li>
					<li><a href="/user/withdrawal/" onfocus="this.blur();">提现管理</a></li>
					<li><a href="/user/cashcoupon/" onfocus="this.blur();">结算记录</a></li>
					<li><a href="/user/verify/" onfocus="this.blur();">收款账户<img src="/skin/images/user/new.png" style="vertical-align:middle;padding-left:10px" /></a></a></li>
				</ul>
			</li>
			<li>
				<span class="l3">账号管理</span>
			<ul class="menuList2" style="display:none">
					<li><a href="/user/realname/" onfocus="this.blur();">实名认证<img src="/skin/images/user/new.png" style="vertical-align:middle;padding-left:10px" /></a></li>

					<li><a href="/user/profile/" onfocus="this.blur();">资料维护</a></li>
				</ul>
			</li>
			<li>
				<span class="l1">商品管理</span>
                                        <ul class="menuList2" style="display:none">
					<li><a href="/user/userrate/" onfocus="this.blur();">费率查看</a></li>
                                </ul>
                        <li>
			<li>
				<span class="l1">批量销卡</span>
                                        <ul class="menuList2" style="display:none">
					<li><a href="/user/Pincard/" onfocus="this.blur();">点卡消耗</a></li>
                                 </ul>
                        <li>

				<span class="l4">信息管理</span>
				<ul class="menuList2" style="display:none">
					<li><a href="/user/message/" onfocus="this.blur();">站内消息</a></li>
					
				</ul>
                        <li>

				<span class="l4">安全中心</span>
				<ul class="menuList2" style="display:none">
					<li><a href="/user/password/" onfocus="this.blur();">修改密码</a></li>
					<li><a id="linshouji" runat="server" onfocus="this.blur();">绑定手机</a></li>
					<li><a id="linemail" runat="server" onfocus="this.blur();">安全邮箱</a></li>
					<li><a href="/user/awalpassword/" onfocus="this.blur();">提现密码</a></li>
					
				</ul>
                        <li>

				<span class="l4">接入中心</span>
				<ul class="menuList2" style="display:none">
					<li><a href="/user/api/" onfocus="this.blur();">资料下载</a></li>
                                </ul>
                        </li>
                    </ul>
                </div>
            </td>
            <td valign="top" class="r">
				
			<div class="title02">VIP 认证</div>

				<!--Tab标签开始-->
				<div class="tabs">
					<div class="tab1  tab-current"  onclick="location.href='/user/verify/add.html?verifytyp=1';"><a href="javascript:void(0)">个人认证</a></div>
					
					<div style="clear:both">
					</div>
				</div>
				<!--Tab标签结束-->

				<table class="V_tb2">
				
					<form name="form1" id="form1" action="/user/Service/realname.ashx" method="post" onSubmit="return false">
						<tbody>
							<input name="m" type="hidden" value="user" />
							<input name="c" type="hidden" value="verify" />
							<input name="a" type="hidden" value="save" />
							<input name="attachments1" type="hidden" value="" />
							<input name="attachments2" type="hidden" value="" />

							<input name="auth_Type" type="hidden" value="1" />

							  <tr class="td1">
								<th style="width:200px;">会员ID</th>
								<td><%=userid%></td>
							  </tr>
							  <tr class="td1">
								<th><font style="color:#F00">*</font><span id="nametxt">个人姓名</span></th>
								<td><input type="text" name="auth_Name2"  id="auth_Name" class="input" maxlength="50" style="width:290px" /><font style="color:#999;padding-left:20px">认证后无法修改，请认真填写</font></td>
							  </tr>
							  <tr class="td1">
								<th><font style="color:#F00">*</font><span id="paperworktxt">身份证号码</span></th>
								<td><input type="text" name="auth_PaperworkNumb" class="input" maxlength="50" style="width:290px" /><font style="color:#999;padding-left:20px">认证后无法修改，请认真填写</font></td>
							  </tr>
						  </tbody>
					  </form>

					  <form id='formFile1' name='formFile1' method="post" action="/user/Service/upload.ashx" target='_blank' enctype="multipart/form-data">
						  <tbody>
							  <tr class="td1">
								<th><font style="color:#F00">*</font><span id="paperworkpictxt">身份证正面扫描件</span></th>
								<td>
									<input type='file' id='fileUp1' name='fileUp' onchange="upload(this.value);" style="width:300px;height:30px" /><font style="color:#999;padding-left:20px">请上传清晰度较高的图片，支持PNG/JPG，小于1M</font>
								</td>
							  </tr>
						</tbody>
					</form>

					  <form id='formFile2' name='formFile2' method="post" action="/user/Service/upload.ashx" target='_blank' enctype="multipart/form-data">
						  <tbody>
							  <tr class="td1" id="pic2">
								<th><font style="color:#F00">*</font><span id="paperworkpictxt">身份证反面扫描件</span></th>
								<td>
									<input type='file' id='fileUp2' name='fileUp' onchange="upload(this.value);" style="width:300px;height:30px" />
								</td>
							  </tr>
						</tbody>
					</form>
				

				<tr class="td1">
					<th></th>
					<td><input type="button" value="提交审核" class="V_btn4 submit ajaxSubmit2" /></td>
				  </tr>
				</table>


			    <div class="V_con1">
			    	<p><font style='color:red'>认证关乎到您的账户安全，请勿使用P图、网络图等伪造图片，否则将导致无法使用提现
			    		PUSH等功能；</font><br />认证资料一经通过审核后无法修改，可以转换认证类型；<br />请上传清晰度较高的图片，模糊不清的图片将导致审核不通过；<br />客服人员将在收到认证资料之后的1-24小时内审核，周末及法定假日顺延。</p>
			    </div>



			</td>
		  </tr>
		</table>
		</body>

</html>
