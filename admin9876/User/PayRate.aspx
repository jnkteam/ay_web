<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.PayRate" Codebehind="PayRate.aspx.cs" %>
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
        <div id="modelPanel" style="background: #F2F2F2">
        </div>
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
                            <tbody>
                                <asp:Repeater ID="repRate" runat="server">
                                    <HeaderTemplate>
                                        <tr height="30"  style="background: #e8eaee" >
                                            <td>
                                                ������</td>
                                                <td>
                                                ΢��ɨ��</td>
                                                <td>
                                                ֧����ɨ��</td>
                                            <td>
                                                �Ƹ�ͨ</td>
                                            <td>
                                                ֧����</td>
                                            <td>
                                                ����</td>
                                            <td>
                                                ������</td>
                                            <td>
                                                �㽭</td>
                                            <td>
                                                ����</td>
                                            <td>
                                                ����</td>
                                             <td>
                                                ����</td>
                                            <td>
                                                ʢ��</td>
                                            <td>
                                                ��;��</td>
                                            <td>
                                                ������</td>
                                            <td>
                                                Q�ҿ�</td>
                                            <td>
                                                ��ͨ��</td>
                                            <td>
                                                ���ο�</td>
                                            <td>
                                                ���׿�</td>
                                            <td>
                                                ������</td>
                                            <td>
                                                �Ѻ���</td>
                                            <td>
                                                ���ſ�</td>
                                            <td>
                                                ���</td>
                                            <td>
                                                ��ɽ</td>
                                            <td>
                                                ����</td>
                                            <td>
                                                ����</td>
                                            <td>
                                                ���</td>                                            
                                            <td>
                                                ħ��</td>
                                          <td>
                                                ֧����APP</td>
                                            <td>
                                                ΢��APP</td>
                                            <td>
                                                ����APP</td>

                                             <td>   ����</td>
                                            <td>
                                                ����</td>
                                        </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr >
                                            <td>
                                                <%# Eval("levName")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p98"))*100%>
                                                %</td>
                                                <td>
                                                <%# Convert.ToDouble(Eval("p99"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p100"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p101"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p102"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p103"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p200")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p201")) * 100%>
                                                %</td>
                                             <td>
                                                <%# Convert.ToDouble(Eval("p202")) * 100%>
                                                %</td>
                                              <td>
                                                <%# Convert.ToDouble(Eval("p203")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p104"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p105"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p106"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p107"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p108"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p109"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p110"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p111"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p112"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p113"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p115"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p116"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p117"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p118"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p119"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p118"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p980")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p990")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p1020"))*100%>
                                                %</td>
                                            <td>
                                                <%# Eval("usetypename")%>
                                            </td>
                                            <td>
                                                <a class="button btn btn-xs  btn-info" href="javascript:edit('<%# Eval("id") %>')" class='ljbg'>�༭</a></td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr >
                                          <td>
                                                <%# Eval("levName")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p98"))*100%>
                                                %</td>
                                                <td>
                                                <%# Convert.ToDouble(Eval("p99"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p100"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p101"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p102"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p103"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p200")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p201")) * 100%>
                                                %</td>
                                             <td>
                                                <%# Convert.ToDouble(Eval("p202")) * 100%>
                                                %</td>
                                              <td>
                                                <%# Convert.ToDouble(Eval("p203")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p104"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p105"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p106"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p107"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p108"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p109"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p110"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p111"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p112"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p113"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p115"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p116"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p117"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p118"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p119"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p118"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p980")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p990")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p1020"))*100%>
                                                %</td>
                                            <td>
                                                <%# Eval("usetypename")%>
                                            </td>
                                            <td>
                                                <a class="button btn btn-xs  btn-info" href="javascript:edit('<%# Eval("id") %>')" class='ljbg'>�༭</a></td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>
                                <tr bgcolor="#F0F6FC" height="30" align="center" style="display:none">
                                    <td>
                                        <asp:TextBox ID="txtlevName" runat="server" Width="50px"></asp:TextBox></td>
                                        <td>
                                        <asp:TextBox ID="txtp98" runat="server" Width="25px"></asp:TextBox>%</td>
                                        <td>
                                        <asp:TextBox ID="txtp99" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp100" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp101" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp102" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp103" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp104" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp105" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp106" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp107" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp108" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp109" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp110" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp111" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp112" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp113" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp115" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp116" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp117" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp118" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp980" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp990" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp1020" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td colspan="2">
                                        <asp:Button ID="btn_save" runat="server" Text="����" OnClick="btn_save_Click" />
                                        <a href="#" onclick="ymPrompt.win('ViewPrice.aspx?Pri_Type=<%# Eval("Pri_Type") %>',600,230,'�û���Ϣ',handler,null,null,{id:'a'})">
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>

        <script type="text/javascript">
            function handler(tp) {
            }
        </script>

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