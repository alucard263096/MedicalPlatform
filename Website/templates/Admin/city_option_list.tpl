<option value='0'>--请选择城市--</option>
<{foreach from=$result item=rs}>
<option value='<{$rs.serialId}>'><{$rs.cityName}></option>
<{/foreach}>