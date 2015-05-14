﻿var ToggleButton = function () {

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
var myjs_detailPageLoad = function () {
    $("#btnSave").hide();
   
    ToggleButton();
   
};


var UpdateGuid = function () {

    var message = "";
    if ($("#content_guid").val() == "") {
        message += "<p>请输入或选择<span style='color:red;'>标识码</span></p>";
    }    if (message != "") {
        //infoDialog(message);
        warningDialog(message);
        return;
    }    $("#btnUpdateGuid").prop("disabled", "disabled");    var json = {
        action: "UPDATE_GUID",
        id: $("#content_id").val(),
        guid: $("#content_guid").val()
    };    $.post("geneappointment.php", json, function (data) {

        $("#btnUpdateGuid").prop("disabled", "");

        if (data == "SUCCESS") {
            infoDialog("操作成功");
            $("#content_status").val("M");
            ToggleButton();
        } else {
            errorDialog(data);
        }
    });
};

var SendCheckItem = function () {

    var message = "";
    if ($("#content_express_no").val() == "") {
        message += "<p>请输入或选择<span style='color:red;'>寄出检测品快递单号</span></p>";
    }    if (message != "") {
        //infoDialog(message);
        warningDialog(message);
        return;
    }

    $("#btnSendCheckItem").prop("disabled", "disabled");    var json = {
        action: "UPDATE_EXPRESSNO",
        id: $("#content_id").val(),
        express_no: $("#content_express_no").val()
    };    $.post("geneappointment.php", json, function (data) {

        $("#btnSendCheckItem").prop("disabled", "");

        if (data == "SUCCESS") {
            infoDialog("操作成功");
            $("#content_status").val("K");
            ToggleButton();
        } else {
            errorDialog(data);
        }
    });

};

var ReceiveCheckItem = function () {
    $("#btnReceiveCheckItem").prop("disabled", "disabled");    var json = {
        action: "UPDATE_RECEIVE",
        id: $("#content_id").val()
    };    $.post("geneappointment.php", json, function (data) {

        $("#btnReceiveCheckItem").prop("disabled", "");

        if (data == "SUCCESS") {
            infoDialog("操作成功");
            $("#content_status").val("R");
            ToggleButton();
        } else {
            errorDialog(data);
        }
    });
};

var SendReport = function () {

    var message = "";
    if ($("#content_report_express_no").val() == "") {
        message += "<p>请输入或选择<span style='color:red;'>寄出报告快递单号</span></p>";
    }    if (message != "") {
        //infoDialog(message);
        warningDialog(message);
        return;
    }

    $("#btnSendReport").prop("disabled", "disabled");    var json = {
        action: "UPDATE_REPORTEXPRESSNO",
        id: $("#content_id").val(),
        report_express_no: $("#content_report_express_no").val()
    };    $.post("geneappointment.php", json, function (data) {

        $("#btnSendReport").prop("disabled", "");

        if (data == "SUCCESS") {
            infoDialog("操作成功");
            $("#content_status").val("G");
            ToggleButton();
        } else {
            errorDialog(data);
        }
    });

};

var Finished = function () {
    $("#btnFinished").prop("disabled", "disabled");    var json = {
        action: "UPDATE_FINISHED",
        id: $("#content_id").val()
    };    $.post("geneappointment.php", json, function (data) {

        $("#btnFinished").prop("disabled", "");

        if (data == "SUCCESS") {
            infoDialog("操作成功");
            $("#content_status").val("F");
            ToggleButton();
        } else {
            errorDialog(data);
        }
    });
};