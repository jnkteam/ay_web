<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.ChannelTypeList" Codebehind="ChannelTypeList.aspx.cs" %>
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
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        通道类型
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="Form1" runat="server">
        <table width="100%" border="0" cellpadding="1" cellspacing="1" id="table_zyads" class="table table-bordered">

            <tr>
                <td align="center">
                    <asp:GridView ID="GVChannel" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" Width="100%" cssClass="table table-bordered table-hover dataTable" CellSpacing="1" OnRowDataBound="GVChannel_RowDataBound">
                        <Columns>    
                            <asp:BoundField DataField="typeId" HeaderText="代码">
                                <ControlStyle Width="8%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="modetypename" HeaderText="名称">
                                <ControlStyle Width="8%" />
                            </asp:BoundField>    
                             <asp:BoundField DataField="code" HeaderText="英文代码">
                                <ControlStyle Width="8%" />
                            </asp:BoundField>                   
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    类 型
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="ltType" runat="server"></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField> 
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    接口模式
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="ltrunmode" runat="server"></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>                          
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    开启状态
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="litOpen" runat="server"></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    前台显示
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:RadioButtonList ID="rblrelease" runat="server" RepeatDirection="horizontal">
                                        <asp:ListItem Value="True">显示</asp:ListItem>
                                        <asp:ListItem Value="False">关闭</asp:ListItem>
                                    </asp:RadioButtonList>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:BoundField DataField="Name" HeaderText="当前接口商">                               
                            </asp:BoundField>
                             <asp:TemplateField>
                                <HeaderTemplate>
                                    平台费率
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Eval("supprate","{0:p2}")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <input type="button" class="button btn btn-xs  btn-info" value="设 置" onclick="javascript:setting('<%#Eval("id")%>')" />
                                    <input type="button" class="button btn btn-xs  btn-info" value="销卡设置" onclick="javascript:deleteCard('<%#Eval("id")%>')" />
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
                  content: "ChannelTypeEdit.aspx?id="+id,
              });
          });





      }
      function deleteCard(id) {


        //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
                layer.ready(function(){
                    //自定页
                    layer.open({
                        type: 2,
                        title: '销卡设置',
                        skin: 'layui-layer-rim', //加上边框
                        //closeBtn: 0, //不显示关闭按钮
                        area: ['67%', '90%'], //宽高
                        content: "mutisupp.aspx?id="+id,
                    });
                });





 }

 </script>