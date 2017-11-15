<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <title>提示信息</title>

    <style type="text/css">
        * {
            padding: 0;
            margin: 0;
            font-size: 16px;
            font-family: '微软雅黑';
        }

        a:link, a:visited {
            text-decoration: none;
            color: #00b6f4;
            font-size:14px;
        }

        a:hover, a:active {
            color: #ff6600;
            text-decoration: underline;
        }

        .showMsg {
            border: 1px solid #4bcbf7;
            border-radius: 5px;
            zoom: 1;
            width: 431px;
            height: 215px;
            position: absolute;
            top: 44%;
            left: 50%;
            margin: -108px 0 0 -216px;
        }

            .showMsg h5 {
                /*background-image: url(/Content/User/images/msg_img/msg.png);*/
                background-repeat: no-repeat;
                color: #fff;
                padding-left: 35px;
                height: 25px;
                line-height: 26px;
                *line-height: 28px;
                overflow: hidden;
                font-size: 14px;
                text-align: left;
            }

            .showMsg .content {
                padding: 46px 12px 10px 45px;
                height: 64px;
                text-align: left;
            }

            .showMsg .bottom {
                width: 431px;
                height: 70px;
                background: url(/Content/User/images/msg_img/oo_bg.jpg) center no-repeat;
                line-height: 26px;
                *line-height: 30px;
                text-align: center;
                position: relative;
            }

                .showMsg .bottom span {
                    display: block;
                    width: 158px;
                    height: 24px;
                    background: #fff;
                    position: absolute;
                    left: 50%;
                    top: 50%;
                    margin: -12px 0 0 -79px;
                    font-weight: bold;
                }

            .showMsg .ok, .showMsg .guery {
                background: url(/Content/User/images/msg_img/msg_bg.png) no-repeat 0px -560px;
            }

            .showMsg .guery {
                background-position: left -460px;
            }
    </style>

</head>
<body>
    <div class="showMsg" style="text-align: center; background-color: white;">
        <h5>提示信息</h5>
        <div class="content guery" style="display: inline-block; display: -moz-inline-stack; zoom: 1; *display: inline; max-width: 280px">敬请期待</div>
        <div class="bottom">
            <span><a href="javascript:history.back();" >[点这里返回上一页]</a></span>
        </div>
    </div>
    <script type="text/javascript">
        function close_dialog() {
            window.top.location.reload(); window.top.art.dialog({ id: "" }).close();
        }
    </script>
</body>
</html>

