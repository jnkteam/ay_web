<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Order.BankOrderList" Codebehind="BankOrderList.aspx.cs" EnableEventValidation="true" %>
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
        网银订单
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
                    <tr  height="30" >
                        <td colspan="2">
                            <div class="input-group">
                            <div class="input-group-btn">
                            <button type="button" class="btn btn-primary">商户ID</button>
                            </div>
                            <asp:TextBox ID="txtuserid" class="form-control" runat="server"></asp:TextBox>



                            </div>


                            <div class="input-group">
                             <%--  代理ID：
                                            <asp:TextBox ID="txtpromid" runat="server" Width="30px"></asp:TextBox>--%>
                                                        <asp:DropDownList ID="ddlChannelType" class="form-control" runat="server" >
                                                            <asp:ListItem Value="">--通道类型--</asp:ListItem>
                                                            <asp:ListItem Value="102">网上银行</asp:ListItem>
                                                            <asp:ListItem Value="101">支付宝</asp:ListItem>
                                                            <asp:ListItem Value="100">财富通</asp:ListItem>
                                                            <asp:ListItem Value="99">微信</asp:ListItem>
                              </asp:DropDownList>
                            </div>

                             <div class="input-group">
                                <asp:DropDownList ID="ddlsupp" class="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <div class="input-group">
                            <asp:DropDownList ID="ddlOrderStatus" class="form-control" runat="server" Width="95px">
                                <asp:ListItem>--订单状态--</asp:ListItem>
                                <asp:ListItem Value="1">处理中</asp:ListItem>
                                <asp:ListItem Value="2">已成功</asp:ListItem>
                                <asp:ListItem Value="4">失败</asp:ListItem>
                                <asp:ListItem Value="8">扣量</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                            <div class="input-group">
                            <asp:DropDownList ID="ddlNotifyStatus" class="form-control" runat="server" Width="95px">
                                <asp:ListItem>--下发状态--</asp:ListItem>
                                <asp:ListItem Value="1">处理中</asp:ListItem>
                                <asp:ListItem Value="2">已成功</asp:ListItem>
                                <asp:ListItem Value="4">失败</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                            <div class="input-group">
                            <asp:DropDownList ID="ddlmange" class="form-control" runat="server"></asp:DropDownList>
                            </div>





                        </td>
                    </tr>
                     <tr  height="30" >
                            <td>
                            <div class="input-group date">
                             <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;开始</div>
                                <asp:TextBox ID="StimeBox"  class="form-control"  runat="server" Width="65px"></asp:TextBox>
                            </div>

                             <div class="input-group date">
                               <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;截止</div>
                            <asp:TextBox ID="EtimeBox" runat="server" class="form-control" Width="65px"></asp:TextBox>
                            </div>
                            <div class="input-group">
                            <asp:Button ID="btn_Search" runat="server" CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btn_Search_Click"></asp:Button>
                            </div>
                             <div class="input-group">
                            <asp:Button ID="btnExport" runat="server" CssClass="button btn  btn-danger" Text="导出"
                            OnClick="btnExport_Click"></asp:Button>
                            </div>
                            </td>
                    </tr>
                    <tr  height="30" >
                        <td>
                        <div class="input-group">
                        <div class="input-group-btn">
                        <button type="button" class="btn btn-primary">订单号</button>
                        </div>
                            <asp:TextBox ID="txtOrderId" runat="server" class="form-control" ></asp:TextBox>
                        </div>
                        <div class="input-group">
                        <div class="input-group-btn">
                        <button type="button" class="btn  btn-primary">商户订单号</button>
                        </div>
                            <asp:TextBox ID="txtUserOrder" runat="server" class="form-control" ></asp:TextBox>
                        </div>
                        <div class="input-group">
                        <div class="input-group-btn">
                        <button type="button" class="btn btn-primary">接口商订单号</button>
                        </div>
                            <asp:TextBox ID="txtSuppOrder" runat="server" class="form-control"></asp:TextBox>
                        </div>






                        </td>

                        <td align="left" bgcolor="">
                        <div class="btn-group">
                                              <button type="button" class="btn btn-default">总额：<% = TotalTranATM %></button>
                                              <button type="button" class="btn btn-default">商户所得：<% = TotalUserATM %></button>
                                              <button type="button" class="btn btn-default">业务总提成：<% = TotalCommission %></button>
                                              <button type="button" class="btn btn-default">平台利润：<% = TotalProfit%></button>
                                            </div>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#ffffff">
                <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered">
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                                <asp:Repeater ID="rptOrders" runat="server" OnItemCommand="rptOrders_ItemCommand"
                                    OnItemDataBound="rptOrders_ItemDataBound">
                                    <HeaderTemplate>
                                        <tr height="30"  style="background: #e8eaee" >
                                            <td>
                                                商户ID
                                            </td>
                                            <td>
                                                接口
                                            </td>
                                            <td>
                                                订单类型
                                            </td>


                                            <td>
                                                通道类型
                                            </td>
                                            <td>
                                                银行
                                            </td>
                                            <td>
                                                金额
                                            </td>
                                            <td>
                                                商户
                                            </td>
                                            <td>
                                                平台
                                            </td>
                                            <td>
                                                代理
                                            </td>
                                            <td>
                                                业务
                                            </td>
                                            <td id="th_profits" runat="server">
                                                利润
                                            </td>
                                            <td>
                                                到帐时间
                                            </td>
                                            <td>
                                                状态
                                            </td>
                                            <td>
                                                下发状态
                                            </td>
                                            <td id="th_supplier" runat="server">
                                                接口商
                                            </td>
                                            <td>
                                                服务器
                                            </td>
                                            <td>
                                                操作
                                            </td>
                                        </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr height="30"  ondblclick="javascript:sendInfo('<%# Eval("id")%>')">
                                            <td>
                                                <a href="?action=userpay&userid=<%# Eval("userid") %>&status=2">
                                                    <%# Eval("userid")%>
                                                </a>
                                            </td>
                                            <td>
                                                <%# Eval("version")%>
                                            </td>
                                            <td>
                                                <%#Enum.GetName(typeof(OriginalStudio.Model.Order.OrderTypeEnum),Eval("ordertype"))%>
                                            </td>


                                            <td>
                                                <%# Eval("modetypename")%>
                                            </td>
                                            <td>
                                                <%# Eval("modeName")%>
                                            </td>
                                            <td>
                                                <%# Eval("refervalue", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("payAmt", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("supplierAmt", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("promAmt", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("commission", "{0:f2}")%>
                                            </td>
                                            <td id="tr_profits" runat="server">
                                                <%# Eval("profits", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("completetime", "{0:yyyy-MM-dd HH:mm:ss}")%>
                                            </td>
                                            <td>
                                                <%# getStatusStyle(Eval("status").ToString()) %>

                                            </td>
                                            <td>
                                                <%# getNotifystatStatusStyle(Eval("notifystat").ToString()) %>

                                            </td>
                                            <td id="tr_supplier" runat="server">
                                                <%# OriginalStudio.WebUI.WebUtility.GetsupplierName(Eval("supplierId"))%>
                                            </td>
                                            <td>
                                                <%# Eval("server")%>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnReissue" class="button btn btn-xs  btn-info" runat="server" Text="补发" ToolTip="手动回发" CommandName="Reissue" CommandArgument='<%# Eval("orderid")%>' />
                                                <asp:Button ID="btnRest" class="button btn btn-xs  btn-info" runat="server" Text="补单" CommandName="ResetOrder" CommandArgument='<%#GetParm(Eval("orderid"),Eval("supplierId"),Eval("refervalue"))%>' />
                                                <asp:Button ID="btnDeduct" class="button btn btn-xs  btn-info" runat="server" Text="扣"  ToolTip="扣量" CommandName="Deduct" CommandArgument='<%# Eval("orderid")%>' />
                                                <asp:Button ID="btnReDeduct" class="button btn btn-xs  btn-info" runat="server" Text="还"  CommandName="ReDeduct" CommandArgument='<%# Eval("orderid")%>' />
												&nbsp;<a title="打印" alt="打印" style="font-size:15px; color:#00c0ef"  href="BankOrderPrint.aspx?ID=<%# Eval("ID") %>" target="_blank" ><i class="fa fa-print"></i></a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr height="30" ondblclick="javascript:sendInfo('<%# Eval("id")%>')">
                                            <td>
                                                <a href="?action=userpay&userid=<%# Eval("userid") %>&status=2">
                                                    <%# Eval("userid")%>
                                                </a>
                                            </td>
                                            <td>
                                                <%# Eval("version")%>
                                            </td>
                                             <td>
                                                <%#Enum.GetName(typeof(OriginalStudio.Model.Order.OrderTypeEnum),Eval("ordertype"))%>
                                            </td>


                                            <td>
                                                <%# Eval("modetypename")%>
                                            </td>
                                            <td>
                                                <%# Eval("modeName")%>
                                            </td>
                                            <td>
                                                <%# Eval("refervalue", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("payAmt", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("supplierAmt", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("promAmt", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("commission", "{0:f2}")%>
                                            </td>
                                            <td id="tr_profits" runat="server">
                                                <%# Eval("profits", "{0:f2}")%>
                                            </td>
                                            <td>
                                                <%# Eval("completetime", "{0:yyyy-MM-dd HH:mm:ss}")%>
                                            </td>
                                            <td>
                                                <%# getStatusStyle(Eval("status").ToString()) %>
                                            </td>
                                            <td>
                                               <%# getNotifystatStatusStyle(Eval("notifystat").ToString()) %>
                                            </td>
                                            <td id="tr_supplier" runat="server">
                                                <%# OriginalStudio.WebUI.WebUtility.GetsupplierName(Eval("supplierId"))%>
                                            </td>
                                            <td>
                                                <%# Eval("server")%>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnReissue" runat="server" class="button btn btn-xs  btn-info" Text="补发" ToolTip="手动回发" CommandName="Reissue" CommandArgument='<%# Eval("orderid")%>' />
                                                <asp:Button ID="btnRest" runat="server" class="button btn btn-xs  btn-info" Text="补单" CommandName="ResetOrder" CommandArgument='<%#GetParm(Eval("orderid"),Eval("supplierId"),Eval("refervalue"))%>' />
                                                <asp:Button ID="btnDeduct" runat="server" class="button btn btn-xs  btn-info" Text="扣" ToolTip="扣量" CommandName="Deduct" CommandArgument='<%# Eval("orderid")%>' />
                                                <asp:Button ID="btnReDeduct" runat="server" class="button btn btn-xs  btn-info" Text="还" ToolTip="订单归还" CommandName="ReDeduct" CommandArgument='<%# Eval("orderid")%>' />
												&nbsp;<a title="打印" alt="打印" style="font-size:15px; color:#00c0ef" href="BankOrderPrint.aspx?ID=<%# Eval("ID") %>" target="_blank" ><i class="fa fa-print"></i></a>
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
<script>
  $(function () {



     $("#StimeBox").jeDate({

            format: "YYYY-MM-DD hh:mm:ss",

        });
     $("#EtimeBox").jeDate({

                 format: "YYYY-MM-DD hh:mm:ss",

             });



  })


  function sendInfo(id) {


  //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
          layer.ready(function(){
              //自定页
              layer.open({
                  type: 2,
                  title: '网银订单',
                  skin: 'layui-layer-rim', //加上边框
                  //closeBtn: 0, //不显示关闭按钮
                  area: ['67%', '90%'], //宽高
                  content: "./BankOrderShow.aspx?id="+id,
              });
          });





      }
</script>