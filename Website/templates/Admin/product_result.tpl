<table id="result" class="display" width="100%" border="0" cellspacing="0" cellpadding="0">
      <thead>
        <tr>
          <th align='center'>操作</th>
          <th align='center'></th>
          <th align='center'>产品分类</th>
          <th align='center'>名称</th>
          <th align='center'>Logo</th>
          <th align='center'>序号</th>
          <th align='center'>简介</th>
          <th align='center'>详情</th>
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
      		<td align='center'><div style='width:100px;'><{$rs.category_name}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.name}></div></td>
      		<td align='center'><div style='width:100px;'><img src='<{$rootpath}>/upload/product/<{$rs.logo}>' height='50px'></div></td>
      		<td align='center'><div style='width:50px;'><{$rs.seq}></div></td>
      		<td align='center'><div style='width:200px;'><{$rs.summary}></div></td>
      		<td align='center'><div style='width:50px;'><a href='<{$rootpath}>/product/detail.php?id=<{$rs.id}>' target='_blank' style='color:blue'><strong>点击查看</strong></a></div></td>
      		<td align='center'><div style='width:50px;'><{if $rs.status=='A'}>启用<{else}>不启用<{/if}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.created_username}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.created_date}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.updated_username}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.updated_date}></div></td>
      	</tr>
      	<{/foreach}>
      </tbody>
    </table>