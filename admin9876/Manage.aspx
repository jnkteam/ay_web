<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Manage" Codebehind="Manage.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="./Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="./Left.aspx" -->
<!-----------------left------------------>




<style type="text/css">
#GridView1 th{text-align: center}
            table
            {
                width: 100%;
                max-width: 100%;

                border: 1px solid #f4f4f4;
                able-layout:fixed;
            }
            .table td{
                padding: 8px;
                line-height: 1.92857143 !important;
                vertical-align: top;

                font-size:14px;
                overflow: hidden;

                word-break: break-all; word-wrap:break-word;
            }


td {height:20px; line-height:20px; padding:0px; vertical-align:middle !important;}
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
.td1 {padding-right:3px;padding-left:3px;color: #333;padding-bottom:0px;padding-top:5px;height:25px; text-align: right; width: 20%; height: 48px;}
.td2 {padding-right:3px;padding-left:8px;padding-top:5px; color:#999999;text-align:right;}
.clean{border: 0 !important; background: #ecf0f5 !important; line-height: 1.8!important;;}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ��Ա����
        <small>������֧��ƽ̨</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
    <div>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" id="table_zyads" style="width: 100%;
            height: 100%; border: #c9ddf0 1px solid; background-color: White;">
            <tr>
                <td align="center" colspan="2" >
                    <div class="input-group ">

                     <a Class="button btn  btn-danger"  href="javascript:add()"  >����</a>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:GridView ID="GridView1" cssClass="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" Width="100%" CellSpacing="1" AllowPaging="True"
                        OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField DataField="UserName" HeaderText="�û���" />
                            <asp:BoundField DataField="RelName" HeaderText="����" />
                            <asp:BoundField DataField="qq" HeaderText="qq" />
                            <asp:BoundField DataField="tel" HeaderText="�ֻ�" />
                            <asp:BoundField DataField="LevelText" HeaderText="���" />
                            <asp:BoundField DataField="Commissiontypeview" HeaderText="�������" />
                            <asp:BoundField DataField="Commission" HeaderText="�������" />
                            <asp:BoundField DataField="CardCommission" HeaderText="�㿨���" />
                            <asp:BoundField DataField="statusName" HeaderText="״̬" />
                             <asp:BoundField DataField="Balance" HeaderText="���" DataFormatString="{0:f2}"/>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a class="button btn btn-xs  btn-info" href="javascript:edit('<%# Eval("ID") %>')">�༭</a>
                                    <a class="button btn btn-xs  btn-info" onclick="return confirm('ȷ��Ҫɾ������û���')" href="?cmd=del&amp;ID=<%# Eval("ID") %>">ɾ��</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                       <FooterStyle BackColor="#e8eaee" Font-Bold="True" ForeColor="White" />
                                                                                                                       <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                                                                       <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                                       <HeaderStyle BackColor="#e8eaee" Font-Bold="True"  />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%; display:none">
                        <tr align="center">
                            <td>
                                �û���
                            </td>
                            <td>
                                ���루���޸������գ�
                            </td>
                            <td>
                                �������루���޸������գ�
                            </td>
                            <td>
                                ����
                            </td>
                            <td>
                                qq
                            </td>
                            <td>
                                �绰
                            </td>
                            <td>
                                �������
                            </td>
                            <td>
                                �������
                            </td>
                             <td>
                                �������
                            </td>
                            <td>
                                ״̬
                            </td>
                            <td>
                                ���
                            </td>
                            <td align="center">
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:TextBox ID="UserNameBox" runat="server"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="PassWordBox" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="SecPassWordBox" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="RelNameBox" runat="server"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="qq" runat="server"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="tel" runat="server"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="ddlCommissionType" runat="server">
                                    <asp:ListItem Value="1">�����̶����</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="2">��֧�����%</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtCommission" runat="server">0</asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtCardCommission" runat="server">0</asp:TextBox>
                            </td>
                             <td align="center">
                                <asp:DropDownList ID="ddlStus" runat="server">
                                    <asp:ListItem Value="1">����</asp:ListItem>
                                    <asp:ListItem Value="0">����</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="LevelList" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:Button ID="BtnUpdate" runat="server" CssClass="button" Text=" �� �� " OnClick="BtnUpdate_Click">
                                </asp:Button>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</section>
    </div>


<!-----------------footer------------------>
 <!-- #include file="./Footer.aspx" -->
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
                  content: "ManageEdit.aspx",
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
                        content: "ManageEdit.aspx?cmd=edit&amp;ID="+id,
                    });
                });
            }
</script>