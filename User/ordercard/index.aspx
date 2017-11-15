<%@ Page Title="" Language="C#" MasterPageFile="~/user/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="KuaiCard.WebUI.user.ordercard.index" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h5 class="page-title">卡类订单管理</h5>
    <div class="form-group">
        <label for="inputName1" class="col-sm-1 control-label" >起始日期：</label>
        <div class="col-md-1">
            <input id="sdate" runat="server" type="text" class="form-control input-sm sdate-picker" />
        </div>
        <label for="inputName1" class="col-sm-1 control-label" >截止日期：</label>
        <div class="col-md-1">
            <input id="edate" runat="server" type="text" class="form-control input-sm edate-picker"/>
        </div>
        <label for="inputName1" class="col-sm-1 control-label" >通道类型：</label>
        <div class="col-md-1">
            <select id="channelId" runat="server" class="form-control input-sm">
                <option value="0" >所有通道</option> 
                <option value="103">移动充值卡</option>
                <option value="106">骏网一卡通</option>
                <option value="108">联通充值卡</option>
                <option value="104">盛大一卡通</option>
                <option value="111">完美一卡通</option>
                <option value="112">搜狐一卡通</option>
                <option value="105">征途一卡通</option>
                <option value="109">久游一卡通</option>
                <option value="110">网易一卡通</option>
                <option value="115">光宇一卡通</option>
                <option value="114">电信充值卡</option>
                <option value="117">纵游一卡通</option>
                <option value="118">天下一卡通</option>
                <option value="107">腾讯一卡通</option>
                <option value="119">天宏一卡通</option>
            </select>
        </div>
        <label for="inputName1" class="col-sm-1 control-label" >订单状态：</label>
        <div class="col-md-1">
            <select name="Success" id="Success" runat="server" class="form-control input-sm">
                <option value="0">所有</option>
                <option value="2">成功</option>
                <option value="4">失败</option>
                <option value="1">处理中</option>
            </select>
        </div>
        <label for="inputName1" class="col-sm-1 control-label" >下发状态：</label>
        <div class="col-md-1">
            <asp:DropDownList ID="ddlNotifyStatus" runat="server" class="form-control input-sm">
                <asp:ListItem>所有</asp:ListItem>
                <asp:ListItem Value="1">处理中</asp:ListItem>
                <asp:ListItem Value="2">已成功</asp:ListItem>
                <asp:ListItem Value="4">失败</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="form-group">
        <label for="inputName1" class="col-sm-1 control-label" >其它：</label>
        <div class="col-md-1">
            <select id="select_field" runat="server" class="form-control input-sm">
                <option value="2">卡号</option>
                <option value="1">商户订单号</option>
                <option value="3">平台订单号</option>
            </select>
        </div>
        <label for="inputName1" class="col-sm-1 control-label" >订单号：</label>
        <div class="col-md-2">
            <input name="okey" type="text" id="okey" runat="server" maxlength="30" value="" class="form-control input-sm" />
        </div>
        <asp:Button ID="b_search" runat="server" Text="搜索" CssClass="btn m-r-5" OnClick="b_search_Click" />
    </div>
    <div class="block-area" id="tableHover">
        <div class="table-responsive overflow">
            <table class="table table-bordered table-hover tile">
                <thead>
                    <tr class="tr-list-head">
                        <th width="25"></th>
                        <th>系统订单</th>
                        <th>商户订单</th>
                        <th>卡号</th>
                        <th>支付方式</th>
                        <th>提交面值（元）</th>
                        <th>成功面值（元）</th>
                        <th>订单状态</th>
                        <th>详细</th>
                        <th>提交时间</th>
                        <th>详情</th>
                    </tr>
                </thead>
                <asp:Repeater ID="rptOrders" runat="server" OnItemDataBound="rptDetails_ItemDataBound">
                    <ItemTemplate>
                        <tr class="td1" id="toporder">
                            <td></td>
                            <td><%# Eval("orderid")%></td>
                            <td><%# Eval("userorder")%></td>
                            <td><%# Eval("cardNo")%></td>
                            <td><%# Eval("modetypename")%></td>
                            <td><%# Eval("refervalue", "{0:f0}")%></td>
                            <td><%# GetViewSuccessAmt(Eval("status"),Eval("realvalue"))%></td>
                            <td> <%#GetViewStatusName(Eval("status"))%>   </td>
                            <td><%# Eval("msg")%></td>
                            <td><%# Eval("addtime", "{0:yyyy-MM-dd HH:mm:ss}")%></td>
                            <td><a class="fc2" href="/user/ordercard/view.aspx?orderid=<%#Eval("orderid")%>">&laquo; 查看</a></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            <table class="table table-bordered table-hover tile">
                <tr style="font-size:14px; height:40px;">
                    <td style="width:400px" >
                        <span>共有<font class="fc2"><%=pageordertotal%></font>个订单│ 成功订单：<font class="fc2"><%=pageordersucctotal%></font>笔
                            │ 总提交订单：<font class="fc2"><%=totalordertotal%></font>笔</span>
                    </td>
                    <td>
                        <webdiyer:AspNetPager CssClass="pagination" ID="Pager1" runat="server"  AlwaysShow="True"  CustomInfoHTML="共%PageCount%页/%RecordCount%条"
                            CustomInfoTextAlign="Left" FirstPageText="首页" HorizontalAlign="Right" LastPageText="末页"
                            NavigationToolTipTextFormatString="跳转{0}页" NextPageText="下一页" PageIndexBoxType="TextBox"
                            PageSize="20" PrevPageText="上一页" ShowBoxThreshold="50" 
                            SubmitButtonText="GO&gt;&gt;" PageIndexBoxClass="col-md-1"
                            TextAfterPageIndexBox="页" TextBeforePageIndexBox="跳到" CurrentPageButtonClass="active" 
                            OnPageChanged="Pager1_PageChanged" Width="100%">
                        </webdiyer:AspNetPager>
                    </td>
                </tr>
            </table>
        </div>
    </div>
<script  type="text/javascript" language="javascript">
    $('.sdate-picker').datetimepicker({
        minView: "month",
        autoclose: true,
        language: 'zh-CN',
        todayBtn: false, //今日按钮
        format: "yyyy-mm-dd"
    });

    $('.edate-picker').datetimepicker({
        minView: "month",
        autoclose: true,
        language: 'zh-CN',
        todayBtn: false, //今日按钮
        format: "yyyy-mm-dd"
    });
    
</script>
</asp:Content>
