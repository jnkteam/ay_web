<%@ Page Language="C#" AutoEventWireup="true" Codebehind="SingleDayHourChart.aspx.cs" Inherits="OriginalStudio.WebUI.Manage.Stat.SingleDayHourChart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>分时数据</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    <link href="../../charts/css/jquery-ui-1.10.4.css" rel="stylesheet" type="text/css" />
    <link href="../../charts/css/jquery.jqChart.css" rel="stylesheet" type="text/css" />
    <link href="../../charts/css/jquery.jqRangeSlider.css" rel="stylesheet" type="text/css" />
    <link href="../../charts/css/styles.css" rel="stylesheet" type="text/css" />
    <link href="../../charts/js/jquery-easyui-1.4.5/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../charts/js/jquery-easyui-1.4.5/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../../charts/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="../../charts/js/jquery.jqChart.min.js" type="text/javascript"></script>
    <script src="../../charts/js/jquery.jqRangeSlider.min.js" type="text/javascript"></script>
    <script src="../../charts/js/jquery.mousewheel.js" type="text/javascript"></script>
    <script src="../../charts/js/LoadData.js" type="text/javascript"></script>
    <script src="../../charts/js/layer/layer.js" type="text/javascript"></script>
    <script src="../../charts/js/laydate/laydate.js" type="text/javascript"></script>
    <script src="../../charts/js/jquery-easyui-1.4.5/jquery.easyui.min.js" type="text/javascript"></script>
    <script  language="javascript" type="text/javascript">
        var cusDay = '2017-01-26';
        var custID = 0;                 //客户序号
        var arHourVol = [];        //总成交量
        var arHourProfit = [];     //总利润
        var arHourCnt = [];        //总订单数

        function InitVal() {
            //清空
            arHourVol.splice(0, arOrderVol.length);
            arHourProfit.splice(0, arOrderProfit.length);
            arHourCnt.splice(0, arOrderCnt.length);
        }

        function Init_jqChart() {
            $('#jqHourChart').jqChart({
                title: { text: '<%# gDay %>订单分时数据统计【<%# gCustID %>】' },
                animation: { duration: 1 },
                shadows: {
                    enabled: true
                },
                series: [
                    {
                        labels: {
                            font: '14px 微软雅黑',
                            fillStyle: 'red'
                        },
                        type: 'column',
                        title: '交易量',
                        fillStyle: '#418CF0',
                        data: arHourVol    //成交量
                    }
                ],
            });

            $('#jqHourProfitChart').jqChart({
                animation: { duration: 1 },
                shadows: {
                    enabled: true
                },
                series: [
                    {
                        labels: {
                            font: '14px 微软雅黑',
                            fillStyle: 'red'
                        },
                        type: 'column',
                        title: '利润',
                        fillStyle: '#8B0A50',
                        data: arHourProfit    //利润
                    }
                ]
            });

            $('#jqHourCntChart').jqChart({
            animation: { duration: 1 },
            shadows: {
                enabled: true
            },
            series: [
                {
                    labels: {
                        font: '14px 微软雅黑',
                        fillStyle: 'red'
                    },
                    type: 'column',
                    title: '订单数',
                    fillStyle: '#CD950C',
                    data: arHourCnt    //订单数
                }
            ]
            });
        }

        function ShowData() {
            cusDay = getQueryString("day");
            custID = getQueryString("userid");
            if (custID == "") custID = "0";
            $.ajax({
                method: 'GET',
                cache: false,
                contentType: "application/json",
                url: '../../charts/handler/payApi.ashx?api=9&day=' + cusDay + '&userid=' + custID,
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                beforeSend: function () {
                    $("#ajax_loading").show();
                },
                success: function (data, textStatus) {
                    data = JSON.parse(data);
                    $("#ajax_loading").hide();
                    if (data['success']) {
                        //alert("OK");
                        arHourVol.splice(0, arHourVol.length);
                        arHourProfit.splice(0, arHourProfit.length);
                        arHourCnt.splice(0, arHourCnt.length);

                        for (var i = 0; i < data['data'].length; i++) {
                            date = data['data'][i]['小时'];
                            arHourVol.push([date, changeTwoDecimal(data['data'][i]['总成交量'])]);
                            arHourProfit.push([date, changeTwoDecimal(data['data'][i]['利润'])]);
                            arHourCnt.push([date, changeTwoDecimal(data['data'][i]['订单数量'])]);
                        };
                        $('#jqHourChart').jqChart('update');
                        $('#jqHourProfitChart').jqChart('update');
                        $('#jqHourCntChart').jqChart('update');
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    todayStr = '';
                }
            });
        };
        //==========================================
        $(document).ready(function () {
            InitVal();
        });
    </script>
</head>
<body onload="Init_jqChart();ShowData()">
    <form id="form1" runat="server"></form>
    <div id="ajax_loading" style="position:absolute; top:0px; right:0px;">
        <img id="loading" src="../../charts/img/loading.gif" alt="加载" />　
    </div>
    <div style="width: 100%;text-align:center;">
        <div id="jqHourChart" style="width: 100%; height: 300px;"></div>
        <div id="jqHourProfitChart" style="width: 100%; height: 300px;"></div>
        <div id="jqHourCntChart" style="width: 100%; height: 300px;"></div>
    </div>
</body>
</html>
