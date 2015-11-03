<table class="fieldsetContent">
	<tr>
		<td>说明：以下的资料管理仅用于首页的背景宣传图，只显示7条按序列显示的数据在首页，为保证效果请尽量控制图片的格式为：1300wX636h</td>
	</tr>
	<tr>
		<td align='left'>
			<{if $sysA=="0"}>
			<input id='banner_new' value='新增' type='button' class='submit' />
			<input id='banner_delete' value='删除' type='button' class='submit' />
			<{/if}>
		</td>
	</tr>
</table>

<div style='padding:10px;'>
  <form>
  <div id="loading_div" style="display:none" align="center"><img src="<{$rootpath}>/images/loading.gif" /></div>
  <div id="banner_ListDiv">
    </div>
  </form>
</div>

<script>
$(document).ready(function(){

	refreshBannerList();
	$("#banner_new").click(function(){
		editBanner("");
	});
	$("#banner_delete").click(function(){
		var list="";
		$.each($(".banner_listckb"),function(){
			if($(this).prop("checked"))
			{
				list+=$(this).val()+",";
			}
		});
		
		$.post("website.action.php",{"action":"deletebanner","list":list},function(data){
			if(data=="success")
			{
				MsgInfo("更新成功！");
				refreshBannerList();
			}
			else
			{
				MsgError("更新失败！");
			}
			
		});
	});
});
function refreshBannerList(){

	$("#banner_ListDiv").load("website.action.php",
						{
						"action":"bannerlist"
						},
						function(data){
						
							 $('#banner_result').dataTable({"oLanguage":oLanguage} );
							
						});
}

function editBanner(id)
{
	$("#details").dialog('open');
		$("#details").load('website.action.php',{"action":"editBanner","id":id},function(data){
			$("#details").dialog('open');
		});
}

function uploadBanner()
{
	if($.trim($("#banner_upload_file").val())!="")
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
				"url":'website.action.php?action=uploadbanner',
				"secureuri":false,
				"fileElementId":"banner_upload_file",
				"dataType": 'text',
				"success": function(data, status)
				{
					if(data.substring(0,7)=="success"){
						str=data.substring(7,data.length);
						$("#banner_detail_pic").val(str);
						$("#banner_detail_img").attr("src",'<{$rootpath}>/upload/index/'+str);
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