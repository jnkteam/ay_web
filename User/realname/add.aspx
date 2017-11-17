<%@ Page Language="C#" MasterPageFile="~/User/MainSite.Master" AutoEventWireup="True" CodeBehind="index.aspx.cs" Inherits="OriginalStudio.WebUI.User.realname.add"%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h5 class="page-title">实名认证</h5>
    <div class="block-area" id="tableHover">
        <div class="table-responsive overflow">
            <table class="table table-bordered table-hover tile view-table">
                <form id='formPost' name='formPost'  method="post" action="/user/Service/realname.ashx"  target='_blank' enctype="multipart/form-data" onSubmit="return false">
	                <input name="m" type="hidden" value="user" />
	                <input name="c" type="hidden" value="verify" />
	                <input name="a" type="hidden" value="save" />
	                <input name="attachments1" type="hidden" value="" />
	                <input name="attachments2" type="hidden" value="" />
                    <input name="auth_Type" type="hidden" value="1" />
                    <tr>
		                <th style="width:200px;">会员ID</th>
		                <td><%=userid%></td>
                    </tr>
                    <tr>
                        <th class="view-title"><font style="color:#F00">*</font>个人姓名</th>
                        <td>
                            <div class="col-md-2">
                                <input type="text" name="auth_Name2"  id="auth_Name" maxlength="50" class="form-control input-sm" /><font style="color:#999;">认证后无法修改，请认真填写</font>
                            </div>
                        </td>
                    </tr>
                    <tr>
		                <th><font style="color:#F00">*</font><span id="paperworktxt">身份证号码</span></th>
		                <td>
                            <div class="col-md-2">
                                <input type="text" name="auth_PaperworkNumb" maxlength="20" class="form-control input-sm" /><font style="color:#999;">认证后无法修改，请认真填写</font>
                            </div>
                        </td>
                    </tr>
                </form>
                <form id='formFile1' name='formFile1' method="post" action="/user/Service/upload.ashx" target='_blank' enctype="multipart/form-data">
		            <tr>
		                <th><font style="color:#F00">*</font>身份证正面扫描件</th>
		                <td>
                            <div class="col-md-6">
			                    <input type='file' id='fileUp1' name='fileUp' onchange="upload(this.value);" style="width:300px;height:30px" /><font style="color:#999;">请上传清晰度较高的图片，支持PNG/JPG，小于1M</font>
                            </div>
		                </td>
                    </tr>
                </form>
                <form id='formFile2' name='formFile2' method="post" action="/user/Service/upload.ashx" target='_blank' enctype="multipart/form-data">
                    <tr>
                        <th><font style="color:#F00">*</font>身份证反面扫描件</th>
                        <td>
                            <div class="col-md-6">                        
                                <input type='file' id='fileUp2' name='fileUp' onchange="upload(this.value);" style="width:300px;height:30px" />
                            </div>
                        </td>
                    </tr>
                </form>
                <tr>
                    <th></th>
                    <td><input type="button" value="提交审核" class="btn m-r-5 ajaxSubmit2 submit" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p><font style='color:red'>认证关乎到您的账户安全，请勿使用P图、网络图等伪造图片，否则将导致无法使用提现PUSH等功能；</font>
                        <br />认证资料一经通过审核后无法修改，可以转换认证类型；
                        <br />请上传清晰度较高的图片，模糊不清的图片将导致审核不通过；
                        <br />客服人员将在收到认证资料之后的1-24小时内审核，周末及法定假日顺延。
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
<script src="/static/dialog/jquery.dialog.js?skin=default" type="text/javascript"></script>
<script src="/static/dialog/plugins/iframeTools.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
    //提交表单
    $(function () {
        $(".ajaxSubmit2").click(function () {
            var auth_Type = $('input[name="auth_Type"]').val();
            var auth_Name = $('[name="auth_Name2"]').val();
            var auth_PaperworkNumb = $('[name="auth_PaperworkNumb"]').val();
            var fileUp1 = $("#fileUp1").val();
            var fileUp2 = $("#fileUp2").val();


            if (auth_Type == 1) {
                var errTxt1 = "个人姓名";
                var errTxt2 = "身份证号码";
                var errTxt3 = "身份证正面扫描件";
            }
            else {
                var errTxt1 = "企业名称";
                var errTxt2 = "(营业执照/组织机构)号码";
                var errTxt3 = "(营业执照/组织机构)扫描件";
            }

            if (auth_Name == "" || auth_Name == null) {
                core.tips("请填写" + errTxt1 + "！", 2, "error");
                return false;
            }
            else {
                var reg = /^[\u4E00-\u9FA5\uF900-\uFA2D]{2,20}$/;
                if (!reg.test(auth_Name)) {
                    core.tips(errTxt1 + "填写错误！", 2, "error");
                    return false;
                }
            }

            if (auth_PaperworkNumb == "" || auth_PaperworkNumb == null) {
                core.tips("请填写" + errTxt2 + "！", 2, "error");
                return false;
            }
            else {
                var reg = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
                if (auth_Type == 2) { reg = /^[\w\-]{10,25}$/; }
                if (!reg.test(auth_PaperworkNumb)) {
                    core.tips(errTxt2 + "填写错误！", 2, "error");
                    return false;
                }
            }

            if (fileUp1 == "" || fileUp1 == null) {
                core.tips("请选择" + errTxt3 + "！", 2, "error");
                return false;
            }
            else {
                var tem = fileUp1.split(".")[1].toLowerCase();
                if (tem != "jpg" && tem != "gif" && tem != "jpeg" && tem != "png") {
                    core.tips(errTxt3 + "必须是 jpg/png 格式的图片！", 2, "error");
                    return false;
                }
            }

            if (auth_Type == 1) {
                if (fileUp2 == "" || fileUp2 == null) {
                    core.tips("请选择身份证反而扫描件！", 2, "error");
                    return false;
                }
                else {
                    var tem = fileUp2.split(".")[1].toLowerCase();
                    if (tem != "jpg" && tem != "gif" && tem != "jpeg" && tem != "png") {
                        core.tips("身份证反而扫描件必须是 jpg/png 格式的图片！", 2, "error");
                        return false;
                    }
                }
            }

            var buttonText = $(".ajaxSubmit2").val();

            $(".ajaxSubmit2").val("请稍候...").attr("disabled", "disabled");

            var successI = 0;

            //alert($("#formFile1"));

            $("#formFile1").ajaxSubmit({
                success: function (data) {
                    var json = eval('json = ' + data);
                    if (json.result) {
                        $('[name="attachments1"]').val(json.url);

                        successI++;

                        if (successI == 2 || auth_Type == 2) {
                            submitForm();
                        }
                    } else {
                        core.error(json.text);
                        $(".ajaxSubmit2").val(buttonText).attr("disabled", false);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });

            if (auth_Type == 1) {
                //个人姓名
                $("#formFile2").ajaxSubmit({
                    success: function (data) {
                        var json = eval('json = ' + data);
                        if (json.result) {
                            $('[name="attachments2"]').val(json.url);
                            successI++;
                            if (successI == 2) {
                                submitForm();
                            }
                        } else {
                            core.error(json.text);
                            $(".ajaxSubmit2").val(buttonText).attr("disabled", false);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
        });
    });
    function submitForm() {
        var sSource = "/user/Service/realname.ashx?t=" + Math.random();
        var postData = "auth_Name2=" + $('[name="auth_Name2"]').val() + "&attachments1=" + $('[name="attachments1"]').val() +
                                "&attachments2=" + $('[name="attachments2"]').val() + "&auth_PaperworkNumb=" + $('[name="auth_PaperworkNumb"]').val();
        $.ajax({
            type: "post",
            dataType: "json",
            timeout: 10000,
            url: sSource,
            data: postData,
            success: function (json) {
                if (json.result) {
                    core.tips(json.text, 2, "success", function () {
                        location.href = json.url;
                    });
                }
                else {
                    $(".ajaxSubmit2").val("提交审核");
                    $(".ajaxSubmit2").attr("disabled", false);
                    core.tips(json.text, 1.5, "error");
                }
            }
        })
    };
</script>	
</asp:Content>
