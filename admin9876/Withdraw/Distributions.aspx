<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.User.distribution.Distributions" Codebehind="Distributions.aspx.cs" %>

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
        接口付款记录
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
            <tr>
                <td>
                    <table>
                        <tr  height="30" >
                            <td colspan="2">
                                    <div class="input-group">
                                    <div class="input-group-btn">
                                    <button type="button" class="btn btn-primary">交易单号</button></div>
                                    <asp:TextBox ID="txttrade_no" class="form-control" runat="server"></asp:TextBox></div>

                                    <div class="input-group">
                                    <div class="input-group-btn">
                                    <button type="button" class="btn btn-primary">用户ID</button></div>
                                    <asp:TextBox ID="txtuserId" class="form-control" runat="server" Width="80px"></asp:TextBox></div>

                                    <div class="input-group">
                                    <div class="input-group-btn">
                                    <button type="button" class="btn btn-primary">开户银行</button></div>
                                    <select id="ddlbankName" class="form-control" runat="server">
                                        <option value="">--请选择--</option>
                                        <option value="0002">支付宝</option>
                                        <option value="0003">财付通</option>
                                        <option value="1002">中国工商银行</option>
                                        <option value="1005">中国农业银行</option>
                                        <option value="1003">中国建设银行</option>
                                        <option value="1026">中国银行</option>
                                        <option value="1001">招商银行</option>
                                        <option value="1006">民生银行</option>
                                        <option value="1020">交通银行</option>
                                        <option value="1025">华夏银行</option>
                                        <option value="1009">兴业银行</option>
                                        <option value="1027">广发银行</option>
                                        <option value="1004">浦发银行</option>
                                        <option value="1022">光大银行</option>
                                        <option value="1021">中信银行</option>
                                        <option value="1010">优奇支付银行</option>
                                        <option value="1066">中国邮政储蓄银行</option>
                                     </select>
                                     </div>

                                    <div class="input-group">
                                    <div class="input-group-btn">
                                    <button type="button" class="btn btn-primary">账号</button></div>
                        <asp:TextBox ID="txtbankAccount" class="form-control" runat="server"></asp:TextBox></div>
                        </td>
                        </tr>


                        <tr>
                        <td>
                             <div class="input-group date">
                                 <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;开始</div>
                             <asp:TextBox ID="StimeBox" runat="server" class="form-control" Width="65px"></asp:TextBox></div>

                             <div class="input-group date">
                                 <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;截止</div>
                            <asp:TextBox ID="EtimeBox" runat="server" class="form-control" Width="65px"></asp:TextBox></div>

                        <div class="input-group">
                        <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btnSearch_Click">
                        </asp:Button></div>
                        <div class="input-group">
                        <asp:Button ID="btnExport" runat="server" CssClass="button btn  btn-danger" Text="导出" OnClick="btnExport_Click"></asp:Button></div>

                        <div class="input-group">
                           <button type="button" class="btn btn-default">总付款金额：<% = total_amount%></button>
                        </div>
                        </td>
                        </tr>

                    </table>
                </td>
            </tr>

            <tr bgcolor="#ffffff">
                <td align="center">
                    <table width="100%" id="tab" border="0" align="center" cellpadding="2" cellspacing="1" class="table table-bordered">
                        <tr>
                            <td align="center">
                                <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                        <asp:Repeater ID="rptTrades"  runat="server" 
                            onitemcommand="rptTrades_ItemCommand" onitemdatabound="rptTrades_ItemDataBound">
                            <HeaderTemplate>
                                <tr style="background: #e8eaee">
                                    <td>
                                        <input id="chkAll" type="checkbox">
                                    </td>                                    
                                    <td>
                                        处理号</td>
                                    <td>
                                        结算序号</td>  
                                    <td>
                                        用户ID</td>
                                    <td>
                                        付款信息</td>                                   
                                    <td>
                                        金额 </td>
                                    <td>
                                        状态</td>
                                     <td>
                                        时间</td> 
                                     <td>
                                        接口商</td>                                   
                                     <td>
                                        接口流水号</td>
                                     <td>
                                        说明</td>
                                     <td>
                                         
                                    </td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <input id="chkItem" type="checkbox" runat="server" value='<%#Eval("id")%>' name="chkItem" />
                                    </td>
                                    <td>
                                        <%# Eval("trade_no")%>
                                    </td>
                                    <td>
                                         <%# Eval("settledId")%>
                                    </td>
                                    <td>
                                         <%# Eval("userid")%>
                                    </td>                                    
                                    <td>
                                        <%# KuaiCard.BLL.SettledFactory.GetSettleBankName(Eval("bankCode").ToString())%> <%# Eval("bankBranch")%> <br />
                                        <%# Eval("bankAccountName")%> <br />
                                        <%# Eval("bankAccount")%>
                                    </td>
                                    <td>
                                        <%# Eval("amount", "{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# KuaiCard.BLL.distribution.GetStatusText(Eval("status"))%>
                                    </td>
                                     <td>
                                        <%# Eval("processingTime", "{0:yyyy-MM-dd HH:mm:ss}")%>
                                    </td>
                                    <td>
                                        <%# KuaiCard.WebUI.WebUtility.GetsupplierName(Eval("suppid"))%>
                                    </td>                                     
                                    <td>
                                        <%# Eval("supp_trade_no")%>
                                    </td>                                    
                                    <td>
                                        <%# Eval("supp_message")%>
                                    </td>  
                                     <td>
                                        <asp:Button ID="btncancel" runat="server" Text="取消" class="button btn btn-xs  btn-info" CommandName="cancel" CommandArgument='<%# Eval("trade_no")%>' Visible="false" />
                                        <asp:Button ID="btnquery" runat="server" Text="重新查询" class="button btn btn-xs  btn-info" CommandName="query" CommandArgument='<%# Eval("trade_no")%>' />
                                        <asp:Button ID="btnReissue" runat="server" Text="补发" class="button btn btn-xs  btn-info" ToolTip="手动回发" CommandName="Reissue" CommandArgument='<%# Eval("id")%>' Visible="false" />
                                    </td>                                     
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr>
                                 <td>
                                        <input id="chkItem" type="checkbox" runat="server" value='<%#Eval("id")%>' name="chkItem" />
                                    </td>
                                    <td>
                                        <%# Eval("trade_no")%>
                                    </td>
                                    <td>
                                         <%# Eval("settledId")%>
                                    </td>
                                    <td>
                                         <%# Eval("userid")%>
                                    </td>                                    
                                    <td>
                                        <%# KuaiCard.BLL.SettledFactory.GetSettleBankName(Eval("bankCode").ToString())%> <%# Eval("bankBranch")%> <br />
                                        <%# Eval("bankAccountName")%> <br />
                                        <%# Eval("bankAccount")%>
                                    </td>
                                    <td>
                                        <%# Eval("amount", "{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# KuaiCard.BLL.distribution.GetStatusText(Eval("status"))%>
                                    </td>
                                     <td>
                                        <%# Eval("processingTime", "{0:yyyy-MM-dd HH:mm:ss}")%>
                                    </td>
                                    <td>
                                        <%# KuaiCard.WebUI.WebUtility.GetsupplierName(Eval("suppid"))%>
                                    </td>                                     
                                    <td>
                                        <%# Eval("supp_trade_no")%>
                                    </td>                                    
                                    <td>
                                        <%# Eval("supp_message")%>
                                    </td>  
                                    <td>
                                        <asp:Button ID="btncancel" runat="server" Text="取消" class="button btn btn-xs  btn-info" CommandName="cancel" CommandArgument='<%# Eval("trade_no")%>' Visible="false" />
                                        <asp:Button ID="btnquery" runat="server" Text="重新查询" class="button btn btn-xs  btn-info" CommandName="query" CommandArgument='<%# Eval("trade_no")%>' />
                                        <asp:Button ID="btnReissue" runat="server" Text="补发" class="button btn btn-xs  btn-info" ToolTip="手动回发" CommandName="Reissue" CommandArgument='<%# Eval("id")%>' Visible="false" />
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
    </form>
    </section>
    </div>


<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>
<script src="<%=ADMIN_URI%>/style/admin/layer/layer.js"></script>
<script type="text/javascript" >
    $(function () {
       $("#StimeBox").jeDate({
           format: "YYYY-MM-DD hh:mm:ss",
       });
       $("#EtimeBox").jeDate({
           format: "YYYY-MM-DD hh:mm:ss",
       });
    })
</script>
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

    </script>


<script type="text/javascript">
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
    })
    function sendMsg(uid){
        window.showModelessDialog("SendMsg.aspx?uid="+uid,window,"dialogWidth=800px;dialogHeight=500px;");
    }

    </script>
     <script type="text/javascript">
         function sendInfo(id) {
             window.open("../User/UserEdit.aspx?id=" + id, "查看用户信息", "'height=700, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=n o, status=no");
         }
</script>