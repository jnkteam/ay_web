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
        商户管理
        <small>第三方支付平台</small>
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
               新增商户
            </a>&nbsp;
             <a class="button btn  btn-danger" href="javascript:userIdImg()">
                           证件审核
                        </a>
        </div>

            <tr height="30" >
                <td>
                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">搜索</button>
                    </div>
                    <asp:DropDownList class="form-control" ID="StatusList" runat="server" EnableViewState="false">
                        <asp:ListItem Value="">—用户状态—</asp:ListItem>
                        <asp:ListItem Value="1">待审核</asp:ListItem>
                        <asp:ListItem Value="2">正常</asp:ListItem>
                        <asp:ListItem Value="4">锁定</asp:ListItem>
                    </asp:DropDownList>
                    </div>

                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">用户名</button>
                    </div>
                    <asp:TextBox ID="txtuserName" class="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">用户ID</button>
                    </div>
                    <asp:TextBox ID="txtuserId" class="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">代理ID</button>
                    </div>
                    <asp:TextBox ID="txtagent" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>

            <tr height="30" >
                <td>
                    <div class="input-group">
                        <asp:DropDownList ID="ddlisSpecialPayRate" class="form-control" runat="server">
                            <asp:ListItem Value="">—单独费率—</asp:ListItem>
                            <asp:ListItem Value="0">未启用</asp:ListItem>
                            <asp:ListItem Value="1">启用</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="input-group">
                        <asp:DropDownList ID="ddlpayrate" class="form-control" runat="server">
                            <asp:ListItem Value="">—费率比例—</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="input-group">
                        <asp:DropDownList ID="ddlSpecial" class="form-control" runat="server">
                            <asp:ListItem Value="">—独立通道—</asp:ListItem>
                            <asp:ListItem Value="1">已设置</asp:ListItem>
                            <asp:ListItem Value="0">未设置</asp:ListItem>
                        </asp:DropDownList>
                    </div>



                    <div class="input-group">
                    <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-primary" Text=" 查 询 " OnClick="btnSearch_Click"></asp:Button>
                    </div>

                    <div class="input-group">
                    <asp:Button ID="btnDelete" runat="server" CssClass="button btn  btn-primary" Text=" 删 除" onclick="btnDelete_Click"> </asp:Button>
                    </div>

                    <div class="input-group">
                    <asp:Button ID="btnCashTo" runat="server" CssClass="button btn  btn-primary" Text="提 现" OnClientClick="return GetMoney_Confirm();" Visible="false"></asp:Button>
                    </div>

                    <div class="input-group">
                    <asp:Button ID="btn_allgetmoney" runat="server" CssClass="button btn  btn-primary" Text="一键提现" Visible="false"></asp:Button>
                    </div>

                    <div class="input-group">

                    <asp:Button ID="btn_Msg" runat="server" CssClass="button btn  btn-primary" Text="内部消息" onclick="btn_Msg_Click"></asp:Button>
                    </div>

                    <div class="input-group">
                    <input type="button" class="button btn  btn-primary" value="设 置" onclick="setupwin();" Visible="false"/>
                    </div>

                    <div class="input-group">
                    <input type="button" class="button btn  btn-primary" value="发送手机短信" onclick="sentsmswin();" />
                    </div>

                </td>
            </tr>

            <tr height="30" >
                <td>
                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">QQ号码</button>
                    </div>
                    <asp:TextBox ID="txtQQ" class="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">手机</button>
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
                       <button type="button" class="btn btn-primary">姓名</button>
                    </div>
                    <asp:TextBox ID="txtfullname" class="form-control" runat="server"></asp:TextBox>
                    </div>
                   
                </td>
            </tr>
            <tr>


            <td align="left" bgcolor="" style="display: none">
                <div class="btn-group">
                  <button type="button" class="btn btn-default"> 已结算总额:<%=yzfmoney %></button>
                  <button type="button" class="btn btn-default">未结算总额:<%=wzfmoney %></button>
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
                                   商户ID</td>


                                    <td>
                                        用户名</td>
                                        <td>签约属性</td>
                                         <td>类型</td>
                                    <td>
                                        <asp:HyperLink ID="hlinkOrderby" runat="server" NavigateUrl="?orderby=balance&type=asc" CssClass="rptheadlink">余额<i class="fa fa-sort-amount-asc"></i></asp:HyperLink>
                                    </td>
                                    <td>
                                        实名认证</td>
                                    <td>
                                        手机认证</td>
                                    <td>
                                        邮件认证</td>

                                    <td>
                                        注册时间</td>
                                    <td>
                                        联系人</td>

                                    <td>
                                        状态</td>

                                    <td>操作</td>

                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr height="30">


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
                                    <a class="button btn btn-xs  btn-info" href="javascript:tongDao('<%# Eval("userid")%>')">
                                                                                通 道<%#isSpecialChannel(Eval("userid"))%>
                                                                            </a>

                                    <a class="button btn btn-xs  btn-info" href="UserPayRateEdit.aspx?ID=<%# Eval("userid")%>">费率</a>

                                      <asp:Label ID="labcmd" class="button btn btn-xs  btn-info"  runat="server"></asp:Label>
                                      <a class="button btn btn-xs  btn-info"  href="javascript:sendMsg(<%# Eval("userid") %>);">发信息</a>
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
        return confirm("确定要删除这些商户吗?");
    });
});

function sendMsg(uid){
    window.showModelessDialog("SendMsg.aspx?uid="+uid,window,"dialogWidth=800px;dialogHeight=500px;");
}


function userAdd(id) {
     layer.ready(function(){
          //自定页
          layer.open({
              type: 2,
              title: '新增用户',
              skin: 'layui-layer-rim', //加上边框
              //closeBtn: 0, //不显示关闭按钮
              area: ['67%', '90%'], //宽高
              content:"UserAdd.aspx"

          });
      });
}
function userIdImg(id) {
     layer.ready(function(){
          //自定页
          layer.open({
              type: 2,
              title: '证件审核',
              skin: 'layui-layer-rim', //加上边框
              //closeBtn: 0, //不显示关闭按钮
              area: ['67%', '90%'], //宽高
              content:"UserIdImgList.aspx"

          });
      });
}

function tongDao(id) {
     layer.ready(function(){
          //自定页
          layer.open({
              type: 2,
              title: '商户通道管理',
              skin: 'layui-layer-rim', //加上边框
              //closeBtn: 0, //不显示关闭按钮
              area: ['67%', '90%'], //宽高
              content:"UserChannel.aspx?id=" +id,

          });
      });
}



function showInfo(id) {
//    window.open("../User/UserEdit.aspx?id=" + id, "查看用户信息", "Width=800px;Height=350px;");
     layer.ready(function(){
          //自定页
          layer.open({
              type: 2,
              title: '用户信息',
              skin: 'layui-layer-rim', //加上边框
              //closeBtn: 0, //不显示关闭按钮
              area: ['67%', '90%'], //宽高
              content:" UserAdd.aspx?id=" + id,
          });
      });
}


</script>