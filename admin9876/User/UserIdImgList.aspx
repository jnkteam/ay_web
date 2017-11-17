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
        证件审核
        <small>第三方支付平台</small>
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
                    <asp:ListItem Value="">—审核状态—</asp:ListItem>
                    <asp:ListItem Value="1">待审核</asp:ListItem>
                    <asp:ListItem Value="2">已审核</asp:ListItem>
                    <asp:ListItem Value="4">审核失败</asp:ListItem>
                </asp:DropDownList>
                </div>

                <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">用户ID</button></div>
                       <asp:TextBox ID="txtUserId" class="form-control" runat="server" EnableViewState="false"></asp:TextBox>
                    </div>


                <div class="input-group">
                    <div class="input-group-btn">
                       <button type="button" class="btn btn-primary">用户名</button></div>
                <asp:TextBox ID="txtUserName" class="form-control" runat="server" EnableViewState="false"></asp:TextBox></div>

                <div class="input-group date">
                <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;开始</div>
                <asp:TextBox ID="StimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox></div>
                <div class="input-group date">

                <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;截止</div>
                <asp:TextBox ID="EtimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox></div>

                <div class="input-group">
                <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btnSearch_Click">
                </asp:Button>
                </div>

                <div class="input-group">
                <asp:Button ID="btnDelete" runat="server" CssClass="button btn  btn-danger" Text=" 删 除" OnClientClick="return Del_Confirm();"
                    OnClick="btnDelete_Click"></asp:Button>
                </div>

                <div class="input-group">
                <asp:Button ID="btnCashTo" runat="server" CssClass="button btn  btn-danger" Text="审 核" OnClientClick="return GetMoney_Confirm();"
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
                                    商户ID
                                </td>
                                <td>
                                    用户名
                                </td>
                                <td>
                                    真实名
                                </td>
                                <td>
                                    证件号码
                                </td>
                                <td>
                                    提交时间
                                </td>
                                <td>
                                    正面
                                </td>
                                <td>
                                    反面
                                </td>
                                <td>
                                    审核状态
                                </td>
                                <td>
                                    审核时间
                                </td>
                                <td>
                                    说 明
                                </td>
                                <td>
                                    审核人
                                </td>
                                <td>
                                    审 核
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
//    window.open("../User/UserEdit.aspx?id=" + id, "查看用户信息", "Width=800px;Height=350px;");
     layer.ready(function(){
          //自定页
          layer.open({
              type: 2,
              title: '用户信息',
              skin: 'layui-layer-rim', //加上边框
              //closeBtn: 0, //不显示关闭按钮
              area: ['67%', '90%'], //宽高
              content:" ../User/UserEdit.aspx?id=" + id,
          });
      });
}

</script>
