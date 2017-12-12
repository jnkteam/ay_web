<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Channel.ChannelTypeEdit" Codebehind="ChannelTypeEdit.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>新建编辑供应商</title>


 <!-- Bootstrap 3.3.7 -->
   <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
   <!-- Theme style -->
   <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/dist/css/AdminLTE.min.css">
    <script type="text/javascript">
function backreturn(){
    location.href='ChannelTypeList.aspx';
}
    </script>
    
    <script type="text/javascript">
        $().ready(function() {
            statechange();

            $("input[name='rblrunmode']").click(function() {
                statechange();
            });
        })

        function statechange() {
            var runmode = $("input[name='rblrunmode']:checked").val();
            if (runmode == "0") {
                $("#ddlSupplier").show();
                $("#cblSupplier").hide();
            }
            else if (runmode == "1") {
                $("#cblSupplier").show();
                $("#ddlSupplier").hide();
            }
        }  
function backreturn(){
    history.go(-1);
}
    </script>
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
                border-top: 1px solid #ddd;
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
#tab th {text-align: center}
#tab td {text-align: center}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered table-hover dataTable">
                <tr>
                    <td class="td2">
                        名称 ：</td>
                    <td class="td1">
                     <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtmodetypename" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        ID ：</td>
                    <td class="td1">
                        <asp:TextBox class="form-control"  ID="txttypeId" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        英文代码 ：</td>
                    <td class="td1">
                     <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtCode" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        通道类型 ：</td>
                    <td class="td1">
                        <asp:RadioButtonList ID="rblType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="1">网银</asp:ListItem>
                            <asp:ListItem Value="2">支付宝</asp:ListItem>
                            <asp:ListItem Value="3">微信</asp:ListItem>
                            <asp:ListItem Value="4">QQ</asp:ListItem>
                            <asp:ListItem Value="5">京东</asp:ListItem>

                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td class="td2">
                        开启状态 ：</td>
                    <td class="td1">
                     <div class="input-group">
                        <asp:DropDownList ID="ddlOpen" class="form-control" runat="server" >
                            <asp:ListItem Value="2">全部开启</asp:ListItem>                         
                            <asp:ListItem Value="1">全部关闭</asp:ListItem>                            
                            <asp:ListItem Value="8">按配置(默认开启)</asp:ListItem>
                            <asp:ListItem Value="4">按配置(默认关闭)</asp:ListItem>                            
                        </asp:DropDownList>
                        <div style="clear: both"></div>
                        <div>
                         <span style="color:Red"> 注意按配置 的意思是如果用户设置了通道的开关状态就按用户的设置的状态
                                                                    <br />如果没有 就看具体通道有没有设置通道状态 如果设置就按具体通道的状态
                                                                    <br />如果没有就默认为关闭 或才开启</span></div>
                        </div>
                       </td>
                </tr>
                <tr>
                    <td class="td2">
                        接口模式 ：</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:RadioButtonList  ID="rblrunmode" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" onselectedindexchanged="rblrunmode_SelectedIndexChanged">
                            <asp:ListItem Value="0" Selected="True">单独</asp:ListItem>
                            <asp:ListItem Value="1">轮询</asp:ListItem>
                        </asp:RadioButtonList>
                        </div>
                    </td>
                </tr>
                <tr id="tr_runmode_1" runat="server" visible="false">
                    <td class="td2">
                        轮询模式 ：</td>
                    <td class="td1">
                        <table width="100%" id="tab" border="0" align="center" cellpadding="2" cellspacing="1" class="table table-bordered table-hover dataTable">
                         <asp:Repeater ID="rptsupp" runat="server" OnItemCommand="rptsupp_ItemCommand" OnItemDataBound="rptsupp_ItemDataBound">
                        <HeaderTemplate>
                            <tr style="background-color: #E8EAEE;  height: 30;">
                                <td>
                                    <input id="chkAll" type="checkbox" value="是否参与">
                                </td>
                                <td>
                                    通道商代码
                                </td>
                                <td>
                                    通道商名称
                                </td>
                                <td>
                                    权重(1-9)
                                </td>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="childCheck">
                                <asp:HiddenField ID="hfsuppid" runat="server" Value='<%# Eval("SupplierCode")%>' />
                                <td>
                                    <input id="chkItem" type="checkbox" runat="server"  name="chkItem" />
                                </td>
                                <td>
                                    <%# Eval("SupplierCode")%>
                                </td>
                                <td>
                                    <%# Eval("SupplierName")%>
                                </td>
                                <td>
                                <div class="input-group">
                                    <asp:TextBox class="form-control"  ID="txtweight" runat="server" Width="80px" Text='<%# Eval("weight")%>'></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="childCheck">
                                <asp:HiddenField ID="hfsuppid" runat="server" Value='<%# Eval("SupplierCode")%>' />
                                <td>
                                    <input id="chkItem" type="checkbox" runat="server"  name="chkItem"/>
                                </td>
                                <td>
                                    <%# Eval("SupplierCode")%>
                                </td>
                                <td>
                                    <%# Eval("SupplierName")%>
                                </td>
                                <td>
                                <div class="input-group">
                                    <asp:TextBox class="form-control"  ID="txtweight" runat="server" Width="80px" Text='<%# Eval("weight")%>'></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>                       
                    </asp:Repeater>
                     </table>
                    </td>
                </tr>
                <tr id="tr_runmode_0" runat="server">
                    <td class="td2">
                        接口商 ：</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:DropDownList class="form-control" ID="ddlSupplier" runat="server"></asp:DropDownList>
                        </div>
                        <div class="input-group">
                        <asp:CheckBoxList ID="cblSupplier" runat="server" RepeatDirection="Horizontal" Visible="false">
                        </asp:CheckBoxList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        排序 ：</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:TextBox class="form-control"  ID="txtsort" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">
                        是否显示 ：</td>
                    <td class="td1">
                    <div class="input-group">
                        <asp:RadioButtonList ID="rblRelease" runat="server" RepeatDirection="horizontal">
                            <asp:ListItem Selected="true" Value="1">显示</asp:ListItem>
                            <asp:ListItem Value="0">不显示</asp:ListItem>
                        </asp:RadioButtonList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td2">                        
                    </td>
                    <td class="td1" style="text-align: center">
                        <asp:Button ID="btnSave" CssClass="button btn  btn-danger" runat="server" Text="保 存" OnClick="btnSave_Click"></asp:Button>

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
<script src="<%=ADMIN_URI%>/style/admin/bower_components/jquery/dist/jquery.min.js"></script>
<script>
    $(function() {
        var clickCheckAll = false;
        $("#chkAll").click(function() {
                        if (clickCheckAll) {
                            $(".childCheck input[type='checkbox']").each(function() {this.checked = false;});
                            clickCheckAll = false;
                        } else {
                            $(".childCheck input[type='checkbox']").each(function() {this.checked = true;});
                            clickCheckAll = true;
                        }

        });
    });
</script>