<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.ChannelList" Codebehind="ChannelList.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>
<style>
#GVChannel tr th{text-align: center;}
#GVChannel tr td{vertical-align:middle;}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ͨ������
        <small>������֧��ƽ̨</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="Form1" runat="server">
        <table width="100%" border="0" cellpadding="1" cellspacing="1" id="table_zyads" class="table table-bordered">

            <tr>
            <td>
             <div class="input-group">
               <asp:DropDownList class="form-control" ID="ddlType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                </asp:DropDownList>
                </div>
                 <div class="input-group">
                <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text="�� ��" OnClick="btnSearch_Click" />
                </div>
                 <div class="input-group">


                <a Class="button btn  btn-danger"  href="javascript:add()">����</a>
                </div>
            </td>
            </tr>
            <tr>             
                <td align="center">
                    <asp:GridView ID="GVChannel" runat="server" AutoGenerateColumns="False" cssClass="table table-bordered table-hover dataTable" CellPadding="4"
                        ForeColor="#333333" GridLines="None" Width="100%" CellSpacing="1" 
                        OnRowDataBound="GVChannel_RowDataBound" onrowcommand="GVChannel_RowCommand">
                        <Columns>    
                             <asp:BoundField DataField="modetypename" HeaderText="���">
                                <ControlStyle Width="8%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="code" HeaderText="����">
                                <ControlStyle Width="8%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="modeEnName" HeaderText="Ӣ�Ĵ���">
                                <ControlStyle Width="8%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="modeName" HeaderText="����">
                                <ControlStyle Width="8%" />
                            </asp:BoundField>                       
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    ��ֵ
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Eval("faceValue")%>
                                </ItemTemplate>
                            </asp:TemplateField>  
                            <asp:BoundField DataField="usingSupplierName" HeaderText="ͨ���ӿ���">
                                <ControlStyle Width="8%" />
                            </asp:BoundField> 
                             <asp:TemplateField>
                                <HeaderTemplate>
                                    ͨ������
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Eval("supprate","{0:p2}")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:BoundField DataField="typesupp" HeaderText="ͨ�����ӿ���">
                                <ControlStyle Width="8%" />
                            </asp:BoundField> 
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    ͨ��������
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Eval("typesupprate", "{0:p2}")%>
                                </ItemTemplate>
                            </asp:TemplateField>                            
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    ����״̬
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="litopen" runat="server"></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>                          
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <input type="button" value="�� ��" class="button btn btn-xs  btn-info" onclick="javascript:setting('<%#Eval("id")%>')" />
                                    <asp:Button ID="btnDel" class="button btn btn-xs  btn-info" runat="server" Text="ɾ��" CommandName="del" CommandArgument='<%#Eval("id")%>' OnClientClick="javascript:return confirm('��ȷ��Ҫɾ����ͨ����');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#e8eaee" Font-Bold="True" ForeColor="White" />
                                                                      <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                      <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                      <HeaderStyle BackColor="#e8eaee" Font-Bold="True"  />
                                                                      <EditRowStyle BackColor="#2461BF" />
                                                                      <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
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
function add() {
  //ҳ��һ�򿪾�ִ�У�����ready��Ϊ��layer���������css����չģ�飩�������
          layer.ready(function(){
              //�Զ�ҳ
              layer.open({
                  type: 2,
                  title: '����',
                  skin: 'layui-layer-rim', //���ϱ߿�
                  //closeBtn: 0, //����ʾ�رհ�ť
                  area: ['67%', '90%'], //���
                  content: "ChannelEdit.aspx",
              });
          });
      }
      function setting(id) {
        //ҳ��һ�򿪾�ִ�У�����ready��Ϊ��layer���������css����չģ�飩�������
                layer.ready(function(){
                    //�Զ�ҳ
                    layer.open({
                        type: 2,
                        title: '����',
                        skin: 'layui-layer-rim', //���ϱ߿�
                        //closeBtn: 0, //����ʾ�رհ�ť
                        area: ['67%', '90%'], //���
                        content: "ChannelEdit.aspx?id="+id,
                    });
                });
            }
</script>