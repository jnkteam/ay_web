<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserList" Codebehind="UserList.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
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
        <div class="input-group" style="position: absolute;left:88%;top: 64px;">

            <a class="button btn  btn-danger" href="javascript:userAdd()">
               �����̻�
            </a>&nbsp;
             <a class="button btn  btn-danger" href="javascript:userIdImg()">
                           ֤�����
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
                                           <button type="button" class="btn btn-primary">��ϵ��</button>
                                        </div>
                                        <asp:TextBox ID="txtfullname" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                    <%--
                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">����ID</button>
                    </div>
                    <asp:TextBox ID="txtagent" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    --%>
                </td>
            </tr>

            <tr height="30" >
                <td>
                <%--
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
                    --%>
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




                </td>
            </tr>

            <tr height="30" >
                <td>

<div class="input-group">
                    <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btnSearch_Click"></asp:Button>
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
                    <a class="button btn  btn-primary" href="javascript:btn_Msg('<%# Eval("userid")%>')">�ڲ���Ϣ</a>
                    </div>

                    <div class="input-group">
                    <input type="button" class="button btn  btn-primary" value="�� ��" onclick="setupwin();" Visible="false"/>
                    </div>

                    <div class="input-group">
                    <input type="button" class="button btn  btn-primary" value="�����ֻ�����" onclick="sentsmswin();" />
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
                                   �̻�ID</td>


                                    <td>
                                        �û���</td>
                                        <td>ǩԼ����</td>
                                         <td>����</td>
                                    <td>
                                        <asp:HyperLink ID="hlinkOrderby" runat="server" NavigateUrl="?orderby=balance&type=asc" CssClass="rptheadlink">���<i class="fa fa-sort-amount-asc"></i></asp:HyperLink>
                                    </td>
                                    <td>
                                        ʵ����֤</td>
                                    <td>
                                        �ֻ���֤</td>
                                    <td>
                                        �ʼ���֤</td>

                                    <td>
                                        ע��ʱ��</td>
                                    <td>
                                        ��ϵ��</td>

                                    <td>
                                        ״̬</td>

                                    <td>����</td>

                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr height="30" class="childCheck">

                                <td>
                                   <input id="chkItem" type="checkbox"  value='<%#Eval("userid")%>' name="chkItem" />
                                </td>
                                    <td>
                                        <%# Eval("userid")%>
                                    </td>

                                    <td>
                                        <a style="color: #dd4b39" href="javascript:showInfo('<%# Eval("userid")%>')">
                                            <strong>
                                            <%#Eval("UserName")%>
                                            </strong>
                                        </a>
                                    </td>
                                     <td>
                                     <%#OriginalStudio.BLL.User.UserFactory.GetClassViewName(Eval("classid"))%>
                                     </td>
                                       <td>
                                        <asp:Label ID="lblUserType" runat="server"></asp:Label>
                                                                         </td>
                                    <td>
                                        <%# Eval("balance")%>
                                    </td>
                                    <td>
                                        <%#getpassview(Eval("IsRealName"))%>
                                    </td>
                                     <td>
                                        <%#getpassview(Eval("IsPhone"))%>
                                    </td>
                                     <td>
                                        <%#getpassview(Eval("IsEmail"))%>
                                    </td>

                                    <td>
                                        <%# Eval("addtime","{0:yyyy-MM-dd HH:ss:mm}")%>
                                    </td>
                                    <td>
                                        <%# Eval("ContactName")%>
                                    </td>

                                    <td>
                                        <asp:Label ID="lblUserStat" runat="server"></asp:Label>
                                    </td>

                                    <td>


                                    <a class="button btn btn-xs btn-info" href="javascript:UserTypeLimit('<%# Eval("userid")%>')">ͨ���޶�</a>
                                    <a class="button btn btn-xs btn-info" href="javascript:UserBindIp('<%# Eval("userid")%>')">IP</a>
                                    <a class="button btn btn-xs btn-info" href="javascript:UserPayRate('<%# Eval("userid")%>')">����</a>
                                    <a class="button btn btn-xs btn-info" href="javascript:UserBankCard('<%# Eval("userid")%>')">���п�</a>
                                    <a class="button btn btn-xs btn-info" href="javascript:tongDao('<%# Eval("userid")%>')">����ͨ��</a>
                                    <%--<a class="button btn btn-xs btn-info" href="javascript:sendMsg(<%# Eval("userid") %>);">����Ϣ</a>--%>
                                     </td>
                                    </td>
										
                                    </td>                                    

                                </tr>
                            </ItemTemplate>

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

function btn_Msg(id) {
    var uid ="";
    $(".childCheck input[type='checkbox']").each(function() {
        if (this.checked){
            uid += $(this).val()+","
        }
    });
    if (uid.length>1){
        uid=uid.substring(0,uid.length-1);
    }else {
        return false
    }
//    uid=(uid.slice(uid.length-1)==',')?uid.slice(0,-1):uid;
//
//    if (uid.length<1){
//    return false;
//    }

     layer.ready(function(){
          //�Զ�ҳ
          layer.open({
              type: 2,
              title: '�ڲ���Ϣ',
              skin: 'layui-layer-rim', //���ϱ߿�
              //closeBtn: 0, //����ʾ�رհ�ť
              area: ['67%', '90%'], //���
              content:"SendMsg.aspx?uid="+uid

          });
      });
}

function userIdImg(id) {
     layer.ready(function(){
          //�Զ�ҳ
          layer.open({
              type: 2,
              title: '֤�����',
              skin: 'layui-layer-rim', //���ϱ߿�
              //closeBtn: 0, //����ʾ�رհ�ť
              area: ['67%', '90%'], //���
              content:"UserIdImgList.aspx"

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
     layer.ready(function(){
          //�Զ�ҳ
          layer.open({
              type: 2,
              title: '�û���Ϣ',
              skin: 'layui-layer-rim', //���ϱ߿�
              //closeBtn: 0, //����ʾ�رհ�ť
              area: ['67%', '90%'], //���
              content:" UserAdd.aspx?id=" + id,
          });
      });
}

//===============//=====================//


//ͨ���޶�
function UserTypeLimit(id) {
     layer.ready(function(){
          //�Զ�ҳ
          layer.open({
              type: 2,
              title: 'ͨ���޶�',
              skin: 'layui-layer-rim', //���ϱ߿�
              area: ['67%', '90%'], //���
              content:" UserTypeLimit.aspx?id=" + id,
          });
      });
}

//��IP
function UserBindIp(id) {
     layer.ready(function(){
          //�Զ�ҳ
          layer.open({
              type: 2,
              title: 'IP��',
              skin: 'layui-layer-rim', //���ϱ߿�
              //closeBtn: 0, //����ʾ�رհ�ť
              area: ['67%', '90%'], //���
              content:" UserBindIp.aspx?id=" + id,
          });
      });
}

//����
function UserPayRate(id) {
     layer.ready(function(){
          //�Զ�ҳ
          layer.open({
              type: 2,
              title: '������������',
              skin: 'layui-layer-rim', //���ϱ߿�
              //closeBtn: 0, //����ʾ�رհ�ť
              area: ['67%', '90%'], //���
              content:" UserPayRate.aspx?id=" + id,
          });
      });
}
//���п�
function UserBankCard(id) {
     layer.ready(function(){
          //�Զ�ҳ
          layer.open({
              type: 2,
              title: '���п�',
              skin: 'layui-layer-rim', //���ϱ߿�
              //closeBtn: 0, //����ʾ�رհ�ť
              area: ['67%', '90%'], //���
              content:" UserBankCard.aspx?id=" + id,
          });
      });
}
</script>