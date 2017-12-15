<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Sys.CleanUpData" Codebehind="CleanUpData.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>

<style>

#cbl_cacheTypeList td{text-align: left;}
.my-center th{text-align: center !important;}
#table2 td{vertical-align:middle;}
.pass{width: 221px !important;}
</style>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" >
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ��������
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
    <div>

        <table width="100%" border="0" id="table2" cellpadding="3" cellspacing="1" class="table table-bordered table-hover dataTable">
            <tr >
                <td style="width: 15%; text-align: right">
                    ҵ������
                </td>
                <td>
                <div class="input-group">
                    <asp:CheckBoxList  ID="cbl_clearType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="order">���׶���</asp:ListItem>
                        <asp:ListItem Value="settled">�����¼</asp:ListItem>
                        <asp:ListItem Value="stat">�ۺ�ͳ��</asp:ListItem>                        
                    </asp:CheckBoxList>
                    </div>
                </td>
            </tr>
            <tr >
                <td style="width: 15%; text-align: right">
                    ��������
                </td>
                <td>
                    <asp:CheckBoxList ID="cb_where" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="bank">��������</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr >
                <td style="width: 15%; text-align: right">
                    ״̬ѡ��
                </td>
                <td>
                    <asp:CheckBoxList ID="cb_stat" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="2">�ѳɹ�</asp:ListItem>
                        <asp:ListItem Value="1">������</asp:ListItem>
                        <asp:ListItem Value="4">ʧ��</asp:ListItem>
                        <asp:ListItem Value="8">����</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr >
                <td colspan="4" style="color: #ff0000">

                    ��������󲻿ɻָ�������ʹ�ã�����ѡ�������������֮ǰ����������

                </td>
            </tr>
            <tr >
                <td style="width: 15%; text-align: right">
                    ѡ������
                </td>
                <td colspan="6" >



                            <div class="input-group date">
                             <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;</div>
                                <asp:TextBox ID="EtimeBox"  class="form-control"  runat="server" Width="65px"></asp:TextBox>
                            </div>
                </td>

            </tr>
            <tr >
                <td style="width: 15%; text-align: right">
                    ��������
                </td>
                <td colspan="6" >
                <div class="input-group">
                    <asp:TextBox class="form-control pass"  ID="txtcaozuo" runat="server"  TextMode="Password"></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr >
                <td style="width: 15%; text-align: right">
                    
                </td>
                <td >
                    <asp:Button ID="btnCleanUp" runat="server" Text=" ȷ������ " CssClass="button btn  btn-danger" OnClick="btndel_Click" />
                    <asp:Label ID="lbmsg" runat="server" ForeColor="Red" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</section>
    </div>


<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>
<script>
  $(function () {




     $("#EtimeBox").jeDate({

                 format: "YYYY-MM-DD hh:mm:ss",

             });



  });
  </script>