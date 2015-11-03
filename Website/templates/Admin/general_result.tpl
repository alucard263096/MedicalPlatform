<table id="result" class="display" width="100%" border="0" cellspacing="0" cellpadding="0">
      <thead>
        <tr>
          <th align='center'>操作</th>
          <th align='center'>名称</th>
          <th align='center'>位置</th>
          <th align='center'>修改人</th>
          <th align='center'>修改日期</th>
        </tr>
      </thead>
      <tbody >
      	<{foreach from=$result item=rs}>
      	<tr>
      		<td align='center'><input onclick='detail(<{$rs.id}>)' value='编辑' type='button' /></td>
      		<td align='center'><div style='width:100px;'><{$rs.name}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.position}></div></td>
      		<td align='center'><div style='width:150px;'><{$rs.updated_username}></div></td>
      		<td align='center'><div style='width:150px;'><{$rs.updated_date}></div></td>
      	</tr>
      	<{/foreach}>
      </tbody>
    </table>