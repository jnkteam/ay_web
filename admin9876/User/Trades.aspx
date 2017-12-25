<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.User.Trades" Codebehind="Trades.aspx.cs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>
<style>
td{
vertical-align: middle !important;
}
</style>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ���׼�¼
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
    <div>
        <table border="0" cellspacing="1" cellpadding="1" style="width: 100%; height: 100%;">
            <tr style="height: 30px">
                <td>
                    <table>
                        <tr>
                            <td>
                                <div class="input-group">
                                <div class="input-group-btn">
                                <button type="button" class="btn btn-primary">����</button></div>
                                <asp:TextBox ID="txtMerchantName" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                    <div class="input-group date">
                                        <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ʼ</div>
                                <asp:TextBox ID="StimeBox" runat="server" class="form-control"></asp:TextBox></div>
                                    <div class="input-group date">
                                        <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ֹ</div>
                                <asp:TextBox ID="EtimeBox" runat="server" class="form-control"></asp:TextBox></div>
                                <div class="input-group">
                                <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btnSearch_Click">
                                </asp:Button>  </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff">
                    <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered">
                        <tr>
                            <td align="center" bgcolor="#ffffff">
                                <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                        <asp:Repeater ID="rptTrades" EnableViewState="false" runat="server" OnItemDataBound="rptUsersItemDataBound">
                            <HeaderTemplate>
                                <tr style="background: #e8eaee">
                                    <td style="display: none">
                                        <input id="chkAll" type="checkbox">
                                    </td>
                                    <td>
                                        �̻�ID</td>
                                    <td>
                                        �̻���</td>
                                    <td>
                                        ���׽��
                                    </td>
                                    <td>
                                        ����ʱ��</td>
                                    <td>
                                        ��������</td>
                                    <td>
                                        ����</td>
                                    <td>
                                        ��ע</td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr >
                                    <td style="display: none">
                                        <input id="chkItem" type="checkbox" runat="server" value='<%#Eval("id")%>' name="chkItem" />
                                    </td>
                                    <td>
                                        <%# Eval("userid")%>
                                    </td>
                                    <td>
                                        <a href="javascript:sendInfo('<%# Eval("userid")%>')">
                                            <strong>
                                                <%# Eval("merchantname")%>
                                            </strong>
                                        </a>
                                    </td>
                                    <td>
                                        <%# Eval("Amt", "{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("tradeTime","{0:yyyy-MM-dd HH:mm:ss}")%>
                                    </td>
                                    <td>
										<%#Enum.GetName(typeof(OriginalStudio.Model.Trade.TradeTypeEnum), Eval("billtype"))%>
                                    </td>
                                    <td>
                                        <%# Eval("Balance", "{0:f2}")%>
                                    </td>
                                    <td>
                                        <%# Eval("Remark")%>
                                    </td>                                   
                                </tr>
                            </ItemTemplate>

                        </asp:Repeater>
                                </table>
                            </td>
                        </tr>
                        <!---------------------pager------------------>
                        <!-- #include file="../Pager.aspx" -->
                        <!---------------------pager------------------>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>

</section>
</div>


<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>

<script src="<%=ADMIN_URI%>/style/admin/layer/layer.js"></script>
<script type="text/javascript" >

        $(function () {
           $("#StimeBox").jeDate({
               format: "YYYY-MM-DD hh:mm:ss",
           });
           $("#EtimeBox").jeDate({
               format: "YYYY-MM-DD hh:mm:ss",
           });
        })


          function sendInfo(id) {
          //ҳ��һ�򿪾�ִ�У�����ready��Ϊ��layer���������css����չģ�飩�������
                  layer.ready(function(){
                      //�Զ�ҳ
                      layer.open({
                          type: 2,
                          title: '�û���Ϣ',
                          skin: 'layui-layer-rim', //���ϱ߿�
                          //closeBtn: 0, //����ʾ�رհ�ť
                          area: ['67%', '90%'], //���
                          content: "../User/UserView.aspx?id=" + id,
                      });
                  });
              }

    $().ready(function(){
         $("#chkAll").click(function(){
            $("input[type='checkbox']").each(function(){
               if ($("#chkAll").attr('checked') == true){
                   $(this).attr("checked", true);
               }
               else
                   $(this).attr("checked", false);
            });
        });
    });


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
