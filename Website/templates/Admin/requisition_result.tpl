<table id="result" class="display" width="100%" border="0" cellspacing="0" cellpadding="0">
      <thead>
        <tr>
          <th align='center'>操作</th>
          <th align='center'></th>
          <th align='center'>申请人</th>
          <th align='center'>申请人职位</th>
          <th align='center'>申请人电话</th>
          <th align='center'>申请人QQ</th>
          <th align='center'>申请公司名称</th>
          <th align='center'>申请公司地址</th>
          <th align='center'>已知合作方式</th>
          <th align='center'>申请日期</th>
          <th align='center'>处理意见</th>
          <th align='center'>状态</th>
          <th align='center'>处理人</th>
          <th align='center'>处理日期</th>
        </tr>
      </thead>
      <tbody >
      	<{foreach from=$result item=rs}>
      	<tr>
      		<td align='center'><input onclick='detail(<{$rs.id}>)' value='处理' type='button' /></td>
      		<td align='center'><div style='width:10px;'><input type='checkbox' value='<{$rs.id}>' class='listckb' /></div></td>
      		<td align='center'><div style='width:200px;'><{$rs.name}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.position}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.phone}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.qq}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.company_name}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.company_city}>-<{$rs.company_address}></div></td>
      		<td align='center'><div style='width:100px;'><{if $rs.knew =='Y'}>是<{else}>否<{/if}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.applied_date}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.remarks}></div></td>
      		<td align='center'><div style='width:50px;'><{if $rs.status=='P'}>未处理<{elseif  $rs.status=='A'}>已处理<{else}>不通过<{/if}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.updated_username}></div></td>
      		<td align='center'><div style='width:100px;'><{$rs.updated_date}></div></td>
      	</tr>
      	<{/foreach}>
      </tbody>
    </table>