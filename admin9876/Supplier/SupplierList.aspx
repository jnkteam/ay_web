<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Supplier.SupplierList" Codebehind="SupplierList.aspx.cs" %>

<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>
<style>
#GVSupplier tr th{text-align: center;}
#GVSupplier tr td{vertical-align:middle;}
</style>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        通道商列表
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="Form1" runat="server">    
        <table width="100%" border="0" cellpadding="1" cellspacing="1" id="table_zyads" style="width: 100%;height: 100%; border: #c9ddf0 1px solid; background-color: White;" class="table table-bordered">
            <tr></tr>
            <tr>
                <td>
                <div class="input-group">


                 <a Class="button btn  btn-danger" href="javascript:add()">新增</a>
                </div>
                 </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:GridView ID="GVSupplier" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" Width="100%" cssClass="table table-bordered table-hover dataTable" CellSpacing="1">
                        <Columns>
                            <asp:BoundField DataField="SupplierCode" HeaderText="代号">
                                <ControlStyle Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SupplierName" HeaderText="名称">
                                <ControlStyle Width="8%" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="purl" HeaderText="网址">--%>
                                <%--<ControlStyle Width="8%" />--%>
                            <%--</asp:BoundField>--%>
                             <%--<asp:TemplateField>--%>
                                <%--<HeaderTemplate>--%>
                                    <%--Logo--%>
                                <%--</HeaderTemplate>--%>
                                <%--<ItemTemplate>--%>
                                     <%--<a href="<%# Eval("purl") %>" target="_blank"><img src="../style/images/paykeylogo/<%# Eval("logourl") %>" width="120" height="60" style="border: 1px dotted #DADADA" alt="" />--%>
                                     <%--</a>--%>
                                <%--</ItemTemplate>--%>
                            <%--</asp:TemplateField>--%>
                            <asp:BoundField DataField="SpDesc" HeaderText="说明">
                                <ControlStyle Width="20%" />
                            </asp:BoundField>                           
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a class="button btn btn-xs  btn-info" href="javascript:fee('<%# Eval("SupplierCode") %>','<%#Eval("SupplierName")%>')"  class="cvlink">费率</a>
                                    <a class="button btn btn-xs  btn-info" href="javascript:edit('<%# Eval("ID") %>')"  class="cvlink">编辑</a>
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
                  content: "SupplierEdit.aspx",
              });
          });





      }
      function fee(code,name) {

        console.info(code)
        //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
                layer.ready(function(){
                    //自定页
                    layer.open({
                        type: 2,
                        title: '费率',
                        skin: 'layui-layer-rim', //加上边框
                        //closeBtn: 0, //不显示关闭按钮
                        area: ['67%', '90%'], //宽高
                        content: "SupplierPayrate.aspx?supid="+code+"&n="+name,
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
                   content: "SupplierEdit.aspx?cmd=edit&ID="+id,
               });
           });





}
</script>