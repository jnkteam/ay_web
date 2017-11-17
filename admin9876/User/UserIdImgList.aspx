<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserIdImgLists" Codebehind="UserIdImgList.aspx.cs" %>

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
        ֤�����
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
                <div class="input-group">
                <asp:DropDownList class="form-control" ID="StatusList" runat="server" EnableViewState="false">
                    <asp:ListItem Value="">�����״̬��</asp:ListItem>
                    <asp:ListItem Value="1">�����</asp:ListItem>
                    <asp:ListItem Value="2">�����</asp:ListItem>
                    <asp:ListItem Value="4">���ʧ��</asp:ListItem>
                </asp:DropDownList>
                </div>

                <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">�û�ID</button></div>
                       <asp:TextBox ID="txtUserId" class="form-control" runat="server" EnableViewState="false"></asp:TextBox>
                    </div>


                <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">�û���</button></div>
                <asp:TextBox ID="txtUserName" class="form-control" runat="server" EnableViewState="false"></asp:TextBox></div>

                <div class="input-group date">
                <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ʼ</div>
                <asp:TextBox ID="StimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox></div>
                <div class="input-group date">

                <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ֹ</div>
                <asp:TextBox ID="EtimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox></div>

                <div class="input-group">
                <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btnSearch_Click">
                </asp:Button>
                </div>

                <div class="input-group">
                <asp:Button ID="btnDelete" runat="server" CssClass="button btn  btn-danger" Text=" ɾ ��" OnClientClick="return Del_Confirm();"
                    OnClick="btnDelete_Click"></asp:Button>
                </div>

                <div class="input-group">
                <asp:Button ID="btnCashTo" runat="server" CssClass="button btn  btn-danger" Text="�� ��" OnClientClick="return GetMoney_Confirm();"
                    OnClick="btnCashTo_Click"></asp:Button>
                </div>
                </table>
            </td>
        </tr>


        <tr >
            <td bgcolor="#ffffff">
                <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered">
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                                <asp:Repeater ID="rptIamges" EnableViewState="false" runat="server" OnItemDataBound="rptUsersItemDataBound">
                                    <HeaderTemplate>
                            <tr height="30"  style="background: #e8eaee" >
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
                                    ��ʵ��
                                </td>
                                <td>
                                    ֤������
                                </td>
                                <td>
                                    �ύʱ��
                                </td>
                                <td>
                                    ����
                                </td>
                                <td>
                                    ����
                                </td>
                                <td>
                                    ���״̬
                                </td>
                                <td>
                                    ���ʱ��
                                </td>
                                <td>
                                    ˵ ��
                                </td>
                                <td>
                                    �����
                                </td>
                                <td>
                                    �� ��
                                </td>
                            </tr>
                        </HeaderTemplate>
                                    <ItemTemplate>
                            <tr ondblclick="javascript:sendInfo('<%# Eval("id")%>')">
                                <td>
                                    <input id="chkItem" type="checkbox" value='<%#Eval("id")%>' name="chkItem" />
                                </td>
                                <td>
                                    <%# Eval("userId")%>
                                </td>
                                <td>
                                     <a href="javascript:showInfo('<%# Eval("ID")%>')">
                                         <strong>
                                         <%#Eval("UserName")%>
                                         </strong>
                                     </a>
                                </td>
                                <td>
                                    <%# Eval("payeeName")%>
                                </td>
                                <td>
                                    <%# Eval("IdCard")%>
                                </td>
                                <td>
                                    <%# Eval("addtime","{0:yyyy-MM-dd HH:ss:mm}")%>
                                </td>
                                <td>
                                    <a href="idimg.aspx?id=<%#Eval("id")%>&show=on" target="_blank">
                                        <img id="img1" src="idimg.aspx?id=<%#Eval("id")%>&show=on" width="180px" height="120px"
                                            style="border: 0" /></a>
                                </td>
                                <td>
                                    <a href="idimg.aspx?id=<%#Eval("id")%>&show=down" target="_blank">
                                        <img id="img2" src="idimg.aspx?id=<%#Eval("id")%>&show=down" width="180" height="120px"
                                            style="border: 0" /></a>
                                </td>
                                <td>
                                    <%# Enum.GetName(typeof(OriginalStudio.Model.User.IdImageStatus),Eval("status"))%>
                                </td>
                                <td>
                                    <%# Eval("checktime","{0:yyyy-MM-dd HH:ss:mm}")%>
                                </td>
                                <td>
                                    <%# Eval("why")%>
                                </td>
                                <td>
                                    <%# Eval("admin")%>
                                </td>
                                <td>
                                    <asp:Label ID="labagcmd" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </ItemTemplate>
                                    <AlternatingItemTemplate>
                            <tr ondblclick="javascript:sendInfo('<%# Eval("id")%>')">
                                <td>
                                    <input id="chkItem" type="checkbox" value='<%#Eval("id")%>' name="chkItem" />
                                </td>
                                <td>
                                    <%# Eval("userId")%>
                                </td>
                                <td>
                                   <a href="javascript:showInfo('<%# Eval("ID")%>')">
                                        <strong>
                                        <%#Eval("UserName")%>
                                        </strong>
                                    </a>
                                </td>
                                <td>
                                    <%# Eval("payeeName")%>
                                </td>
                                <td>
                                    <%# Eval("IdCard")%>
                                </td>
                                <td>
                                    <%# Eval("addtime","{0:yyyy-MM-dd HH:ss:mm}")%>
                                </td>
                                <td>
                                    <a href="idimg.aspx?id=<%#Eval("id")%>&show=on" target="_blank">
                                        <img id="img1" src="idimg.aspx?id=<%#Eval("id")%>&show=on" width="180px" height="120px"
                                            style="border: 0" /></a>
                                </td>
                                <td>
                                    <a href="idimg.aspx?id=<%#Eval("id")%>&show=down" target="_blank">
                                        <img id="img2" src="idimg.aspx?id=<%#Eval("id")%>&show=down" width="180" height="120px"
                                            style="border: 0" /></a>
                                </td>
                                <td>
                                    <%# Enum.GetName(typeof(OriginalStudio.Model.User.IdImageStatus),Eval("status"))%>
                                </td>
                                <td>
                                    <%# Eval("checktime","{0:yyyy-MM-dd HH:ss:mm}")%>
                                </td>
                                <td>
                                    <%# Eval("why")%>
                                </td>
                                <td>
                                    <%# Eval("admin")%>
                                </td>
                                <td>
                                    <asp:Label ID="labagcmd" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
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
});



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
        });


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
              content:" ../User/UserEdit.aspx?id=" + id,
          });
      });
}

</script>
