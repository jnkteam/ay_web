
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<%=ADMIN_URI%>/style/admin/dist/img/en2.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=username %></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
           <!-----------Menu------------->
            <%=treeView %>
           <!-----------Menu------------->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>