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
      	<{foreach from=$result item=rs}>
      	<tr>
      		<td align='center'><input onclick='detail(<{$rs.id}>)' value='编辑' type='button' /></td>
      		<td align='center'><div style='width:10px;'><input type='checkbox' value='<{$rs.id}>' class='listckb' /></div></td>
      		<td align='center'><div style='width:200px;'><{$rs.name}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.type_name}></div></td>
      		<td align='center'><div style='width:150px;'><{$rs.tel}></div></td>
      		<td align='center'><div style='width:150px;'><{$rs.mobile}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.contacter}></div></td>
      		<td align='center'><div style='width:200px;'><{$rs.address}></div></td>
      		<td align='center'><div style='width:50px;'><{if $rs.status=='A'}>启用<{else}>不启用<{/if}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.created_username}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.created_date}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.updated_username}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.updated_date}></div></td>
      	</tr>
      	<{/foreach}>
      </tbody>
    </table>