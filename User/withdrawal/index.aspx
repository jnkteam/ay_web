<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index2.aspx.cs" Inherits="OriginalStudio.WebUI.User.withdrawal.index2"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">余额提现</h1>
    </div>
    <input id="min" type="hidden" value="<%=tixianedu %>" />
    <input id="rate" type="hidden" value="<%=shouxufei %>" />
    <input id="balancea" type="hidden" value="<%=balancea %>" />
    <input id="multiple" type="hidden" value="1" />
    <input id="balance" type="hidden" value="0.3" />
    <input type="hidden" name="accountID" id="accountID" />
    <div class="main m-form tabular-form withdraw-form">
        <div class="form-group">
            <label class="control-label">收款账户</label>
            <% if (gHasBankFlag) { %>
                <div class="choose-bank">
                    <ul class="cashier-banks">
                        <%= gBankList %>
                    </ul>
                </div>
            <% } else {%>
                <a href="/user/verify/addbank.aspx" class="btn add-account"><i class="icon icon-add"></i>添加新的收款账户</a>
            <% }%>
        </div>
        <div class="form-group">
            <label class="control-label">结算方式</label>
            <label class="radio"><input type="radio" checked="checked" />网银：<em>T+<%=wangyinT %></em></label>
            <label class="radio"><input type="radio" />支付宝：<em>T+<%=alipayT %></em></label>
            <label class="radio"><input type="radio" />微信：<em>T+<%=weixinT %></em></label>
            <label class="radio"><input type="radio" />QQ钱包：<em>T+<%=qqT %></em></label>
        </div>
        <div class="form-group">
            <label class="control-label">账户余额</label>
            <div class="form-static">
                <em><%=zongyue%></em> 元 &nbsp; 不可提现金额（T+1）：<em><%= glimitTodayIncome %></em> 元
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">可提现余额</label>
            <div class="form-static"><em><span class="account-balance2"><%=balancea %></span></em> 元</div>
        </div>
        <div class="form-group">
            <label class="control-label">提现金额</label>
            <input type="text" name="money" id="withdrawMoney" class="form-control" maxlength="8"  />
            <span class="unit">元 &nbsp;&nbsp; （最小提现金额为<%=tixianedu %>元）</span>
        </div>
        <div class="form-group">
            <label class="control-label">手续费</label>
            <div class="form-static"><em><span id="userPoundage">0.00</span></em> 元 &nbsp; （提现金额的<%=shouxufei %>%）</div>
        </div>
        <div class="form-group">
            <label class="control-label">实际到账金额</label>
            <div class="form-static"><em><span id="actualToAccount">0.00</span></em> 元</div>
        </div>
        <div class="form-group">
            <label class="control-label">提现密码</label>
            <input type="password" name="paypwd" id="paypwd" maxlength="18"  class="form-control" />
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-primary" onclick="ajaxSubmit();">确认提现</button>
        </div>
    </div>
    <script type="text/javascript" language="javascript">
        $(function () {
            var account_balance = <%=balancea %>;   //账户余额
            var POUNDAGE_RATE = <%=shouxufei %>; //手续费率
            var MULTI = 1;   //提现金额梯度
            var MIN_MONEY = <%=tixianedu %>;   //最小提现输入金额
            var MIN_POUNDAGE =<%=zuixiaoshouxu %>; //最小手续费
            var MAX_POUND =<%=zuigaoshouxu %>; //最高手续费

            $("#withdrawMoney")
                .keyup(function(e,isMulti){
                var withdraw = parseInt($(this).val());
                if (withdraw == "NaN") return;
                if(!withdraw){
                    withdraw = MIN_MONEY;
                }

                if(isMulti){
                    if(withdraw < MIN_MONEY){
                        withdraw = MIN_MONEY;
                    }

                    var remainder = withdraw%MULTI;
                    if(remainder != 0){
                        withdraw = withdraw - remainder;
                        // 下句取消注释则向上一个梯度取整
                        // withdraw += MULTI;
                    }
                }
                var poundageInit = withdraw * POUNDAGE_RATE;

                if(poundageInit < MIN_POUNDAGE && poundageInit != 0){
                    poundageInit = MIN_POUNDAGE;
                }
                if (poundageInit > MAX_POUND){
                    poundageInit = MAX_POUND;
                }
                var poundageMoney = (Math.round(poundageInit * 100) / 100).toFixed(2);

                if(e.which != 37 && e.which != 39 && e.which != 8 ){
                    $(this).val(withdraw);
                }

                $("#userPoundage").html(poundageMoney);
                $("#userPoundage").val(poundageMoney);
                //var actualMoney = (withdraw + poundageMoney).toFixed(2);
                var actualMoney = parseFloat(withdraw) + parseFloat(poundageMoney);

                if(actualMoney < 0){
                    actualMoney = 0;
                }
                if (actualMoney >= account_balance)
                {
                    withdraw = (account_balance - poundageMoney).toFixed(2);
                    if(withdraw < 0){
                        actualMoney = 0;
                    }
                }

                $("#actualToAccount").html(withdraw);
                })
                .blur(function(){
                    $(this).trigger('keyup', [true]);
                });

            //收款方式点击切换
            $("input[name='bankName']").change(function () {
                $("#accountID").val($(this).val());
            });
        });
    </script>     
    <!--这句话放在最后面-->
    <script src="/js2.0/withdrawal_apply2.0.js" type="text/javascript"></script>
</asp:Content>