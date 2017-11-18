<%@ Page Language="C#" AutoEventWireup="True" Inherits="OriginalStudio.WebUI.Manage.Order.BankOrderList" Codebehind="BankOrderList.aspx.cs" EnableEventValidation="true" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="aspxc" %>
<!-----------------header---------------->
 <!-- #include file="../Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="../Left.aspx" -->
<!-----------------left------------------>


 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ��������
        <small>������֧��ƽ̨</small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">

    <!--<form id="form1" runat="server">-->
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="table1">

        <tr>
            <td>
                <table>
                    <tr  height="30" >
                        <td colspan="2">
                            <div class="input-group">
                            <div class="input-group-btn">
                            <button type="button" class="btn btn-primary">�̻�ID</button>
                            </div>
                            <asp:TextBox ID="txtuserid" class="form-control" runat="server"></asp:TextBox>



                            </div>


                            <div class="input-group">
                             <%--  ����ID��
                                            <asp:TextBox ID="txtpromid" runat="server" Width="30px"></asp:TextBox>--%>
                                                        <asp:DropDownList ID="ddlChannelType" class="form-control" runat="server" >
                                                            <asp:ListItem Value="">--ͨ������--</asp:ListItem>
                                                            <asp:ListItem Value="102">��������</asp:ListItem>
                                                            <asp:ListItem Value="101">֧����</asp:ListItem>
                                                            <asp:ListItem Value="100">�Ƹ�ͨ</asp:ListItem>
                                                            <asp:ListItem Value="99">΢��</asp:ListItem>
                              </asp:DropDownList>
                            </div>

                             <div class="input-group">
                                <asp:DropDownList ID="ddlsupp" class="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <div class="input-group">
                            <asp:DropDownList ID="ddlOrderStatus" class="form-control" runat="server" Width="95px">
                                <asp:ListItem>--����״̬--</asp:ListItem>
                                <asp:ListItem Value="1">������</asp:ListItem>
                                <asp:ListItem Value="2">�ѳɹ�</asp:ListItem>
                                <asp:ListItem Value="4">ʧ��</asp:ListItem>
                                <asp:ListItem Value="8">����</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                            <div class="input-group">
                            <asp:DropDownList ID="ddlNotifyStatus" class="form-control" runat="server" Width="95px">
                                <asp:ListItem>--�·�״̬--</asp:ListItem>
                                <asp:ListItem Value="1">������</asp:ListItem>
                                <asp:ListItem Value="2">�ѳɹ�</asp:ListItem>
                                <asp:ListItem Value="4">ʧ��</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                            <div class="input-group">
                            <asp:DropDownList ID="ddlmange" class="form-control" runat="server"></asp:DropDownList>
                            </div>





                        </td>
                    </tr>
                     <tr  height="30" >
                            <td>
                            <div class="input-group date">
                             <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ʼ</div>
                                <asp:TextBox ID="StimeBox"  class="form-control"  runat="server" Width="65px"></asp:TextBox>
                            </div>

                             <div class="input-group date">
                               <div class="input-group-addon"> <i class="fa fa-calendar"></i>&nbsp;��ֹ</div>
                            <asp:TextBox ID="EtimeBox" runat="server" class="form-control" Width="65px"></asp:TextBox>
                            </div>
                            <div class="input-group">
                            <!--<asp:Button ID="btn_Search" runat="server"  CssClass="button btn  btn-danger" Text=" �� ѯ " OnClick="btn_Search_Click"></asp:Button>-->
                            <button Class="button btn  btn-danger" id="search" >��ѯ</button>
                            </div>
                             <div class="input-group">
                            <asp:Button ID="btnExport" runat="server" CssClass="button btn  btn-danger" Text="����"
                            OnClick="btnExport_Click"></asp:Button>
                            </div>
                            </td>
                    </tr>
                    <tr  height="30" >
                        <td>
                        <div class="input-group">
                        <div class="input-group-btn">
                        <button type="button" class="btn btn-primary">������</button>
                        </div>
                            <asp:TextBox ID="txtOrderId" runat="server" class="form-control" ></asp:TextBox>
                        </div>
                        <div class="input-group">
                        <div class="input-group-btn">
                        <button type="button" class="btn  btn-primary">�̻�������</button>
                        </div>
                            <asp:TextBox ID="txtUserOrder" runat="server" class="form-control" ></asp:TextBox>
                        </div>
                        <div class="input-group">
                        <div class="input-group-btn">
                        <button type="button" class="btn btn-primary">�ӿ��̶�����</button>
                        </div>
                            <asp:TextBox ID="txtSuppOrder" runat="server" class="form-control"></asp:TextBox>
                        </div>






                        </td>

                        <td align="left" bgcolor="">
                        <div class="btn-group">
                                              <button type="button" class="btn btn-default">�ܶ<% = TotalTranATM %></button>
                                              <button type="button" class="btn btn-default">�̻����ã�<% = TotalUserATM %></button>
                                              <button type="button" class="btn btn-default">ҵ������ɣ�<% = TotalCommission %></button>
                                              <button type="button" class="btn btn-default">ƽ̨����<% = TotalProfit%></button>
                                            </div>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#ffffff">
                <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table table-bordered">
                    <tr>
                        <td align="center">

                <table border="0" cellpadding="0" cellspacing="1" width="100%" id="table2" class="table table-bordered table-hover dataTable">

                                        <tr height="30"  style="background: #e8eaee" >
                                            <td>
                                                �̻�ID
                                            </td>
                                            <td>
                                                �ӿ�
                                            </td>
                                            <td>
                                                ��������
                                            </td>


                                            <td>
                                                ͨ������
                                            </td>
                                            <td>
                                                ����
                                            </td>
                                            <td>
                                                ���
                                            </td>
                                            <td>
                                                �̻�
                                            </td>
                                            <td>
                                                ƽ̨
                                            </td>
                                            <td>
                                                ����
                                            </td>
                                            <td>
                                                ҵ��
                                            </td>
                                            <td id="rptOrders_ctl00_th_profits">
                                                ����
                                            </td>

                                            <td>
                                                ����ʱ��
                                            </td>
                                            <td>
                                                ״̬
                                            </td>
                                            <td>
                                                �·�״̬
                                            </td>
                                            <td id="rptOrders_ctl00_th_supplier">
                                                �ӿ���
                                            </td>

                                            <td>
                                                ������
                                            </td>
                                            <td>
                                                ����
                                            </td>
                                        </tr>
                                        <tbody id="data"></tbody>



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
    <!--</form>-->

    </section>
    </div>


<!-----------------footer------------------>
 <!-- #include file="../Footer.aspx" -->
<!-----------------footer------------------>

<script src="<%=ADMIN_URI%>/style/admin/layer/layer.js"></script>
<script>
  $(function () {



     $("#StimeBox").jeDate({

            format: "YYYY-MM-DD hh:mm:ss",

        });
     $("#EtimeBox").jeDate({

                 format: "YYYY-MM-DD hh:mm:ss",

             });

     //���ݲ�ѯ=======================
     $("#search").click(function() {
           $.ajax({
                          method: 'POST',
                          cache: false,
                          contentType: "application/json",
                          url: './BankOrderList.ashx',
                          data: {
                                   txtOrderId       : $("#txtOrderId").val(),
                                   txtuserid        : $("#txtuserid").val(),
                                   ddlChannelType   : $("#ddlChannelType").val(),
                                   ddlsupp          : $("#ddlsupp").val(),
                                   txtUserOrder     : $("#txtUserOrder").val(),
                                   txtSuppOrder     : $("#txtSuppOrder").val(),
                                   ddlOrderStatus   : $("#ddlOrderStatus").val(),
                                   ddlNotifyStatus  : $("#ddlNotifyStatus").val(),
                                   StimeBox         : $("#StimeBox").val(),
                                   EtimeBox         : $("#EtimeBox").val(),
                              },
                          headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                          beforeSend: function () {
                              $("#search").html("��ѯ��...");
                          },
                          success: function (data, textStatus) {
                              data = JSON.parse(data);
                              $("#search").html("��ѯ");


                              if (data['success']) {
                                   console.info(data['data']);

                                  var dtCount = data['data'].length;
                                  var html = "";
                                  for (var i = 0; i < dtCount; i++) {


                                      html+= "<tr height='30'  ondblclick='javascript:sendInfo()'>";
                                      html+= "<td> "+data['data'][i]['userid']+"</td>";
                                      html+= "<td> "+data['data'][i]['version']+"</td>";
                                      html+= "<td> "+data['data'][i]['ordertype']+"</td>";
                                      html+= "<td> "+data['data'][i]['modetypename']+"</td>";
                                      html+= "<td> "+data['data'][i]['modeName']+"</td>";
                                      html+= "<td> "+data['data'][i]['refervalue']+"</td>";
                                      html+= "<td> "+data['data'][i]['payAmt']+"</td>";
                                      html+= "<td> "+data['data'][i]['supplierAmt']+"</td>";
                                      html+= "<td> "+data['data'][i]['promAmt']+"</td>";
                                      html+= "<td> "+data['data'][i]['commission']+"</td>";
                                      html+= "<td> "+data['data'][i]['profits']+"</td>";
                                      html+= "<td> "+data['data'][i]['completetime']+"</td>";
                                      html+= "<td><%=getStatusStyle("") %></td>";
                                      html+= "<td> "+data['data'][i]['notifystat']+"</td>";

                                      html+= "<td><a title='�����' style='color:#1db283' href='javascript:void(0)'><i class='fa  fa-check-circle'></i></a></td>";
                                      html+= "<td><a title='�����' style='color:#1db283' href='javascript:void(0)'><i class='fa  fa-check-circle'></i></a></td>";

                                  html+= "<td><input type='submit' name='rptOrders$ctl01$btnReissue' value='����' id='rptOrders_ctl01_btnReissue' title='�ֶ��ط�' class='button btn btn-xs  btn-info' /><input type='submit' name='rptOrders$ctl01$btnDeduct' value='����' onclick='return confirm(\'�Ƿ�ȷ��������\'); id='rptOrders_ctl01_btnDeduct' title='����' class='button btn btn-xs  btn-info' />&nbsp;<a title='��ӡ' alt='��ӡ' style='font-size:15px; color:#00c0ef'  href='BankOrderPrint.aspx?ID=3813646' target='_blank' ><i class='fa fa-print'></i></a></td></tr>";



                                  };
                              $("#data").html(html);
                              }
                          },
                          error: function (XMLHttpRequest, textStatus, errorThrown) {
                              errorMsg = '';
                          }
                      });




     });
     //���ݲ�ѯ=======================


  })


  function sendInfo(id) {


  //ҳ��һ�򿪾�ִ�У�����ready��Ϊ��layer���������css����չģ�飩�������
          layer.ready(function(){
              //�Զ�ҳ
              layer.open({
                  type: 2,
                  title: '��������',
                  skin: 'layui-layer-rim', //���ϱ߿�
                  //closeBtn: 0, //����ʾ�رհ�ť
                  area: ['67%', '90%'], //���
                  content: "./BankOrderShow.aspx?id="+id,
              });
          });
      }


</script>