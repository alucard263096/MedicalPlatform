
var myjs_detailPageLoad = function () {
    $("#btnSave").hide();
    
    $("#btnUpdateGuid").hide();
    $("#btnSendCheckItem").hide();
    $("#btnReceiveCheckItem").hide();
    $("#btnSendReport").hide();
    $("#btnFinished").hide();
    
    var payment = $("#content_payment").val();
    if (payment == "Y") {
        var status = $("#content_status").val();
        if (status == "P") {
            $("#btnUpdateGuid").show();
        } else if(status == "M"){
            $("#btnSendCheckItem").show();
        } else if (status == "K") {
            $("#btnReceiveCheckItem").show();
        } else if (status == "R") {
            $("#btnSendReport").show();
        } else if (status == "G") {
            $("#btnFinished").show();
        }
    }
};

var UpdateGuid = function () {
    
    var message = "";
    if ($("#content_guid").val() == "") {
        message += "<p>请输入或选择<span style='color:red;'>标识码</span></p>";
    }    if (message != "") {
        //infoDialog(message);
        warningDialog(message);
        return ;
    }    $("#btnUpdateGuid").prop("disabled", "disabled");    var json = {
        action: "UPDATE_GUID",
        id: $("#content_id").val(),
        guid: $("#content_guid").val()
    };    $.post("geneappointment.php", json, function (data) {

        $("#btnUpdateGuid").prop("disabled", "");
        
        if (data == "success") {
            infoDialog("操作成功");
        } else {
            errorDialog(data);
        }
    });


}
