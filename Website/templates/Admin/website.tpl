<{include file="$smarty_root/Admin/header.tpl" }>
<style>
.ui-widget-content{
border:0px;
}
</style>

  <script type="text/javascript" src="<{$rootpath}>/js/datatable/js/jquery.dataTables.js"></script>
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_page.css" media="screen" rel="stylesheet" />
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_table.css" media="screen" rel="stylesheet" />

  <script type="text/javascript" src="<{$rootpath}>/js/ajaxfileupload.js"></script>
<div class='supperheader'>
网站管理
  </div>
  <div id="tabs">
  <ul>
    <li><a href="#tabs-1">网站基本设置</a></li>
    <li><a href="#tabs-2">首页宣传图</a></li>
    <li><a href="#tabs-3">其它</a></li>
  </ul>
  <div id="tabs-1">
    <{include file="$smarty_root/Admin/website_basic.tpl" }>
  </div>
  <div id="tabs-2">
    <{include file="$smarty_root/Admin/website_banner.tpl" }>
  </div>
  <div id="tabs-3">
    	暂无，如有需要，请联系开发人员。
  </div>
</div>

<div style='display:none;'>
<div id='details'></div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$( "#tabs" ).tabs({
	      collapsible: true
	    });
	$('#details').dialog({
		autoOpen: false,
		modal: true,
		width:900,
		height:600
	});
});



</script>



<{include file="$smarty_root/Admin/footer.tpl" }>