<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.OrderStat.OrderReport" Codebehind="OrderReport.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>




<style type="text/css">
#GridView1 th{text-align: center}
            table
            {
                width: 100%;
                max-width: 100%;

                border: 1px solid #f4f4f4;
                able-layout:fixed;
            }
            .table td{
                padding: 8px;
                line-height: 1.92857143 !important;
                vertical-align: top;

                font-size:14px;
                overflow: hidden;

                word-break: break-all; word-wrap:break-word;
            }

.table th{text-align: center}
td {height:20px; line-height:20px; padding:0px; vertical-align:middle !important;}
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
.td1 {padding-right:3px;padding-left:3px;color: #333;padding-bottom:0px;padding-top:5px;height:25px; text-align: right; width: 20%; height: 48px;}
.td2 {padding-right:3px;padding-left:8px;padding-top:5px; color:#999999;text-align:right;}
.clean{border: 0 !important; background: #ecf0f5 !important; line-height: 1.8!important;;}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>


    <section class="content-header">
      <h1>
        当日数据统计
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
    <table border="0" cellspacing="1" cellpadding="0" style="width: 100%">

        <tr>
            <td>
                <table>
                    <tr>
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
                            <asp:Button ID="btn_Search" runat="server" CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btn_Search_Click"></asp:Button></div>


                             <div class="btn-group">
                                                         <button type="button" class="btn btn-default">总额：<asp:Label ID="lbmoney" runat="server" Text="0"></asp:Label></button>
                                                          <button type="button" class="btn btn-default">
                                                        总支出：<asp:Label ID="lbchumoney" runat="server" Text="0"></asp:Label>
                                                        </button>
                                                    </div>
                        </td>
                    </tr>
                    <tr>
                        <td>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#fff">
                <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                    <tr height="22" style=" background: #e8eaee">
                        <td>
                            商户名
                        </td>
                        <td>
                            总金额
                        </td>
                        <td>
                            充值次数
                        </td>
                        <td>
                            商户所得
                        </td>                       
                    </tr>
                    <asp:Repeater ID="gv_data" runat="server">
                        <ItemTemplate>
                            <tr style="background-color: #fff">
                                <td>
                                    <%#Eval("UserName") %>
                                </td>
                                <td>
                                    <%#Eval("totalAmt")%>
                                </td>
                                <td>
                                    <%#Eval("fillcount")%>
                                </td>
                                <td>
                                    <%#Eval("payAmt")%>
                                </td>                                
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr style="background-color: #EBEBEB">
                                 <td>
                                    <%#Eval("UserName") %>
                                </td>
                                <td>
                                    <%#Eval("totalAmt")%>
                                </td>
                                <td>
                                    <%#Eval("fillcount")%>
                                </td>
                                <td>
                                    <%#Eval("payAmt")%>
                                </td>                             
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
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
<script>
  $(function () {



     $("#StimeBox").jeDate({

            format: "YYYY-MM-DD hh:mm:ss",

        });
     $("#EtimeBox").jeDate({

                 format: "YYYY-MM-DD hh:mm:ss",

             });





  })




</script>