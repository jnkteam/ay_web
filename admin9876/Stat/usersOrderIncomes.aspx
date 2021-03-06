﻿<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.OrderStat.UsersOrderIncomes"
    CodeBehind="UsersOrderIncomes.aspx.cs" %>
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
        商户各通道收益比例分析
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">

    <form id="form1" runat="server">
    <table border="0" cellspacing="1" cellpadding="0" style="width: 100%">
        <tr>
            <td colspan="3">
                <div class="input-group">
                    <div class="input-group-btn">
                    <button type="button" class="btn btn-primary">商户ID</button>
                    </div>
                    <asp:TextBox ID="txtMerchantName" class="form-control" runat="server" Width="65px"></asp:TextBox>
                </div>
                <div class="input-group">
                <asp:DropDownList class="form-control" ID="ddlChannelType" runat="server" Width="95px">
                </asp:DropDownList>
                </div>

                <div class="input-group date">
                <div class="input-group-addon"> <i></i>&nbsp;面值从：</div>
                <asp:TextBox ID="txtvaluefrom" class="form-control" runat="server" Width="65px"></asp:TextBox>
                <div class="input-group-addon"> <i></i>&nbsp;至</div>
                <asp:TextBox ID="txtvalueto" class="form-control" runat="server" Width="65px"></asp:TextBox>
                </div>

                <div class="input-group date">
                <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;开始</div>
                <asp:TextBox ID="StimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox>
                </div>
                <div class="input-group date">
                <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;截止</div>
                <asp:TextBox ID="EtimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox>
                </div>

                <div class="input-group">
                <asp:Button ID="btn_Search" runat="server" CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btn_Search_Click">
                </asp:Button>
                </div>
            </td>
        </tr>


        <tr>
            <td bgcolor="#ffffff">
                <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered">
                <tr>
                    <td align="center">
                        <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                    <tr height="30"  style="background: #e8eaee">
                        <td>
                            日期
                        </td>
                        <td>
                            商户号
                        </td>
                        <td>
                            通道类型
                        </td>
                        <td>
                            订单金额
                        </td>
                        <td>
                            总订单数
                        </td>	
						<td>
                            订单总金额
                        </td>						
                        <td>
                            费率
                        </td>
                        <td>
                            商户所得
                        </td>
                    </tr>
                    <asp:Repeater ID="gv_data" runat="server">
                        <ItemTemplate>
                            <tr height="30">
                                <td>
                                    <%#Eval("fmtOrderDate")%>
                                </td>
                                <td>
                                    <%#Eval("MerchantName")%>
                                </td>
                                <td>
                                    <%#Eval("TypeName")%>
                                </td>
                                <td>
									<%#Eval("OrderValue","{0:f2}")%>
                                </td>
                                <td>
                                    <%#Eval("OrderCount")%>
                                </td>
								<td>
									<%#Eval("TotalOrderValue","{0:f2}")%>
                                </td>								
                                <td>
                                    <%#Eval("PayRate","{0:p2}")%>
                                </td>
                                <td>
                                    <%#Eval("SumPay","{0:f3}")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                   <!---------------------pager------------------>
                   <!-- #include file="../Pager.aspx" -->
                   <!---------------------pager------------------>
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

            <script src="<%=ADMIN_URI%>/style/admin/layer/layer.js"></script>
            <script>
              $(function () {



                 $("#StimeBox").jeDate({

                        format: "YYYY-MM-DD hh:mm:ss",

                    });
                 $("#EtimeBox").jeDate({

                             format: "YYYY-MM-DD hh:mm:ss",

                         });



              });
    var table = document.getElementById("table_zyads");
    if (table) {
        for (i = 0; i < table.rows.length; i++) {
            if (i % 2 == 0) {
                table.rows[i].bgColor = "ffffff";
            } else { table.rows[i].bgColor = "f3f9fe" }
        }
    }
    var mytr = document.getElementById("table2").getElementsByTagName("tr");
    for (var i = 1; i < mytr.length; i++) {
        mytr[i].onmouseover = function() {
            var rows = this.childNodes.length;
            for (var row = 0; row < rows; row++) {
                this.childNodes[row].style.backgroundColor = '#B2D3FF';
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

