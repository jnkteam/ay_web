<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Order.usersOrderIncomes"
    CodeBehind="usersOrderIncomes.aspx.cs" %>
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
        商户各通道收益比例分析
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">

    <form id="form1" runat="server">
    <table border="0" cellspacing="1" cellpadding="0" style="width: 100%">
        <tr>
            <td colspan="3">
                <div class="input-group">
                    <div class="input-group-btn">
                    <button type="button" class="btn btn-primary">商户ID</button>
                    </div>
                    <asp:TextBox ID="txtuserid" class="form-control" runat="server" Width="65px"></asp:TextBox>
                </div>
                <div class="input-group">
                <asp:DropDownList class="form-control" ID="ddlChannelType" runat="server" Width="95px">
                    <asp:ListItem Value="">--支付类型--</asp:ListItem>
                    <asp:ListItem Value="102">网上银行</asp:ListItem>
                    <asp:ListItem Value="101">支付宝</asp:ListItem>
                    <asp:ListItem Value="100">财富通</asp:ListItem>
                    <asp:ListItem Value="103">神州行充值卡</asp:ListItem>
                    <asp:ListItem Value="104">盛大一卡通</asp:ListItem>
                    <asp:ListItem Value="105">征途支付卡</asp:ListItem>
                    <asp:ListItem Value="106">骏网一卡通</asp:ListItem>
                    <asp:ListItem Value="107">腾讯Q币卡</asp:ListItem>
                    <asp:ListItem Value="108">联通充值卡</asp:ListItem>
                    <asp:ListItem Value="109">久游一卡通</asp:ListItem>
                    <asp:ListItem Value="110">网易一卡通</asp:ListItem>
                    <asp:ListItem Value="111">完美一卡通</asp:ListItem>
                    <asp:ListItem Value="112">搜狐一卡通</asp:ListItem>
                    <asp:ListItem Value="113">电信充值卡</asp:ListItem>
                    <asp:ListItem Value="114">声讯卡</asp:ListItem>
                    <asp:ListItem Value="115">光宇一卡通</asp:ListItem>
                    <asp:ListItem Value="116">金山一卡通</asp:ListItem>
                    <asp:ListItem Value="117">魔兽卡</asp:ListItem>
                    <asp:ListItem Value="118">5173卡</asp:ListItem>
                    <asp:ListItem Value="119">热血卡</asp:ListItem>
                </asp:DropDownList>
                </div>

                <div class="input-group date">
                <div class="input-group-addon"> <i></i>&nbsp;面值从：</div>
                <asp:TextBox ID="txtvaluefrom" class="form-control" runat="server" Width="65px"></asp:TextBox>
                <div class="input-group-addon"> <i></i>&nbsp;至</div>
                <asp:TextBox ID="txtvalueto" class="form-control" runat="server" Width="65px"></asp:TextBox>
                </div>

                <div class="input-group date">
                <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;开始</div>
                <asp:TextBox ID="StimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox>
                </div>
                <div class="input-group date">
                <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;截止</div>
                <asp:TextBox ID="EtimeBox" class="form-control" runat="server" Width="65px"></asp:TextBox>
                </div>

                <div class="input-group">
                <asp:Button ID="btn_Search" runat="server" CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btn_Search_Click">
                </asp:Button>
                </div>
            </td>
        </tr>


        <tr>
            <td bgcolor="#ffffff">
                <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered">
                <tr>
                    <td align="center">
                        <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                    <tr height="30"  style="background: #e8eaee">
                        <td>
                            日期
                        </td>
                        <td>
                            商户名(#ID)
                        </td>
                        <td>
                            真实姓名
                        </td>
                        <td>
                            充值类别
                        </td>
                        <td>
                            面值
                        </td>
                        <td>
                            结算比例
                        </td>
                        <td>
                            总条数
                        </td>
                        <td>
                            总金额
                        </td>
                    </tr>
                    <asp:Repeater ID="gv_data" runat="server">
                        <ItemTemplate>
                            <tr height="30">
                                <td>
                                    <%#Eval("mydate")%>
                                </td>
                                <td>
                                    <%#Eval("Username")%>
                                </td>
                                <td>
                                    <%#Eval("full_name")%>
                                </td>
                                <td>
                                    <%#Eval("modetypename")%>
                                </td>
                                <td>
                                    <%#Eval("faceValue")%>
                                </td>
                                <td>
                                    <%#Eval("payrate","{0:p2}")%>
                                </td>
                                <td>
                                    <%#Eval("s_num")%>
                                </td>
                                <td>
                                    <%#Eval("sumpay")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr>
                                <td>
                                    <%#Eval("mydate")%>
                                </td>
                                <td>
                                    <%#Eval("Username")%>
                                </td>
                                <td>
                                    <%#Eval("full_name")%>
                                </td>
                                <td>
                                    <%#Eval("modetypename")%>
                                </td>
                                <td>
                                    <%#Eval("faceValue")%>
                                </td>
                                <td>
                                    <%#Eval("payrate","{0:p2}")%>
                                </td>
                                <td>
                                    <%#Eval("s_num")%>
                                </td>
                                <td>
                                    <%#Eval("sumpay")%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                   <!---------------------pager------------------>
                   <!-- #include file="../Pager.aspx" -->
                   <!---------------------pager------------------>
                </table>
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
            <script>
              $(function () {



                 $("#StimeBox").jeDate({

                        format: "YYYY-MM-DD hh:mm:ss",

                    });
                 $("#EtimeBox").jeDate({

                             format: "YYYY-MM-DD hh:mm:ss",

                         });



              });
    var table = document.getElementById("table_zyads");
    if (table) {
        for (i = 0; i < table.rows.length; i++) {
            if (i % 2 == 0) {
                table.rows[i].bgColor = "ffffff";
            } else { table.rows[i].bgColor = "f3f9fe" }
        }
    }
    var mytr = document.getElementById("table2").getElementsByTagName("tr");
    for (var i = 1; i < mytr.length; i++) {
        mytr[i].onmouseover = function() {
            var rows = this.childNodes.length;
            for (var row = 0; row < rows; row++) {
                this.childNodes[row].style.backgroundColor = '#B2D3FF';
            }
        };
        mytr[i].onmouseout = function() {
            var rows = this.childNodes.length;
            for (var row = 0; row < rows; row++) {
                this.childNodes[row].style.backgroundColor = '';
            }
        };
    }
</script>

