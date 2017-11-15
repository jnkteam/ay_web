<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.PayRate" Codebehind="PayRate.aspx.cs" %>
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
        费率设置
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
        <div id="modelPanel" style="background: #F2F2F2">
        </div>
        <table width="100%" border="0" cellspacing="1" cellpadding="0" class="table table-bordered">
            <tr>
                <td align="left" style="text-align: left !important;" colspan="3" >

                    <input id="btnAdd" type="button" Class="button btn  btn-danger" value="新 增" onclick="add()" class="button"/></td>
            </tr>
        </table>
        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered">
            <tbody>
                <tr>
                    <td align="center">
                        <table width="99%" border="0" cellpadding="1" cellspacing="1" bgcolor="#cccccc" id="table2" class="table table-bordered table-hover dataTable">
                            <tbody>
                                <asp:Repeater ID="repRate" runat="server">
                                    <HeaderTemplate>
                                        <tr height="30"  style="background: #e8eaee" >
                                            <td>
                                                费率组</td>
                                                <td>
                                                微信扫码</td>
                                                <td>
                                                支付宝扫码</td>
                                            <td>
                                                财付通</td>
                                            <td>
                                                支付宝</td>
                                            <td>
                                                网银</td>
                                            <td>
                                                神州行</td>
                                            <td>
                                                浙江</td>
                                            <td>
                                                江苏</td>
                                            <td>
                                                辽宁</td>
                                             <td>
                                                福建</td>
                                            <td>
                                                盛大卡</td>
                                            <td>
                                                征途卡</td>
                                            <td>
                                                骏网卡</td>
                                            <td>
                                                Q币卡</td>
                                            <td>
                                                联通卡</td>
                                            <td>
                                                久游卡</td>
                                            <td>
                                                网易卡</td>
                                            <td>
                                                完美卡</td>
                                            <td>
                                                搜狐卡</td>
                                            <td>
                                                电信卡</td>
                                            <td>
                                                光宇卡</td>
                                            <td>
                                                金山</td>
                                            <td>
                                                纵游</td>
                                            <td>
                                                天下</td>
                                            <td>
                                                天宏</td>                                            
                                            <td>
                                                魔兽</td>
                                          <td>
                                                支付宝APP</td>
                                            <td>
                                                微信APP</td>
                                            <td>
                                                网银APP</td>

                                             <td>   类型</td>
                                            <td>
                                                操作</td>
                                        </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr >
                                            <td>
                                                <%# Eval("levName")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p98"))*100%>
                                                %</td>
                                                <td>
                                                <%# Convert.ToDouble(Eval("p99"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p100"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p101"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p102"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p103"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p200")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p201")) * 100%>
                                                %</td>
                                             <td>
                                                <%# Convert.ToDouble(Eval("p202")) * 100%>
                                                %</td>
                                              <td>
                                                <%# Convert.ToDouble(Eval("p203")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p104"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p105"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p106"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p107"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p108"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p109"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p110"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p111"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p112"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p113"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p115"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p116"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p117"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p118"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p119"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p118"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p980")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p990")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p1020"))*100%>
                                                %</td>
                                            <td>
                                                <%# Eval("usetypename")%>
                                            </td>
                                            <td>
                                                <a class="button btn btn-xs  btn-info" href="javascript:edit('<%# Eval("id") %>')" class='ljbg'>编辑</a></td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr >
                                          <td>
                                                <%# Eval("levName")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p98"))*100%>
                                                %</td>
                                                <td>
                                                <%# Convert.ToDouble(Eval("p99"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p100"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p101"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p102"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p103"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p200")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p201")) * 100%>
                                                %</td>
                                             <td>
                                                <%# Convert.ToDouble(Eval("p202")) * 100%>
                                                %</td>
                                              <td>
                                                <%# Convert.ToDouble(Eval("p203")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p104"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p105"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p106"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p107"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p108"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p109"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p110"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p111"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p112"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p113"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p115"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p116"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p117"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p118"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p119"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p118"))*100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p980")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p990")) * 100%>
                                                %</td>
                                            <td>
                                                <%# Convert.ToDouble(Eval("p1020"))*100%>
                                                %</td>
                                            <td>
                                                <%# Eval("usetypename")%>
                                            </td>
                                            <td>
                                                <a class="button btn btn-xs  btn-info" href="javascript:edit('<%# Eval("id") %>')" class='ljbg'>编辑</a></td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>
                                <tr bgcolor="#F0F6FC" height="30" align="center" style="display:none">
                                    <td>
                                        <asp:TextBox ID="txtlevName" runat="server" Width="50px"></asp:TextBox></td>
                                        <td>
                                        <asp:TextBox ID="txtp98" runat="server" Width="25px"></asp:TextBox>%</td>
                                        <td>
                                        <asp:TextBox ID="txtp99" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp100" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp101" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp102" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp103" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp104" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp105" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp106" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp107" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp108" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp109" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp110" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp111" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp112" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp113" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp115" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp116" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp117" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp118" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp980" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp990" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td>
                                        <asp:TextBox ID="txtp1020" runat="server" Width="25px"></asp:TextBox>%</td>
                                    <td colspan="2">
                                        <asp:Button ID="btn_save" runat="server" Text="保存" OnClick="btn_save_Click" />
                                        <a href="#" onclick="ymPrompt.win('ViewPrice.aspx?Pri_Type=<%# Eval("Pri_Type") %>',600,230,'用户信息',handler,null,null,{id:'a'})">
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>

        <script type="text/javascript">
            function handler(tp) {
            }
        </script>

    </form>

    </section>
       </div>


   <!-----------------footer------------------>
    <!-- #include file="../Footer.aspx" -->
   <!-----------------footer------------------>
<script src="<%=ADMIN_URI%>/style/admin/layer/layer.js"></script>
<script>
function add() {
  //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
          layer.ready(function(){
              //自定页
              layer.open({
                  type: 2,
                  title: '新增',
                  skin: 'layui-layer-rim', //加上边框
                  //closeBtn: 0, //不显示关闭按钮
                  area: ['67%', '90%'], //宽高
                  content: "PayRateEdit.aspx",
              });
          });
      }
      function edit(id) {
        //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
                layer.ready(function(){
                    //自定页
                    layer.open({
                        type: 2,
                        title: '编辑',
                        skin: 'layui-layer-rim', //加上边框
                        //closeBtn: 0, //不显示关闭按钮
                        area: ['67%', '90%'], //宽高
                        content: "PayRateEdit.aspx?id="+id,
                    });
                });
            }
</script>