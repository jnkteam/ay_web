<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="NewsEdit.aspx.cs" Inherits="KuaiCard.WebUI.Manage.News.NewsEdit"
    ValidateRequest="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../style/admin.css" type="text/css" rel="stylesheet" />
    <meta name="keywords" content="" />
    <meta name="description" content="">
    <title></title>

    <link href="Umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="Umeditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="Umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="Umeditor/umeditor.min.js"></script>
    <script type="text/javascript" src="Umeditor/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="hfcontent" runat="server" />
    <table width="100%" border="0" cellspacing="1" cellpadding="3">
        <tr>
            <td colspan="4" style="font-weight: bold; font-size: 14px; background: url(../style/images/topbg.gif) repeat-x;
                color: teal; height: 28px">
                新闻信息编辑
            </td>
        </tr>
        <tr>
            <td>
                <table style="border: 1px;" cellpadding="0" cellspacing="0" class="table01">
                    <tr>
                        <td align="center" style="width: 118px; height: 40px;">
                            标题：
                        </td>
                        <td align="left" style="width: 550px; height: 40px;">
                            <asp:TextBox ID="txtTitle" runat="server" Width="220px"></asp:TextBox>
                            <asp:CheckBox ID="cb_red" runat="server" Text="加红" CssClass="label" Visible="false">
                            </asp:CheckBox>
                            <asp:CheckBox ID="cb_bold" runat="server" Text="加粗" CssClass="label"></asp:CheckBox>
                            <asp:CheckBox ID="cb_top" runat="server" Text="置顶" CssClass="label"></asp:CheckBox>
                            <asp:CheckBox ID="cb_pop" runat="server" Text="弹出" CssClass="label"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 118px; height: 40px;">
                            标题颜色：
                        </td>
                        <td align="left" style="width: 550px; height: 40px;">
                            <asp:RadioButtonList ID="rbColor" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="FF0000">&lt;span style=&quot; color:#FF0000&quot;&gt;#FF0000&lt;/span&gt;</asp:ListItem>
                                <asp:ListItem Value="990000">&lt;span style=&quot; color:#990000&quot;&gt;#990000&lt;/span&gt;</asp:ListItem>
                                <asp:ListItem Value="FF0066">&lt;span style=&quot; color:#FF0066&quot;&gt;#FF0066&lt;/span&gt;</asp:ListItem>
                                <asp:ListItem Value="FF3300">&lt;span style=&quot; color:#FF3300&quot;&gt;#FF3300&lt;/span&gt;</asp:ListItem>
                            </asp:RadioButtonList>
                            <br />
                            颜色代码：<asp:TextBox ID="txtColorCode" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 118px; height: 40px;">
                            类型：
                        </td>
                        <td align="left" style="width: 550px; height: 40px;">
                            <asp:DropDownList ID="ddl_type" runat="server" Width="93px">
                            </asp:DropDownList>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            内容：
                        </td>
                        <td align="left">

                          <script type="text/plain" id="myEditor" ><%=newscontent%></script>

                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 118px; height: 40px;">
                            添加日期：
                        </td>
                        <td align="left" style="width: 550px; height: 40px;">
                            <input id="txtDate" runat="server" readonly="readonly" type="text" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 118px; height: 40px;">
                            是否发布：
                        </td>
                        <td align="left" style="width: 550px; height: 40px;">
                            <asp:RadioButtonList ID="rbl_Release" runat="server" RepeatDirection="Horizontal"
                                RepeatLayout="Flow">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 118px; height: 25px;">
                        </td>
                        <td align="left" style="width: 550px; height: 25px;">
                            <asp:Button ID="BtnSubmit" runat="server" Text="提  交" OnClick="BtnSubmit_Click" OnClientClick="return getContent();" />
                            <input type="button" value="返  回" onclick="javascript:location.href='NewsList.aspx'" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
<script type="text/javascript">
    //实例化编辑器
    var um = UM.getEditor('myEditor');
    um.addListener('blur', function() {
        $('#focush2').html('编辑器失去焦点了')
    });
    um.addListener('focus', function() {
        $('#focush2').html('')
    });
    //按钮的操作
    function insertHtml() {
        var value = prompt('插入html代码', '');
        um.execCommand('insertHtml', value)
    }
    function isFocus() {
        alert(um.isFocus())
    }
    function doBlur() {
        um.blur()
    }
    function createEditor() {
        enableBtn();
        um = UM.getEditor('myEditor');
    }
    function getAllHtml() {
        var _val = UM.getEditor('myEditor').getAllHtml();
        $("#hfcontent").val(_val);
    }
    function getContent() {
        var _val = UM.getEditor('myEditor').getContent();
        $("#hfcontent").val(_val);
    }
    function getPlainTxt() {
        var _val = UM.getEditor('myEditor').getPlainTxt();
        $("#hfcontent").val(_val);
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用umeditor')方法可以设置编辑器的内容");
        UM.getEditor('myEditor').setContent('欢迎使用umeditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UM.getEditor('myEditor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UM.getEditor('myEditor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UM.getEditor('myEditor').selection.getRange();
        range.select();
        var txt = UM.getEditor('myEditor').selection.getText();

        $("#hfcontent").val(txt);
    }

    function getContentTxt() {
        var txt = UM.getEditor('myEditor').getContentTxt();
        $("#hfcontent").val(txt);
    }
    function hasContent() {
      
        var txt = UM.getEditor('myEditor').hasContents();
        $("#hfcontent").val(txt);
    }
    function setFocus() {
        UM.getEditor('myEditor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UM.getEditor('myEditor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++]; ) {
            if (btn.id == str) {
                domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++]; ) {
            domUtils.removeAttributes(btn, ["disabled"]);
        }
    }
</script>
</body>
</html>
