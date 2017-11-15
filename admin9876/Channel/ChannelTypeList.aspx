<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.ChannelTypeList" Codebehind="ChannelTypeList.aspx.cs" %>
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
                <td align="center">
                    <asp:GridView ID="GVChannel" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" Width="100%" cssClass="table table-bordered table-hover dataTable" CellSpacing="1" OnRowDataBound="GVChannel_RowDataBound">
                        <Columns>    
                            <asp:BoundField DataField="typeId" HeaderText="����">
                                <ControlStyle Width="8%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="modetypename" HeaderText="����">
                                <ControlStyle Width="8%" />
                            </asp:BoundField>    
                             <asp:BoundField DataField="code" HeaderText="Ӣ�Ĵ���">
                                <ControlStyle Width="8%" />
                            </asp:BoundField>                   
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    �� ��
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="ltType" runat="server"></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField> 
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    �ӿ�ģʽ
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="ltrunmode" runat="server"></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>                          
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    ����״̬
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="litOpen" runat="server"></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    ǰ̨��ʾ
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:RadioButtonList ID="rblrelease" runat="server" RepeatDirection="horizontal">
                                        <asp:ListItem Value="True">��ʾ</asp:ListItem>
                                        <asp:ListItem Value="False">�ر�</asp:ListItem>
                                    </asp:RadioButtonList>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:BoundField DataField="Name" HeaderText="��ǰ�ӿ���">                               
                            </asp:BoundField>
                             <asp:TemplateField>
                                <HeaderTemplate>
                                    ƽ̨����
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Eval("supprate","{0:p2}")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <input type="button" class="button btn btn-xs  btn-info" value="�� ��" onclick="javascript:setting('<%#Eval("id")%>')" />
                                    <input type="button" class="button btn btn-xs  btn-info" value="��������" onclick="javascript:deleteCard('<%#Eval("id")%>')" />
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
                  content: "ChannelTypeEdit.aspx?id="+id,
              });
          });





      }
      function deleteCard(id) {


        //ҳ��һ�򿪾�ִ�У�����ready��Ϊ��layer���������css����չģ�飩�������
                layer.ready(function(){
                    //�Զ�ҳ
                    layer.open({
                        type: 2,
                        title: '��������',
                        skin: 'layui-layer-rim', //���ϱ߿�
                        //closeBtn: 0, //����ʾ�رհ�ť
                        area: ['67%', '90%'], //���
                        content: "mutisupp.aspx?id="+id,
                    });
                });





 }

 </script>