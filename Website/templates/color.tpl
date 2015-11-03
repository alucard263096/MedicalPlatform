<{include file="$smarty_root/header.tpl" }>
	<link rel="stylesheet" href="css/colorpicker.css" type="text/css" />
<script type="text/javascript" src="js/colorpicker.js"></script>


<p id="colorpickerHolder">
</p>
<script type="text/javascript">
<!--
$(document).ready(function(){
	$('#colorpickerHolder').ColorPicker({flat: true,color: '#a0ce4e',
		onChange: function (hsb, hex, rgb) {
		$('.navbar-inner').css('backgroundColor', '#' + hex);
		}
	});
});
//-->
</script>

<{include file="$smarty_root/footer.tpl" }>
