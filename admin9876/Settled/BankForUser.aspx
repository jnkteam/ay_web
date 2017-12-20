<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Settled.BankForUser" Codebehind="BankForUser.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>

<style>

td{text-align: center; vertical-align: middle !important;}
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
    <div id="modelPanel" style="background-color: #F2F2F2">
    </div>
    <input id="selectedUsers" runat="server" type="hidden" />
    <table width="100%" border="0" cellspacing="1" cellpadding="1" class="table1" class="table table-bordered">

        <tr>
            <td>
                <div class="input-group">
                                                 <div class="input-group-btn">
                                                    <button type="button" class="btn btn-primary">�̻���</button>
                                                 </div>
                <asp:TextBox class="form-control" ID="txtMerchantName" runat="server"></asp:TextBox>
                </div>
                 <div class="input-group">
                 <div class="input-group-btn">
                 <button type="button" class="btn btn-primary">���</button>
                 </div>

                <asp:TextBox class="form-control" ID="txtbalance" runat="server" Text="100"></asp:TextBox>
                </div>
                 <div class="input-group">
                <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btnSearch_Click">
                </asp:Button>
                </div>
                 <div class="input-group">
                <asp:Button ID="btnBatchSettle" runat="server" CssClass="button btn  btn-danger" Text="��������"
                    onclick="btnBatchSettle_Click" OnClientClick="return check();">
                </asp:Button>
                </div>

                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">��������</button>
                                </div>

               <asp:TextBox class="form-control" ID="txtPassWord" runat="server" TextMode="Password"></asp:TextBox>
               </div>
                <div class="input-group">
                <asp:Button CssClass="button btn  btn-danger" ID="btnAllSettle" runat="server"  Text="ȫ������"
                    onclick="btnAllSettle_Click" OnClientClick="return checkAll();">
                </asp:Button>
                </div>


				&nbsp;&nbsp; <div class="btn-group">
                            						  <button type="button" class="btn btn-default">����<%#TotalMoney%></button></div>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table width="100%" id="tab" border="0" align="center" class="table table-bordered table-hover dataTable" style="background: #fff" cellpadding="2" cellspacing="1">
                    <asp:Repeater ID="rptUsers" runat="server" 
                        OnItemDataBound="rptUsersItemDataBound" onitemcommand="rptUsers_ItemCommand">
                        <HeaderTemplate>
                            <tr height="30"  style="background: #e8eaee">
                                <td>
                                    <input id="chkAll" type="checkbox">
                                </td>
                                <td>
                                    �̻���
                                </td>  
                                <td>
                                    ��¼�û�
                                </td>                                
                                <td>
                                    ���
                                </td>
                                <td>
                                    ������
                                </td>
                                <td>
                                    ����
                                </td>
                                <td>
                                    �տ���
                                </td>
                                <td>
                                    ������
                                </td>
                                <td>
                                    ���п���
                                </td>
                                <td>
                                    ������ַ
                                </td>
                                <td>
                                    ����ģʽ
                                </td>
                                <td>
                                    ��Ѻ���
                                </td>
                                <td>
                                    ������
                                </td>
                                <td>
                                    ����
                                </td>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="childCheck">
                                <asp:HiddenField ID="hfuserid" runat="server" Value='<%# Eval("userid")%>' />
                                <td>
                                    <input id="chkItem" type="checkbox" runat="server" value='<%#Eval("userid")%>' name="chkItem" />
                                </td>
                                <td>
                                    <%# Eval("merchantname")%>                                    
                                </td> 
                                <td>
                                    <%# Eval("username")%>
                                </td>                              
                                <td>
                                    <%# Eval("balance", "{0:f2}")%>
                                </td>
                                <td>
                                    <%# Eval("unpayment", "{0:f2}")%>
                                </td>
                                <td>
                                    <%# Eval("Freeze", "{0:f2}")%>
                                </td>
                                <td>
                                    <%# Eval("AccountName")%>
                                </td>
                                 <td>
                                    <%# Eval("BankName") %>
                                </td>
                                <td>
                                    <%# Eval("BankAccount")%>
                                </td>
                                <td>
                                    <%# Eval("bankAddress")%>
                                </td>
                                <td>
                                    <%# Eval("SchemeName")%>
                                </td>
                                <td>
                                    <asp:Literal ID="litTodayIncome" runat="server"></asp:Literal>
                                </td>
                                <td>
                                <div class="input-group">
                                    <asp:TextBox ID="txtpayAmt" class="form-control" runat="server" style="width:80px !important"></asp:TextBox>
                                    </div>
                                </td>                               
                                <td>
                                    <asp:Button  cssclass="button btn btn-xs btn-info" ID="btnSettled" runat="server" CommandName="Settled" CommandArgument='<%# Eval("userid") %>' Text="����" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        
                    </asp:Repeater>
                </table>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                     <!---------------------pager------------------>
                                                           <!-- #include file="../Pager.aspx" -->
                                                           <!---------------------pager------------------>
                    <tr>
                    <td style="text-align: left !important;">
                    <br>
                        ˵�������ǰ���ƽ̨�涨���������̸��̻���� <br />��ѯ�����е�����ǡ��̻�ʵ������ȥ�������л�δ��ˡ��͡�������Ľ�
                    </td>
                    </tr>
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
<script type="text/javascript">
        $().ready(function() {

           var clickCheckAll = false;
                        $("#chkAll").click(function() {
                                        if (clickCheckAll) {
                                            $(".childCheck input[type='checkbox']").each(function() {this.checked = false;});
                                            clickCheckAll = false;
                                        } else {
                                            $(".childCheck input[type='checkbox']").each(function() {this.checked = true;});
                                            clickCheckAll = true;
                                        }

                        });
        })
        function isselect() {
            var result = false;
            $("input[type='checkbox']").each(function() {
                if ($(this).attr("userid") != "chkAll") {
                    if ($(this).attr('checked') == true) {
                        result = true;
                    }
                }
            });
            return result;
        }
        function check() {
            if (!isselect()) {
                alert('����ѡ��һ����¼');
                return false;
            }
            return true;
        }
        function checkAll() {
            if ($("#txtPassWord").val() =="") {
                alert('�������������');
                return false;
            }
            return true;
        }
        function sendMsg(uid) {
            window.showModelessDialog("SendMsg.aspx?uid=" + uid, window, "dialogWidth=800px;dialogHeight=500px;");
        }

    </script>