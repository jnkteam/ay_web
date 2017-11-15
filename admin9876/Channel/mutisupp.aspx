<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.channel.mutisupp"
    CodeBehind="mutisupp.aspx.cs" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" >
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

    <!-- Bootstrap 3.3.7 -->
       <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
       <!-- Theme style -->
       <link rel="stylesheet" href="<%=ADMIN_URI%>/style/admin/dist/css/AdminLTE.min.css">
    <style type="text/css">
        .rptheadlink
        {
            color: White;
            font-family: 宋体;
            font-size: 12px;
        }

        .style4
        {
            height: 24px;
        }
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


        td {height:20px; line-height:20px; padding:0px; vertical-align:middle !important; text-align: center;}
    </style>

    <script src="../../js/common.js" type="text/javascript"></script>

    <script src="../../js/ControlDate/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript">
        $().ready(function() {
            $("#chkAll").click(function() {
                $("input[type='checkbox']").each(function() {
                    if ($("#chkAll").attr('checked') == true) {
                        $(this).attr("checked", true);
                    }
                    else
                        $(this).attr("checked", false);
                });
            });
        })
        function isselect() {
            var result = false;
            $("input[type='checkbox']").each(function() {
                if ($(this).attr("id") != "chkAll") {
                    if ($(this).attr('checked') == true) {
                        result = true;
                    }
                }
            });
            return result;
        }
        function check() {
            if (!isselect()) {
                alert('至少选择一条记录');
                return false;
            }
            return true;
        }
        function checkAll() {
            if ($("#txtPassWord").val() == "") {
                alert('请输入二级密码');
                return false;
            }
            return true;
        }
        function sendMsg(uid) {
            window.showModelessDialog("SendMsg.aspx?uid=" + uid, window, "dialogWidth=800px;dialogHeight=500px;");
        }
    
    </script>

    <script type="text/javascript">
        function sendInfo(id) {
            window.open("../User/UserEdit.aspx?id=" + id, "查看用户信息", "'height=700, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=n o, status=no");
        }
    </script>

</head>
<body class="yui-skin-sam">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellspacing="1" cellpadding="1" class="table1" class="table table-bordered">

        <tr><td>&nbsp;</td></tr>
        <tr>

            <td style="text-align: left !important;">

                <div class="input-group">
                <div class="input-group-btn">
                                        <button type="button" class="btn  btn-primary">通道类型</button>
                                        </div>
                <asp:TextBox ID="txttypename" class="form-control" readonly runat="server" Width="200px"></asp:TextBox>
                </div>



                <asp:HiddenField ID="hftypeid" runat="server" />
            </td>
        </tr>
         <tr><td>&nbsp;</td></tr>

        <tr>
            <td align="center" colspan="2">
                <table width="100%" id="tab" border="0" align="center" cellpadding="2" cellspacing="1" Class="table table-bordered table-hover dataTable">
                    <asp:Repeater ID="rptsupp" runat="server" OnItemCommand="rptsupp_ItemCommand" OnItemDataBound="rptsupp_ItemDataBound">
                        <HeaderTemplate>
                            <tr style="background-color: #E8EAEE; height: 30px;">
                                <td>
                                    <input id="chkAll" type="checkbox">
                                </td>
                                <td>
                                    通道商代码
                                </td>
                                <td>
                                    通道商名称
                                </td>
                                <td>
                                    显示名称
                                </td>
                                <td>
                                    费率
                                </td>
                                <td>
                                    默认通道
                                </td>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr >
                                <asp:HiddenField ID="hfsuppid" runat="server" Value='<%# Eval("code")%>' />
                                <td>
                                    <input id="chkItem" type="checkbox" runat="server"  name="chkItem" />
                                </td>
                                <td>
                                    <%# Eval("code")%>
                                </td>
                                <td>
                                    <%# Eval("name")%>
                                </td>
                                <td>
                                    <%# Eval("name1", "{0:f2}")%>
                                </td>
                                <td>
                                <div class="input-group">
                                    <asp:TextBox ID="txtpayrate" class="form-control"  runat="server" Width="80px" Text='<%# Eval("payrate","{0:f2}")%>'></asp:TextBox>%
                                    </div>
                                </td>
                                 <td>
                                    <input id="chkisdefault" type="checkbox" runat="server"  name="chkisdefault" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr >
                                 <asp:HiddenField ID="hfsuppid" runat="server" Value='<%# Eval("code")%>' />
                                <td>
                                    <input id="chkItem" type="checkbox" runat="server"  name="chkItem" />
                                </td>
                                <td>
                                    <%# Eval("code")%>
                                </td>
                                <td>
                                    <%# Eval("name")%>
                                </td>
                                <td>
                                    <%# Eval("name1", "{0:f2}")%>
                                </td>
                                <td>
                                <div class="input-group">
                                    <asp:TextBox ID="txtpayrate" class="form-control" runat="server" Width="80px" Text='<%# Eval("payrate","{0:f2}")%>'></asp:TextBox>%
                                    </div>
                                </td>
                                 <td>
                                    <input id="chkisdefault" type="checkbox" runat="server"  name="chkisdefault" />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </table>
            </td>
        </tr>




         <tr>

                    <td>
                        <asp:Button ID="btnsave" class="button btn  btn-danger" runat="server" Text="保存设置" OnClick="btnsave_Click" />
                    </td>
                </tr>

    </table>
    </form>



</body>
</html>
