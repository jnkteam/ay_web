<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.OrderStat.OrderReport4" Codebehind="OrderReport4.aspx.cs" %>
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
        代理收益
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="table1">

        <tr>
            <td>
					<div class="input-group date">
						<div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;开始</div>
						<asp:TextBox ID="StimeBox"  class="form-control"  runat="server" Width="65px"></asp:TextBox>
					</div>

					<div class="input-group date">
						<div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;截止</div>
						<asp:TextBox ID="EtimeBox" runat="server" class="form-control" Width="65px"></asp:TextBox>
					</div>

					<div class="input-group">
						<asp:Button ID="btn_Search" runat="server" CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btn_Search_Click"></asp:Button>
					</div>
            </td>
        </tr>
        <tr>
            <td bgcolor="#ffffff">                
                <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered">
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                                <asp:Repeater ID="rep_report" runat="server" OnItemDataBound="rptOrders_ItemDataBound"  onitemcommand="rep_report_ItemCommand">
                                    <HeaderTemplate>
                                        <tr height="30"  style="background: #e8eaee">
                                            <td>
                                                代理名
                                            </td>
                                            <td>
                                                代理名称
                                            </td>
                                            <td>
                                                日期
                                            </td>
                                            <td>
                                                代理收益
                                            </td>
                                            <td>
                                                交易总金额
                                            </td>
                                            <td>
                                                下级商户
                                            </td>
                                        </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr bgcolor="#EFF3FB">
                                            <td>
                                                <%# Eval("代理号")%>
                                            </td>
                                             <td>
                                                <%# Eval("代理名")%>
                                            </td>
                                             <td>
                                                <%# Eval("日期")%>
                                            </td>
                                            <td>
                                                <%# Eval("利润", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("总订单金额", "{0:f2}")%>                                           
                                            </td>
                                            <td>
                                                <a href="../User/UserList.aspx?agentid=<%# Eval("userid")%>">查看</a>                                       
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </td>
                    </tr>
                     <!---------------------pager------------------>
                                        <!-- #include file="../Pager.aspx" -->
                                        <!---------------------pager------------------>
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