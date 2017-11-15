<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.Order.orderreport7" Codebehind="orderreport7.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>


 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        利润分析
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="table1">
        <tr height="30" >
            <td>

                            <div class="input-group date">
                            <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;开始</div>
                            <asp:TextBox ID="StimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox>
                            </div>

                            <div class="input-group date">
                            <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;截止</div>
                            <asp:TextBox ID="EtimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox>
                            </div>
                            <div class="input-group">
                            <asp:Button ID="btn_Search"  runat="server" CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btn_Search_Click">
                            </asp:Button>
                            </div>
            </td>
        </tr>

        <tr>
            <td bgcolor="#ffffff">                
                <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered">
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                                <asp:Repeater ID="rep_report" runat="server" 
                                    OnItemDataBound="rptOrders_ItemDataBound">
                                    <HeaderTemplate>
                                        <tr height="30"style="background: #e8eaee">
                                            <td>
                                                种类
                                            </td>
                                            <td>
                                                利润
                                            </td>
                                        </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr  height="30" >
                                            <td>
                                                <%# Eval("class")%>
                                            </td>
                                            <td>
                                               <%# Eval("amt", "{0:f2}")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr  height="30" >
                                            <td>
                                                <%# Eval("class")%>
                                            </td>
                                            <td>
                                               <%# Eval("amt", "{0:f2}")%>
                                            </td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                    <FooterTemplate>
                                        <tr height="30"  >
                                            <td>
                                                总计
                                            </td>
                                            <td>
                                                <%=TotalProfit%>
                                            </td>
                                        </tr>
                                    </FooterTemplate>
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
