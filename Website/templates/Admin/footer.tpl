
		</div>

		<div id="separator"></div>

	</div>



	<script type='text/javascript'>

		//DOM加载完毕执行

		$(document).ready(function(){

			//隔行换色

			$(".list_table tr:nth-child(even)").addClass('even');

			$(".list_table tr").hover(

				function () {

					$(this).addClass("sel");

				},

				function () {

					$(this).removeClass("sel");

				}

			);



			

		});
	</script>
	
		
<script>
$(document).ready(function(){

	if($.trim("<{$sysErrorMsg}>")!="")
	{
		MsgError("<{$sysErrorMsg}>");
	}
	
	if($.trim("<{$sysInfoMsg}>")!="")
	{
		MsgInfo("<{$sysInfoMsg}>");
	}
	if($.trim("<{$sysWarningMsg}>")!="")
	{
		MsgWarning("<{$sysWarningMsg}>");
	}
});

</script>
			<script type="text/javascript">
$(document).ready(function(){
	$(".number").keyup(function(){     
        var tmptxt=$(this).val();     
        $(this).val(tmptxt.replace(/\D|^0/g,''));     
    }).bind("paste",function(){     
        var tmptxt=$(this).val();     
        $(this).val(tmptxt.replace(/\D|^0/g,''));     
    }).css("ime-mode", "disabled");  
	
});
</script>
		

<div style='display:none;'>
<div id="dialog-message-info" title="消息" >
	<p>
		
	</p>
</div>
<div id="dialog-message-error" title="错误">
	<p>
		
	</p>
</div>
<div id="dialog-message-warning" title="警告">
	<p>
		
	</p>
</div>
</div>
	
	
	
</body>

</html>