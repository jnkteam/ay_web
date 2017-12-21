<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.UserSupplier" Codebehind="UserSupplier.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>
<style>
#GVChannel tr th{text-align: center;}
#GVChannel tr td{vertical-align:middle;}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        独立通道账号
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="Form1" runat="server">
        <table width="100%" border="0" cellpadding="1" cellspacing="1" id="table_zyads" class="table table-bordered">

            <tr>
            <td>
             <div class="input-group">
               <asp:DropDownList class="form-control" ID="UserID" runat="server"  >
                </asp:DropDownList>
                </div>
                 <div class="input-group">
                               <asp:DropDownList class="form-control" ID="SupplierCode" runat="server" >
                                </asp:DropDownList>
                                </div>
                 <div class="input-group">
                <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text="查询" OnClick="btnSearch_Click" />
                </div>
                 <div class="input-group">


                <a Class="button btn  btn-danger"  href="javascript:add()">新增</a>
                </div>
            </td>
            </tr>
            <tr>             
                <td align="center">
                    <asp:GridView ID="GVChannel" runat="server" AutoGenerateColumns="False" cssClass="table table-bordered table-hover dataTable" CellPadding="4"
                        ForeColor="#333333" GridLines="None" Width="100%" CellSpacing="1" 
                        OnRowDataBound="GVChannel_RowDataBound" onrowcommand="GVChannel_RowCommand">
                        <Columns>    
							<asp:BoundField DataField="ID" HeaderText="ID">
                                <ControlStyle Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="merchantname" HeaderText="商户名">
                                <ControlStyle Width="5%" />
                            </asp:BoundField>
                              <asp:BoundField DataField="suppliername" HeaderText="通道名">
                                  <ControlStyle Width="5%" />
                              </asp:BoundField>
                            <asp:BoundField DataField="puserid" HeaderText="账号">
                                <ControlStyle Width="5%" />
                            </asp:BoundField>

                             <asp:BoundField DataField="pusername" HeaderText="用户名">
                                                            <ControlStyle Width="5%" />
                                                        </asp:BoundField>

                             <asp:BoundField DataField="puserparm1" HeaderText="参数1">
                             <ControlStyle Width="5%" />
                             </asp:BoundField>
                            <asp:BoundField DataField="puserparm2" HeaderText="参数2">
                                                                                                                                                                            <ControlStyle Width="5%" />
                            </asp:BoundField>




                            <asp:TemplateField>
                             <HeaderTemplate>
                             是否启用
                             </HeaderTemplate>
                             <ItemTemplate>
                             <asp:Literal ID="lissingle" runat="server"></asp:Literal>
                             </ItemTemplate>
                             </asp:TemplateField>

                             <asp:TemplateField>
                                                         <HeaderTemplate>
                                                         是否跳转
                                                         </HeaderTemplate>
                                                         <ItemTemplate>
                                                         <asp:Literal ID="listransfer" runat="server"></asp:Literal>
                                                         </ItemTemplate>
                                                         </asp:TemplateField>

                            <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    <input type="button" value="设 置" class="button btn btn-xs  btn-info" onclick="javascript:setting('<%#Eval("id")%>')" />
                                    <asp:Button ID="btnDel" class="button btn btn-xs  btn-info" runat="server" Text="删除" CommandName="del" CommandArgument='<%#Eval("id")%>' OnClientClick="javascript:return confirm('您确认要删除吗？');" />
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
                  content: "UserSupplierEdit.aspx",
              });
          });
      }
      function setting(id) {
        //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
                layer.ready(function(){
                    //自定页
                    layer.open({
                        type: 2,
                        title: '设置',
                        skin: 'layui-layer-rim', //加上边框
                        //closeBtn: 0, //不显示关闭按钮
                        area: ['67%', '90%'], //宽高
                        content: "UserSupplierEdit.aspx?id="+id,
                    });
                });
            }
</script>