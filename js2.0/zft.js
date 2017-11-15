!(function ($) {
    var sidebarToggle = function () {
        var $toggle = $('#sidebar-toggle'),
            $body = $('body'),
            closedCls = 'sidebar-closed';

        $toggle.on('click', function () {
            if ($body.hasClass(closedCls)) {
                $body.removeClass(closedCls);
            } else {
                $body.addClass(closedCls);
            }
        });
    };

    var clock = function () {
        var format = function (n) {
            return n <= 9 ? '0' + n : n;
        };

        var time = function () {
            var now = new Date();
            return format(now.getHours()) + ':' + format(now.getMinutes()) + ':' + format(now.getSeconds());
        };

        var modify = function () {
            $time.html(time());
        };

        var $time = $('#current-time');

        setInterval(modify, 1000);

        modify();
    };

    var calendar = function () {
        $('.laydate').on('click', function () {
           laydate();
        });
    };

    $(function () {
        sidebarToggle();

        clock();

        calendar();
    });
}(jQuery));