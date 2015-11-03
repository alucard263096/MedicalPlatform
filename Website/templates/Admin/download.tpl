<{include file="$smarty_root/Admin/header.tpl" }>

  <script type="text/javascript" src="<{$rootpath}>/js/datatable/js/jquery.dataTables.js"></script>
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_page.css" media="screen" rel="stylesheet" />
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_table.css" media="screen" rel="stylesheet" />
  
  <script type="text/javascript" src="<{$rootpath}>/js/ajaxfileupload.js"></script>
<div class='supperheader'>
下载管理
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
		<td>文件名:</td>
		<td>
			<input id='c_filename' value='' type='text' />
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
          <th align='center'>操作</th>
          <th align='center'></th>
          <th align='center'>栏目</th>
          <th align='center'>文件</th>
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
		width:1000,
		height:700
	});
		
	$("#search").click(function(){
		$("#dev_result").show();
		
		var filename=$("#c_filename").val();
		var status=$("#c_status").val();
		
		
		
		$("#ListDiv").load("download.action.php",
							{
							"action":"search",
							"filename":filename,
							"status":status
							},
							function(data){
							
								oTable = $('#result').dataTable({"oLanguage":oLanguage} );
								
							});
		
	});
	
	$("#new").click(function(){

		$("#details").load('download_detail.php',function(){
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
		
		$.post("download.action.php",{"action":"delete","list":list},function(data){
			
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
		$("#details").load('download_detail.php',{"id":id},function(){
			$("#details").dialog('open');
		});
}

function upload(fid)
{
	if($.trim($("#ffile_"+fid).val())!="")
	{
		$(".detail_button").ajaxStart(function(){
			$(".detail_button").attr("disabled",true);
		})
		.ajaxComplete(function(){
			$(".detail_button").attr("disabled",false);
		});
		$.ajaxFileUpload
		(
			{
				"url":'download.action.php?action=upload&fid='+fid,
				"secureuri":false,
				"fileElementId":"ffile_"+fid,
				"dataType": 'text',
				"success": function(data, status)
				{
					if(data.substring(0,7)=="success"){
						str=data.substring(7,data.length);
						$("#ffilename_"+fid).val(str.split('|~~|')[1]);
						$("#flength_"+fid).val(str.split('|~~|')[0]);
						$("#dc_"+fid).text(str.split('|~~|')[1]).attr("href","<{$rootpath}>/dc.php?filename="+str.split('|~~|')[1]);
					}else{
						alert("上传失败");
					}
				},
				"error": function(data, status, e)
				{
					//alert(e);
				}
			}
		);
	}
}


</script>
<{include file="$smarty_root/Admin/footer.tpl" }>