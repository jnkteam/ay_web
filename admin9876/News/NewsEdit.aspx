<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="NewsEdit.aspx.cs" Inherits="OriginalStudio.WebUI.Manage.News.NewsEdit"
    ValidateRequest="false" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>




<style type="text/css">
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
.td1 {padding-right:3px;padding-left:3px;color:#999999;padding-bottom:0px;padding-top:5px;height:25px;}
.td2 {padding-right:3px;padding-left:8px;padding-top:5px; color: #333;background: #e8eaee;text-align:right;}
#rblrunmode{border:0 !important;}
#rblRelease{border:0 !important;}
#rblrunmode td{border:0 !important;}
#rblRelease td{border:0 !important;}
#tab th {text-align: center;}
#tab td {text-align: center;}
.form-control{}
.min-width{width: 200px !important;}
.mycenter{text-align: center !important;}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        新闻管理
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
    <asp:HiddenField ID="hfcontent" runat="server" />
    <table width="100%" border="0" cellspacing="1" cellpadding="3">

        <tr>
            <td>
                <table style="border: 1px;" cellpadding="0" cellspacing="0" class="table01" class="table table-bordered table-hover dataTable">
                    <tr>
                        <td align="right" class="td2">
                            标题
                        </td>
                        <td align="left" class="td1">
                         <div class="input-group">
                            <asp:TextBox ID="txtTitle" class="form-control" runat="server" ></asp:TextBox>
                            </div>
                            <div class="input-group">
                             <asp:CheckBox ID="cb_red" class="form-control clean" runat="server" Text="加红" Visible="false">
                            </asp:CheckBox>
                            </div>
                            <div class="input-group">
                            <asp:CheckBox ID="cb_bold" class="form-control clean" runat="server" Text="加粗" ></asp:CheckBox>
                            </div>
                             <div class="input-group">
                            <asp:CheckBox ID="cb_top" runat="server" class="form-control clean" Text="置顶" ></asp:CheckBox>
                            </div>
                             <div class="input-group">
                            <asp:CheckBox ID="cb_pop" runat="server" class="form-control clean" Text="弹出" ></asp:CheckBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"  class="td2">
                            标题颜色
                        </td>
                        <td align="left" class="td1">
                         <div class="input-group">
                            <asp:RadioButtonList ID="rbColor" class="form-control clean" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="FF0000">&lt;span style=&quot; color:#FF0000&quot;&gt;#FF0000&lt;/span&gt;</asp:ListItem>
                                <asp:ListItem Value="990000">&lt;span style=&quot; color:#990000&quot;&gt;#990000&lt;/span&gt;</asp:ListItem>
                                <asp:ListItem Value="FF0066">&lt;span style=&quot; color:#FF0066&quot;&gt;#FF0066&lt;/span&gt;</asp:ListItem>
                                <asp:ListItem Value="FF3300">&lt;span style=&quot; color:#FF3300&quot;&gt;#FF3300&lt;/span&gt;</asp:ListItem>
                            </asp:RadioButtonList>
                            </div>
                             <div class="input-group">
                                                    <div class="input-group-btn">
                                                    <button type="button" class="btn btn-primary">颜色代码</button>
                                                    </div>
                            <asp:TextBox ID="txtColorCode" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"  class="td2">
                            类型
                        </td>
                        <td align="left" class="td1">
                        <div class="input-group">
                            <asp:DropDownList class="form-control" ID="ddl_type" runat="server" Width="93px">
                            </asp:DropDownList>
                        </div>    &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="right"  class="td2">
                            内容
                        </td>
                        <td align="left" class="td1">




                            <textarea id="myEditor"  onblur="moveVal()" rows="10" cols="60">
                                                                        <%=newscontent%>
                                                </textarea>

                        </td>
                    </tr>
                    <tr>
                        <td align="right"  class="td2">
                            添加日期
                        </td>
                        <td align="left" class="td1">
                         <div class="input-group date">
                                                       <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;</div>
                            <input id="txtDate" class="form-control" runat="server" readonly="readonly" type="text" />
                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"  class="td2">
                            是否发布
                        </td>
                        <td align="left" class="td1">
                        <div class="input-group ">
                            <asp:RadioButtonList ID="rbl_Release" class="form-control clean" runat="server" RepeatDirection="Horizontal"
                                RepeatLayout="Flow">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" >
                        </td>
                        <td align="left" >
                            <asp:Button ID="BtnSubmit" Class="button btn  btn-danger" runat="server" Text="提  交" OnClick="BtnSubmit_Click" OnClientClick="return getContent();" />

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

<!-- CK Editor -->
<script src="<%=ADMIN_URI%>/style/admin/bower_components/ckeditor/ckeditor.js"></script>

<script>
  $(function () {

    var editor = CKEDITOR.replace('myEditor');


    editor.on( 'change', function( event ) {
        var data = this.getData();//内容
        $("#hfcontent").val(data);
    });



  });

</script>