<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.PayRate" Codebehind="PayRate.aspx.cs" %>
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
        ��������
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">

        <table width="100%" border="0" cellspacing="1" cellpadding="0" class="table table-bordered">
            <tr>
                <td align="left" style="text-align: left !important;" colspan="3" >

                    <input id="btnAdd" type="button" Class="button btn  btn-danger" value="�� ��" onclick="add()" class="button"/></td>
            </tr>
        </table>
        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered">
            <tbody>
                <tr>

                    <td align="center">
                        <table width="99%" border="0" cellpadding="1" cellspacing="1" bgcolor="#cccccc" id="table2" class="table table-bordered table-hover dataTable">
                            <tbody style="background: #E8EAEE">

                            <td>������</td>
                            <td>��������</td>

                            <asp:Repeater ID="channelTypeNameRep" runat="server">
                                <ItemTemplate>
                                  <td><%# Eval("typename")%></td>
                                </ItemTemplate>
                            </asp:Repeater>
                            <td>����</td>
                            </tbody>
                            <tbody>
                                <asp:Repeater ID="repRate" runat="server" onitemdatabound="repRate_ItemDataBound">
                                    <ItemTemplate>
                                        <tr  >
                                            <td><%# Eval("ratename") %></td>
                                            <td> <asp:Label ID="ratetypename" runat="server"></asp:Label></td>

                                <asp:Repeater ID="channelType" runat="server"><ItemTemplate>
                                <td><%#Container.DataItem%>%</td>
                                </ItemTemplate></asp:Repeater>

                                <td> <a class="button btn btn-xs  btn-info" href="javascript:edit('<%# Eval("ID") %>')"  class="cvlink">�༭</a></td>
                                        </tr>
                                    </ItemTemplate>


                                </asp:Repeater>

                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
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
                  content: "PayRateEdit.aspx",
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
                        content: "PayRateEdit.aspx?id="+id,
                    });
                });
            }
</script>