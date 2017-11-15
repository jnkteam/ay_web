<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.NewsList" Codebehind="NewsList.aspx.cs" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>
<style>

#GridView1 th{text-align: center}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ���Ź���
        <small>������֧��ƽ̨</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
        <div>
            <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table1">

                <tr>
                    <td>
                        <font class="jfontitem">
                         <div class="input-group">
                            <asp:DropDownList class="form-control"  ID="ddl_type" runat="server" Width="128px" >
                                <asp:ListItem Value="" Selected="True">�������</asp:ListItem>
                            </asp:DropDownList>
                            </div>

                             <div class="input-group">
                            <asp:TextBox ID="txtTitle" class="form-control"  runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group">
                            <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btnSearch_Click">
                            </asp:Button>
                            </div>
                            <div class="input-group">
                            <asp:Button ID="btnPublish" runat="server" CssClass="button btn  btn-danger" Text="һ���������ս��㹫��" OnClick="btnPublish_Click"/></div></font></td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView cssClass="table table-bordered table-hover dataTable" ID="GridView1" runat="server" AutoGenerateColumns="False"
                            CellPadding="4"  GridLines="None" Width="100%" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">

                            <Columns>
                                <asp:BoundField DataField="NewsID" HeaderText="ID" />                                
                                <asp:TemplateField HeaderText="���">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNewsType" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>                                
                                <asp:HyperLinkField DataTextField="NewsTitle" HeaderText="����" />
                                <asp:BoundField DataField="AddTime" HeaderText="ʱ��" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
                                  <asp:BoundField DataField="release" HeaderText="�Ƿ񷢲�"/>
                                <asp:TemplateField HeaderText="����">
                                    <ItemTemplate>
                                        <asp:Button ID="btnUpdate" runat="server" class="button btn btn-xs  btn-info" Text="�� ��" CommandName="update" CommandArgument='<%# Eval("NewsID") %>'/>
                                        <asp:Button ID="btnDel" runat="server" class="button btn btn-xs  btn-info" Text="ɾ ��" OnClientClick="return confirm('��ȷ��Ҫɾ������������')" CommandName="del" CommandArgument='<%# Eval("NewsID") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#e8eaee" Font-Bold="True" ForeColor="White" />
                                                                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                <HeaderStyle BackColor="#e8eaee" Font-Bold="True"  />

                        </asp:GridView>
                       <!---------------------pager------------------>
                                           <!-- #include file="../PagerIng.aspx" -->
                                           <!---------------------pager------------------>
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