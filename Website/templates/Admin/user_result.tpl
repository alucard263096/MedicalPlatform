<table id="result" class="display" width="100%" border="0" cellspacing="0" cellpadding="0">
      <thead>
        <tr>
          <th align='center'>操作</th>
          <th align='center'></th>
          <th align='center'>登录名</th>
          <th align='center'>名字</th>
          <th align='center'>电子邮件</th>
          <th align='center'>状态</th>
          <th align='center'>权限</th>
          <th align='center'>创建日期</th>
          <th align='center'>修改日期</th>
        </tr>
      </thead>
      <tbody >
      	<{foreach from=$result item=rs}>
      	<tr>
      		<td align='center'><input onclick='detail(<{$rs.user_id}>)' value='编辑' type='button' /></td>
      		<td align='center'><div style='width:10px;'><input type='checkbox' value='<{$rs.user_id}>' class='listckb' /></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.login_id}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.user_name}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.email}></div></td>
      		<td align='center'><div style='width:100px;'><{if $rs.status=='A'}>启用<{else}>不启用<{/if}></div></td>
      		<td align='left'>
      		<div style='width:420px;height:150px;overflow:auto;'>
      			<table>
      			<{foreach from=$rs.function item=rss}>
      				<tr>
      					<td><strong><{$rss.function_name}></strong></td>
      					<td align='left' >
      						<table>
      						<{foreach from=$rss.sub_function item=rsss}>
      							<tr>
      								<td><{$rsss.function_name}></td>
      								<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
      								<{foreach from=$rsss.access_right item=rssss }>
      								<td><{if $rssss.right_id>0 }><{$rssss.name}><{/if}></td>
      								<td>|</td>
      								<{/foreach}>
      							</tr>
      						<{/foreach}>
      						</table>
      					</td>
      				</tr>
      				<tr>
      					<td colspan='2'><hr></td>
      				</tr>
      			<{/foreach}>
      			</table>
      		</div>
      		</td>
      		<td align='center'><div style='width:150px;'><{$rs.created_date}></div></td>
      		<td align='center'><div style='width:150px;'><{$rs.updated_date}></div></td>
      	</tr>
      	<{/foreach}>
      </tbody>
    </table>