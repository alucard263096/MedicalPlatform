<{include file="$smarty_root/Admin/header.tpl" }>

  <script type="text/javascript" src="<{$rootpath}>/js/datatable/js/jquery.dataTables.js"></script>
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_page.css" media="screen" rel="stylesheet" />
  <link type="text/css" href="<{$rootpath}>/js/datatable/css/demo_table.css" media="screen" rel="stylesheet" />
  
  <div class='supperheader'>
产品分类管理
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
		<td>申请人:</td>
		<td>
			<input id='c_name' value='' type='text' />
		</td>
		<td>电话:</td>
		<td>
			<input id='c_phone' value='' type='text' />
		</td>
	</tr>
	<tr>
		<td>QQ:</td>
		<td>
			<input id='c_qq' value='' type='text' />
		</td>
		<td>申请日期:</td>
		<td>
			<label >从</label><input type="text" id="c_from" name="from">
			<label >到</label><input type="text" id="c_to" name="to">
		</td>
	</tr>
	<tr>
		<td>公司名称:</td>
		<td>
			<input id='c_company_name' value='' type='text' />
		</td>
		<td>公司电话:</td>
		<td>
			<input id='c_company_phone' value='' type='text' />
		</td>
	</tr>
	<tr>
		<td>状态:</td>
		<td>
			<select id='c_status'>
				<option value='ALL'>--请选中--</option>
				<option value='P' selected="selected">未处理</option>
				<option value='A'>已处理</option>
				<option value='I'>不通过</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan='4' align='left'>
			<input id='search' value='搜索' type='button'  class='submit'/>
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
          <th align='center'>序号</th>
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
		width:900,
		height:600
	});


		
	$("#search").click(function(){
		$("#dev_result").show();
		
		var name=$("#c_name").val();
		var phone=$("#c_phone").val();
		var qq=$("#c_qq").val();
		var company_name=$("#c_company_name").val();
		var company_phone=$("#c_company_phone").val();
		var from=$("#c_from").val();
		var to=$("#c_to").val();
		var status=$("#c_status").val();
		
		
		
		$("#ListDiv").load("requisition.action.php",
							{
							"action":"search",
							"name":name,
							"phone":phone,
							"qq":qq,
							"company_name":company_name,
							"company_phone":company_phone,
							"from":from,
							"to":to,
							"status":status
							},
							function(data){
								oTable = $('#result').dataTable({"oLanguage":oLanguage} );
							});
		
	});
	
	$("#new").click(function(){

		$("#details").load('requisition_detail.php',function(data){
			$("#details").dialog('open');
		});
		
	});

	$("#search").click();
	
	$("#delete").click(function(){

		var list="";
		$.each($(".listckb"),function(){
			if($(this).prop("checked"))
			{
				list+=$(this).val()+",";
			}
		});
		
		$.post("requisition.action.php",{"action":"delete","list":list},function(data){
			
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
		$("#details").load('requisition_detail.php',{"id":id},function(data){
			$("#details").dialog('open');
		});
}

</script>
<{include file="$smarty_root/Admin/footer.tpl" }>