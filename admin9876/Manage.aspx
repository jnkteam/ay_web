<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Manage" Codebehind="Manage.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="./Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="./Left.aspx" -->
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


td {height:20px; line-height:20px; padding:0px; vertical-align:middle !important;}
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
.td1 {padding-right:3px;padding-left:3px;color: #333;padding-bottom:0px;padding-top:5px;height:25px; text-align: right; width: 20%; height: 48px;}
.td2 {padding-right:3px;padding-left:8px;padding-top:5px; color:#999999;text-align:right;}
.clean{border: 0 !important; background: #ecf0f5 !important; line-height: 1.8!important;;}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        人员设置
        <small>第三方支付平台</small>
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
                    <asp:GridView ID="GridView1" cssClass="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" Width="100%" CellSpacing="1" AllowPaging="True"
                        OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField DataField="UserName" HeaderText="用户名" />
                            <asp:BoundField DataField="RelName" HeaderText="姓名" />
                            <asp:BoundField DataField="qq" HeaderText="qq" />
                            <asp:BoundField DataField="tel" HeaderText="手机" />
                            <asp:BoundField DataField="LevelText" HeaderText="身份" />
                            <asp:BoundField DataField="Commissiontypeview" HeaderText="提成类型" />
                            <asp:BoundField DataField="Commission" HeaderText="网银提成" />
                            <asp:BoundField DataField="CardCommission" HeaderText="点卡提成" />
                            <asp:BoundField DataField="statusName" HeaderText="状态" />
                             <asp:BoundField DataField="Balance" HeaderText="余额" DataFormatString="{0:f2}"/>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a class="button btn btn-xs  btn-info" href="javascript:edit('<%# Eval("ID") %>')">编辑</a>
                                    <a class="button btn btn-xs  btn-info" onclick="return confirm('确定要删除这个用户？')" href="?cmd=del&amp;ID=<%# Eval("ID") %>">删除</a>
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
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%; display:none">
                        <tr align="center">
                            <td>
                                用户名
                            </td>
                            <td>
                                密码（不修改请留空）
                            </td>
                            <td>
                                二级密码（不修改请留空）
                            </td>
                            <td>
                                姓名
                            </td>
                            <td>
                                qq
                            </td>
                            <td>
                                电话
                            </td>
                            <td>
                                提成类型
                            </td>
                            <td>
                                网银提成
                            </td>
                             <td>
                                卡类提成
                            </td>
                            <td>
                                状态
                            </td>
                            <td>
                                身份
                            </td>
                            <td align="center">
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:TextBox ID="UserNameBox" runat="server"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="PassWordBox" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="SecPassWordBox" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="RelNameBox" runat="server"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="qq" runat="server"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="tel" runat="server"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="ddlCommissionType" runat="server">
                                    <asp:ListItem Value="1">按条固定提成</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="2">按支付金额%</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtCommission" runat="server">0</asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtCardCommission" runat="server">0</asp:TextBox>
                            </td>
                             <td align="center">
                                <asp:DropDownList ID="ddlStus" runat="server">
                                    <asp:ListItem Value="1">正常</asp:ListItem>
                                    <asp:ListItem Value="0">锁定</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="LevelList" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:Button ID="BtnUpdate" runat="server" CssClass="button" Text=" 保 存 " OnClick="BtnUpdate_Click">
                                </asp:Button>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</section>
    </div>


<!-----------------footer------------------>
 <!-- #include file="./Footer.aspx" -->
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
                  content: "ManageEdit.aspx",
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
                        content: "ManageEdit.aspx?cmd=edit&amp;ID="+id,
                    });
                });
            }
</script>