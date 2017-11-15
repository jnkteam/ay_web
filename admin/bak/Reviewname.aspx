<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Reviewname.aspx.cs" Inherits="KuaiCard.WebUI.Manage.Reviewname" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="style/union.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
      .rptheadlink{color: White; font-family: ����; font-size: 12px};
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
                    ʵ�����</td>
            </tr>
            <tr>
                <td>
                    ����
                   <asp:DropDownList ID="StatusList" runat="server" EnableViewState="false">
                        <asp:ListItem Value="2">�����</asp:ListItem>
                        <asp:ListItem Value="1">���ͨ��</asp:ListItem>
                        <asp:ListItem Value="3">δͨ��</asp:ListItem>
                    </asp:DropDownList>     
                    �û�ID��<asp:TextBox ID="txtuserId" runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" CssClass="button" Text=" �� ѯ " OnClick="btnSearch_Click">
                    </asp:Button>  
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table width="100%" id="tab" border="0" align="center" cellpadding="2" cellspacing="1">
                        <asp:Repeater ID="rptUsers" runat="server"  OnItemCommand="rptApply_ItemCommand" >
                            <HeaderTemplate>
                                <tr style="background-color: #507CD1; color: #fff; height: 22;">
                                   
                                    <td>�̻�ID</td>
                                    <td>�̻��˺�</td>
                                    <td>��֤����</td>
                                    <td>���֤��</td>
                                    <td>���֤����</td>
                                   <td>���֤����</td>
                                   <td>�ύʱ��</td>
                                   <td>״̬</td>
                                   <td>����</td>
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
                                    <asp:Button ID="btnAudit" runat="server" Text="ͨ��" CommandName="Pass" CommandArgument='<%# Eval("ID") %>'  />
                                        <asp:Button ID="btnRefuse" runat="server" Text="�ܾ�" CommandName="Refuse" CommandArgument='<%# Eval("ID") %>'  /></td>                                 
                                </tr>
                                
                                <div id="divCenter" align="center" style="position: absolute; z-index: 9; display: none; background-color: #eee; width:700px; height:500px;left:200px;top:200px; border:1px solid #222;">
<img src='/Upload<%# Eval("frontPic")%>' /><a href="javascript:void(0);" onclick="picClose();">�ر�</a>
</div>
<div id="divCentera" align="center" style="position: absolute; z-index: 9; display: none; background-color: #eee; width:700px; height:500px;left:200px;top:200px; border:1px solid #222;">
<img src='/Upload<%# Eval("versoPic")%>' /><a href="javascript:void(0);" onclick="picClosea();">�ر�</a>
</div>
                            </ItemTemplate>
                         
                        </asp:Repeater>
                    </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr style="background-color: #EFEFEF">
                            <td style="height: 16px;">
                                <aspxc:AspNetPager ID="Pager1" runat="server" OnPageChanging="Pager1_PageChanged"
                                    AlwaysShow="True" CustomInfoHTML="�ܼ�¼����%RecordCount%&nbsp;��ҳ����%PageCount%&nbsp;��ǰҳ��%CurrentPageIndex%&nbsp;"
                                    CustomInfoTextAlign="Left" FirstPageText="��ҳ" HorizontalAlign="Right" LastPageText="ĩҳ"
                                    NavigationToolTipTextFormatString="��ת{0}ҳ" NextPageText="��һҳ" PageIndexBoxType="DropDownList"
                                    PageSize="20" PrevPageText="��һҳ" ShowBoxThreshold="50" ShowCustomInfoSection="Left"
                                    ShowPageIndex="False" ShowPageIndexBox="Always" SubmitButtonText="GO&gt;&gt;"
                                    TextAfterPageIndexBox="ҳ" TextBeforePageIndexBox="����" Width="100%" Height="30px">
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
