<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.ManageRoles" Codebehind="ManageRoles.aspx.cs" EnableEventValidation="false"%>
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
        角色设置
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
    <div>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" id="table_zyads" style="width: 100%;
            height: 100%; border: #c9ddf0 1px solid; background-color: White;">
            <tr>
                <td align="center" colspan="2" >
                    <div class="input-group ">

                     <a Class="button btn  btn-danger"  href="javascript:add()"  >新增</a>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center">






                     <asp:GridView ID="GridView" cssClass="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                            ForeColor="#333333" GridLines="None" Width="100%" CellSpacing="1" AllowPaging="True">
                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="ID" />
                                                <asp:BoundField DataField="title" HeaderText="角色" />
                                                <asp:BoundField DataField="module" HeaderText="所属模块" />
                                                <asp:BoundField DataField="description" HeaderText="描述" />
                                                <asp:BoundField HtmlEncode="false" DataField="statusStr" HeaderText="状态" />

                                                <asp:TemplateField HeaderText="操作">
                                                    <ItemTemplate>
                                                        <a class="button btn btn-xs  btn-info" href="javascript:menu(<%# Eval("ID")%>)"  class="cvlink">菜单授权</a>
                                                        <a class="button btn btn-xs  btn-info" href="javascript:rules(<%# Eval("ID")%>)"  class="cvlink">访问授权</a>
                                                        <a class="button btn btn-xs  btn-info" href="javascript:edit(<%# Eval("ID")%>)"  class="cvlink">编辑</a>

                                                        <asp:Button ID="delete" runat="server" class="button btn btn-xs  btn-danger" Text="删除 " CommandName="del" CommandArgument='<%#Eval("id")%>'  oncommand="BtnDelete_Click"> </asp:Button>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                           <FooterStyle BackColor="#e8eaee" Font-Bold="True" ForeColor="White" />
                                                                                                                                           <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                                                                                           <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                                                           <HeaderStyle BackColor="#e8eaee" Font-Bold="True"  />
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
                  content: "ManageRolesEdit.aspx",
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
                        content: "ManageRolesEdit.aspx?id="+id,
                    });
                });
            }


        function menu(id) {
               //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
                       layer.ready(function(){
                           //自定页
                           layer.open({
                               type: 2,
                               title: '菜单授权',
                               skin: 'layui-layer-rim', //加上边框
                               //closeBtn: 0, //不显示关闭按钮
                               area: ['67%', '90%'], //宽高
                               content: "ManageRolesMenu.aspx?id="+id,
                           });
                       });
                   }
         function rules(id) {
                //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
                        layer.ready(function(){
                            //自定页
                            layer.open({
                                type: 2,
                                title: '访问授权',
                                skin: 'layui-layer-rim', //加上边框
                                //closeBtn: 0, //不显示关闭按钮
                                area: ['67%', '90%'], //宽高
                                content: "ManageRolesRules.aspx?id="+id,
                            });
                        });
                    }
</script>