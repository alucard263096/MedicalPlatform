<{include file="$smarty_root/header.tpl" }>
<script type="text/javascript" src="<{$rootpath}>/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<{$rootpath}>/ckeditor/ckeditor.js"></script>
<{$str}>

<{foreach from=$str item=rs}>
<{$rs.aa}>
<{/foreach}>

<textarea id="description" name="description"></textarea>

<script>
$(document).ready(function(){

		CKEDITOR.replace( 'description',
		{
			skin : 'office2003',
			height:200
	
		});
});
</script>



<form action="file_upload.php" method="post"
enctype="multipart/form-data">
<label for="file">Filename:</label>
<input type="file" name="file" id="file" /> 
<br />
<input type="submit" name="submit" value="Submit" />
</form>

<{include file="$smarty_root/footer.tpl" }>