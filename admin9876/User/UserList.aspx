<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserList" Codebehind="UserList.aspx.cs" %>

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
        �̻�����
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
        <div class="input-group" style="position: absolute;left:94%;top: 64px;">

            <a class="button btn  btn-danger" href="javascript:userAdd('<%# Eval("userid")%>')">
               �����̻�
            </a>
        </div>

            <tr height="30" >
                <td>
                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">����</button>
                    </div>
                    <asp:DropDownList class="form-control" ID="StatusList" runat="server" EnableViewState="false">
                        <asp:ListItem Value="">���û�״̬��</asp:ListItem>
                        <asp:ListItem Value="1">�����</asp:ListItem>
                        <asp:ListItem Value="2">����</asp:ListItem>
                        <asp:ListItem Value="4">����</asp:ListItem>
                    </asp:DropDownList>
                    </div>

                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">�û���</button>
                    </div>
                    <asp:TextBox ID="txtuserName" class="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">�û�ID</button>
                    </div>
                    <asp:TextBox ID="txtuserId" class="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">����ID</button>
                    </div>
                    <asp:TextBox ID="txtagent" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>

            <tr height="30" >
                <td>
                    <div class="input-group">
                        <asp:DropDownList ID="ddlisSpecialPayRate" class="form-control" runat="server">
                            <asp:ListItem Value="">���������ʡ�</asp:ListItem>
                            <asp:ListItem Value="0">δ����</asp:ListItem>
                            <asp:ListItem Value="1">����</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="input-group">
                        <asp:DropDownList ID="ddlpayrate" class="form-control" runat="server">
                            <asp:ListItem Value="">�����ʱ�����</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="input-group">
                        <asp:DropDownList ID="ddlSpecial" class="form-control" runat="server">
                            <asp:ListItem Value="">������ͨ����</asp:ListItem>
                            <asp:ListItem Value="1">������</asp:ListItem>
                            <asp:ListItem Value="0">δ����</asp:ListItem>
                        </asp:DropDownList>
                    </div>



                    <div class="input-group">
                    <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-primary" Text=" �� ѯ " OnClick="btnSearch_Click"></asp:Button>
                    </div>

                    <div class="input-group">
                    <asp:Button ID="btnDelete" runat="server" CssClass="button btn  btn-primary" Text=" ɾ ��" onclick="btnDelete_Click"> </asp:Button>
                    </div>

                    <div class="input-group">
                    <asp:Button ID="btnCashTo" runat="server" CssClass="button btn  btn-primary" Text="�� ��" OnClientClick="return GetMoney_Confirm();" Visible="false"></asp:Button>
                    </div>

                    <div class="input-group">
                    <asp:Button ID="btn_allgetmoney" runat="server" CssClass="button btn  btn-primary" Text="һ������" Visible="false"></asp:Button>
                    </div>

                    <div class="input-group">

                    <asp:Button ID="btn_Msg" runat="server" CssClass="button btn  btn-primary" Text="�ڲ���Ϣ" onclick="btn_Msg_Click"></asp:Button>
                    </div>

                    <div class="input-group">
                    <input type="button" class="button btn  btn-primary" value="�� ��" onclick="setupwin();" Visible="false"/>
                    </div>

                    <div class="input-group">
                    <input type="button" class="button btn  btn-primary" value="�����ֻ�����" onclick="sentsmswin();" />
                    </div>

                </td>
            </tr>

            <tr height="30" >
                <td>
                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">QQ����</button>
                    </div>
                    <asp:TextBox ID="txtQQ" class="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">�ֻ�</button>
                    </div>
                    <asp:TextBox ID="txtTel" class="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">Email</button>
                    </div>
                    <asp:TextBox ID="txtMail" class="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">����</button>
                    </div>
                    <asp:TextBox ID="txtfullname" class="form-control" runat="server"></asp:TextBox>
                    </div>
                   
                </td>
            </tr>
            <tr>


            <td align="left" bgcolor="" style="display: none">
                <div class="btn-group">
                  <button type="button" class="btn btn-default"> �ѽ����ܶ�:<%=yzfmoney %></button>
                  <button type="button" class="btn btn-default">δ�����ܶ�:<%=wzfmoney %></button>
                </div>
            </td>
            </tr>


            <tr>
                <td align="center" bgcolor="#ffffff">
                    <table width="100%" id="tab" border="0" align="center" cellpadding="2" cellspacing="1" class="table table-bordered">
                        <tr>
                            <td align="center">
                                <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                                <asp:Repeater ID="rptUsers" EnableViewState="false" runat="server" OnItemDataBound="rptUsersItemDataBound">
                                <HeaderTemplate>
                                <tr height="30"  style="background: #e8eaee">
                                    <td>
                                        <input id="chkAll" type="checkbox">
                                    </td>
                                    <td>
                                        ǩԼ����</td>
                                    <td>
                                        �̻�ID</td>
                                    <td>
                                        �û���</td>
                                    <td>
                                        <asp:HyperLink ID="hlinkOrderby" runat="server" NavigateUrl="?orderby=balance&type=asc" CssClass="rptheadlink">����</asp:HyperLink>
                                    </td>
                                    <td>
                                        ʵ����֤</td>
                                    <td>
                                        �ֻ���֤</td>
                                    <td>
                                        �ʼ���֤</td>
                                    <td>
                                        ���ַ���</td>
                                    <td>
                                        ����¼</td>
                                    <td>
                                        ����</td>
                                    <td>
                                        ����</td>
                                    <td>
                                        ״̬</td>
                                    <td>
                                        ����</td>
                                    <td>
                                        ����</td>
                                     <td>ҵ��</td>
                                    <td>ͨ��</td>
                                    <td>����</td>
                                    <td>����</td>
									<td>��ע</td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr height="30">
                                    <td>
                                        <input id="chkItem" type="checkbox"  value='<%#Eval("id")%>' name="chkItem" />
                                    </td>
                                     <td>
                                        <%#OriginalStudio.BLL.User.UserFactory.GetClassViewName(Eval("classid"))%>
                                    </td>
                                    <td>
                                        <%# Eval("id")%>
                                    </td>
                                    <td>
                                        <a href="javascript:showInfo('<%# Eval("ID")%>')">
                                            <strong>
                                            <%#Eval("UserName")%>
                                            </strong>
                                        </a>
                                    </td>
                                    <td>
                                        <%# Eval("balance")%>
                                    </td>
                                    <td>
                                        <%#getpassview(Eval("isRealNamePass"))%>
                                    </td>
                                     <td>
                                        <%#getpassview(Eval("isPhonePass"))%>
                                    </td>
                                     <td>
                                        <%#getpassview(Eval("isEmailPass"))%>
                                    </td>
                                    <td>
                                        <%# Eval("schemename")%>
                                    </td>
                                    <td>
                                        <%# Eval("lastLoginTime","{0:yyyy-MM-dd HH:ss:mm}")%>
                                    </td>
                                    <td>
                                        <%# Eval("full_name")%>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblUserType" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblUserStat" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblUserLevel" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblUserSettle" runat="server"></asp:Label>
                                    </td>
                                    <td><asp:Label ID="labagcmd" runat="server"></asp:Label></td>
                                    <td><a class="button btn btn-xs  btn-info" href="javascript:tongDao('<%# Eval("ID")%>')">
                                            ͨ ��<%#isSpecialChannel(Eval("ID"))%>
                                        </a></td>
                                    <td><a class="button btn btn-xs  btn-info" href="UserPayRateEdit.aspx?ID=<%# Eval("id")%>">����</a></td>
                                    <td>
                                      <asp:Label ID="labcmd" class="button btn btn-xs  btn-info"  runat="server"></asp:Label>
                                      <a class="button btn btn-xs  btn-info"  href="javascript:sendMsg(<%# Eval("ID") %>);">����Ϣ</a>
                                      <a style="font-size:15px; color:#00c0ef" href="UserInfoPrint.aspx?ID=<%# Eval("ID") %>" target="_blank" ><i class="fa fa-print"></i></a></td>
                                    </td>
										
                                    </td>                                    
									<td>
                                        <%# Eval("desc")%>
                                    </td>	
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr height="30">
                                    <td>
                                        <input id="chkItem" type="checkbox" value='<%#Eval("id")%>' name="chkItem" />
                                    </td>
                                     <td>
                                        <%#OriginalStudio.BLL.User.UserFactory.GetClassViewName(Eval("classid"))%>
                                    </td>
                                    <td>
                                        <%# Eval("id")%>
                                    </td>
                                    <td>

                                        <a href="javascript:showInfo('<%# Eval("ID")%>')">
                                            <strong>
                                            <%#Eval("UserName")%>
                                            </strong>
                                        </a>
                                    </td>
                                    <td>
                                        <%# Eval("balance")%>
                                    </td>
                                    <td>
                                        <%#getpassview(Eval("isRealNamePass"))%>
                                    </td>
                                     <td>
                                        <%#getpassview(Eval("isPhonePass"))%>
                                    </td>
                                     <td>
                                        <%#getpassview(Eval("isEmailPass"))%>
                                    </td>
                                    <td>
                                        <%# Eval("schemename")%>
                                    </td>
                                    <td>
                                        <%# Eval("lastLoginTime","{0:yyyy-MM-dd HH:ss:mm}")%>
                                    </td>
                                    <td>
                                        <%# Eval("full_name")%>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblUserType" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblUserStat" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblUserLevel" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblUserSettle" runat="server"></asp:Label>
                                    </td>
                                    <td><asp:Label ID="labagcmd" runat="server"></asp:Label></td>
                                    <td>
                                    <a class="button btn btn-xs  btn-info" href="javascript:tongDao('<%# Eval("ID")%>')">
                                        ͨ ��<%#isSpecialChannel(Eval("ID"))%>
                                    </a>
                                    </td>
                                      
                                    <td><a class="button btn btn-xs  btn-info" href="UserPayRateEdit.aspx?ID=<%# Eval("id")%>">
                                            ����</a></td>
                                    <td>
                                        <asp:Label ID="labcmd" class="button btn btn-xs  btn-info" runat="server"></asp:Label>
                                        <a class="button btn btn-xs  btn-info" href="javascript:sendMsg(<%# Eval("ID") %>);">����Ϣ</a>
										<a style="font-size:15px; color:#00c0ef" href="UserInfoPrint.aspx?ID=<%# Eval("ID") %>" target="_blank" ><i class="fa fa-print"></i></a></td>
                                    </td>
									<td>
                                        <%# Eval("desc")%>
                                    </td>									
                                </tr>
                            </AlternatingItemTemplate>
                        </asp:Repeater>
                    </table>
                    <!---------------------pager------------------>
                    <!-- #include file="../Pager.aspx" -->
                    <!---------------------pager------------------>
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
<script src="<%=ADMIN_URI%>/style/admin/layer/layer.js"></script>
<script type="text/javascript">
 function handler(tp){
 }

var mytr =  document.getElementById("tab").getElementsByTagName("tr");
for(var i=1;i<mytr.length;i++){
  mytr[i].onmouseover= function(){ 
var rows = this.childNodes.length;
for(var row=0;row<rows;row++){
this.childNodes[row].style.backgroundColor='#E6EEFF';
}
};
  mytr[i].onmouseout= function(){ 
var rows = this.childNodes.length;
for(var row=0;row<rows;row++){
this.childNodes[row].style.backgroundColor='';
}
};
}

$().ready(function(){
     $("#chkAll").click(function(){
        $("input[type='checkbox']").each(function(){
           if ($("#chkAll").attr('checked') == true){
               $(this).attr("checked", true);
           }
           else
               $(this).attr("checked", false);
        });
    });
    var btnDeleteId = "#<%=btnDelete.ClientID%>";
    $(btnDeleteId).click(function(){
        return confirm("ȷ��Ҫɾ����Щ�̻���?");
    });
});

function sendMsg(uid){
    window.showModelessDialog("SendMsg.aspx?uid="+uid,window,"dialogWidth=800px;dialogHeight=500px;");
}


function userAdd(id) {
     layer.ready(function(){
          //�Զ�ҳ
          layer.open({
              type: 2,
              title: '�����û�',
              skin: 'layui-layer-rim', //���ϱ߿�
              //closeBtn: 0, //����ʾ�رհ�ť
              area: ['67%', '90%'], //���
              content:"UserAdd.aspx"

          });
      });
}

function tongDao(id) {
     layer.ready(function(){
          //�Զ�ҳ
          layer.open({
              type: 2,
              title: '�̻�ͨ������',
              skin: 'layui-layer-rim', //���ϱ߿�
              //closeBtn: 0, //����ʾ�رհ�ť
              area: ['67%', '90%'], //���
              content:"UserChannel.aspx?id=" +id,

          });
      });
}



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