<table id="result" class="display" width="100%" border="0" cellspacing="0" cellpadding="0">
      <thead>
        <tr>
          <th align='center'>操作</th>
          <th align='center'></th>
          <th align='center'>序号</th>
          <th align='center'>栏目</th>
          <th align='center'>文件列表</th>
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
      		<td align='center'><div style='width:100px;'><{$rs.seq}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.name}></div></td>
      		<td align='center'>
	      		<div style='width:100px;'>
	      			<{foreach from=$rs.filelist item=file}>
	      			<div <{if $file.status =='I' }>style="color:#cccccc"<{/if}>><{$file.name}></div>
					<{/foreach}>
	      		</div></td>
      		<td align='center'><div style='width:100px;'><{if $rs.status=='A'}>启用<{else}>不启用<{/if}></div></td>
      		<td align='center'><div style='width:150px;'><{$rs.created_username}></div></td>
      		<td align='center'><div style='width:150px;'><{$rs.created_date}></div></td>
      		<td align='center'><div style='width:150px;'><{$rs.updated_username}></div></td>
      		<td align='center'><div style='width:150px;'><{$rs.updated_date}></div></td>
      	</tr>
      	<{/foreach}>
      </tbody>
    </table>