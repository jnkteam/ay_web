<%@ Page Language="C#" MasterPageFile="~/User/Site1.Master" AutoEventWireup="True" CodeBehind="addbank.aspx.cs" Inherits="KuaiCard.WebUI.User.verify.addbank" Title="添加收款帐号" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="/skin/user/css/addbank.css" rel="stylesheet" type="text/css" media="screen,projection" />
		<SCRIPT LANGUAGE="JavaScript">
		    // 隔行变色
		    $(function() {
		        setup();
		        $(".td1").each(function(i) {
		            this.style.backgroundColor = ['#fff', '#fafafa'][i % 2];
		        });

		        $('[name="accountType"]').change(function() {

		            if ($(this).val() == "alipay") {
		                $(".banktr").hide();
		                $(".alipaytr").show();
		                $("#Typebank").val("alipay");
		            } else {
		                $(".banktr").show();
		                $(".alipaytr").hide();
		                $("#Typebank").val("bank");
		            }
		        });
		        $('[name="bankName"]').change(function() {

		            var id = $(this).val()
		            $("#bankid").val(id);
		        });
		    })
		</SCRIPT>

    <script type="text/javascript">
        function ajaxSubmit() {
            var bankCode = $("input[name='bankid']").val();

            var typeBank = $("#Typebank").val();
            var Province = $("#s1").val();
            var City = $("#s2").val();
            var Area = $("#s3").val();
            var bankfullname = $("input[name='bankfullname']").val();
            var accountName = $("input[name='accountName']").val();
            var accountID = $("input[name='accountID']").val();
            var alipayID = $("input[name='alipayID']").val();
            
            var code = $("#verifycode").val();
            var name = $("input[name='sign']").val();
            var sSource = '/user/Service/thebank.ashx?t=' + Math.random();
            var postData = 'bankCode=' + bankCode + '&typeBank=' + typeBank + '&Province=' + Province + '&City=' + City + '&Area=' + Area + '&bankfullname=' + bankfullname + '&accountName=' + accountName + '&accountID=' + accountID + '&alipayID=' + alipayID;
            var loading = $.dialog.tips("提交中，请稍后……", 60, "loading");
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: sSource,
                data: postData,

                success: function(json) {

                    if (json.result == 'ok') {
                        loading.close();
                        $.dialog({
                            title: '信息提示',
                            content: json.msg,
                            icon: json.ico,
                            time: '10',
                            ok: true
                        });
                        window.location.href = '/user/verify/';
                    } else {
                        loading.close();
                        $.dialog({
                            title: '信息提示',
                            content: json.msg,
                            icon: json.ico,
                            time: '10',
                            ok: true

                        });

                    }
                }

            })
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" src="/static/js/geo.js"></script>
<input name="Typebank" id= "Typebank" type="hidden" value="bank" />
<input name="bankid" id="bankid" value="" type="hidden" />
 <td valign="top" class="r">
				<div class="title02">添加收款帐号<a href="/user/verify/" class="Annkela"><img src="/skin/images/User/Icon/12.png"/>已添加帐号列表</a></div>
					  <table class="V_tb2">
						  <tr class="td1">
							<th style="width:120px" width="120">帐号类型</th>
							<td>
								<label for="accountType_bank"><input name="accountType" id="accountType_bank" type="radio" value="bank" checked="checked" /> 银行卡</label>

							</td>
						</tr>

							<tr class="td1 banktr">
								<th class="style1"><font style="color:#F00">*</font>开户行</th>
								<td class="style1">
									<div class="paytypes">
										<!--中国银行-->
										<div style="clear:both">
											<b><input type="radio" name="bankName" value="1026" id="boc" /></b>
											<label for="boc">
												<a class="ico boc"></a>
											</label>
										</div>

										<!--工商银行-->
										<div>
											<b><input type="radio" name="bankName" value="1002" id="icbc" /></b>
											<label for="icbc">
												<a class="ico icbc"></a>
											</label>
										</div>


										<!--招商银行-->
										<div>
											<b><input type="radio" name="bankName" value="1001" id="cmb" /></b>
											<label for="cmb">
												<a class="ico cmb"></a>
											</label>
										</div>

										<!--建设银行-->
										<div>
											<b><input type="radio" name="bankName" value="1003" id="ccb" /></b>
											<label for="ccb">
												<a class="ico ccb"></a>
											</label>
										</div>

										<!--农业银行-->
										<div>
											<b><input type="radio" name="bankName" value="1005" id="abc" /></b>
											<label for="abc">
												<a class="ico abc"></a>
											</label>
										</div>


										<!--上海浦东发展银行-->
										<div>
											<b><input type="radio" name="bankName" value="1004" id="spdb" /></b>
											<label for="spdb">
												<a class="ico spdb"></a>
											</label>
										</div>


										<!--兴业银行-->
										<div>
											<b><input type="radio" name="bankName" value="1009" id="cib" /></b>
											<label for="cib">
												<a class="ico cib"></a>
											</label>
										</div>

										<!--广发银行-->
										<div>
											<b><input type="radio" name="bankName" value="1027" id="gdb" /></b>
											<label for="gdb">
												<a class="ico gdb"></a>
											</label>
										</div>

										<!--华夏银行-->
										<div>
											<b><input type="radio" name="bankName" value="1025" id="hxb" /></b>
											<label for="hxb">
												<a class="ico hxb"></a>
											</label>
										</div>

										<!--杭州银行-->
										<div>
											<b><input type="radio" name="bankName" value="1027" id="hzcb" /></b>
											<label for="hzcb">
												<a class="ico hzcb"></a>
											</label>
										</div>

										<!--上海银行-->
										<div>
											<b><input type="radio" name="bankName" value="1028" id="shbank" /></b>
											<label for="shbank">
												<a class="ico shbank"></a>
											</label>
										</div>

										<!--宁波银行-->
										<div>
											<b><input type="radio" name="bankName" value="1029" id="nbbank" /></b>
											<label for="nbbank">
												<a class="ico nbbank"></a>
											</label>
										</div>

										<!--平安银行-->
										<div>
											<b><input type="radio" name="bankName" value="1010" id="spabank" /></b>
											<label for="spabank">
												<a class="ico spabank"></a>
											</label>
										</div>

										<!--中国邮政储蓄银行-->
										<div>
											<b><input type="radio" name="bankName" value="1066" id="postgc" /></b>
											<label for="postgc">
												<a class="ico postgc"></a>
											</label>
										</div>

										<!--交通银行-->
										<div>
											<b><input type="radio" name="bankName" value="1020" id="comm" /></b>
											<label for="comm">
												<a class="ico comm"></a>
											</label>
										</div>

										<!--中国光大银行-->
										<div>
											<b><input type="radio" name="bankName" value="1022" id="ceb" /></b>
											<label for="ceb">
												<a class="ico ceb"></a>
											</label>
										</div>

										<!--北京银行-->
										<div>
											<b><input type="radio" name="bankName" value="1030" id="bjbank" /></b>
											<label for="bjbank">
												<a class="ico bjbank"></a>
											</label>
										</div>

										<!--大连银行-->
										<div>
											<b><input type="radio" name="bankName" value="1031" id="dlb" /></b>
											<label for="dlb">
												<a class="ico dlb"></a>
											</label>
										</div>

										<!--浙商银行-->
										<div>
											<b><input type="radio" name="bankName" value="1032" id="czsb" /></b>
											<label for="czsb">
												<a class="ico czsb"></a>
											</label>
										</div>

										<!--民生银行-->
										<div>
											<b><input type="radio" name="bankName" value="1006" id="cmbc" /></b>
											<label for="cmbc">
												<a class="ico cmbc"></a>
											</label>
										</div>

										<!--中信银行-->
										<div>
											<b><input type="radio" name="bankName" value="1021" id="citic" /></b>
											<label for="citic">
												<a class="ico citic"></a>
											</label>
										</div>

										<!--盛京银行-->
										<div>
											<b><input type="radio" name="bankName" value="1034" id="sjb" /></b>
											<label for="sjb">
												<a class="ico sjb"></a>
											</label>
										</div>
										<!--深圳发展银行-->
										<div>
											<b><input type="radio" name="bankName" value="1033" id="szdb" /></b>
											<label for="szdb">
												<a class="ico szdb"></a>
											</label>
										</div>
										<!--汇丰银行-->
										<div>
											<b><input type="radio" name="bankName" value="1035" id="hsbc" /></b>
											<label for="hsbc">
												<a class="ico hsbc"></a>
											</label>
										</div>

										<div style="clear:both;height:20px"></div>

									</div>
								</td>
							  </tr>

							<tr class="td1 banktr" style="display: none;">
								<th><font style="color:#F00">*</font>开户行所在地</th>
								<td>
									<select name="Province" id="s1" style="width:100px;">
									</select>
									<select name="City" id="s2" style="width:150px;">
									</select>   
									<select name="Area" id="s3" style="width:150px;">
									</select>
								</td>
							</tr>

							<tr class="td1 banktr" style="display: none;">
								<th><font style="color:#F00">*</font>支行名称</th>
								<td><input type="text" name="bankfullname" class="V_input2" value=""  style="width:410px;"/>(如:科技园支行)</td>
							</tr>

							<tr class="td1">
								<th><font style="color:#F00">*</font>收款人姓名</th>
								<td><input type="text" name="accountName" class="V_input2" value="" style="width:410px;" /></td>
							</tr>

							<tr class="td1 banktr">
								<th><font style="color:#F00">*</font>银行账号</th>
								<td><input type="text" name="accountID" class="V_input2" value=""  style="width:410px;"/></td>
							</tr>


							<tr class="td1 alipaytr" style="display:none">
								<th><font style="color:#F00">*</font>支付宝账号</th>
								<td><input type="text" name="alipayID" class="V_input2" /></td>
							</tr>

						  <tr class="td1">
							<th></th>
							<td><a  href="javascript:" onclick="ajaxSubmit();" class="V_btn4 submit ajaxSubmit" >保 存</a></td>
						  </tr>
					</table>
				  </form>

				 
				<div class="V_con1">
					<p>
						<span style="font-size:14px;">1、开户名必须与认证的个人姓名/企业名称一致！<br>2、填写的帐号必须与开户名对应，否则可能会因此而造成无法成功收到提现、退款及PUSH所得钱款！</span>
				</div>  
				 
				 
				</td>


</asp:Content>
