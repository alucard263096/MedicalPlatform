




var myjs_savevalidate = function () {
    if ($("#content_is_general").prop("checked")==false) {
        if ($("#content_specialist_id").val() == "0") {

            return "<p>非全科医生的注册专科不能为空</p>";

        }
    }
    return "";
};