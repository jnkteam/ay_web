<%@ Page Language="C#" AutoEventWireup="True" validateRequest="false" Inherits="OriginalStudio.WebUI.Manage.User.PayRateEdit" Codebehind="PayRateEdit.aspx.cs" %>


<!DOCTYPE html>
<html>
<head>
    <title>费率</title>

 <!-- Bootstrap 3.3.7 -->
   <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
   <!-- Theme style -->
   <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/dist/css/AdminLTE.min.css">

   <style type="text/css">
   table
            {
                width: 100%;
                max-width: 100%;
                margin-bottom: 20px;
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

input[type="radio"] {margin-left: 10px;}
td {height:20px; line-height:20px; font-size:12px;padding:0px; vertical-align:middle !important;}
.td_title,th {height:20px;line-height:22px;font-weight:bold;border:0px solid #fff;text-align:left;}
.td1 {padding-right:3px;padding-left:3px;color:#999999;padding-bottom:0px;padding-top:5px;height:25px;}
.td2 {padding-right:3px;padding-left:8px;padding-top:5px; color: #333;background: #e8eaee;font-size:12px;text-align:right;}
.input-group{float: left; margin-left: 7px;}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hideValue" runat="server"  />
            <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered table-hover dataTable">





            <tr height="30">
                <td colspan="10" >
                <div class="input-group">
                						 <div class="input-group-btn">
                                                                <button type="button" class="btn btn-primary">费率组</button>
                                                                </div>
                						<asp:TextBox ID="ratename" required  class="form-control" runat="server" ></asp:TextBox>
                					</div>
                <div class="input-group">
                     费率类型：
                    <asp:RadioButtonList  style="padding:5px;" ID="rbl_type" runat="server" RepeatDirection="Horizontal"
                        RepeatLayout="Flow">
                        <asp:ListItem Value="1" >平台</asp:ListItem>
                        <asp:ListItem Value="3" Selected="True">会员</asp:ListItem>
                        <asp:ListItem Value="4">代理</asp:ListItem>
                    </asp:RadioButtonList>(不可修改)
                </div>
                </td>
            </tr>

               	 <tr>
                                        <td align="center">


                                         <div>
                                                	<table class="table table-bordered table-hover dataTable" cellspacing="1" cellpadding="4" id="GridView" style="color:#333333;width:100%;">
                                                		 <asp:Repeater ID="PayRateRepeater" EnableViewState="false" runat="server" >
                                                                                        <HeaderTemplate>
                                                                                        <tr height="30"  style="background: #e8eaee">

                                                                                            <td>
                                                                                                通道类型代码
                                                                                            </td>
                                                                                         <td >名称</td>
                                                                                         <td width="20%">费率</td>




                                                                                        </tr>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                    <input type="hidden" value="<%# Eval("typeid")%>" class="typeids"/>
                                                                                        <tr height="30">


                                                                                            <td>
                                                                                                <%# Eval("TypeCode")%>
                                                                                             </td>
                                                                                            <td>

                                                                                               <%# Eval("typename")%>
                                                                                            </td>
                                                                                             <td>

                                                                                                <div class="input-group" style="padding: 10px;">
                                                                                                <input style="width: 108px !important;" type="text" value="<%#Eval("rateValue")%>" class="form-control rateInput" required  id="rate_<%# Eval("typeid")%>" />%

                                                                                                                                                      </div>
                                                                                             </td>

                                                                                        </tr>
                                                                                    </ItemTemplate>

                                                                                </asp:Repeater>
                                                    <tr>
                                                                <td colspan="4" style="height: 30px">
                                                                    <div align="center">
                                                                        <asp:Button OnClick="btnSave_Click" style="height:35px"  ID="btnAdd" Class="button btn  btn-danger"  runat="server" Text="提 交"  OnClientClick="javascript:beforeSubmit();"></asp:Button>

                                                                    </div>
                                                                </td>
                                                            </tr>
                                                	</table>
                                                </div>






                                             <div>

                        </div>




                                        </td>
                                    </tr>










            </table>
        </div>
    </form>
</body>
</html>
<script src="<%=ADMIN_URI%>/style/admin/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
function beforeSubmit() {

        var xml = '';
        xml += "<PayRate>";
        $('.typeids').each(function(){
            var thisFloat = parseFloat($('#rate_'+$(this).val()).val())/100.00;
            thisFloat = thisFloat.toFixed(4)
            xml+= "<ChannelType ID=\""+$(this).val()+"\" Rate=\""+thisFloat+"\"/>";
        });
        xml += "</PayRate>";



        $("#hideValue").val(xml);
        }


</script>