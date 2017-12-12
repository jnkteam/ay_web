<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Withdraw.Historys"
    CodeBehind="Historys.aspx.cs" %>

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
        �����¼
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
            <tr>
                <td>
                    <table>
                        <tr height="30" >
                            <td colspan="2">
                                <div class="input-group">
                                <asp:DropDownList class="form-control" ID="ddlStatusList" runat="server">
                                </asp:DropDownList></div>

                                <div class="input-group">
                                    <div class="input-group-btn">
                                    <button type="button" class="btn btn-primary">�̻���</button></div>
                                <asp:TextBox ID="txtMerchantName" class="form-control" runat="server" Width="80px"></asp:TextBox></div>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                    <button type="button" class="btn btn-primary">����ID</button></div>
                                <asp:TextBox ID="txtItemInfoId" class="form-control" runat="server" Width="80px"></asp:TextBox></div>

                                <div class="input-group">
                                    <div class="input-group-btn">
                                    <button type="button" class="btn btn-primary">�տ��˻�</button></div>
                                <asp:TextBox ID="txtAccount" class="form-control" runat="server" Width="80px"></asp:TextBox></div>

                                <div class="input-group">
                                    <div class="input-group-btn">
                                    <button type="button" class="btn btn-primary">�տ���</button></div>
                                <asp:TextBox ID="txtpayeeName" class="form-control" runat="server" Width="80px"></asp:TextBox></div>
                            </td>
                        </tr>
                        <tr>
                            <td>							
                                <div class="input-group">
									<asp:DropDownList class="form-control" ID="ddlbankName" runat="server"></asp:DropDownList>
                                </div>
								
                                <div class="input-group">
                                    <asp:DropDownList class="form-control" ID="ddlmode" runat="server">
                                    </asp:DropDownList></div>
                                <div class="input-group">
                                    <asp:DropDownList class="form-control" ID="ddlSupplier" runat="server">
                                    </asp:DropDownList></div>
								 <div class="input-group date">
									 <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ʼ</div>
										<asp:TextBox ID="txtStimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox></div>
								 <div class="input-group date">
									 <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ֹ</div>
										<asp:TextBox ID="txtEtimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox></div>
                                <div class="input-group">
                                    <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btnSearch_Click"></asp:Button></div>
                                <div class="input-group">
                                    <asp:Button ID="btnExport" runat="server" CssClass="button btn  btn-danger" Text="����" OnClick="btnExport_Click"/></div>
                                <div class="input-group">
                                       <button type="button" class="btn btn-default">�����ܶ<%=TotalMoney %></button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr bgcolor="#ffffff">
                <td>
                    <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered">
                        <tr>
                            <td align="center">
                                <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                        <asp:Repeater ID="rptList" runat="server">
                            <HeaderTemplate>
                                <tr style="background: #e8eaee">
                                    <td>
                                        ���
                                    </td>
                                    <td>
                                        �̻���
                                    </td>
                                    <td>
                                        �տ���Ϣ
                                    </td>
                                    <td>
                                        ������
                                    </td>
                                    <td>
                                        ʵ��֧�����
                                    </td>
                                    <td>
                                        ��˰
                                    </td>
                                    <td>
                                        ������
                                    </td>
                                    <td>
                                        ����ʱ��
                                    </td>
                                    <td>
                                        ״̬
                                    </td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("ID")%>
                                    </td>
                                    <td>
                                        <a href="?action=paylistbyid&userid=<%#Eval("userid")%>">
                                            <%#Eval("merchantname")%>(#<%#Eval("userid")%>)
                                        </a>
                                    </td>
                                    <td>
                                        <%# Eval("payeeName")%> <br />
                                        <%# Eval("Account")%>
                                    </td>
                                    <td>
                                        <%# Eval("amount","{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Convert.ToDecimal(Eval("amount")).ToString("f2") %>
                                    </td>
                                    <td>
                                        <%# Eval("Tax", "{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("Charges", "{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("PayTime", "{0:yyyy-MM-dd HH:mm:ss}")%>
                                    </td>
                                    <td>
                                        <a class="button btn btn-xs  btn-info" style="cursor: none;color: #ffffff;" href="javascript:void(0)"><%# Eval("StatusText")%></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                    &nbsp;
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
<script type="text/javascript" >
    $(function () {
       $("#txtStimeBox").jeDate({
           format: "YYYY-MM-DD hh:mm:ss",
       });
       $("#txtEtimeBox").jeDate({
           format: "YYYY-MM-DD hh:mm:ss",
       });
    })

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
