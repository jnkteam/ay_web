<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Sys.CahceManage" Codebehind="CahceManage.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>

<style>

#cbl_cacheTypeList td{text-align: left;}
.my-center th{text-align: center !important;}
</style>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        网关缓存管理
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">

            <table border="0" cellspacing="1" cellpadding="0" style="width: 100%; height: 100%;" id="table_zyads" class="table table-bordered">

                <tr>
                    <td align="center">
                        <table style="border-right: #c9ddf0 1px solid; border-top: #c9ddf0 1px solid; border-left: #c9ddf0 1px solid;
                            border-bottom: #c9ddf0 1px solid" cellspacing="0" cellpadding="0" width="100%"
                            bgcolor="#f3f9fe" border="0" class="table table-bordered table-hover dataTable">
                            <tr>
                                <td>

                                        <tr>
                                            <td height="30" style="font-size: 14px;">
                                             <div class="input-group">
                                                本地缓存总量：<asp:Label ID="CacheCountLabel" runat="server" Text="没有缓存"></asp:Label>
                                                </div>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            <div class="input-group">
                                                <asp:Button ID="btnDelAll" CssClass="button btn  btn-danger" runat="server" Text="清空全部缓存"
                                                    OnClick="btnDelAll_Click" />
                                                    </div>
                                                    </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            <div class="input-group">
                                                <asp:Label ID="Label1" runat="server" ForeColor="Red">系统依托缓存来提高运行效率。请勿随便清空缓存！</asp:Label>
                                                </div>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            <div class="input-group">

                                                <asp:CheckBoxList  ID="cbl_cacheTypeList" runat="server" Width="100%">

                                                    <asp:ListItem  Value="CHANNELS">支付通道</asp:ListItem>
                                                    <asp:ListItem Value="CHANNEL_TYPE">支付通道类别</asp:ListItem>
                                                    <asp:ListItem Value="CHANNEL_TYPE_USER_">用户支付通道设置</asp:ListItem>
                                                    <asp:ListItem Value="NEWS">新闻</asp:ListItem>
                                                    <asp:ListItem Value="SUPPLIER_">接口商</asp:ListItem>
                                                    <asp:ListItem Value="SUPPPAYRATE">供应商费率</asp:ListItem>
                                                    <asp:ListItem Value="USER_">用户缓存</asp:ListItem>
                                                    <asp:ListItem Value="USERHOST_">用户来路网站列表</asp:ListItem>
                                                    <asp:ListItem Value="Question">安全问题列表</asp:ListItem>
                                                    <asp:ListItem Value="WEBINFO_">网站设置</asp:ListItem>
                                                    <asp:ListItem Value="SYSCONFIG">配置信息</asp:ListItem>
                                                </asp:CheckBoxList>
                                            </div>
                                            <div style="clear: both"></div>
                                                <div class="input-group">
                                                <asp:Button ID="btnBigClass" CssClass="button btn  btn-danger"  runat="server" Text="清除所选类别缓存"
                                                    onclick="btnBigClass_Click" />
                                                    </div>
                                            </td>
                                        </tr>
                                        <tr><td>MemCached缓存</td></tr>
                                        <tr>

                                        <td>
                                            <asp:GridView class="table table-bordered table-hover dataTable my-center" ID="gv_cache" runat="server" AutoGenerateColumns="False" Width="100%" DataKeyNames="cacheKey">
                                                <Columns>
                                                     <asp:TemplateField>
                                                     <ItemTemplate>
                                                            <asp:CheckBox ID="item" runat="server" />
                                                     </ItemTemplate>
                                                     </asp:TemplateField>
                                                      <asp:BoundField HeaderText="缓存类别" DataField="cacheType" />
                                                      <asp:BoundField HeaderText="类别名称" DataField="cacheTypeName" />
                                                    <asp:BoundField HeaderText="缓存Key" DataField="cacheKey" />                                                                                                   
                                                </Columns>
                                            </asp:GridView>
                                            <asp:Button ID="btnClear" runat="server" CssClass="button btn  btn-danger" Text="按小类清除"
                                                onclick="btnClear_Click"  />
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