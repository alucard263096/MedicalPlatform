<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="css/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>

<label for="file">Filename:</label>
<input type="file" name="file" id="file" /> 
<br />
<input type="button" id="go" name="submit" value="Submit" />


<script type="">
$(document).ready(function(){
	$("#go").click(function(){
		$.post("helloworld.php",{"file":$("#file").val()},function(data){
			alert(data);
		});
	});
});
</script>


</body>
</html>