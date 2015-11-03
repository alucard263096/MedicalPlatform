<{include file="$smarty_root/Admin/header.tpl" }>

  <script type="text/javascript" src="<{$rootpath}>/js/datatable/js/jquery.dataTables.js"></script>
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_page.css" media="screen" rel="stylesheet" />
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_table.css" media="screen" rel="stylesheet" />
  

<div class='supperheader'>
用户管理
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
		<td>姓名:</td>
		<td>
			<input id='user_name' value='' type='text' />
		</td>
		<td>邮件:</td>
		<td>
			<input id='email' value='' type='text' />
		</td>
	</tr>
	<tr>
		<td>状态:</td>
		<td>
			<select id='status'>
				<option value=''>--请选择--</option>
				<option value='A'>启用</option>
				<option value='I'>不启用</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan='4' align='left'>
			<input id='search' value='搜索' type='button' class='submit' />
			<{if $sysA=="0"}>
			<input id='new' value='新增' type='button' class='submit' />
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
          <th align='center'></th>
          <th align='center'>登录名</th>
          <th align='center'>名字</th>
          <th align='center'>电子邮件</th>
          <th align='center'>状态</th>
          <th align='center'>权限</th>
          <th align='center'>创建日期</th>
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
		
		var user_name=$("#user_name").val();
		var email=$("#email").val();
		var status=$("#status").val();
		
		
		
		$("#ListDiv").load("user.action.php",
							{
							"action":"search",
							"user_name":user_name,
							"email":email,
							"status":status
							},
							function(data){
							
								oTable = $('#result').dataTable({"oLanguage":oLanguage} );
								
							});
		
	});
	
	$("#new").click(function(){

		$("#details").load('user_detail.php',function(){
			$("#details").dialog('open');
		});
		
	});
	
	$("#delete").click(function(){

		var user_list="";
		$.each($(".listckb"),function(){
			if($(this).prop("checked"))
			{
				user_list+=$(this).val()+",";
			}
		});
		
		$.post("user.action.php",{"action":"delete","user_list":user_list},function(data){
			
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
function detail(user_id)
{
	$("#details").dialog('open');
		$("#details").load('user_detail.php',{"user_id":user_id},function(){
			$("#details").dialog('open');
		});
}
</script>
<{include file="$smarty_root/Admin/footer.tpl" }>