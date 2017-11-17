<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="batch.aspx.cs" Inherits="OriginalStudio.WebUI.User.withdrawal.batch" Title="修改绑定邮箱" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="titlebar">
        <h1 class="title">批量下发</h1>
    </div>
    <div class="main">
        <div class="m-form tabular-form transfer-form">
            <ul class="transfer-list">
                <li id="item1">
                    <div class="form-group">
                        <label class="control-label">开户行：</label>
                        <select class="form-control" id="bank1">
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">开户名：</label>
                        <input type="text" id="accname1" class="form-control input-sm" placeholder="开户名" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">银行账号：</label>
                        <input type="text" id="acccard1" class="form-control" placeholder="银行账号" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">下发金额：</label>
                        <input type="text" id="money1" class="form-control input-sm" maxlength="8" onkeypress="keyPress(this)" onkeyup="keyUp(this)" onblur="onBlur(this)" placeholder="金额（元）" />
                    </div>
                    <a href="javascript:addbankitem();" class="btn btn-primary btn-add">增加</a>
                </li>
                <li id="item2" style="display:none">
                    <div class="form-group">
                        <label class="control-label">开户行：</label>
                        <select class="form-control" id="bank2">
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">开户名：</label>
                        <input type="text" id="accname2" class="form-control input-sm" placeholder="开户名" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">银行账号：</label>
                        <input type="text" id="acccard2" class="form-control" placeholder="银行账号" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">下发金额：</label>
                        <input type="text" id="money2" class="form-control input-sm" maxlength="8" onkeypress="keyPress(this)" onkeyup="keyUp(this)" onblur="onBlur(this)" placeholder="金额（元）" />
                    </div>
                    <a href="javascript:delbankitem(2);" class="btn btn-primary btn-del">删除</a>
                </li>
                <li id="item3" style="display:none">
                    <div class="form-group">
                        <label class="control-label">开户行：</label>
                        <select class="form-control"  id="bank3">
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">开户名：</label>
                        <input type="text" id="accname3" class="form-control input-sm" placeholder="开户名" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">银行账号：</label>
                        <input type="text" id="acccard3" class="form-control" placeholder="银行账号" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">下发金额：</label>
                        <input type="text" id="money3" class="form-control input-sm" maxlength="8" onkeypress="keyPress(this)" onkeyup="keyUp(this)" onblur="onBlur(this)" placeholder="金额（元）" />
                    </div>
                    <a href="javascript:delbankitem(3);" class="btn btn-primary btn-del">删除</a>
                </li>
                <li id="Li1" style="display:none">
                    <div class="form-group">
                        <label class="control-label">开户行：</label>
                        <select class="form-control"  id="Select1">
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">开户名：</label>
                        <input type="text" id="Text1" class="form-control input-sm" placeholder="开户名" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">银行账号：</label>
                        <input type="text" id="Text2" class="form-control" placeholder="银行账号" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">下发金额：</label>
                        <input type="text" id="Text3" class="form-control input-sm" maxlength="8" onkeypress="keyPress(this)" onkeyup="keyUp(this)" onblur="onBlur(this)" placeholder="金额（元）" />
                    </div>
                    <a href="javascript:delbankitem(3);" class="btn btn-primary btn-del">删除</a>
                </li>
                <li id="item4" style="display:none">
                    <div class="form-group">
                        <label class="control-label">开户行：</label>
                        <select class="form-control"  id="bank4">
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">开户名：</label>
                        <input type="text" id="accname4" class="form-control input-sm" placeholder="开户名" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">银行账号：</label>
                        <input type="text" id="acccard4" class="form-control" placeholder="银行账号" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">下发金额：</label>
                        <input type="text" id="money4" class="form-control input-sm" maxlength="8" onkeypress="keyPress(this)" onkeyup="keyUp(this)" onblur="onBlur(this)" placeholder="金额（元）" />
                    </div>
                    <a href="javascript:delbankitem(4);" class="btn btn-primary btn-del">删除</a>
                </li>
                <li id="item5" style="display:none">
                    <div class="form-group">
                        <label class="control-label">开户行：</label>
                        <select class="form-control"  id="bank5">
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">开户名：</label>
                        <input type="text" id="accname5" class="form-control input-sm" placeholder="开户名" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">银行账号：</label>
                        <input type="text" id="acccard5" class="form-control" placeholder="银行账号" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">下发金额：</label>
                        <input type="text" id="money5" class="form-control input-sm" maxlength="8" onkeypress="keyPress(this)" onkeyup="keyUp(this)" onblur="onBlur(this)" placeholder="金额（元）" />
                    </div>
                    <a href="javascript:delbankitem(5);" class="btn btn-primary btn-del">删除</a>
                </li>
                <li id="item6" style="display:none">
                    <div class="form-group">
                        <label class="control-label">开户行：</label>
                        <select class="form-control"  id="bank6">
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">开户名：</label>
                        <input type="text" id="accname6" class="form-control input-sm" placeholder="开户名" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">银行账号：</label>
                        <input type="text" id="acccard6" class="form-control" placeholder="银行账号" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">下发金额：</label>
                        <input type="text" id="money6" class="form-control input-sm" maxlength="8" onkeypress="keyPress(this)" onkeyup="keyUp(this)" onblur="onBlur(this)" placeholder="金额（元）" />
                    </div>
                    <a href="javascript:delbankitem(6);" class="btn btn-primary btn-del">删除</a>
                </li>
                <li id="item7" style="display:none">
                    <div class="form-group">
                        <label class="control-label">开户行：</label>
                        <select class="form-control"  id="bank7">
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">开户名：</label>
                        <input type="text" id="accname7" class="form-control input-sm" placeholder="开户名" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">银行账号：</label>
                        <input type="text" id="acccard7" class="form-control" placeholder="银行账号" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">下发金额：</label>
                        <input type="text" id="money7" class="form-control input-sm" maxlength="8" onkeypress="keyPress(this)" onkeyup="keyUp(this)" onblur="onBlur(this)" placeholder="金额（元）" />
                    </div>
                    <a href="javascript:delbankitem(7);" class="btn btn-primary btn-del">删除</a>
                </li>
                <li id="item8" style="display:none">
                    <div class="form-group">
                        <label class="control-label">开户行：</label>
                        <select class="form-control"  id="bank8">
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">开户名：</label>
                        <input type="text" id="accname8" class="form-control input-sm" placeholder="开户名" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">银行账号：</label>
                        <input type="text" id="acccard8" class="form-control" placeholder="银行账号" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">下发金额：</label>
                        <input type="text" id="money8" class="form-control input-sm" maxlength="8" onkeypress="keyPress(this)" onkeyup="keyUp(this)" onblur="onBlur(this)" placeholder="金额（元）" />
                    </div>
                    <a href="javascript:delbankitem(8);" class="btn btn-primary btn-del">删除</a>
                </li>
                <li id="item9" style="display:none">
                    <div class="form-group">
                        <label class="control-label">开户行：</label>
                        <select class="form-control"  id="bank9">
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">开户名：</label>
                        <input type="text" id="accname9" class="form-control input-sm" placeholder="开户名" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">银行账号：</label>
                        <input type="text" id="acccard9" class="form-control" placeholder="银行账号" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">下发金额：</label>
                        <input type="text" id="money9" class="form-control input-sm" maxlength="8" onkeypress="keyPress(this)" onkeyup="keyUp(this)" onblur="onBlur(this)" placeholder="金额（元）" />
                    </div>
                    <a href="javascript:delbankitem(9);" class="btn btn-primary btn-del">删除</a>
                </li>
                <li id="item10" style="display:none">
                    <div class="form-group">
                        <label class="control-label">开户行：</label>
                        <select class="form-control"  id="bank10">
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">开户名：</label>
                        <input type="text" id="accname10" class="form-control input-sm" placeholder="开户名" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">银行账号：</label>
                        <input type="text" id="acccard10" class="form-control" placeholder="银行账号" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">下发金额：</label>
                        <input type="text" id="money10" class="form-control input-sm" maxlength="8" onkeypress="keyPress(this)" onkeyup="keyUp(this)" onblur="onBlur(this)" placeholder="金额（元）" />
                    </div>
                    <a href="javascript:delbankitem(10);" class="btn btn-primary btn-del">删除</a>
                </li>
            </ul>
            <div class="form-group">
                <label class="control-label">验证码：</label>
                <div class="captcha-control">
                    <input type="text" id="imgcode" class="form-control" placeholder="图形验证码" />
                    <img  alt="点击刷新验证码" id="captchaImg" data-url="/CodeImage.aspx" src="/CodeImage.aspx"  class="captcha" title="点我换一张" onclick="reloadimage();"/>
                </div>
            </div>
            <% if (PhoneValid)
               { %>
            <div class="form-group">
                <label class="control-label">短信验证码：</label>
                <input type="text" id="msgcode" class="form-control" placeholder="短信验证码" />
                <a href="javascript:;getmsgcode()" class="btn btn-primary btn-send">发送短信</a>
            </div>
            <% }%>
            <div class="form-group">
                <label class="control-label">支付密码：</label>
                <input type="password" id="paypwd" class="form-control" placeholder="请输入支付密码" />
                <button type="button" class="btn btn-primary btn-submit" onclick="ajaxBatchSubmit();">提交下发</button>
            </div>
        </div>
        <div class="transfer-subtotal">
            下发订单笔数：<span id="itemCount">1</span> 笔 &nbsp; | &nbsp; 总金额：<span id="itemMoney">0.00</span> 元
        </div>
    </div>
    <script src="/js2.0/withdrawal_apply2.0.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            bindBankList();
        });
        
        //发送短信验证码
        function getmsgcode() {
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 10000,
                url: '/user/Service/sendPhone.ashx',
                data: "name=getcode",
                success: function (json) {
                    if (json.result == 'true') {
                        alert(json.text);
                    } else {
                        alert(json.text);
                    }
                },
                error: function () {
                    alert('发送失败');
                }
            });
        }
    </script>
</asp:Content>
