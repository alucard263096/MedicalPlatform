<{include file="$smarty_root/Admin/header.tpl" }>

  <script type="text/javascript" src="<{$rootpath}>/js/datatable/js/jquery.dataTables.js"></script>
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_page.css" media="screen" rel="stylesheet" />
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_table.css" media="screen" rel="stylesheet" />
  

  
	
<div class='supperheader'>
分区经理管理
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
		<td>中文名:</td>
		<td>
			<input id='c_chname' value='' type='text' />
		</td>
		<td>英文名:</td>
		<td>
			<input id='c_engname' value='' type='text' />
		</td>
	</tr>
	<tr>
		<td>职务:</td>
		<td>
			<select id='c_position'>
				<option value=''>--请选择--</option>
				<{foreach from=$positionlist item=rs}>
				<option value='<{$rs.position}>'><{$rs.position}></option>
				<{/foreach}>
			</select>
		</td>
		<td>电话:</td>
		<td>
			<input id='c_tel' value='' type='text' />
		</td>
	</tr>
	<tr>
		<td>qq:</td>
		<td>
			<input id='c_qq' value='' type='text' />
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
			<input id='search' value='搜索' type='button' class='submit' />
			<{if $sysA=="0"}>
			<input id='new' value='新增' type='button'  class='submit'/>
			<{/if}>
			<{if $sysD=="0"}>
			<input id='delete' value='删除' type='button'  class='submit'/>
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
          <th align='center'>中文名</th>
          <th align='center'>英文名</th>
          <th align='center'>职位</th>
          <th align='center'>电话</th>
          <th align='center'>QQ</th>
          <th align='center'>邮箱</th>
          <th align='center'>地址</th>
          <th align='center'>所属省份</th>
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
		
		var chname=$("#c_chname").val();
		var engname=$("#c_engname").val();
		var position=$("#c_position").val();
		var tel=$("#c_tel").val();
		var qq=$("#c_qq").val();
		var status=$("#c_status").val();
		
		
		
		$("#ListDiv").load("manager.action.php",
							{
							"action":"search",
							"chname":chname,
							"engname":engname,
							"position":position,
							"tel":tel,
							"qq":qq,
							"status":status
							},
							function(data){
							
								oTable = $('#result').dataTable({"oLanguage":oLanguage} );
								
							});
		
	});
	
	$("#new").click(function(){

		$("#details").load('manager_detail.php',function(data){
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
		
		$.post("manager.action.php",{"action":"delete","list":list},function(data){
			
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
		$("#details").load('manager_detail.php',{"id":id},function(){
			$("#details").dialog('open');
		});
}



</script>
<{include file="$smarty_root/Admin/footer.tpl" }>