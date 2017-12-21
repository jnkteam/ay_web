<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.TocashScheme" Codebehind="TocashSchemes.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>

<style>

td{text-align: center}
th{text-align: center}
</style>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        提现方案
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
    <div>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" id="table_zyads" class="table table-bordered">
            <tr>
                <td align="left" colspan="2" style="text-align: left !important;">
                     <a class="button btn  btn-danger" href="javascript:add()">
                                   新增
                                </a>&nbsp;
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:GridView ID="GridView1" cssClass="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="False" CellPadding="4" OnRowDataBound="GVChannel_RowDataBound"
                        ForeColor="#333333" GridLines="None" Width="100%" CellSpacing="1" >
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField DataField="schemename" HeaderText="方案名称" />
                            <asp:BoundField DataField="bankdetentiondays" HeaderText="网银T+N" />

                            <asp:BoundField DataField="alipaydetentiondays" HeaderText="支付宝T+N" />
                            <asp:BoundField DataField="weixindetentiondays" HeaderText="微信T+N" />
                            <asp:BoundField DataField="otherdetentiondays" HeaderText="其它T+N" />
                            <asp:BoundField DataField="SingleMinAmtLimit" HeaderText="每笔最少提" />
                            <asp:BoundField DataField="SingleMaxAmtLimit" HeaderText="每笔最多提" />
                            <asp:BoundField DataField="dailymaxtimes" HeaderText="每天最多提次" />
                            <asp:BoundField DataField="dailymaxamt" HeaderText="每天限额" />

                            <asp:TemplateField HeaderText="结算通道" >
                            <ItemTemplate >
                              <asp:Literal ID="transupplierName" runat="server"></asp:Literal>
                             </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="默认">
                              <ItemTemplate>
                              <asp:Literal ID="isdefaultIcon" runat="server"></asp:Literal>
                              </ItemTemplate>

                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    <a  class="button btn btn-xs btn-info" href="javascript:edit('<%# Eval("ID")%>')">编辑</a>
                                    <a  class="button btn btn-xs btn-info" onclick="return confirm('确定要删除这个用户？')" href="?cmd=del&amp;ID=<%# Eval("ID") %>">删除</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#e8eaee" Font-Bold="True" ForeColor="White" />
                                                                                             <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                                             <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                             <HeaderStyle BackColor="#e8eaee" Font-Bold="True"  />
                                                                                             <EditRowStyle BackColor="#2461BF" />
                                                                                             <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>          
        </table>
    </div>
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
                  content: "TocashSchemeModi.aspx",
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
                        content: "TocashSchemeModi.aspx?cmd=edit&id="+id,
                    });
                });
            }
</script>