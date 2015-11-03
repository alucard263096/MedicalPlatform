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
新闻管理
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
		<td>标题:</td>
		<td>
			<input id='c_title' value='' type='text' />
		</td>
		<td>导读:</td>
		<td>
			<input id='c_summary' value='' type='text' />
		</td>
	</tr>
	<tr>
		<td>发布日期:</td>
		<td>
			<label for="from">从</label>
<input type="text" id="c_from" name="from">
<label for="to">到</label>
<input type="text" id="c_to" name="to">
		</td>
		<td>状态:</td>
		<td>
			<select id='c_status'>
				<option value=''>--请选择--</option>
				<option value='A'>启用</option>
				<option value='I'>不启用</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan='4' align='left'>
			<input id='search' value='搜索' type='button'  class='submit'/>
			<{if $sysA=="0"}>
			<input id='new' value='新增' type='button'  class='submit'/>
			<{/if}>
			<{if $sysD=="0"}>
			<input id='delete' value='删除' type='button' class='submit' />
			<{/if}>
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
          <th align='center'>操作</th>
          <th align='center'></th>
          <th align='center'>标题</th>
          <th align='center'>发布日期</th>
          <th align='center'>导读</th>
          <th align='center'>状态</th>
          <th align='center'>创建人</th>
          <th align='center'>创建日期</th>
          <th align='center'>修改人</th>
          <th align='center'>修改日期</th>
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

	$( "#c_from" ).datepicker({
	      defaultDate: "+1w",
	      changeMonth: true,
	      numberOfMonths: 3,
	      dateFormat:"yy-mm-dd",
	      onClose: function( selectedDate ) {
	        $( "#c_to" ).datepicker( "option", "minDate", selectedDate );
	      }
	    });
	    $( "#c_to" ).datepicker({
	      defaultDate: "+1w",
	      changeMonth: true,
	      numberOfMonths: 3,
	      dateFormat:"yy-mm-dd",
	      onClose: function( selectedDate ) {
	        $( "#c_from" ).datepicker( "option", "maxDate", selectedDate );
	      }
	    });




	
	//oTable = $('#result').dataTable({"oLanguage":oLanguage} );
	$("#dev_result").hide();
	
	$('#details').dialog({
		autoOpen: false,
		modal: true,
		width:850,
		height:650
	});
		
	$("#search").click(function(){
		$("#dev_result").show();
		
		var title=$("#c_title").val();
		var summary=$("#c_summary").val();
		var from=$("#c_from").val();
		var to=$("#c_to").val();
		var status=$("#c_status").val();
		
		
		
		$("#ListDiv").load("news.action.php",
							{
							"action":"search",
							"title":title,
							"summary":summary,
							"from":from,
							"to":to,
							"status":status
							},
							function(data){
							
								oTable = $('#result').dataTable({"oLanguage":oLanguage} );
								
							});
		
	});
	
	$("#new").click(function(){

		$("#details").load('news_detail.php',function(data){
			$("#details").dialog('open');
		});
		
	});
	
	$("#delete").click(function(){

		var list="";
		$.each($(".listckb"),function(){
			if($(this).prop("checked"))
			{
				list+=$(this).val()+",";
			}
		});
		
		$.post("news.action.php",{"action":"delete","list":list},function(data){
			
			if(data=="success")
			{
				MsgInfo("更新成功！");
				$("#search").click();
			}
			else
			{
				MsgError("更新失败！");
			}
			
		});
	});
});
function detail(id)
{
	$("#details").dialog('open');
		$("#details").load('news_detail.php',{"id":id},function(){
			$("#details").dialog('open');
		});
}



</script>
<{include file="$smarty_root/Admin/footer.tpl" }>