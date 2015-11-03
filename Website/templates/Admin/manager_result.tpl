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
          <th align='center'>管理省份</th>
          <th align='center'>状态</th>
          <th align='center'>创建人</th>
          <th align='center'>创建日期</th>
          <th align='center'>修改人</th>
          <th align='center'>修改日期</th>
        </tr>
      </thead>
      <tbody >
      	<{foreach from=$result item=rs}>
      	<tr>
      		<td align='center'><input onclick='detail(<{$rs.id}>)' value='编辑' type='button' /></td>
      		<td align='center'><div style='width:10px;'><input type='checkbox' value='<{$rs.id}>' class='listckb' /></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.chname}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.engname}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.position}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.tel}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.QQ}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.email}></div></td>
      		<td align='center'><div style='width:150px;'><{$rs.address}></div></td>
      		<td align='center'><div class='provincelist' style='width:150px;'><{$rs.provinces}></div></td>
      		<td align='center'><div style='width:50px;'><{if $rs.status=='A'}>启用<{else}>不启用<{/if}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.created_username}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.created_date}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.updated_username}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.updated_date}></div></td>
      	</tr>
      	<{/foreach}>
      </tbody>
    </table>
    <script>
    $(document).ready(function(){

        var arrprovince=new Array();
        <{foreach from=$provincelist item=prs}>
        arrprovince["<{$prs.spell}>"]="<{$prs.provinceName}>";
		<{/foreach}>

		
		$(".provincelist").each(function(){
			var provincestr=$(this).text();
			var arr=provincestr.split(",");
			var nstr="";
			var isFirst=true;
			for(var i=0;i<arr.length;i++){
				if($.trim(arr[i])!=""){
					if(isFirst==false){
						nstr=nstr+",";
					}
					isFirst=false;
					nstr=nstr+arrprovince[arr[i]];
				}
			}
			$(this).text(nstr);
		});

    });
    
    
    </script>