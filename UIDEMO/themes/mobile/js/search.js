function starSearch() {
    $('#popupSearch').popup('open');
    initSearchDiv();
}

function closeSearch() {
    $('#popupSearch').popup('close');
}

function initSearchDiv() {
    var searchDiv = $(".header .ui-input-search");
    $(searchDiv).css("border-radius", "0");
    $(searchDiv).css("margin-bottom", "15px");
    $(searchDiv).css("margin-left", "10px");
    $(searchDiv).css("margin-top", "15px");
    $(searchDiv).css("padding", "0");
    $(searchDiv).css("width", "75%");
    $(".ui-popup-container").css("z-index", "9999");
    $("#search").css("font-size", "0.6em");
    $("#search").css("margin-left", "5px");
    $("#search").css("height", "30px");
    $("#popupSearch-screen").css("background", "gray");
}