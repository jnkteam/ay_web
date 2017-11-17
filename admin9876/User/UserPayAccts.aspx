<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserPayAccts" Codebehind="UserPayAccts.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
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
        �̻������ʻ�������
        <small>������֧��ƽ̨</small>
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
    <table width="100%" border="0" cellspacing="1" cellpadding="1" class="table1">
        <tr>
            <td>

            <div class="input-group">
            <div class="input-group-btn">
               <button type="button" class="btn btn-primary">�����û�ID</button>
            </div>
            <asp:TextBox ID="txtUserId" class="form-control" runat="server" EnableViewState="false"></asp:TextBox>
            </div>
            <div class="input-group">
               <asp:DropDownList class="form-control" ID="StatusList" runat="server" EnableViewState="false">
                   <asp:ListItem Value="">��״̬��</asp:ListItem>
                   <asp:ListItem Value="1">�����</asp:ListItem>
                   <asp:ListItem Value="2">ͨ�����</asp:ListItem>
                   <asp:ListItem Value="4">���ʧ��</asp:ListItem>
               </asp:DropDownList>
            </div>

            <div class="input-group date">
             <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ʼ</div>
                <asp:TextBox ID="StimeBox"  class="form-control"  runat="server" Width="65px"></asp:TextBox>
            </div>

             <div class="input-group date">
               <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ֹ</div>
            <asp:TextBox ID="EtimeBox" runat="server" class="form-control" Width="65px"></asp:TextBox>
            </div>

            <div class="input-group">
                <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btnSearch_Click"></asp:Button>
            </div>

            <div class="input-group">
            <asp:Button ID="btnDelete" runat="server" CssClass="button btn  btn-danger" Text=" ɾ ��"
                OnClientClick="return Del_Confirm();" onclick="btnDelete_Click">
            </asp:Button>
            </div>

            </td>
        </tr>


        <tr>
            <td align="center" bgcolor="#ffffff">
                <table width="100%" id="tab" border="0" align="center" cellpadding="2" cellspacing="1" class="table table-bordered">
                <td align="center">
                   <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">

                    <asp:Repeater ID="rptApps" runat="server" 
                        OnItemDataBound="rptAppsItemDataBound" onitemcommand="rptApps_ItemCommand">
                        <HeaderTemplate>
                            <tr height="30"  style="background: #e8eaee">
                                <td>
                                    <input id="chkAll" type="checkbox">
                                </td>
                                <td>
                                    �̻�ID
                                </td>
                                <td>
                                    �û���
                                </td>
                                <td>
                                    �տʽ
                                </td>
                                <td>
                                    ��������
                                </td>
                                <td>
                                    �����ʺ�
                                </td>
                                <td>
                                    ��������
                                </td>
                                <td>
                                    ��������
                                </td>
                                <td>
                                    ����֧��
                                </td> 
                                  <td>
                                    �����
                                </td> 
                                  <td>
                                    ���ʱ��
                                </td> 
                                 <td>
                                    ״̬
                                </td>                               
                                <td>
                                    ����
                                </td>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr height="30" >
                                <td>
                                    <input id="chkItem" type="checkbox" value='<%#Eval("id")%>' name="chkItem" />
                                </td>
                                <td>
                                    <%# Eval("userid")%>
                                </td>
                                <td>
                                    <a href="javascript:showInfo('<%# Eval("id")%>')">
                                        <strong>
                                        <%#Eval("UserName")%>
                                        </strong>
                                    </a>
                                </td>
                                <td>
                                    <%# OriginalStudio.BLL.User.userspaybank.GetSettleModeName(Eval("pmode"))%>
                                </td>
                                <td>
                                    <%# OriginalStudio.BLL.SettledFactory.GetSettleBankName(Eval("payeeBank").ToString())%>
                                </td>
                                <td>
                                     <%# Eval("account")%>��<%#OriginalStudio.BLL.User.userspaybank.GetAccoutTypeName(Eval("accoutType"))%>��
                                </td>
                                 <td>
                                    <%# Eval("payeeName")%>
                                </td>
                                <td>
                                   <%# Eval("bankProvince")%><%# Eval("bankCity")%>
                                </td>
                                <td>
                                    <%# Eval("bankAddress")%>
                                </td>
                                 <td>
                                    <%# Eval("relname")%>
                                </td>
                                 <td>
                                    <%# Eval("SureTime","{0:yyyy-MM-dd HH:mm:ss}")%>
                                </td>
                                <td>
                                    <asp:Label ID="lblUserStat" runat="server"></asp:Label>
                                </td>                                
                                <td>
                                     <asp:Button ID="btn_pass" CssClass="button btn btn-xs  btn-info" runat="server" CommandName="pass" CommandArgument='<%#Eval("id")%>' Text="ͨ�����" />
                                     <asp:Button ID="btn_fail" CssClass="button btn btn-xs  btn-info" runat="server"  CommandName="fail" CommandArgument='<%#Eval("id")%>' Text="���ʧ��" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr height="30">
                               <td>
                                    <input id="chkItem" type="checkbox" value='<%#Eval("id")%>' name="chkItem" />
                                </td>
                                <td>
                                    <%# Eval("userid")%>
                                </td>
                                <td>
                                    <a href='UserEdit.aspx?ID=<%# Eval("userid") %>'><strong>
                                        <%# Eval("userName")%>
                                    </strong></a>
                                </td>
                                <td>
                                     <%# OriginalStudio.BLL.User.userspaybank.GetSettleModeName(Eval("pmode"))%>
                                </td>
                                <td>
                                   <%# OriginalStudio.BLL.SettledFactory.GetSettleBankName(Eval("payeeBank").ToString())%>
                                </td>
                                <td>
                                   <%# Eval("account")%>��<%#OriginalStudio.BLL.User.userspaybank.GetAccoutTypeName(Eval("accoutType"))%>��
                                </td>
                                 <td>
                                    <%# Eval("payeeName")%>
                                </td>
                                <td>
                                   <%# Eval("bankProvince")%><%# Eval("bankCity")%>
                                </td>
                                <td>
                                    <%# Eval("bankAddress")%>
                                </td>
                                  <td>
                                    <%# Eval("relname")%>
                                </td>
                                 <td>
                                    <%# Eval("SureTime","{0:yyyy-MM-dd HH:mm:ss}")%>
                                </td>
                                <td>
                                    <asp:Label ID="lblUserStat" runat="server"></asp:Label>
                                </td>                                
                                <td>
                                   <asp:Button ID="btn_pass" CssClass="button btn btn-xs  btn-info" runat="server" CommandName="pass" CommandArgument='<%#Eval("id")%>' Text="ͨ�����" />
                                    <asp:Button ID="btn_fail" CssClass="button btn btn-xs  btn-info" runat="server"  CommandName="fail" CommandArgument='<%#Eval("id")%>' Text="���ʧ��" />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    </table>
                    </td>

                <!---------------------pager------------------>
                <!-- #include file="../PagerIng.aspx" -->
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
    <script type="text/javascript">

      $(function () {



         $("#StimeBox").jeDate({

                format: "YYYY-MM-DD hh:mm:ss",

            });
         $("#EtimeBox").jeDate({

                     format: "YYYY-MM-DD hh:mm:ss",

                 });



      })
        function handler(tp) {
        }

        var mytr = document.getElementById("tab").getElementsByTagName("tr");
        for (var i = 1; i < mytr.length; i++) {
            mytr[i].onmouseover = function() {
                var rows = this.childNodes.length;
                for (var row = 0; row < rows; row++) {
                    this.childNodes[row].style.backgroundColor = '#E6EEFF';
                }
            };
            mytr[i].onmouseout = function() {
                var rows = this.childNodes.length;
                for (var row = 0; row < rows; row++) {
                    this.childNodes[row].style.backgroundColor = '';
                }
            };
        }

        $().ready(function() {
            $("#chkAll").click(function() {
                $("input[type='checkbox']").each(function() {
                    if ($("#chkAll").attr('checked') == true) {
                        $(this).attr("checked", true);
                    }
                    else
                        $(this).attr("checked", false);
                });
            });
        })


        function showInfo(id) {
        //    window.open("../User/UserEdit.aspx?id=" + id, "�鿴�û���Ϣ", "Width=800px;Height=350px;");
             layer.ready(function(){
                  //�Զ�ҳ
                  layer.open({
                      type: 2,
                      title: '�û���Ϣ',
                      skin: 'layui-layer-rim', //���ϱ߿�
                      //closeBtn: 0, //����ʾ�رհ�ť
                      area: ['67%', '90%'], //���
                      content:" ../User/UserEdit.aspx?id" + id,
                  });
              });
        }

        function sendMsg(uid) {
            window.showModelessDialog("SendMsg.aspx?uid=" + uid, window, "dialogWidth=800px;dialogHeight=500px;");
        }
    </script>



