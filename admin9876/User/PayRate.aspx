<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.PayRate" Codebehind="PayRate.aspx.cs" %>
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
        费率设置
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">

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
                            <tbody style="background: #E8EAEE">

                            <td>费率组</td>
                            <td>费率类型</td>

                            <asp:Repeater ID="channelTypeNameRep" runat="server">
                                <ItemTemplate>
                                  <td><%# Eval("typename")%></td>
                                </ItemTemplate>
                            </asp:Repeater>
                            <td>操作</td>
                            </tbody>
                            <tbody>
                                <asp:Repeater ID="repRate" runat="server" onitemdatabound="repRate_ItemDataBound">
                                    <ItemTemplate>
                                        <tr  >
                                            <td><%# Eval("ratename") %></td>
                                            <td> <asp:Label ID="ratetypename" runat="server"></asp:Label></td>

                                <asp:Repeater ID="channelType" runat="server"><ItemTemplate>
                                <td><%#Container.DataItem%>%</td>
                                </ItemTemplate></asp:Repeater>

                                <td> <a class="button btn btn-xs  btn-info" href="javascript:edit('<%# Eval("ID") %>')"  class="cvlink">编辑</a></td>
                                        </tr>
                                    </ItemTemplate>


                                </asp:Repeater>

                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
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