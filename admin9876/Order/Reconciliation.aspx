<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Order.Reconciliation" ValidateRequest="false" Codebehind="Reconciliation.aspx.cs" %>

<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>
<style>

.td1 {padding-right:3px;padding-left:3px;color:#333; padding-bottom:0px;padding-top:5px;height:25px;width:35%; text-align: left;}
.td2 {padding-right:3px;padding-left:8px;padding-top:15px !important;color:#333;background:#e8eaee;text-align:right;width:15%;}
.input_add{width: 500px !important;}
#rblOrdClass{    margin-top: 7px;}
#rblOrdClass td{padding-left: 8px;}
</style>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        对账查询
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">

    <form id="form1" runat="server">
        <table width="100%" border="0" cellspacing="1" cellpadding="3"  class="table table-bordered table-hover dataTable">         
            <tr>
                <td class="td2">订单号</td>
                <td colspan="8" class="td1">
					<div class="input-group">
						<asp:TextBox ID="txtorders" runat="server" class="form-control input_add" Width="600px"  ></asp:TextBox>
					</div>
					<div class="input-group">
						<asp:Button ID="btn_search" CssClass="button btn  btn-danger" runat="server" Text="提交查询" onclick="btn_search_Click"/>
					</div>
                </td>
            </tr>              
            <tr>
                <td class="td2">上游结果</td>
                <td class="td1">
					<asp:TextBox ID="txtResult" runat="server" class="form-control input_add" Width="600px"  ></asp:TextBox>
                </td>
            </tr>
        </table>
    </form>
</section>
    </div>
<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>
