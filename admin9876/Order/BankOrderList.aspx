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

    <!--<form id="form1" runat="server">-->
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="table1">

        <tr>
            <td>
                <table>
                    <tr  height="30" >
                        <td colspan="2">
                            <div class="input-group">
                            <div class="input-group-btn">
                            <button type="button" class="btn btn-primary">商户号</button>
                            </div>
                            <asp:TextBox ID="txtuserid" class="form-control" runat="server"></asp:TextBox>



                            </div>


                            <div class="input-group">
                             <%--  代理ID：
                                            <asp:TextBox ID="txtpromid" runat="server" Width="30px"></asp:TextBox>--%>
                                                        <asp:DropDownList ID="ddlChannelType" class="form-control" runat="server" >
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
                            <!--<asp:Button ID="btn_Search" runat="server"  CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btn_Search_Click"></asp:Button>-->
                            <button Class="button btn  btn-danger" id="search" onclick="search(1)" >查询</button>
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

                                        <tr height="30"  style="background: #e8eaee" >
                                            <td>
                                                商户号
                                            </td>
                                            <td>
                                                订单号
                                            </td>
                                            <td>
                                                订单类型
                                            </td>


                                            <td>
                                                通道类型
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


                                            <td id="rptOrders_ctl00_th_profits">
                                                利润
                                            </td>
                                            <td>
                                                下单时间
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
                                            <td id="rptOrders_ctl00_th_supplier">
                                                接口商
                                            </td>

                                            <td>
                                                服务器
                                            </td>
                                            <td>
                                                操作
                                            </td>
                                        </tr>
                                        <tbody id="data"></tbody>



                            </table>

                        </td>
                    </tr>
                    <style>
                                         #Pager1{
                                             margin-top: 7px;
                                         }
                                         #Pager1_input{


                                             height: 34px;
                                             padding: 6px 12px;
                                             font-size: 14px;
                                             line-height: 1.42857143;
                                             color: #555;
                                             background-color: #fff;
                                             background-image: none;
                                             border: 1px solid #ccc;
                                             border-radius: 4px;
                                             -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                                             box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                                             -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                                             -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                                             transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                                         }
                                         #Pager1 a{

                                                       padding: 6px 12px;
                                                         height: 34px;
                                                       line-height: 1.42857143;
                                                       color: #333;
                                                       text-decoration: none;
                                                       background-color: #fff;
                                                       border: 1px solid #ddd;}

                                         </style>
                    <tbody id="pager">

                    <!---------------------pager------------------>

                    <!---------------------pager------------------>
                    </tbody>

                </table>
            </td>
        </tr>
    </table>
    <!--</form>-->

    </section>
    </div>


<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>

<script src="<%=ADMIN_URI%>/style/admin/layer/layer.js"></script>
<script src="<%=ADMIN_URI%>/style/admin/bank_order_list.js"></script>
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