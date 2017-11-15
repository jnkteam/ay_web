<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.Order.orderreport4" Codebehind="orderreport4.aspx.cs" %>
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
        ��������
        <small>������֧��ƽ̨</small>
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
                                                                       <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ʼ</div>
                                                                          <asp:TextBox ID="StimeBox"  class="form-control"  runat="server" Width="65px"></asp:TextBox>
                                                                      </div>

                                           <div class="input-group date">
                                                                        <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ֹ</div>
                                                                     <asp:TextBox ID="EtimeBox" runat="server" class="form-control" Width="65px"></asp:TextBox>
                                                                     </div>

                             <div class="input-group">


                            <asp:Button ID="btn_Search" runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btn_Search_Click">
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
                                    OnItemDataBound="rptOrders_ItemDataBound" 
                                    onitemcommand="rep_report_ItemCommand">
                                    <HeaderTemplate>
                                        <tr height="30"  style="background: #e8eaee">
                                            <td>
                                                �û�ID
                                            </td>
                                            <td>
                                                �û�����
                                            </td>
                                            <td>
                                                ��ʵ����
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="iBtnpromAmt" runat="server" CommandName="promAmt">������</asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="iBtnrealvalue" runat="server" CommandName="realvalue">�����ܳ�ֵ���</asp:LinkButton>
                                            </td>
                                            <td>
                                                �¼��̻�
                                            </td>
                                        </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr bgcolor="#EFF3FB">
                                            <td>
                                                <%# Eval("agentid")%>
                                            </td>
                                             <td>
                                                <%# Eval("username")%>
                                            </td>
                                             <td>
                                                <%# Eval("full_name")%>
                                            </td>
                                            <td>
                                                <%# Eval("promAmt", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("realvalue", "{0:f2}")%>                                           
                                            </td>
                                            <td>
                                                <a href="../User/UserList.aspx?agentid=<%# Eval("agentid")%>">�鿴</a>                                       
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr bgcolor="#ffffff" >
                                           <td>
                                                <%# Eval("agentid")%>
                                            </td>
                                            <td>
                                                <%# Eval("username")%>
                                            </td>
                                             <td>
                                                <%# Eval("full_name")%>
                                            </td>
                                            <td>
                                                <%# Eval("promAmt", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("realvalue", "{0:f2}")%>                                           
                                            </td>
                                            <td>
                                                <a href="../User/UserList.aspx?agentid=<%# Eval("agentid")%>">�鿴</a>                                                
                                            </td>
                                        </tr>
                                    </AlternatingItemTemplate>
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