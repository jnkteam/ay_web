<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.Audits" CodeBehind="Audits.aspx.cs" %>

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
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        �������
        <small>������֧��ƽ̨</small>
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
                <td>
                    <table>
                        <tr  height="30" >
                            <td colspan="2">
                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">�̻�ID</button></div>
                                <asp:TextBox ID="txtUserId" class="form-control" runat="server" Width="80px"></asp:TextBox></div>

                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">����ID</button></div>
                                <asp:TextBox ID="txtItemInfoId" class="form-control" runat="server" Width="80px"></asp:TextBox></div>
                                <div class="input-group">
                                <asp:DropDownList class="form-control" ID="ddlbankName" runat="server">
                                <asp:ListItem value="">--�տ�����--</asp:ListItem>
                                <asp:ListItem value="0002">֧����</asp:ListItem>
                                <asp:ListItem value="0003">�Ƹ�ͨ</asp:ListItem>
                                <asp:ListItem value="1002">�й���������</asp:ListItem>
                                <asp:ListItem value="1005">�й�ũҵ����</asp:ListItem>
                                <asp:ListItem value="1003">�й���������</asp:ListItem>
                                <asp:ListItem value="1026">�й�����</asp:ListItem>
                                <asp:ListItem value="1001">��������</asp:ListItem>
                                <asp:ListItem value="1006">��������</asp:ListItem>
                                <asp:ListItem value="1020">��ͨ����</asp:ListItem>
                                <asp:ListItem value="1025">��������</asp:ListItem>
                                <asp:ListItem value="1009">��ҵ����</asp:ListItem>
                                <asp:ListItem value="1027">�㷢����</asp:ListItem>
                                <asp:ListItem value="1004">�ַ�����</asp:ListItem>
                                <asp:ListItem value="1022">�������</asp:ListItem>
                                <asp:ListItem value="1021">��������</asp:ListItem>
                                <asp:ListItem value="1010">����֧������</asp:ListItem>
                                <asp:ListItem value="1066">�й�������������</asp:ListItem>
                                </asp:DropDownList></div>
                            </td>
                        </tr>
                        <tr  height="30" >
                            <td colspan="2">
                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">�տ��˻�</button></div>
                                <asp:TextBox ID="txtAccount" class="form-control" runat="server" Width="80px"></asp:TextBox></div>

                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">�տ���</button></div>
                                <asp:TextBox ID="txtpayeeName" class="form-control" runat="server" Width="80px"></asp:TextBox></div>

                                <div class="input-group">
                                <asp:DropDownList class="form-control" ID="ddlmode" runat="server">
                                </asp:DropDownList></div>

                                <div class="input-group">
                                <asp:DropDownList ID="ddlSupplier" class="form-control" runat="server">
                                </asp:DropDownList></div>
                            </td>
                        </tr>
                        <tr  height="30" >
                            <td colspan="2">
                            <div class="input-group">
                                <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btnSearch_Click">
                    </asp:Button></div>
                            <div class="input-group">
                                <asp:Button ID="btnPass" runat="server" CssClass="button btn  btn-danger"  Text="����ͨ�����"
                        OnClick="btnPass_Click"></asp:Button></div>
                            <div class="input-group">
                                <asp:Button ID="btnAllPass" runat="server" CssClass="button btn  btn-danger"  Text="ȫ��ͨ�����"
                        OnClick="btnAllPass_Click"></asp:Button></div>
                            <div class="input-group">
                                <asp:Button ID="btnallfail" runat="server" CssClass="button btn  btn-danger" Text="ȫ���ܾ�"
                        OnClick="btnallfail_Click"></asp:Button></div>
                            <div class="input-group">
                                <asp:Button ID="btnExport" runat="server" CssClass="button btn  btn-danger" Text="����" OnClick="btnExport_Click">
                            </asp:Button></div>
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
                        <asp:Repeater ID="rptApply" runat="server" 
                            onitemdatabound="rptApply_ItemDataBound" 
                            onitemcommand="rptApply_ItemCommand">
                            <HeaderTemplate>
                                <tr style="background: #e8eaee">
                                    <td style="width: 5%">
                                        <input id="Checkboxall" type="checkbox" class="qx" onclick="checkall(this)" />   ȫѡ                                     
                                    </td>
                                    <td style="width: 5%">
                                        ���
                                    </td>
                                    <td style="width: 8%">
                                        �̻���
                                    </td>
                                    <td style="width: 20%">
                                        �տ���Ϣ
                                    </td>
                                    <td style="width: 8%">
                                        ����
                                    </td>
                                    <td style="width: 8%">
                                        ������
                                    </td>
                                    <td style="width: 10%">
                                        ����ʱ��
                                    </td>
                                    <td style="width: 10%">
                                        ֧������
                                    </td>
                                    <td style="width: 8%">
                                        ����ӿ�
                                    </td> 
                                    <td>
                                        ����
                                    </td>                                     
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <input id="<%# Eval("ID") %>" type="checkbox" name="ischecked" class="qx" value="<%# Eval("ID") %>" />
                                    </td>
                                    <td>
                                        <%# Eval("ID")%>
                                    </td>
                                    <td>
                                        <a href="javascript:sendInfo('<%# Eval("userid")%>')">
                                            <%#Eval("UserName")%>
                                        </a>
                                    </td>
                                    <td>
                                        <%# KuaiCard.BLL.SettledFactory.GetSettleBankName(Eval("PayeeBank").ToString())%> <%# Eval("Payeeaddress")%> <br />
                                        <%# Eval("payeeName")%> <br />
                                        <%# Eval("account")%>
                                    </td>                                    
                                    <td>
                                        <%#Enum.GetName(typeof(KuaiCard.Model.SettledmodeEnum), Eval("settmode"))%>
                                    </td>
                                    <td>
                                        <%# Eval("amount","{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("AddTime","{0:yyyy-MM-dd HH:mm:ss}") %>
                                    </td>
                                    <td>
                                        <%# Eval("required", "{0:yyyy-MM-dd}")%>
                                    </td>
                                    <td>
                                        <%# KuaiCard.WebUI.WebUtility.GetsupplierName(Eval("tranapi"))%>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnAudit" runat="server" class="button btn btn-xs  btn-info" Text="ͨ��" CommandName="Pass" CommandArgument='<%# Eval("ID") %>'  />
                                        <asp:Button ID="btnRefuse" runat="server" class="button btn btn-xs  btn-info" Text="�ܾ�" CommandName="Refuse" CommandArgument='<%# Eval("ID") %>'  />
                                    </td>                                    
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr>
                                   <td>
                                        <input id="<%# Eval("ID") %>" type="checkbox" name="ischecked" class="qx" value="<%# Eval("ID") %>" />
                                    </td>
                                    <td>
                                        <%# Eval("ID")%>
                                    </td>
                                    <td>
                                        <a href="javascript:sendInfo('<%# Eval("userid")%>')">
                                            <%#Eval("UserName")%>
                                        </a>
                                    </td>
                                    <td>
                                        <%# KuaiCard.BLL.SettledFactory.GetSettleBankName(Eval("PayeeBank").ToString())%> <%# Eval("Payeeaddress")%> <br />
                                        <%# Eval("payeeName")%> <br />
                                        <%# Eval("account")%>
                                    </td>                                    
                                    <td>
                                        <%#Enum.GetName(typeof(KuaiCard.Model.SettledmodeEnum), Eval("settmode"))%>
                                    </td>
                                    <td>
                                        <%# Eval("amount","{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("AddTime","{0:yyyy-MM-dd HH:mm:ss}") %>
                                    </td>
                                    <td>
                                        <%# Eval("required", "{0:yyyy-MM-dd}")%>
                                    </td>
                                    <td>
                                         <%# KuaiCard.WebUI.WebUtility.GetsupplierName(Eval("tranapi"))%>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnAudit" class="button btn btn-xs  btn-info" runat="server" Text="ͨ��" CommandName="Pass" CommandArgument='<%# Eval("ID") %>'  />
                                        <asp:Button ID="btnRefuse" class="button btn btn-xs  btn-info" runat="server" Text="�ܾ�" CommandName="Refuse" CommandArgument='<%# Eval("ID") %>'  />
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
                          content: "../User/UserEdit.aspx?id=" + id,
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

<script type="text/javascript" language="JavaScript">
    var table = document.getElementById("table_zyads"); if (table) { for (i = 0; i < table.rows.length; i++) { if (i % 2 == 0) { table.rows[i].bgColor = "ffffff"; } else { table.rows[i].bgColor = "f3f9fe" } } } var mytr = document.getElementById("table2").getElementsByTagName("tr"); for (var i = 1; i < mytr.length; i++) { mytr[i].onmouseover = function() { var rows = this.childNodes.length; for (var row = 0; row < rows; row++) { this.childNodes[row].style.backgroundColor = '#DFE8F6'; } }; mytr[i].onmouseout = function() { var rows = this.childNodes.length; for (var row = 0; row < rows; row++) { this.childNodes[row].style.backgroundColor = ''; } }; }</script>

