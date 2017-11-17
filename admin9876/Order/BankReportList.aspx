<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Order.BankReportList" Codebehind="BankReportList.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>




<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>


    <script type="text/javascript">
        function openuserurl(url) {
            window.open(url, "�鿴�û���Ϣ");
        }
    </script>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ����״̬����
        <small>������֧��ƽ̨</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">


    <form id="form1" runat="server">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="table1">

        <tr>
            <td>
                <table>
                    <tr height="30" >
                        <td colspan="2">
                            <div class="input-group">
                                 <div class="input-group-btn">
                                 <button type="button" class="btn btn-primary">�̻�ID</button>
                                 </div>
                                 <asp:TextBox ID="txtuserid" class="form-control" runat="server"></asp:TextBox>
                            </div>

                            <div class="input-group">
                            <%--  ����ID��
                                 <asp:TextBox ID="txtpromid" runat="server" Width="30px"></asp:TextBox>--%>
                                 <asp:DropDownList ID="ddlChannelType" class="form-control" runat="server" >
                                 <asp:ListItem Value="">--ͨ������--</asp:ListItem>
                                 <asp:ListItem Value="102">��������</asp:ListItem>
                                 <asp:ListItem Value="101">֧����</asp:ListItem>
                                 <asp:ListItem Value="100">�Ƹ�ͨ</asp:ListItem>
                                 </asp:DropDownList>
                            </div>




                            <div class="input-group">
                            <asp:DropDownList ID="ddlOrderStatus" class="form-control" runat="server" Width="95px">
                                <asp:ListItem>--����״̬--</asp:ListItem>
                                <asp:ListItem Value="2">�ѳɹ�</asp:ListItem>
                                <asp:ListItem Value="4">ʧ��</asp:ListItem>
                                <asp:ListItem Value="8">����</asp:ListItem>
                            </asp:DropDownList>
                            </div>

                            <div class="input-group">
                                <asp:DropDownList ID="ddlNotifyStatus" class="form-control" runat="server" Width="95px">
                                <asp:ListItem>--�·�״̬--</asp:ListItem>
                                <asp:ListItem Value="1">������</asp:ListItem>
                                <asp:ListItem Value="2">�ѳɹ�</asp:ListItem>
                                <asp:ListItem Value="4">ʧ��</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="input-group">
                                 <asp:DropDownList ID="ddlmange" class="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </td>
                    </tr>

                    <tr height="30">
                        <td>
                            <div class="input-group date">
                            <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ʼ</div>
                               <asp:TextBox ID="StimeBox"  class="form-control"  runat="server" Width="65px"></asp:TextBox>
                            </div>

                            <div class="input-group date">
                            <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ֹ</div>
                               <asp:TextBox ID="EtimeBox" runat="server" class="form-control" Width="65px"></asp:TextBox>
                            </div>

                            <div class="input-group">
                               <asp:Button ID="btn_Search" runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btn_Search_Click"></asp:Button>
                            </div>


                        </td>
                    </tr>




                    <tr height="30">
                        <td>
                            <div class="input-group">
                            <div class="input-group-btn">
                            <button type="button" class="btn btn-primary">������</button>
                            </div>
                                <asp:TextBox ID="txtOrderId" runat="server" class="form-control" ></asp:TextBox>
                            </div>
                            <div class="input-group">
                            <div class="input-group-btn">
                            <button type="button" class="btn  btn-primary">�̻�������</button>
                            </div>
                                <asp:TextBox ID="txtUserOrder" runat="server" class="form-control" ></asp:TextBox>
                            </div>
                            <div class="input-group">
                            <div class="input-group-btn">
                            <button type="button" class="btn btn-primary">�ӿ��̶�����</button>
                            </div>
                                <asp:TextBox ID="txtSuppOrder" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>


        <tr>
            <td bgcolor="#ffffff">
                <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered">
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                                <asp:Repeater ID="rptOrders" runat="server" OnItemCommand="rptOrders_ItemCommand"
                                    OnItemDataBound="rptOrders_ItemDataBound">
                                    <HeaderTemplate>
                                        <tr height="30"  style="background: #e8eaee">
                                            <td>
                                                �̻�ID
                                            </td>
                                            <td>
                                                �ӿ�
                                            </td>
                                            <td>
                                                �̻�������
                                            </td>
                                            <td>
                                                ������
                                            </td>
                                            <td>
                                                ͨ������
                                            </td>
                                            <td>
                                                ����
                                            </td>
                                             <td>
                                                ״̬
                                            </td>
                                            <td>
                                                �·�״̬
                                            </td>
                                            <td>
                                                �·�ʱ��
                                            </td>
                                             <td>
                                                �·�����
                                            </td>
                                            <td>
                                                ��������
                                            </td>
                                            <td>
                                                ����
                                            </td>
                                        </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr height="30" ondblclick="javascript:sendInfo('<%# Eval("id")%>')">
                                            <td>
                                                <a href="?action=userpay&userid=<%# Eval("userid") %>&status=2">
                                                    <%# Eval("userid")%>
                                                </a>
                                            </td>
                                            <td>
                                                <%# Eval("version")%>
                                            </td>
                                            <td>
                                                <%# Eval("userorder")%>
                                            </td>
                                            <td>
                                                <%# Eval("orderid")%>
                                            </td>
                                            <td>
                                                <%# Eval("modetypename")%>
                                            </td>
                                            <td>
                                                <%# Eval("modeName")%>
                                            </td>
                                             <td>
                                                <%# getStatusStyle(Eval("status").ToString()) %>
                                            </td>
                                            <td>
                                                <%# getNotifystatStatusStyle(Eval("notifystat").ToString()) %>
                                            </td>
                                             <td>
                                                <%# Eval("notifytime")%>
                                            </td>
                                            <td>
                                                <%# Eval("notifycount")%>
                                            </td>
                                            <td>
                                                <%# Eval("notifycount")%>
                                            </td>
                                            <td>
                                                <button class="button btn btn-xs  btn-info"><a  style="color: #fff;" href="javascript:openuserurl('<%# Eval("againNotifyUrl")%>')">�鿴</a></button>
                                                <asp:Button ID="btnReissue" class="button btn btn-xs  btn-info" runat="server" Text="����" ToolTip="�ֶ��ط�" CommandName="Reissue" CommandArgument='<%# Eval("orderid")%>' />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr height="30" ondblclick="javascript:sendInfo('<%# Eval("id")%>')">
                                              <td>
                                                <a href="?action=userpay&userid=<%# Eval("userid") %>&status=2">
                                                    <%# Eval("userid")%>
                                                </a>
                                            </td>
                                            <td>
                                                <%# Eval("version")%>
                                            </td>
                                            <td>
                                                <%# Eval("userorder")%>
                                            </td>
                                            <td>
                                                <%# Eval("orderid")%>
                                            </td>
                                            <td>
                                                <%# Eval("modetypename")%>
                                            </td>
                                            <td>
                                                <%# Eval("modeName")%>
                                            </td>
                                             <td>
                                                 <%# getStatusStyle(Eval("status").ToString()) %>
                                            </td>
                                            <td>
                                                <%# getNotifystatStatusStyle(Eval("notifystat").ToString()) %>
                                            </td>
                                             <td>
                                                <%# Eval("notifytime")%>
                                            </td>
                                            <td>
                                                <%# Eval("notifycount")%>
                                            </td>
                                            <td>
                                                <%# Eval("notifycount")%>
                                            </td>
                                            <td>
                                            <button class="button btn btn-xs  btn-info"><a style="color: #fff;" href="javascript:openuserurl('<%# Eval("againNotifyUrl")%>')">�鿴</a></button>
                                                <asp:Button ID="btnReissue" class="button btn btn-xs  btn-info" runat="server" Text="����" ToolTip="�ֶ��ط�" CommandName="Reissue" CommandArgument='<%# Eval("orderid")%>' />
                                            </td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>
                            </table>
                        </td>
                    </tr>
                    <!---------------------pager------------------>
                    <!-- #include file="../Pager.aspx" -->
                    <!---------------------pager------------------>

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

<script src="<%=ADMIN_URI%>/style/admin/layer/layer.js"></script>
<script>
  $(function () {



     $("#StimeBox").jeDate({

            format: "YYYY-MM-DD hh:mm:ss",

        });
     $("#EtimeBox").jeDate({

                 format: "YYYY-MM-DD hh:mm:ss",

             });



  })


  function sendInfo(id) {


  //ҳ��һ�򿪾�ִ�У�����ready��Ϊ��layer���������css����չģ�飩�������
          layer.ready(function(){
              //�Զ�ҳ
              layer.open({
                  type: 2,
                  title: '��������',
                  skin: 'layui-layer-rim', //���ϱ߿�
                  //closeBtn: 0, //����ʾ�رհ�ť
                  area: ['67%', '90%'], //���
                  content: "./BankOrderShow.aspx?id="+id,
              });
          });





      }
</script>