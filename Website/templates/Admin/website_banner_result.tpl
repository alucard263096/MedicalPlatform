<table id="banner_result" class="display" width="100%" border="0" cellspacing="0" cellpadding="0">
      <thead>
        <tr>
          <th align='center'>操作</th>
          <th align='center'></th>
          <th align='center'>序号</th>
          <th align='center'>口号</th>
          <th align='center'>标签</th>
          <th align='center'>标题</th>
          <th align='center'>图片</th>
          <th align='center'>状态</th>
        </tr>
      </thead>
      <tbody >
      	<{foreach from=$result item=rs}>
      	<tr>
      		<td align='center'><input onclick='editBanner(<{$rs.id}>)' value='编辑' type='button' /></td>
      		<td align='center'><div style='width:10px;'><input type='checkbox' value='<{$rs.id}>' class='banner_listckb' /></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.seq}></div></td>
      		<td align='center'><div style='width:300px;'><{$rs.slogan}></div></td>
      		<td align='center'><div style='width:150px;'><{$rs.label}></div></td>
      		<td align='center'><div style='width:150px;'><{$rs.title}></div></td>
      		<td align='center'><div style='width:150px;'><img src='<{$rootpath}>/upload/index/<{$rs.pic}>' height='50px'></div></td>
      		<td align='center'><div style='width:100px;'><{if $rs.status=='A'}>启用<{else}>不启用<{/if}></div></td>
      	</tr>
      	<{/foreach}>
      </tbody>
    </table>