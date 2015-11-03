
function MsgInfo(msg)
{
	try{
	$( "#dialog-message-info" ).dialog( "destroy" );
	}catch(exception){
		
	}
	$( "#dialog-message-info p").text(msg);
	
	$( "#dialog-message-info" ).dialog({
		modal: true,
		buttons: {
			关闭: function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
}
function MsgError(msg)
{
	try{
		$( "#dialog-message-error" ).dialog( "destroy" );
		}catch(exception){
			
		}
	$( "#dialog-message-error p").text(msg);
	$( "#dialog-message-error" ).dialog({
		modal: true,
		buttons: {
		关闭: function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
}
function MsgWarning(msg)
{
	try{
		$( "#dialog-message-warning" ).dialog( "destroy" );
		}catch(exception){
			
		}
	$( "#dialog-message-warning p").text(msg);
	
	$( "#dialog-message-warning" ).dialog({
		modal: true,
		buttons: {
			关闭: function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
}