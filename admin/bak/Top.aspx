<%@ Page Language="C#" AutoEventWireup="True" Inherits="KuaiCard.WebUI.Manage.Top" Codebehind="top.aspx.cs" %>

<html xmlns="">
<head>
    <title>�����̨</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="style/left1a.css" rel="stylesheet" type="text/css" />
    <link href="style/left1b.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" type="text/css" rel="stylesheet" />
        <script src="style/jquery-1.6.2.min.js" type="text/javascript"></script>

    <script src="style/jquery.messager.js" type="text/javascript"></script>

    <link href="style/zzsc.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            color: #FF3300;
        }
    </style>
<script>
    var times = 1;

    function clock() {
        var result = "error";
        $.ajax({
            type: 'get',
            url: "tools/Alarm.aspx", //
            success: function(result) {
                checkResult(result);
            }
        });
    }

    function checkResult(result) {
        var music = document.getElementById("bgMusic");
        if (result == "0") {
            music.pause();
            //ִ�ж�ʱ����
            if (times < 50) {
                setTimeout("clock();", 10000);
                times++;
            }
           
        } else if (result == "1") {
        
        //ִ�ж�ʱ����
        if (music.paused) {
            music.play();
            
        } else {
            music.pause();
           
        }

        if (times < 50) {
            setTimeout("clock();", 10000);
            times++;
        }
            $("#codem").hide();
            $("#res").show();
        } else if (result == "ERR1") {
            $("#res .ti").html("��������");
            $("#res").show();
        }
        else if (result == "ERR2") {
            $("#res .ti").html("�����ڣ�");
            $("#res").show();
        }
    }
   
    $(document).ready(function() {
        setTimeout("clock();", 10000);
    });
   
</script>
<script>
function myrefresh(){
window.location.reload();
}
setTimeout('myrefresh()',500000); //ָ��1��ˢ��һ��
</script>
</head>
<body style="margin-top: 0px;">
<audio id="bgMusic" src="/Prompt/4331.wav"  loop="loop"></audio>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td rowspan="2" align="center" valign="middle" style="height: 40px; width: 150px;">
                <a href="index.aspx" target="rightframe">
                    <img src="style/images/logo.gif" alt="��̨����ϵͳ" border="0" /></a></td>
            <td colspan="2" style="padding-right: 10px; margin-top: 0px; line-height: 28px; height: 28px;text-align: right;">
                &nbsp;���ã�<strong><%=username %></strong>����ӭʹ�ú�̨����ϵͳ</td>
        </tr>
        <tr style="background-image:url(style/images/bg_top.gif)">
            <td >
                <div class="toptitle" id="navigation">
                    <a href="#" onclick="parent.left.disp(1);return false;">��������</a>| 
                    <a href="#" onclick="parent.left.disp(2);return false;">��������</a>| 
                    <a href="#" onclick="parent.left.disp(6);return false;">ͳ�Ʒ���</a>| 
                    <a href="#" onclick="parent.left.disp(3);return false;">�ӿڹ���</a>|
                    <a href="#" onclick="parent.left.disp(4);return false;">�̻������</a>| 
                    <a href="#" onclick="parent.left.disp(5);return false;">�������</a>| 
                    <a href="#" onclick="parent.left.disp(7);return false;">��˽����</a>
                </div>
            </td>
            <td align="right">
                <div class="toptitle_r">
                    <a href="index.aspx" target="rightframe">ϵͳ���</a>|
                    <a href="ChangePwd.aspx" target="rightframe">�޸�����</a>|
                    <a href="Logout.aspx" onclick="return confirm('��ȷ��Ҫ�˳���')">�˳�</a></div>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="topline">
            </td>
        </tr>
    </table>
</body>
</html>
