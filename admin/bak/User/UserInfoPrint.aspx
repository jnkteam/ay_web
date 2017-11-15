<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.User.UserInfoPrint" Codebehind="UserInfoPrint.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户信息</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="../../css/Styles2.0.css" type="text/css" rel="stylesheet" />
	<script src="../../jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
	<script src="../../jquery/jquery.jqprint-0.3.js" type="text/javascript"></script>	
	<script type="text/javascript">
		$().ready(function() {
		var usertype = $("input[name='rbluserType']:checked").val();       
			if (usertype == "3") {
				$("#ddlmemvip").show();
				$("#ddlpromvip").hide();
			}
			else if (usertype == "4") {
				$("#ddlpromvip").show();
				$("#ddlmemvip").hide();
			}
			$("input[name='rbluserType']").click(function() {
				var usertype = $(this).val();   
					   
				if (usertype == "3") {
					$("#ddlmemvip").show();
					$("#ddlpromvip").hide();
				}
				else if (usertype == "4") {
					$("#ddlpromvip").show();
					$("#ddlmemvip").hide();
				}
			});
		})     
		function doPrint(){		
			$("#admin_center").jqprint();
		}
    </script>
</head>
<body  class="mainbody">
    <form id="form1" runat="server">
		<div id="admin_center">
        <table class="tb" cellpadding="1" cellspacing="1">
            <tr>
                <td class="tb_title" colspan="4" >商户基本信息</td>
            </tr>
            <tr>
                <td class="tb_left">用户名ID</td>
                <td class="tb_right"><asp:Label ID="lblid" runat="server"></asp:Label></td>
                <td class="tb_left">用户名</td>
                <td class="tb_right"><asp:Label ID="lblUserName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="tb_left">签约属性</td>
                <td class="tb_right"><asp:Label ID="lbluserclass" runat="server"></asp:Label></td>
                <td class="tb_left">用户名</td>
                <td class="tb_right"><asp:Label ID="lblfullname" runat="server"></asp:Label></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tb_left">会员类型</td>
                <td class="tb_right"><asp:Label ID="lbluserType" runat="server"></asp:Label></td>
                <td class="tb_left">会员等级</td>
                <td class="tb_right"><asp:Label ID="lblmemvip" runat="server"></asp:Label></td>
            </tr>			
            <tr>
                <td class="tb_left">所属代理</td>
                <td class="tb_right"><asp:Label ID="lblagents" runat="server"></asp:Label></td>
                <td class="tb_left">所属业务员</td>
                <td class="tb_right"><asp:Label ID="lblmange" runat="server"></asp:Label></td>
            </tr>		
            <tr>
                <td class="tb_left">邮箱地址</td>
                <td class="tb_right"><asp:Label ID="lblemail" runat="server"></asp:Label></td>
                <td class="tb_left">QQ号码</td>
                <td class="tb_right"><asp:Label ID="lblqq" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="tb_left">手机号码</td>
                <td class="tb_right"><asp:Label ID="lbltel" runat="server"></asp:Label></td>
                <td class="tb_left">身份证号码</td>
                <td class="tb_right"><asp:Label ID="lblidCard" runat="server"></asp:Label></td>
            </tr>				
            <tr>
                <td class="tb_left">收款方式</td>
                <td class="tb_right"><asp:Label ID="lblsettlemode" runat="server"></asp:Label></td>
                <td class="tb_left">开户银行</td>
                <td class="tb_right"><asp:Label ID="lblpayeeBank" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="tb_left">银行帐号</td>
                <td class="tb_right"><asp:Label ID="lblaccount" runat="server"></asp:Label></td>
                <td class="tb_left">收款人</td>
                <td class="tb_right"><asp:Label ID="lblpayeeName" runat="server"></asp:Label></td>
            </tr>				
            <tr>
                <td class="tb_left">注册时间</td>
                <td class="tb_right"><asp:Label ID="lblregTime" runat="server"  ></asp:Label></td>
                <td class="tb_left">最后登录IP</td>
                <td class="tb_right"><asp:Label ID="lbllastLoginIp" runat="server"  ></asp:Label></td>
            </tr>		
            <tr>                
                <td class="tb_left">结算模式</td>
                <td class="tb_right"><asp:Label ID="lblsettledmode" runat="server"></asp:Label></td>
                <td class="tb_left">首次登录IP</td>
                <td class="tb_right"><asp:Label ID="lblfirstLoginIp" runat="server"  ></asp:Label></td>				
			</tr>			
			<tr>
                <td class="tb_left">认证信息 </td>
				<td class="tb_right" colspan="3"><asp:Label ID="lblPass" runat="server"></asp:Label></td>
            </tr>		
			<tr>
                <td class="tb_left">身份证件</td>
				<td class="tb_right"><img id="img1" src="<%# frontPic%>" width="180px" height="120px" style="border: 0" /></td>
				<td class="tb_left">身份证件</td>
				<td class="tb_right"><img id="img1" src="<%# backPic%>" width="180px" height="120px" style="border: 0" /></td>
            </tr>
        </table>
		</div>
    </form>
	<div align="center">
		<input type="button" value="打印" class="btnSubmit" onclick="doPrint()" />
	</div>
</body>
</html>