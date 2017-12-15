<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Order.RunLogList" Codebehind="RunLogList.aspx.cs" %>

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
        ���׵�����־
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellspacing="1" cellpadding="1" class="table1" >
        <tr height="60">
            <td colspan="2">
                <div class="input-group">
                <div class="input-group-btn">
                <button type="button" class="btn btn-primary">�û�������</button>
                </div>
                <asp:TextBox ID="txtuserOrder" runat="server" class="form-control"></asp:TextBox>
                </div>


                <div class="input-group">
                <div class="input-group-btn">
                <button type="button" class="btn btn-primary">�̻���</button>
                </div>
                <asp:TextBox ID="txtMerchantName" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="input-group">
                <div class="input-group-btn">
                <button type="button" class="btn btn-primary">��ʼ��</button>
                </div>
                <asp:TextBox ID="StimeBox" runat="server" Width="65px" class="form-control"></asp:TextBox>
                </div>

                <div class="input-group">
                <div class="input-group-btn">
                <button type="button" class="btn btn-primary">��ֹ��</button>
                </div>
                <asp:TextBox ID="EtimeBox" runat="server" Width="65px" class="form-control"></asp:TextBox>
                </div>

                <div class="input-group">
                <asp:Button ID="btnSearch" runat="server" CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btnSearch_Click">
                </asp:Button>
                </div>

                <div class="input-group">
                <asp:Button ID="btnDel" runat="server" CssClass="button btn  btn-danger" Text=" ɾ �� " />
                </div>
            </td>
        </tr>

        <tr>
            <td bgcolor="#ffffff">
                <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered">
                    <tr>
                        <td align="center">
                            <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">
                    <asp:Repeater ID="rptTrades" EnableViewState="false" runat="server" OnItemDataBound="rptUsersItemDataBound">
                        <HeaderTemplate>
                            <tr height="30"  style="background: #e8eaee">
                                <td style="width:5%">
                                    <input id="chkAll" type="checkbox">
                                </td>
                                <td style="width:10%">
                                    ���׺�
                                </td>
                                <td style="width:10%">
                                    �̻���
                                </td>
                                <td style="width:10%">
                                    �û���
                                </td>
                                <td style="width:10%">
                                    ����
                                </td>
                                <td style="width:25%">
                                    �ύ��ַ
                                </td>
                                <td style="width:10%"> 
                                    �������
                                </td>
                                <td style="width:10%">
                                    �����ź�
                                </td>
                                <td style="width:10%">
                                    ʱ��
                                </td>
                            </tr>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr ondblclick="javascript:showInfo('<%# Eval("id")%>')">
                                <td>
                                    <input id="chkItem" type="checkbox" runat="server" value='<%#Eval("id")%>' name="chkItem" />
                                </td>
                                <td>
                                    <%# Eval("userorder")%>
                                </td>
                                <td>
                                    <%# Eval("MerchantName")%>
                                </td>
                                <td>
                                    <a href="javascript:sendInfo('<%# Eval("userid")%>')">
                                        <%#Eval("UserName")%>
                                    </a>
                                </td>
                                <td>
                                    <%#Enum.GetName(typeof(OriginalStudio.Model.Sys.LogTypeEnum), Eval("logtype"))%>
                                </td>
                                <td style="word-break:break-all">
                                    <%# Eval("url")%>
                                </td>
                                <td>
                                    <%# Eval("errorcode")%>
                                </td>
                                <td>
                                    <%# Eval("errorinfo")%>
                                </td>
                                <td>
                                    <%# Eval("addtime", "{0:yyyy-MM-dd HH:mm:ss}")%>
                                </td>
                            </tr>
                        </ItemTemplate>

                        <AlternatingItemTemplate>
                            <tr style="background-color: #ffffff">
                                <tr ondblclick="javascript:showInfo('<%# Eval("id")%>')">
                                    <td>
                                        <input id="chkItem" type="checkbox" runat="server" value='<%#Eval("id")%>' name="chkItem" />
                                    </td>
                                    <td>
                                        <%# Eval("userorder")%>
                                    </td>
                                    <td>
                                        <%# Eval("MerchantName")%>
                                    </td>
                                    <td>
                                        <a href="javascript:sendInfo('<%# Eval("userid")%>')">
                                            <%#Eval("UserName")%>
                                        </a>
                                    </td>
                                    <td>
                                        <%#Enum.GetName(typeof(OriginalStudio.Model.Sys.LogTypeEnum), Eval("logtype"))%>
                                    </td>
                                    <td style="word-break:break-all">
                                        <%# Eval("url")%>
                                    </td>
                                    <td>
                                        <%# Eval("errorcode")%>
                                    </td>
                                    <td>
                                        <%# Eval("errorinfo")%>
                                    </td>
                                    <td>
                                        <%# Eval("addtime", "{0:yyyy-MM-dd HH:mm:ss}")%>
                                    </td>
                                </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                        </table>
                     </td>
                 </tr>

                            <!---------------------pager------------------>
                            <!-- #include file="../PagerIng.aspx" -->
                            <!---------------------pager------------------>

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
<script src="<%=ADMIN_URI%>/style/admin/layer/layer.js"></script>
<script>
  $(function () {



     $("#StimeBox").jeDate({

            format: "YYYY-MM-DD hh:mm:ss"

        });
     $("#EtimeBox").jeDate({

                 format: "YYYY-MM-DD hh:mm:ss"

             });



  });

        function handler(tp) {
        }

        var mytr = document.getElementById("tab").getElementsByTagName("tr");
        for (var i = 1; i < mytr.length; i++) {
            mytr[i].onmouseover = function() {
                var rows = this.childNodes.length;
                for (var row = 0; row < rows; row++) {
                    this.childNodes[row].style.backgroundColor = '#E6EEFF';
                }
            };
            mytr[i].onmouseout = function() {
                var rows = this.childNodes.length;
                for (var row = 0; row < rows; row++) {
                    this.childNodes[row].style.backgroundColor = '';
                }
            };
        }

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
          });
          function sendMsg(uid) {
            //  window.showModelessDialog("SendMsg.aspx?uid=" + uid, window, "dialogWidth=800px;dialogHeight=500px;");
               layer.ready(function(){
                            //�Զ�ҳ
                            layer.open({
                                type: 2,
                                title: '��Ϣ',
                                skin: 'layui-layer-rim', //���ϱ߿�
                                //closeBtn: 0, //����ʾ�رհ�ť
                                area: ['67%', '90%'], //���
                                content: "SendMsg.aspx?uid=" + uid,
                            });
                        });
          }
          function sendInfo(id) {
          //    window.open("../User/UserEdit.aspx?id=" + id, "�鿴�û���Ϣ", "Width=800px;Height=350px;");
               layer.ready(function(){
                            //�Զ�ҳ
                            layer.open({
                                type: 2,
                                title: '�鿴�û���Ϣ',
                                skin: 'layui-layer-rim', //���ϱ߿�
                                //closeBtn: 0, //����ʾ�رհ�ť
                                area: ['67%', '90%'], //���
                                content:" ../User/UserEdit.aspx?id=" + id,
                            });
                        });
          }
          function showInfo(id) {
          //    window.open("RunLogShow.aspx?id=" + id, "�鿴��ϸ��Ϣ", "Width=800px;Height=350px;");
               layer.ready(function(){
                            //�Զ�ҳ
                            layer.open({
                                type: 2,
                                title: '�鿴��ϸ��Ϣ',
                                skin: 'layui-layer-rim', //���ϱ߿�
                                //closeBtn: 0, //����ʾ�رհ�ť
                                area: ['67%', '90%'], //���
                                content: "RunLogShow.aspx?id=" + id,
                            });
                        });
          }

    </script>

