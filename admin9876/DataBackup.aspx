<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.DataBackup" Codebehind="DataBackup.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="./Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="./Left.aspx" -->
<!-----------------left------------------>

<style>

#cbl_cacheTypeList td{text-align: left;}
.my-center th{text-align: center !important;}
#table2 td{vertical-align:middle;}
.form-control{width: 400px !important;}
</style>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ���ݱ���
        <small>������֧��ƽ̨</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
        <div>
            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">

                <tr>
                    <td class="jfontItem" align="right" >
                        ָ��Ŀ¼</td>
                    <td align="left">
                     <div class="input-group">
                        <asp:TextBox ID="txtfilepath" class="form-control" runat="server"  Text="d:\BACKUP\Pay\"></asp:TextBox>
                            </div>
                            </td>
                </tr>
                <tr>
                    <td class="jfontItem" align="right" >
                        �����ļ���</td>
                    <td align="left">
                     <div class="input-group">
                        <asp:TextBox ID="txtfilname" class="form-control" runat="server"  ></asp:TextBox>
                        </div>
                        </td>
                </tr>
                <tr>
                    <td align="right" class="jfontItem" style="width: 125px; height: 40px;">
                    </td>
                    <td align="left" style="height: 40px">
                        <asp:Button CssClass="button btn  btn-danger" ID="bt_sub"  runat="server" Text="ȷ������ " OnClick="bt_sub_Click">
                        </asp:Button><asp:Label ID="lbmsg" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right" class="jfontItem" style="width: 125px; height: 40px;">
                    </td>
                    <td align="left" style="height: 40px">
                        <asp:Button CssClass="button btn  btn-danger" ID="btnClear" runat="server" Text="��ʷ��������" OnClick="btnClear_Click">
                        </asp:Button><asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label><br />
                </tr>
            </table>
        </div>
    </form>
</section>
    </div>


<!-----------------footer------------------>
 <!-- #include file="./Footer.aspx" -->
<!-----------------footer------------------>
