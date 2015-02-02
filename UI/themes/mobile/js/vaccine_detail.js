$(function () {
    $("#home-slides").slidesjs({
        navigation: false,
    });
});

function displayDetails(id) {
    if ($("#" + id).css("display") == "none" || "undefined" == typeof (id) || id.length <= 0) {
        $("#" + id).css("display", "block");
    } else {
        $("#" + id).css("display", "none");
    }
}