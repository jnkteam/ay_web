<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Reviewname.aspx.cs" Inherits="KuaiCard.WebUI.Manage.Reviewname" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="style/union.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
      .rptheadlink{color: White; font-family: 宋体; font-size: 12px};
    </style>
    
    <script src="../js/common.js" type="text/javascript"></script>
    <script src="../js/ControlDate/WdatePicker.js" type="text/javascript"></script>
<script>
    function picBig() {
        var v = document.getElementById('divCenter');
        v.style.display = "block";
    }

    function picClose() {
        var v = document.getElementById('divCenter');
        v.style.display = "none";
    }
    function picBiga() {
        var v = document.getElementById('divCentera');
        v.style.display = "block";
    }

    function picClosea() {
        var v = document.getElementById('divCentera');
        v.style.display = "none";
    }
</script>
</head>
<body class="yui-skin-sam">
    <form id="form1" runat="server">
        <div id="modelPanel" style="background-color: #F2F2F2">
        </div>
        <input id="selectedUsers" runat="server" type="hidden" />
        <table width="100%" border="0" cellspacing="1" cellpadding="1" class="table1">
            <tr>
                <td align="center" style="font-weight: bold; font-size: 14px; background-image: url(../style/images/topbg.gif);
                    color: teal; background-repeat: repeat-x; height: 24px">
                    实名审核</td>
            </tr>
            <tr>
                <td>
                    搜索
                   <asp:DropDownList ID="StatusList" runat="server" EnableViewState="false">
                        <asp:ListItem Value="2">待审核</asp:ListItem>
                        <asp:ListItem Value="1">审核通过</asp:ListItem>
                        <asp:ListItem Value="3">未通过</asp:ListItem>
                    </asp:DropDownList>     
                    用户ID：<asp:TextBox ID="txtuserId" runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" CssClass="button" Text=" 查 询 " OnClick="btnSearch_Click">
                    </asp:Button>  
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table width="100%" id="tab" border="0" align="center" cellpadding="2" cellspacing="1">
                        <asp:Repeater ID="rptUsers" runat="server"  OnItemCommand="rptApply_ItemCommand" >
                            <HeaderTemplate>
                                <tr style="background-color: #507CD1; color: #fff; height: 22;">
                                   
                                    <td>商户ID</td>
                                    <td>商户账号</td>
                                    <td>认证姓名</td>
                                    <td>身份证号</td>
                                    <td>身份证正面</td>
                                   <td>身份证反面</td>
                                   <td>提交时间</td>
                                   <td>状态</td>
                                   <td>操作</td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #EFF3FB">
                                  
                                    <td>
                                        <%# Eval("id")%>
                                    </td>
                                    <td>
                                       <%# Eval("username")%>
                                    </td>
                                    <td>
                                        <%# Eval("full_name")%>
                                    </td>
                                    <td>
                                        <%# Eval("idCard")%>
                                    </td>
                                    <td>
                                     <a name='fff' href='javascript:void(0);' onclick='picBig();'><img src='/Upload<%# Eval("frontPic")%>' width="138" height="108" style="margin-left:1px;margin-top:1px;"></a>
                                    </td>
                                    <td>
                                    <a name='fff' href='javascript:void(0);' onclick='picBiga();'><img src='/Upload<%# Eval("versoPic")%>' width="138" height="108" style="margin-left:1px;margin-top:1px;"> </a> 
                                    </td> 
                                     <td>
                                        <%# Eval("msn")%>
                                    </td>
                                    <td>
                                        <%#GetViewStatusName(Eval("isRealNamePass"))%>
                                    </td>
                                    <td>
                                    <asp:Button ID="btnAudit" runat="server" Text="通过" CommandName="Pass" CommandArgument='<%# Eval("ID") %>'  />
                                        <asp:Button ID="btnRefuse" runat="server" Text="拒绝" CommandName="Refuse" CommandArgument='<%# Eval("ID") %>'  /></td>                                 
                                </tr>
                                
                                <div id="divCenter" align="center" style="position: absolute; z-index: 9; display: none; background-color: #eee; width:700px; height:500px;left:200px;top:200px; border:1px solid #222;">
<img src='/Upload<%# Eval("frontPic")%>' /><a href="javascript:void(0);" onclick="picClose();">关闭</a>
</div>
<div id="divCentera" align="center" style="position: absolute; z-index: 9; display: none; background-color: #eee; width:700px; height:500px;left:200px;top:200px; border:1px solid #222;">
<img src='/Upload<%# Eval("versoPic")%>' /><a href="javascript:void(0);" onclick="picClosea();">关闭</a>
</div>
                            </ItemTemplate>
                         
                        </asp:Repeater>
                    </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr style="background-color: #EFEFEF">
                            <td style="height: 16px;">
                                <aspxc:AspNetPager ID="Pager1" runat="server" OnPageChanging="Pager1_PageChanged"
                                    AlwaysShow="True" CustomInfoHTML="总记录数：%RecordCount%&nbsp;总页数：%PageCount%&nbsp;当前页：%CurrentPageIndex%&nbsp;"
                                    CustomInfoTextAlign="Left" FirstPageText="首页" HorizontalAlign="Right" LastPageText="末页"
                                    NavigationToolTipTextFormatString="跳转{0}页" NextPageText="下一页" PageIndexBoxType="DropDownList"
                                    PageSize="20" PrevPageText="上一页" ShowBoxThreshold="50" ShowCustomInfoSection="Left"
                                    ShowPageIndex="False" ShowPageIndexBox="Always" SubmitButtonText="GO&gt;&gt;"
                                    TextAfterPageIndexBox="页" TextBeforePageIndexBox="跳到" Width="100%" Height="30px">
                                </aspxc:AspNetPager>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>

    <script type="text/javascript">
 function handler(tp){
 }

var mytr =  document.getElementById("tab").getElementsByTagName("tr");
for(var i=1;i<mytr.length;i++){
  mytr[i].onmouseover= function(){ 
var rows = this.childNodes.length;
for(var row=0;row<rows;row++){
this.childNodes[row].style.backgroundColor='#E6EEFF';
}
};
  mytr[i].onmouseout= function(){ 
var rows = this.childNodes.length;
for(var row=0;row<rows;row++){
this.childNodes[row].style.backgroundColor='';
}
};
}

    </script>

</body>
</html>
