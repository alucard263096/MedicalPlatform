﻿
var myjs_detailPageLoad = function () {

    $("#btnSave").hide();
   
};


var Handle = function () {

        action: "HANDLE",
        id: $("#content_id").val(),
        h_comment: $("#content_h_comment").val(),
        h_status: $("#content_h_status").val()
    };

        $("#btnHandle").prop("disabled", "");

        if (data == "SUCCESS") {
            infoDialog("操作成功");
        } else {
            errorDialog(data);
        }
    });
};