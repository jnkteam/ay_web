<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Order.Reconciliation2"
    ValidateRequest="false" CodeBehind="Reconciliation2.aspx.cs" %>

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
        接口补单
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">

    <form id="form1" runat="server">
    <table width="100%" border="0" cellspacing="1" cellpadding="3">

        <tr>
            <td colspan="3">


                <div class="input-group date">
                                             <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;开始</div>
                                                <asp:TextBox ID="StimeBox"  class="form-control"  runat="server" Width="65px"></asp:TextBox>
                                            </div>

                 <div class="input-group date">
                                              <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;截止</div>
                                           <asp:TextBox ID="EtimeBox" runat="server" class="form-control" Width="65px"></asp:TextBox>
                                           </div>

                <div class="input-group">
                <asp:Button ID="btn_search" runat="server" Text="查询" CssClass="button btn  btn-danger" OnClick="btn_search_Click" />
                </div>
                 <div class="input-group">
                <asp:Button ID="btn_Reconciliation" runat="server" CssClass="button btn  btn-danger" Text="接口补单" OnClick="btn_Reconciliation_Click" />
                </div>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="table1">
        <tr>
            <td bgcolor="#ffffff">
                <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered">
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                                <asp:Repeater ID="rptOrders" runat="server">
                                    <HeaderTemplate>
                                        <tr height="30" style="background: #e8eaee">
                                            <td>商户ID</td>
                                            <td>订单号 </td>
                                            <td>提交时间</td>
                                            <td>卡类型</td>
                                            <td>卡号</td>
                                            <td>金额</td>
                                            <td>接口</td>
                                        </tr>



                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr >
                                            <td>
                                                <a href="?action=userpay&userid=<%# Eval("userid") %>&status=2">
                                                    <%# Eval("userid")%>
                                                </a>
                                            </td>
                                            <td>
                                                <%# Eval("orderid")%>
                                            </td>
                                            <td>
                                                <%# Eval("processingtime","{0:yyyy-MM-dd}")%>
                                            </td>
                                            <td>
                                                <%# Eval("modetypename")%>
                                            </td>
                                            <td>
                                                <%# Eval("cardNo")%>
                                            </td>
                                            <td>
                                                <%# Eval("refervalue", "{0:f2}")%>
                                            </td>
                                            <td id="tr_supplier" runat="server">
                                                <%# OriginalStudio.WebUI.WebUtility.GetsupplierName(Eval("supplierId"))%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr bgcolor="#ffffff">
                                           <td>
                                                <a href="?action=userpay&userid=<%# Eval("userid") %>&status=2">
                                                    <%# Eval("userid")%>
                                                </a>
                                            </td>
                                            <td>
                                                <%# Eval("orderid")%>
                                            </td>
                                            <td>
                                                <%# Eval("processingtime","{0:yyyy-MM-dd}")%>
                                            </td>
                                            <td>
                                                <%# Eval("modetypename")%>
                                            </td>
                                            <td>
                                                <%# Eval("cardNo")%>
                                            </td>
                                            <td>
                                                <%# Eval("refervalue", "{0:f2}")%>
                                            </td>
                                            <td id="tr_supplier" runat="server">
                                                <%# OriginalStudio.WebUI.WebUtility.GetsupplierName(Eval("supplierId"))%>
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
<script>
      $(function () {



         $("#StimeBox").jeDate({

                format: "YYYY-MM-DD hh:mm:ss",

            });
         $("#EtimeBox").jeDate({

                     format: "YYYY-MM-DD hh:mm:ss",

                 });



      });
      </script>