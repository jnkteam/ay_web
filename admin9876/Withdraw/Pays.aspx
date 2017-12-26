<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Withdraw.Pays" Codebehind="Pays.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>
<style>
td{
vertical-align: middle !important;
}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        �������
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">

    <form id="form1" runat="server">
    <div>
        <table border="0" cellspacing="1" cellpadding="1" style="width: 100%; height: 100%;">
            <tr style="height: 30px">
                <td colspan="2">
                    <table>
                        <tr height="30" >
                            <td>
                                <div class="input-group">
									<div class="input-group-btn"><button type="button" class="btn btn-primary">�� �� ��</button></div>
									<asp:TextBox ID="txtMerchantName" class="form-control" runat="server" Width="80px"></asp:TextBox>
								</div>
                                <div class="input-group">
									<div class="input-group-btn"><button type="button" class="btn btn-primary">����ID</button></div>
									<asp:TextBox ID="txtItemInfoId" class="form-control" runat="server" Width="80px"></asp:TextBox>
								</div>
								<div class="input-group">
									<div class="input-group-btn"><button type="button" class="btn btn-primary">�տ��˻�</button></div>
									<asp:TextBox ID="txtAccount" runat="server" class="form-control" ></asp:TextBox>
								</div>								
                            </td>
                        </tr>
                        <tr height="30" >
                            <td>
								<div class="input-group"><asp:DropDownList class="form-control" ID="ddlbankName" runat="server"></asp:DropDownList></div>
								<div class="input-group"><asp:DropDownList ID="ddlmode" class="form-control" runat="server"></asp:DropDownList></div>
								<div class="input-group"><asp:DropDownList ID="ddlSupplier" class="form-control" runat="server"></asp:DropDownList></div>
  								<div class="input-group"><asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btnSearch_Click"></asp:Button></div>
								<div class="input-group">
									<asp:RadioButtonList  ID="rbl_export_mode"  runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"  Visible="False">
										<asp:ListItem Selected="True" Value="1">excel</asp:ListItem>
										<asp:ListItem Value="2">txt</asp:ListItem>
									</asp:RadioButtonList>
								</div>
								<div class="input-group"><asp:Button ID="btnExport" runat="server" CssClass="button btn  btn-danger" Text="����" OnClick="btnExport_Click" Visible="False"></asp:Button></div>
								<div class="input-group">
									<div class="input-group-btn"><button type="button" class="btn btn-primary">��������</button></div>
									<asp:TextBox ID="txtPassWord" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
								</div>

								<div class="input-group">
									<asp:Button ID="btnAllSettle" runat="server" CssClass="button btn  btn-danger" Text="����֧��" onclick="btnAllSettle_Click" OnClientClick="return checkAll();"></asp:Button>
								</div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td bgcolor="#ffffff">
                    <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered">
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                        <asp:Repeater ID="rptList" runat="server">
                            <HeaderTemplate>
                                <tr height="30" style="background: #e8eaee">
                                    <td style="width: 5%">
                                        ���
                                    </td>
                                    <td style="width: 8%">
                                        �̻���
                                    </td>
                                    <td style="width: 8%">
                                        �տ���Ϣ
                                    </td>
                                    <td style="width: 8%">
                                        ������
                                    </td>
                                    <td style="width: 8%">
                                        �� �� ��
                                    </td>
                                    <td style="width: 8%">
                                        ʵ��֧�����
                                    </td>
                                    <td style="width: 8%">
                                        ����
                                    </td>
                                    <td style="width: 10%">
                                        ����ʱ��
                                    </td>
									<td style="width: 10%">
                                        ���ʱ��
                                    </td>
                                    <td style="width: 15%">
                                        ״̬
                                    </td>
                                    <td>
                                        <input id="Checkboxall" type="checkbox" class="qx" onclick="checkall(this)" />
                                        ȫѡ
                                    </td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("ID")%>
                                    </td>
                                    <td>
                                        <a href="javascript:sendInfo('<%# Eval("userid")%>')">
                                            <%#Eval("MerchantName")%>
                                        </a>
                                    </td>
                                    <td>
                                        <%# Eval("payeeName")%> <br />
                                        <%# Eval("Account")%>
                                    </td>
                                    <td>
                                        <%# Eval("amount", "{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("Charges", "{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Convert.ToDecimal(Eval("amount")).ToString("f2") %>
                                    </td>
                                    <td>
                                        <%#Enum.GetName(typeof(OriginalStudio.Model.Settled.SettlePayTypeEnum), Eval("paytype"))%>
                                    </td>
                                    <td>
                                        <%# Eval("AddTime","{0:yyyy-MM-dd HH:mm:ss}") %>
                                    </td>
									<td>
                                        <%# Eval("paytime","{0:yyyy-MM-dd HH:mm:ss}") %>
                                    </td>									
                                    <td>
                                        <a class="button btn btn-xs  btn-info" href="javascript:showOrder(<%# Eval("ID") %>,'modi');">�޸�</a>
                                        <a class="button btn btn-xs  btn-info" href="javascript:showOrder(<%# Eval("ID") %>,'pay');">����֧��</a>
                                    </td>
                                    <td>
                                        <input id="<%# Eval("ID") %>" type="checkbox" name="ischecked" class="qx" value="<%# Eval("ID") %>" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                            </table>
                        </td>
                    </tr>
                        <!---------------------pager------------------>
                        <!-- #include file="../PagerIng.aspx" -->
                        <!---------------------pager------------------>
                    </table>
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
    <script type="text/javascript">
        function sendInfo(id) {
        //ҳ��һ�򿪾�ִ�У�����ready��Ϊ��layer���������css����չģ�飩�������
            layer.ready(function(){
                //�Զ�ҳ
                layer.open({
                    type: 2,
                    title: '�û���Ϣ',
                    skin: 'layui-layer-rim', //���ϱ߿�
                    //closeBtn: 0, //����ʾ�رհ�ť
                    area: ['67%', '90%'], //���
                    content: "../User/UserView.aspx?id=" + id,
                });
            });
        }
    </script>
    <script type="text/javascript">
        function showOrder(id,action) {
        //ҳ��һ�򿪾�ִ�У�����ready��Ϊ��layer���������css����չģ�飩�������
            layer.ready(function(){
                //�Զ�ҳ
                layer.open({
                    type: 2,
                    title: '���ֹ���',
                    skin: 'layui-layer-rim', //���ϱ߿�
                    //closeBtn: 0, //����ʾ�رհ�ť
                    area: ['67%', '90%'], //���
                    content: "Pay.aspx?action="+action+"&ID=" + id,
                });
            });
        }
    </script>
    <script type="text/javascript" language="javascript">
        function Setchkall(obj) {
            var objs = document.getElementsByName("chk");
            for (i = 0; i < objs.length; i++) {
                objs[i].checked = obj.checked;
            }
        }
        function checkall(obj) {
            var check = document.getElementsByName("ischecked");
            for (i = 0; i < check.length; i++) {
                check[i].checked = obj.checked;
            }
        }
    </script>