<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.OrderStat.OrderReport7" Codebehind="OrderReport7.aspx.cs" %>

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
        �������
        <small><%=PlatformName%></small>
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
					<div class="input-group-addon"> <i class="fa fa-calendar"></i>��ʼ</div>
					<asp:TextBox ID="StimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox>
					</div>

					<div class="input-group date">
					<div class="input-group-addon"> <i class="fa fa-calendar"></i>��ֹ</div>
					<asp:TextBox ID="EtimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox>
					</div>
					<div class="input-group">
					<asp:Button ID="btn_Search"  runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btn_Search_Click">
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
                                                ͨ������
                                            </td>
                                            <td>
                                                ��������
                                            </td>
                                            <td>
                                                �ɹ�������
                                            </td>
                                            <td>
                                                �����ܶ�
                                            </td>
											<td>
                                                ƽ̨�ܶ�
                                            </td>
											<td>
                                                �����ܶ�
                                            </td>
											<td>
                                                �̻��ܶ�
                                            </td>
                                            <td>
                                                ����
                                            </td>
                                        </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr  height="30" >
                                            <td>
                                                <%# Eval("ͨ������")%>
                                            </td>
                                            <td>
                                                <%# Eval("��������")%>
                                            </td>
                                            <td>
                                                <%# Eval("�ɹ�������")%>                               
                                            </td>
                                            <td>
                                                <%# Eval("�����ܶ�", "{0:f2}")%>
                                            </td>
											<td>
                                                <%# Eval("ƽ̨�ܶ�", "{0:f2}")%>
                                            </td>
											<td>
                                                <%# Eval("�����ܶ�", "{0:f2}")%>
                                            </td>
											<td>
                                                <%# Eval("�̻��ܶ�", "{0:f2}")%>
                                            </td>
                                            <td>
                                               <%# Eval("����", "{0:f2}")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
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
