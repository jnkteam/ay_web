<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Reconciliation" ValidateRequest="false" Codebehind="Reconciliation.aspx.cs" %>

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
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">

    <form id="form1" runat="server">
        <table width="100%" border="0" cellspacing="1" cellpadding="3"  class="table table-bordered table-hover dataTable">

            <tr>
                <td class="td2">
                    接口商</td>
                <td colspan="3" class="td1">
                <div class="input-group">
                    <asp:DropDownList ID="ddlsupp" class="form-control" runat="server">
                        <asp:ListItem Value="80">欧飞</asp:ListItem>
                        <asp:ListItem Value="60866">60866</asp:ListItem>
                        <asp:ListItem Value="81">汇元</asp:ListItem>
                        <asp:ListItem Value="70">70card</asp:ListItem>
                        <asp:ListItem Value="700">龙宝</asp:ListItem>
                        <asp:ListItem Value="86">神州付</asp:ListItem>
                        <asp:ListItem Value="3200">天付宝</asp:ListItem>
                    </asp:DropDownList>
                </div>
                    </td>
            </tr>            
            <tr>
                <td class="td2">
                    订单号</td>
                <td colspan="3" class="td1">
                <div class="input-group">
                    <asp:TextBox ID="txtorders" runat="server" class="form-control input_add" Width="600px"  ></asp:TextBox>
                </div>
                    </td>
            </tr>              
            <tr>
                <td>
                    &nbsp;</td>
                <td class="td1" colspan="3">
                    <span style="padding-left: 3px; height: 40px">
                     <div class="input-group">
                        <asp:Button ID="btn_search" CssClass="button btn  btn-danger" runat="server" Text="提交查询"
                        onclick="btn_search_Click"/>
                        </div>
                    </span>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="1" cellpadding="0" class="table1">
       
        <tr>
            <td bgcolor="#ffffff">                
                <table cellspacing="0" cellpadding="0" width="100%" border="0"  class="table table-bordered">
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                                <asp:Repeater ID="rptOrders" runat="server" >
                                    <HeaderTemplate>
                                        <tr height="30"  style="background: #e8eaee">
                                            <td>
                                                订单号
                                            </td>
                                            <td>
                                                流水号
                                            </td>
                                            <td>
                                                支付金额
                                            </td>
                                            <td>
                                                查询结果
                                            </td>
                                            <td>
                                                支付状态
                                            </td>
                                            <td>
                                                交易币种
                                            </td>
                                            <td>
                                                卡种
                                            </td>                                           
                                        </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr bgcolor="#EFF3FB" >
                                            <td>
                                                <%# Eval("orderid")%>
                                            </td>
                                            <td>
                                                <%# Eval("supporder")%>
                                            </td>
                                            <td>
                                                <%# Eval("realamt")%>                                               
                                            </td>
                                            <td>
                                                <%# Eval("result")%>
                                            </td>                                           
                                            <td>
                                                <%# Eval("status")%>
                                            </td>
                                            <td>
                                                <%# Eval("coin")%>
                                            </td>
                                            <td>
                                                <%# Eval("cardtype")%>
                                            </td>                                            
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr bgcolor="#ffffff" >
                                            <td>
                                                <%# Eval("orderid")%>
                                            </td>
                                            <td>
                                                <%# Eval("supporder")%>
                                            </td>
                                            <td>
                                                <%# Eval("realamt")%>                                               
                                            </td>
                                            <td>
                                                <%# Eval("result")%>
                                            </td>                                           
                                            <td>
                                                <%# Eval("status")%>
                                            </td>
                                            <td>
                                                <%# Eval("coin")%>
                                            </td>
                                            <td>
                                                <%# Eval("cardtype")%>
                                            </td>       
                                        </tr>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>
                            </table>
                        </td>
                    </tr>                    
                </table>
            </td>
        </tr>
    </table>
        

    </form>
</section>
    </div>
<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>
