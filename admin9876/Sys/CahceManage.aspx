<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Sys.CahceManage" Codebehind="CahceManage.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>

<style>

#cbl_cacheTypeList td{text-align: left;}
.my-center th{text-align: center !important;}
</style>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ���ػ������
        <small>������֧��ƽ̨</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">

            <table border="0" cellspacing="1" cellpadding="0" style="width: 100%; height: 100%;" id="table_zyads" class="table table-bordered">

                <tr>
                    <td align="center">
                        <table style="border-right: #c9ddf0 1px solid; border-top: #c9ddf0 1px solid; border-left: #c9ddf0 1px solid;
                            border-bottom: #c9ddf0 1px solid" cellspacing="0" cellpadding="0" width="100%"
                            bgcolor="#f3f9fe" border="0" class="table table-bordered table-hover dataTable">
                            <tr>
                                <td>

                                        <tr>
                                            <td height="30" style="font-size: 14px;">
                                             <div class="input-group">
                                                ���ػ���������<asp:Label ID="CacheCountLabel" runat="server" Text="û�л���"></asp:Label>
                                                </div>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            <div class="input-group">
                                                <asp:Button ID="btnDelAll" CssClass="button btn  btn-danger" runat="server" Text="���ȫ������"
                                                    OnClick="btnDelAll_Click" />
                                                    </div>
                                                    </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            <div class="input-group">
                                                <asp:Label ID="Label1" runat="server" ForeColor="Red">ϵͳ���л������������Ч�ʡ����������ջ��棡</asp:Label>
                                                </div>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            <div class="input-group">

                                                <asp:CheckBoxList  ID="cbl_cacheTypeList" runat="server" Width="100%">

                                                    <asp:ListItem  Value="CHANNELS">֧��ͨ��</asp:ListItem>
                                                    <asp:ListItem Value="CHANNEL_TYPE">֧��ͨ�����</asp:ListItem>
                                                    <asp:ListItem Value="CHANNEL_TYPE_USER_">�û�֧��ͨ������</asp:ListItem>
                                                    <asp:ListItem Value="NEWS">����</asp:ListItem>
                                                    <asp:ListItem Value="SUPPLIER_">�ӿ���</asp:ListItem>
                                                    <asp:ListItem Value="SUPPPAYRATE">��Ӧ�̷���</asp:ListItem>
                                                    <asp:ListItem Value="USER_">�û�����</asp:ListItem>
                                                    <asp:ListItem Value="USERHOST_">�û���·��վ�б�</asp:ListItem>
                                                    <asp:ListItem Value="Question">��ȫ�����б�</asp:ListItem>
                                                    <asp:ListItem Value="WEBINFO_">��վ����</asp:ListItem>
                                                    <asp:ListItem Value="SYSCONFIG">������Ϣ</asp:ListItem>
                                                </asp:CheckBoxList>
                                            </div>
                                            <div style="clear: both"></div>
                                                <div class="input-group">
                                                <asp:Button ID="btnBigClass" CssClass="button btn  btn-danger"  runat="server" Text="�����ѡ��𻺴�"
                                                    onclick="btnBigClass_Click" />
                                                    </div>
                                            </td>
                                        </tr>
                                        <tr><td>MemCached����</td></tr>
                                        <tr>

                                        <td>
                                            <asp:GridView class="table table-bordered table-hover dataTable my-center" ID="gv_cache" runat="server" AutoGenerateColumns="False" Width="100%" DataKeyNames="cacheKey">
                                                <Columns>
                                                     <asp:TemplateField>
                                                     <ItemTemplate>
                                                            <asp:CheckBox ID="item" runat="server" />
                                                     </ItemTemplate>
                                                     </asp:TemplateField>
                                                      <asp:BoundField HeaderText="�������" DataField="cacheType" />
                                                      <asp:BoundField HeaderText="�������" DataField="cacheTypeName" />
                                                    <asp:BoundField HeaderText="����Key" DataField="cacheKey" />                                                                                                   
                                                </Columns>
                                            </asp:GridView>
                                            <asp:Button ID="btnClear" runat="server" CssClass="button btn  btn-danger" Text="��С�����"
                                                onclick="btnClear_Click"  />
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