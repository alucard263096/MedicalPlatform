<{include file="$smarty_root/Admin/header.tpl" }>

  <script type="text/javascript" src="<{$rootpath}>/js/datatable/js/jquery.dataTables.js"></script>
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_page.css" media="screen" rel="stylesheet" />
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_table.css" media="screen" rel="stylesheet" />
  

	<link rel="stylesheet" href="<{$rootpath}>/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<{$rootpath}>/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<{$rootpath}>/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<{$rootpath}>/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<{$rootpath}>/kindeditor/plugins/code/prettify.js"></script>
  
  <script type="text/javascript" src="<{$rootpath}>/js/ajaxfileupload.js"></script>
	
<div class='supperheader'>
供应商管理
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
			<input id='c_name' value='' type='text' />
		</td>
		<td>类型:</td>
		<td>
			<select id='c_type'>
				<option value=''>--请选择--</option>
				<{foreach from=$partnertype item=rs}>
				<option value='<{$rs.code}>'><{$rs.name}></option>
				<{/foreach}>
			</select>
		</td>
	</tr>
	<tr>
		<td>电话:</td>
		<td>
			<input id='c_tel' value='' type='text' />
		</td>
		<td>地址:</td>
		<td>
			<input id='c_address' value='' type='text' />
		</td>
	</tr>
	<tr>
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
          <th align='center'>名称</th>
          <th align='center'>类型</th>
          <th align='center'>电话</th>
          <th align='center'>手机</th>
          <th align='center'>联系人</th>
          <th align='center'>联系地址</th>
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
		width:900,
		height:900
	});
		
	$("#search").click(function(){
		$("#dev_result").show();
		
		var name=$("#c_name").val();
		var type=$("#c_type").val();
		var tel=$("#c_tel").val();
		var address=$("#c_address").val();
		var status=$("#c_status").val();
		
		
		
		$("#ListDiv").load("partner.action.php",
							{
							"action":"search",
							"name":name,
							"type":type,
							"tel":tel,
							"address":address,
							"status":status
							},
							function(data){
							
								oTable = $('#result').dataTable({"oLanguage":oLanguage} );
								
							});
		
	});
	
	$("#new").click(function(){

		$("#details").load('partner_detail.php',function(data){
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
		
		$.post("partner.action.php",{"action":"delete","list":list},function(data){
			
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
		$("#details").load('partner_detail.php',{"id":id},function(){
			$("#details").dialog('open');
		});
}

function upload()
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
				"url":'partner.action.php?action=uploadlogo',
				"secureuri":false,
				"fileElementId":"file",
				"dataType": 'text',
				"success": function(data, status)
				{
					if(data.substring(0,7)=="success"){
						str=data.substring(7,data.length);
						$("#detail_logo_file").val(str.split('|~~|')[1]);
						$("#detail_logo_img").attr("src","<{$rootpath}>/upload/partner/"+str.split('|~~|')[1]);
						
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


</script>
<{include file="$smarty_root/Admin/footer.tpl" }>