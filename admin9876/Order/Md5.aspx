<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.wxkmadmin_Md5" Codebehind="Md5.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>
 <style type="text/css">
            table
              {
                  width: 100%;
                  max-width: 100%;

                  border: 1px solid #f4f4f4;
                  able-layout:fixed;
              }
              .table td{
                  padding: 8px;
                  line-height: 1.92857143 !important;
                  vertical-align: top;
                  border-top: 1px solid #ddd;
                  font-size:14px;
                  overflow: hidden;

                  word-break: break-all; word-wrap:break-word;
              }
     A:link {COLOR:#237C04;TEXT-DECORATION: none}
     td {height:20px; line-height:20px; padding:0px; vertical-align:middle !important;}

     .td1 {padding-right:3px;padding-left:3px;color:#999999;padding-bottom:0px;padding-top:5px;height:25px;}
     .td2 {padding-right:3px;padding-left:8px;padding-top:5px; color: #333;background: #e8eaee;text-align:right;}

    input { border:1px solid #999;padding:3px;margin-left:10px;font:12px tahoma;ling-height:16px}
    select { border:1px solid #999;padding:3px;margin-left:10px;font:12px tahoma;ling-height:16px}


    #nav LI A.noncurrent {/*border:#DC171E 3px solid;*/}
    #nav UL {PADDING-BOTTOM: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; PADDING-TOP: 0px}
    #nav LI {DISPLAY: inline; padding-left:10px;}
    #nav LI a:hover {border:#B6E000 1px solid;}
    #nav li A:visited {border:#ff0000 1px solid;}
    img{border:#CCCCCC 1px solid;padding:0 5px}

    #rblTypeOpen td{border:0 !important;}
    #rblOpen td{border:0 !important;}

    </style>

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
      <table width="100%" border="0" cellspacing="1" cellpadding="3"  class="table1" class="table table-bordered table-hover dataTable">
            <tr>							
                <td class="td2">
                    被加密字符串：

				</td>
				<td class="td1">
					<div class="input-group">
						<asp:TextBox ID="txtMd5Str" style="width:280px !important" class="form-control" runat="server"></asp:TextBox>
					</div>
				</td>
            </tr>
            <tr>
				<td class="td2">
                    字符编码：

				</td>
				<td class="td1">
					<div class="input-group">
						<asp:DropDownList class="form-control" ID="ddlencode" runat="server">
							<asp:ListItem Value="utf-8">UTF-8</asp:ListItem>						
							<asp:ListItem Value="gb2312">GB2312</asp:ListItem>
							<asp:ListItem Value="gbk">GBK</asp:ListItem>
						</asp:DropDownList>
					</div>				
				</td>				
            </tr>
            <tr>
				<td class="td2">
                    加密结果：
				</td>
				<td class="td1">
					<div class="input-group">
						<asp:TextBox ID="txtresult" style="margin-left:10px; width:280px !important; height:100px" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
					</div>
				</td>				
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
				<td colspan="6" align="center">

						<asp:Button ID="btn_Update" runat="server" Text="加密" OnClick="btnUpdate_Click" CssClass="button btn  btn-danger" />

				</td>				
            </tr>
        </table>
    </form>
</section>
</div>

<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>

