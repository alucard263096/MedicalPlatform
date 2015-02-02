$(function () {
    initMenu();
    setVaccineDetailHeight("vaccineDetails", "vaccineNum");
});

function initMenu() {
    $("#menuPanel").css("display", "none");
    $("#cover").css("display", "none");
    $("#menu > div").each(function () {
        $(this).css("display", "none");
    });
}

function openSubMenu(id, myself) {
    if (id.length <= 0) {
        return;
    }

    $("#menu > div").each(function () {
        $(this).css("display", "none");
    });

    $("#" + getMainMenuName(id) + " > div").each(function () {
        $(this).css("background", "none");
    });

    $("#" + id).css("display", "block");
    $(myself).css("background", "white");
    $("#" + getMainMenuName(id)).css("display", "block");
    $("#menuPanel").css("margin-top", getMenuMarginTopHeight() + "px");
    $("#cover").css("margin-top", getMenuMarginTopHeight() + "px");
    $("#cover").css("display", "block");
    $("#menu").css("display", "block");
}

function getFirstSubMenuName(id) {
    var prevName = id.slice(0, id.length - 4);
    return prevName + "SubMenu_1";
}

function getMainMenuName(id) {
    var prevName = id.slice(0, id.length - 9);
    return prevName + "Menu";
}


function clickMenu(id) {
    if (($("#menuPanel").css("display") == "block" && isSameMenu(id)) || "undefined" == typeof (id) || id.length <= 0) {
        $("#menuPanel").css("display", "none");
        $("#cover").css("display", "none");
    } else {
        $("#menuPanel").css("display", "block");
        openSubMenu(getFirstSubMenuName(id));
        initFirstClickMenu(id);
    }
}

var clickMenuId;
function isSameMenu(id) {
    if (clickMenuId == id) {
        return true;
    }
    clickMenuId = id;
}

function initFirstClickMenu(id) {
    $("#" + id + " div").first().css("background", "white");
}

function getMenuMarginTopHeight() {
    return $("#child_narvigation").height() - 8;
}

function setVaccineDetailHeight(parentId, childId) {
    var heightValue = $("#" + parentId).height();
    $("#" + childId).height(heightValue);
}