<div id="header">

			<div class="logo">

				<a href="<{$rootpath}>/Admin/home.php"><img src="<{$rootpath}>/images/logo.gif" width="303" height="43" /></a>

			</div>

			
			<div id="menu">

				<ul name="menu">

				</ul>

			</div>

			<p><a href="<{$rootpath}>/Admin/logout.php">退出管理</a> <a href="<{$rootpath}>/Admin/home.php">后台首页</a> <a href="<{$rootpath}>/index.php" target='_blank'>前台</a> <span>您好 <label class='bold'><{$sysUserName}></label></span></p>

		</div>

		<div id="info_bar">

			<label class="navindex"><a href="<{$rootpath}>/Admin/password.php">修改密码</a></label>

			<span class="nav_sec">

									</span>

		</div>



		<div id="admin_left">

			<ul class="submenu"></ul>

			<div id="copyright"></div>

		</div>

<script type="text/javascript">
$(document).ready(function(){
	//后台菜单创建

	var data = [<{$sysMenuJson}>];
var current = '<{$currentFunctionId}>';
var url='<{$rootpath}>/Admin/home.php';

initMenu(data,current,url);

$(".submenu li ul li a").each(function(){

	var vacc=null;
    if($(this).text().indexOf("加盟申请")>=0){
        vacc=$(this);
    }
    if(vacc!=null){
	$.post("requisition.action.php",
			  {
			    action:"getprocesscount"
			  },
			  function(data,status){
				  vacc.append("("+data+")");
			  });
    }
});

});
</script>

