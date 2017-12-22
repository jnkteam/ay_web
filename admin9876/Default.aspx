<%@ page language="C#" autoeventwireup="True" inherits="OriginalStudio.WebUI.Manage.Default" Codebehind="Default.aspx.cs" %>
<!-----------------header---------------->
 <!-- #include file="./Top.aspx" -->
<!-----------------header---------------->
<!-----------------left------------------>
 <!-- #include file="./Left.aspx" -->
<!-----------------left------------------>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"><div id="top-alert" class="fixed alert alert-error" style="display:none">
                <button onclick="closeTopAlert()" class="close fixed" >&times;</button>
                <div class="alert-content"></div>
</div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        欢迎使用
        <small><%=PlatformName%></small>
      </h1>
      <ol class="breadcrumb">

      </ol>
    </section>

    <!-- Main content -->

    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>合计</h3>

              <p>总 <%=合计[0]%> 笔 / 成功<span style="color: #b7f026;font-weight: bold"> <%=合计[1]%></span> 笔</p>
              <p>总 <%=合计[2]%> 元 /  利润<span style="color: #b81550;font-weight: bold"> <%=合计[3]%></span> 元</p>
            </div>
            <div class="icon">
              <i class="ion ion-podium"></i>
            </div>
             <a href="#" class="small-box-footer">&nbsp;</a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
             <h3>网银</h3>

                           <p>总 <%=网银[0]%> 笔 / 成功<span style="color: #b7f026;font-weight: bold"> <%=网银[1]%></span> 笔</p>
                           <p>总 <%=网银[2]%> 元 /  利润<span style="color: #b81550;font-weight: bold"> <%=网银[3]%></span> 元</p>
            </div>
            <div class="icon">
              <i class="ion ion-playstation"></i>
            </div>
             <a href="#" class="small-box-footer">&nbsp;</a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>支付宝</h3>

                            <p>总 <%=支付宝[0]%> 笔 / 成功<span style="color: #b7f026;font-weight: bold"> <%=支付宝[1]%></span> 笔</p>
                            <p>总 <%=支付宝[2]%> 元 /  利润<span style="color: #b81550;font-weight: bold"> <%=支付宝[3]%></span> 元</p>
            </div>
            <div class="icon">
              <i class="ion ion-ipad"></i>
            </div>
            <a href="#" class="small-box-footer">&nbsp;</a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>微信</h3>

                            <p>总 <%=微信[0]%> 笔 / 成功<span style="color: #b7f026;font-weight: bold"> <%=微信[1]%></span> 笔</p>
                            <p>总 <%=微信[2]%> 元 /  利润<span style="color: #b81550;font-weight: bold"> <%=微信[3]%></span> 元</p>
            </div>
            <div class="icon">
              <i class="ion ion-chatbubbles"></i>
            </div>
             <a href="#" class="small-box-footer">&nbsp;</a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <section class="col-lg-7 connectedSortable">



 <!-- Map box -->
          <div class="box box-solid bg-light-blue-gradient">
            <div class="box-header">
              <!-- tools box -->
              <div class="pull-right box-tools">
                <!--<button type="button" class="btn btn-primary btn-sm daterange pull-right" data-toggle="tooltip"-->
                        <!--title="Date range">-->
                  <!--<i class="fa fa-calendar"></i></button>-->
                <button type="button" class="btn btn-primary btn-sm pull-right" data-widget="collapse"
                        data-toggle="tooltip" title="Collapse" style="margin-right: 5px;">
                  <i class="fa fa-minus"></i></button>
              </div>
              <!-- /. tools -->

              <i class="fa fa-map-marker"></i>

              <h3 class="box-title">
                Visitors
              </h3>
            </div>
            <div class="box-body">
              <div id="world-map" style="height: 250px; width: 100%;"></div>
            </div>
            <!-- /.box-body-->
            <div class="box-footer no-border">
              <div class="row">
                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                  <div id="sparkline-1"></div>
                  <div class="knob-label">Visitors</div>
                </div>
                <!-- ./col -->
                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                  <div id="sparkline-2"></div>
                  <div class="knob-label">Online</div>
                </div>
                <!-- ./col -->
                <div class="col-xs-4 text-center">
                  <div id="sparkline-3"></div>
                  <div class="knob-label">Exists</div>
                </div>
                <!-- ./col -->
              </div>
              <!-- /.row -->
            </div>
          </div>
          <!-- /.box -->



        </section>
        <!-- /.Left col -->
        <!-- right col (We are only adding the ID to make the widgets sortable)-->
        <section class="col-lg-5 connectedSortable">





          <!-- Calendar -->
          <div class="box box-solid bg-green-gradient">
            <div class="box-header">
              <i class="fa fa-calendar"></i>

              <h3 class="box-title">Calendar</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <!-- button with a dropdown -->
                <div class="btn-group">
                  <!--<button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown">-->
                    <!--<i class="fa fa-bars"></i></button>-->
                  <ul class="dropdown-menu pull-right" role="menu">
                    <li><a href="#">Add new event</a></li>
                    <li><a href="#">Clear events</a></li>
                    <li class="divider"></li>
                    <li><a href="#">View calendar</a></li>
                  </ul>
                </div>
                <button type="button" class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <!--<button type="button" class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i>-->
                <!--</button>-->
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <!--The calendar -->
              <div id="calendar" style="width: 100%"></div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-black">
              <div class="row">
                <div class="col-sm-6">
                  <!-- Progress bars -->
                  <div class="clearfix">
                    <span class="pull-left">Task #1</span>
                    <small class="pull-right">90%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 90%;"></div>
                  </div>

                  <div class="clearfix">
                    <span class="pull-left">Task #2</span>
                    <small class="pull-right">70%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 70%;"></div>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                  <div class="clearfix">
                    <span class="pull-left">Task #3</span>
                    <small class="pull-right">60%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 60%;"></div>
                  </div>

                  <div class="clearfix">
                    <span class="pull-left">Task #4</span>
                    <small class="pull-right">40%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 40%;"></div>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
          </div>
          <!-- /.box -->

        </section>
        <!-- right col -->
      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<!-----------------footer------------------>
 <!-- #include file="./Footer.aspx" -->
<!-----------------footer------------------>