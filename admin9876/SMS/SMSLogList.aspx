<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.SMS.SMSLogList" Codebehind="SMSLogList.aspx.cs" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>


 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        短信记录
        <small>第三方支付平台</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
        <div id="modelPanel" style="background-color: #F2F2F2">
        </div>
        <input id="selectedUsers" runat="server" type="hidden" />
        <table width="100%" border="0" cellspacing="1" cellpadding="1" class="table1">

            <tr>
                <td>
                 <div class="input-group">
                                        <div class="input-group-btn">
                                        <button type="button" class="btn  btn-primary">手机号码</button>
                                        </div>
                    <asp:TextBox ID="txtMobile" class="form-control" runat="server" EnableViewState="false"></asp:TextBox>
                    </div>
                     <div class="input-group">
                    <asp:Button ID="btn_Search" runat="server" CssClass="button btn  btn-danger" Text=" 查 询 " OnClick="btn_Search_Click">
                    </asp:Button>
                    </div>
                    </td>
            </tr>
            <tr>
                <td align="center">
                    <table width="100%" id="tab" border="0" align="center" cellpadding="2" cellspacing="1" class="table table-bordered table-hover dataTable">
                        <asp:Repeater ID="repSms" EnableViewState="false" runat="server" OnItemDataBound="repSms_ItemDataBound">
                            <HeaderTemplate>
                                <tr height="30"  style="background: #e8eaee">
                                    <td style="width:5%">
                                    展开
                                    </td>
                                    <td style="width:5%">
                                        <input id="chkAll" type="checkbox">
                                    </td>
                                    <td style="width:5%">
                                        序号</td>
                                    <td style="width:20%">
                                        手机号码</td>
                                    <td style="width:20%">
                                        已发送总次数</td>
                                    <td style="width:20%">
                                        受限</td>
                                    <td style="width:15%">
                                        操作</td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr >
                                    <td style="width: 40px; text-align: center">


                                    <a id="mycollapse" class="_close" href="javascript:collapse(this, '<%#Eval("ID")%>')"><i class="fa fa-plus-square" id="plusicon_<%#Eval("ID")%>"></i></a>
                                    </td>
                                    <td>
                                        <input id="chkItem" type="checkbox" runat="server" value='<%#Eval("ID")%>' name="chkItem"/>
                                    </td>
                                    <td>
                                        <%# Eval("ID")%>
                                    </td>
                                    <td>
                                        <%# Eval("phone")%>
                                    </td>                                    
                                    <td>
                                        <%# Eval("count")%>
                                    </td> 
                                    <td>
                                        <%# Eval("enable")%>
                                    </td>  
                                    <td class="atd">
                                        <asp:Literal ID="litcmd" runat="server"></asp:Literal>
                                    </td>                                    
                                </tr>
                                <tr id="<%#Eval("ID") %>" style="display:none">
                                    <td colspan="16">
                                        <asp:Repeater ID="rptDetail" runat="server" >
                                        <HeaderTemplate>
                                            <table align="center" class="table table-bordered table-hover dataTable" cellpadding="0" cellspacing="0" width="98%" class="zb" style="background-color: #e8eaee;margin: 8px;">
                                                <tr class="style3">
                                                    <td>
                                                        发送时间
                                                    </td>
                                                    <td>
                                                        发送IP
                                                    </td>
                                                    <td height="30">
                                                        验证码
                                                    </td>                                                  
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr onmouseover="c=this.style.backgroundColor;this.style.backgroundColor='#c4d6fc'"onmouseout='this.style.backgroundColor=c;'>
                                                <td>
                                                    &nbsp;
                                                    <%#Convert.ToDateTime(((System.Data.DataRow)Container.DataItem)["sendTime"]).ToString("yyyy-MM-dd mm:ss")%>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <%#((System.Data.DataRow)Container.DataItem)["clientIP"].ToString()%>
                                                </td>
                                                <td>
                                                    &nbsp;<%#((System.Data.DataRow)Container.DataItem)["code"].ToString()%>
                                                </td>                                              
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    </td>
                                </tr>
                            </ItemTemplate>                            
                        </asp:Repeater>
                    </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <!---------------------pager------------------>
                                           <!-- #include file="../Pager.aspx" -->
                                           <!---------------------pager------------------>
                            <td  style="text-align: left !important; color: #9db1c2" height="25">说明：【受限】如果是【True】 只能发送在【站点设置】中配置的【一个手机最多可以发送信息次数】条数，如果为【False】则不这一设置限制，可以发送无限条。</td>
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
    <script type="text/javascript">


    $(document).ready(function(){
        $(".atd a").addClass("button btn btn-xs  btn-info");
        $(".atd a").css("color","#fff");
    });
    function collapse(img, objName){
	    var obj = document.getElementById(objName);
	    if($("#mycollapse").attr('class') == "_close"){
	        $("#mycollapse").removeClass("_close");
	        $("#mycollapse").addClass("_open");
	        $("#plusicon_"+objName).removeClass("fa-plus-square");
	        $("#plusicon_"+objName).addClass("fa-minus-square");
	        obj.style.display = '';
	    }else {
	         $("#mycollapse").removeClass("_open");
             $("#mycollapse").addClass("_close");
             $("#plusicon_"+objName).addClass("fa-plus-square");
             $("#plusicon_"+objName).removeClass("fa-minus-square");
             obj.style.display = 'none';
	    }



    }

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


