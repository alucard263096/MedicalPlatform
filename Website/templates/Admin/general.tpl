<{include file="$smarty_root/Admin/header.tpl" }>

  <script type="text/javascript" src="<{$rootpath}>/js/datatable/js/jquery.dataTables.js"></script>
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_page.css" media="screen" rel="stylesheet" />
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_table.css" media="screen" rel="stylesheet" />
  
  
  
	<link rel="stylesheet" href="<{$rootpath}>/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<{$rootpath}>/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<{$rootpath}>/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<{$rootpath}>/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<{$rootpath}>/kindeditor/plugins/code/prettify.js"></script>
  
<div class='supperheader'>
一般管理
  </div>
<div class="fieldset">搜索条件</div>
<table class="fieldsetContent">
	<tr>
		<td width="1%"><img src="<{$rootpath}>/images/onedot.gif" width="80" height="1" /></td>
		<td width="49%"><img src="<{$rootpath}>/images/onedot.gif" width="1" height="1" /></td>
		<td width="1%"><img src="<{$rootpath}>/images/onedot.gif" width="80" height="1" /></td>
		<td width="49%"><img src="<{$rootpath}>/images/onedot.gif" width="1" height="1" /></td>
	</tr>
	<tr>
		<td>名称:</td>
		<td>
			<input id='s_name' value='' type='text' />
		</td>
	</tr>
	<tr>
		<td colspan='4' align='left'>
			<input id='search' value='搜索' type='button' class='submit' />
		</td>
	</tr>
</table>
<div  id='dev_result' class="ui-layout-center" >
<div class="fieldset">结果</div>
<div style='padding:10px;'>
  <form>
  <div id="loading_div" style="display:none" align="center"><img src="<{$rootpath}>/images/loading.gif" /></div>
  <div id="ListDiv">
    <table id="result" class="display" width="100%" border="0" cellspacing="0" cellpadding="0">
      <thead>
        <tr>
          <th align='center'></th>
          <th align='center'>名称</th>
          <th align='center'>简介</th>
          <th align='center'>修改日期</th>
          <th align='center'>操作</th>
        </tr>
      </thead>
      <tbody >
      	
      </tbody>
    </table>
    </div>
  </form>
</div>
</div>
<div style='display:none;'>
<div id='details'></div>
</div>


<script type="text/javascript" charset="utf-8">
var oTable;

$(document).ready(function() {
	//oTable = $('#result').dataTable({"oLanguage":oLanguage} );
	$("#dev_result").hide();
	
	$('#details').dialog({
		autoOpen: false,
		modal: true,
		width:800,
		height:600
	});
		
	$("#search").click(function(){
		$("#dev_result").show();
		
		var s_name=$("#s_name").val();
		
		
		
		$("#ListDiv").load("general.action.php",
							{
							"action":"search",
							"name":s_name
							},
							function(data){
							
								oTable = $('#result').dataTable({"oLanguage":oLanguage} );
								
							});
		
	});
	
});
function detail(id)
{
	$("#details").dialog('open');
		$("#details").load('general_detail.php',{"id":id},function(){
			$("#details").dialog('open');
		});
}
</script>
<{include file="$smarty_root/Admin/footer.tpl" }>