<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.wxkmadmin_Md5" Codebehind="Md5.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>


 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        MD5加密工具
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
      <table width="100%" border="0" cellspacing="1" cellpadding="3"  class="table1">
            <tr>							
                <td colspan="1">
                    <div class="input-group">
						<div class="input-group-btn"><button type="button" class="btn btn-primary">被加密字符串：</button></div>
					</div>
				</td>
				<td colspan="5">
					<div class="input-group">
						<asp:TextBox ID="txtMd5Str" class="form-control" runat="server"></asp:TextBox>
					</div>
				</td>
            </tr>
            <tr>
				<td>
                    <div class="input-group">
						<div class="input-group-btn"><button type="button" class="btn btn-primary">字符编码：</button></div>
					</div>
				</td>
				<td>
					<div class="input-group">
						<asp:DropDownList ID="ddlencode" runat="server">
							<asp:ListItem Value="utf-8">UTF-8</asp:ListItem>						
							<asp:ListItem Value="gb2312">GB2312</asp:ListItem>
							<asp:ListItem Value="gbk">GBK</asp:ListItem>
						</asp:DropDownList>
					</div>				
				</td>				
            </tr>
            <tr>
				<td>
                    <div class="input-group">
						<div class="input-group-btn"><button type="button" class="btn btn-primary">加密结果：</button></div>						
					</div>
				</td>
				<td>
					<div class="input-group">
						<asp:TextBox ID="txtresult" runat="server" TextMode="MultiLine"></asp:TextBox>
					</div>
				</td>				
            </tr>
            <tr>
				<td colspan="6">
                    <div class="input-group">
						<asp:Button ID="btn_Update" runat="server" Text="加密" OnClick="btnUpdate_Click" CssClass="button btn  btn-danger" />
					</div>
				</td>				
            </tr>
        </table>
    </form>
</section>
</div>

<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>

		<script src="<%=ADMIN_URI%>/style/admin/layer/layer.js"></script>
		<script>
		  $(function () {



			 $("#StimeBox").jeDate({

					format: "YYYY-MM-DD hh:mm:ss",

				});
			 $("#EtimeBox").jeDate({

						 format: "YYYY-MM-DD hh:mm:ss",

					 });



		  })

	function handler(tp) {
	}

	var mytr = document.getElementById("table2").getElementsByTagName("tr");
	for (var i = 1; i < mytr.length; i++) {
		mytr[i].onmouseover = function() {
			var rows = this.childNodes.length;
			for (var row = 0; row < rows; row++) {
				this.childNodes[row].style.backgroundColor = '#E6EEFF';
			}
		};
		mytr[i].onmouseout = function() {
			var rows = this.childNodes.length;
			for (var row = 0; row < rows; row++) {
				this.childNodes[row].style.backgroundColor = '';
			}
		};
	}

</script>

