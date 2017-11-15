<%@ Page Language="C#" AutoEventWireup="true" Codebehind="DayOrdersChart.aspx.cs" Inherits="KuaiCard.WebUI.Manage.Stat.DayOrdersChart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>成交订单日汇总</title>
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
        var days = 0;
        var fromdate = 0;
        var todate = 0;
        var auto = 1;


        var custID = 0;                 //客户序号
        var arOrderVol = [];        //总成交量
        var arOrderProfit = [];     //总利润
        var arOrderCnt = [];        //总订单数

        function InitVal() {
            auto = 1;
            var e = new Date().DateAdd('d', 1);
            var b = new Date('2017-01-01');
            fromdate = b.format("YYYY-MM-DD");
            todate = e.format("YYYY-MM-DD");
            $('#txtBeginDate').val(b.format("YYYY-MM-DD"));
            $('#txtEndDate').val(e.format("YYYY-MM-DD"));
            laydate.skin('danlan');
            laydate({
                elem: '#txtBeginDate',
                format: 'YYYY-MM-DD',
                festival: true,
                choose: function (datas) {
                    fromdate = datas;  //.replace(/-/gm, '');
                    ShowData();
                }
            });
            laydate({
                elem: '#txtEndDate',
                format: 'YYYY-MM-DD',
                festival: true,
                choose: function (datas) {
                    todate = datas;    //.replace(/-/gm, '');
                    ShowData();
                }
            });

            //清空
            arOrderVol.splice(0, arOrderVol.length);
            arOrderProfit.splice(0, arOrderProfit.length);
            arOrderCnt.splice(0, arOrderCnt.length);
        }

        function Init_jqChart() {
            $('#jqOrdersChart').jqChart({
                title: { text: '订单日数据统计' },
                animation: { duration: 1 },
                shadows: {
                    enabled: true
                },
                series: [
                    {
                        labels: {
                            font: '14px 微软雅黑',
                            fillStyle: 'red',
                            stringFormat : '%d'
                        },
                        type: 'column',
                        title: '交易量',
                        fillStyle: '#418CF0',
                        data: arOrderVol    //成交量
                    }
                ]
            });

            $('#jqOrdersChart').bind('dataPointMouseDown', function (e, data) {
                var tmp = formatDate(new Date(data.x.toString()), 'YYYY-MM-DD');
                window.open('SingleDayHourChart.aspx?day=' + tmp + "&userid=" + custID);
            });
                
            $('#jqOrdersProfitChart').jqChart({
                animation: { duration: 1 },
                shadows: {
                    enabled: true
                },
                series: [
                    {
                        labels: {
                            font: '14px 微软雅黑',
                            fillStyle: 'red',
                            stringFormat: '%d'
                        },
                        type: 'column',
                        title: '利润',
                        fillStyle: '#8B0A50',
                        data: arOrderProfit    //利润
                    }
                ]
            });

            $('#jqOrdersCntChart').jqChart({
            animation: { duration: 1 },
            shadows: {
                enabled: true
            },
            series: [
            {
                labels: {
                    font: '14px 微软雅黑',
                    fillStyle: 'red',
                    stringFormat: '%d'
                },
                type: 'column',
                title: '订单数',
                fillStyle: '#CD950C',
                data: arOrderCnt    //订单数
            }]
            });
        }

        function ShowData() {
            $.ajax({
                method: 'GET',
                cache: false,
                contentType: "application/json",
                url: '../../charts/handler/payApi.ashx?api=1&from=' + fromdate + '&to=' + todate + '&userid=' + custID,
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                beforeSend: function () {
                    $("#ajax_loading").show();
                },
                success: function (data, textStatus) {
                    data = JSON.parse(data);
                    $("#ajax_loading").hide();
                    if (data['success']) {
                        //alert("OK");
                        arOrderVol.splice(0, arOrderVol.length);
                        arOrderProfit.splice(0, arOrderProfit.length);
                        arOrderCnt.splice(0, arOrderCnt.length);

                        var sumOrderVol = 0;
                        var sumOrderProfit = 0;
                        var sumOrderCnt = 0;

                        var dtCount = data['data'].length;
                        for (var i = 0; i < dtCount; i++) {
                            var date = data['data'][i]['日期'];
                            arOrderVol.push([date, changeTwoDecimal(data['data'][i]['总成交量'])]);
                            arOrderProfit.push([date, changeTwoDecimal(data['data'][i]['利润'])]);
                            arOrderCnt.push([date, changeTwoDecimal(data['data'][i]['订单数量'])]);

                            sumOrderVol = sumOrderVol + changeTwoDecimal(data['data'][i]['总成交量']);
                            sumOrderProfit = sumOrderProfit + changeTwoDecimal(data['data'][i]['利润']);
                            sumOrderCnt = sumOrderCnt + changeTwoDecimal(data['data'][i]['订单数量']);
                        };
                        $('#jqOrdersChart').jqChart('update');
                        $('#jqOrdersProfitChart').jqChart('update');
                        $('#jqOrdersCntChart').jqChart('update');

                        //alert(sumOrderVol);
                        if (dtCount > 0) {
                            $('#spTotalVol').val(sumOrderVol);
                            $('#spTotalProfit').val(sumOrderProfit);
                        }
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
    <form id="form1" runat="server"><asp:HiddenField ID="hidTitle" runat="server" /></form>
    <div id="ajax_loading" style="position:absolute; top:0px; right:0px;">
        <img id="loading" src="../../charts/img/loading.gif" alt="加载" />　
    </div>
    <div style="margin-top:10px; margin-left:0px">
        <div id="top" style="width: 1400px; height: 40px;">
            <label><b>起始日期：</b></label><input id="txtBeginDate" type="text" class="txt" />　
            <label><b>截至日期：</b></label><input id="txtEndDate" type="text" class="txt" />　
            <label><b>客户：</b></label><input class="easyui-combobox" style="width:200px" id="user_roleid" data-options="
				                                                            url:'../../charts/handler/payApi.ashx?api=10',
				                                                            method:'get',
				                                                            valueField:'id',
				                                                            textField:'id',
				                                                            panelHeight:'350',
                                                                            onSelect: function(rec){  
                                                                                custID = rec.id; 
                                                                            }"/>　
            <input id="btnLoad" type="button" style="width:120px; height:30px;" value="查询" onclick="ShowData();" />　
            <label><b>总额:</b></label><input id="spTotalVol"  type="text" style="width:100px" />　　
            <label><b>利润:</b></label><input id="spTotalProfit"  type="text" style="width:100px" />
        </div>
    </div>	
    <div style="width: 100%;text-align:center;">
        <div id="jqOrdersChart" style="width: 100%; height: 300px;"></div>
        <div id="jqOrdersProfitChart" style="width: 100%; height: 300px;"></div>
        <div id="jqOrdersCntChart" style="width: 100%; height: 300px;"></div>
    </div> 
</body>
</html>
