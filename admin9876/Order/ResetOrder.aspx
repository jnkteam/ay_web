<%@ Page Language="C#" AutoEventWireup="true" Inherits="OriginalStudio.WebUI.Manage.Order.ResetOrder" Codebehind="resetorder.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>
<style>

.td1 {padding-right:3px;padding-left:3px;color:#333; padding-bottom:0px;padding-top:5px;height:25px;width:35%; text-align: left;}
.td2 {padding-right:3px;padding-left:8px;padding-top:15px !important;color:#333;background:#e8eaee;text-align:right;width:15%;}
.input_add{width: 232px !important;}
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
        补单功能
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">

        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered table-hover dataTable">
            <tr>
                <td class="td2">
                    </td>
                <td class="td1">
                   上家接口卡单的情况下，可以在这里给客户补单！
                </td>
            </tr>
            <tr>
                <td class="td2">
                    订单类型</td>
                <td class="td1">
                    <asp:RadioButtonList  ID="rblOrdClass"  runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Value="1" Selected="true">网银订单</asp:ListItem>
                         </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    订单号</td>
                <td class="td1">
                <div class="input-group">
                    <asp:TextBox ID="txtOrder" runat="server" class="form-control input_add"  MaxLength="30" ></asp:TextBox>
                      </div>
                    <asp:RequiredFieldValidator ID="rfv_order"  runat="server"
                        ControlToValidate="txtOrder" Display="Dynamic" ErrorMessage="请输入订单号"></asp:RequiredFieldValidator>

                    
                </td>
            </tr>
            <tr>
                <td class="td2">
                    订单成功金额</td>
                <td class="td1">
                <div class="input-group">
                    <asp:TextBox ID="txtOrderAmt" runat="server" class="form-control input_add"  ></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfv_amt" runat="server" 
                        ControlToValidate="txtOrderAmt" Display="Dynamic" ErrorMessage="请输入订单金额"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rev_amt" runat="server" 
                        ControlToValidate="txtOrderAmt" Display="Dynamic" ErrorMessage="订单金额不正确" 
                        ValidationExpression="^{0,1}\d{1,}\.{0,1}\d{0,}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    提交接口商</td>
                <td class="td1">
                  <div class="input-group">
                    <asp:DropDownList ID="ddlSupp" class="form-control" runat="server">
                        </asp:DropDownList>
                  </div>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    </td>
                <td class="td1">
                 <div class="input-group">
                   <asp:Button ID="btnAdd" CssClass="button btn  btn-danger" runat="server" Text="提 交" OnClick="btnAdd_Click"/>
                 </div>
                </td>
            </tr>
            <%--<tr>--%>
                <%--<td class="td2">--%>
                    <%--</td>--%>
                <%--<td class="td1">--%>
                   <%--说明：如果是扣量，被商户发现了，就让用户提交一个差不多的订单，然后通过这里给他补单！--%>
                <%--</td>--%>
            <%--</tr>--%>
        </table>
    </form>
</section>
    </div>
<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>