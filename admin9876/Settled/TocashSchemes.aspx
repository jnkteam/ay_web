<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.TocashScheme" Codebehind="TocashSchemes.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>

<style>

td{text-align: center}
th{text-align: center}
</style>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ���ַ���
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
    <div>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" id="table_zyads" class="table table-bordered">
            <tr>
                <td align="left" colspan="2" style="text-align: left !important;">
                     <a class="button btn  btn-danger" href="javascript:add()">
                                   ����
                                </a>&nbsp;
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:GridView ID="GridView1" cssClass="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="False" CellPadding="4" OnRowDataBound="GVChannel_RowDataBound"
                        ForeColor="#333333" GridLines="None" Width="100%" CellSpacing="1" >
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField DataField="schemename" HeaderText="��������" />
                            <asp:BoundField DataField="bankdetentiondays" HeaderText="����T+N" />

                            <asp:BoundField DataField="alipaydetentiondays" HeaderText="֧����T+N" />
                            <asp:BoundField DataField="weixindetentiondays" HeaderText="΢��T+N" />
                            <asp:BoundField DataField="otherdetentiondays" HeaderText="����T+N" />
                            <asp:BoundField DataField="SingleMinAmtLimit" HeaderText="ÿ��������" />
                            <asp:BoundField DataField="SingleMaxAmtLimit" HeaderText="ÿ�������" />
                            <asp:BoundField DataField="dailymaxtimes" HeaderText="ÿ��������" />
                            <asp:BoundField DataField="dailymaxamt" HeaderText="ÿ���޶�" />

                            <asp:TemplateField HeaderText="����ͨ��" >
                            <ItemTemplate >
                              <asp:Literal ID="transupplierName" runat="server"></asp:Literal>
                             </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Ĭ��">
                              <ItemTemplate>
                              <asp:Literal ID="isdefaultIcon" runat="server"></asp:Literal>
                              </ItemTemplate>

                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="����">
                                <ItemTemplate>
                                    <a  class="button btn btn-xs btn-info" href="javascript:edit('<%# Eval("ID")%>')">�༭</a>
                                    <a  class="button btn btn-xs btn-info" onclick="return confirm('ȷ��Ҫɾ������û���')" href="?cmd=del&amp;ID=<%# Eval("ID") %>">ɾ��</a>
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
    </div>
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
                  content: "TocashSchemeModi.aspx",
              });
          });
      }
      function edit(id) {
        //ҳ��һ�򿪾�ִ�У�����ready��Ϊ��layer���������css����չģ�飩�������
                layer.ready(function(){
                    //�Զ�ҳ
                    layer.open({
                        type: 2,
                        title: '�༭',
                        skin: 'layui-layer-rim', //���ϱ߿�
                        //closeBtn: 0, //����ʾ�رհ�ť
                        area: ['67%', '90%'], //���
                        content: "TocashSchemeModi.aspx?cmd=edit&id="+id,
                    });
                });
            }
</script>