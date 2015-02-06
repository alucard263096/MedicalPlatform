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
function initMenu() {
    $("#menuPanel").css("display", "none");
    $("#cover").css("display", "none");
    $("#menu > div").each(function () {
        $(this).css("display", "none");
    });
}


var isSameNextMenu;
function openNextMenu(myself) {
    if (isSameNextMenu != myself) {
        closeNextMenu(myself);
    }

    var nextMenu = $(myself).next();
    if (nextMenu.css("display") == "none") {
        nextMenu.show(1000);
    } else {
        nextMenu.hide(1000);
    }
    isSameNextMenu = myself;
}

function closeNextMenu(ctr) {
    var brothers = $(ctr).siblings('div');
    brothers.each(function () {
        $(this).hide(1000);
    });
}

function openSubMenu(firstid, menuid, myself) {
    
    closeMenu();

    $("#" + menuid + " > div").each(function () {
        $(this).css("background", "none");
    });

    $("#" + firstid).css("display", "block");
    $(myself).css("background", "white");
    $("#" + menuid).css("display", "block");
    $("#menuPanel").css("margin-top", getMenuMarginTopHeight() + "px");
    $("#cover").css("margin-top", getMenuMarginTopHeight() + "px");
    $("#cover").css("display", "block");
    $("#menu").css("display", "block");
}

function getFirstSubMenuName(menuid) {
    var first = $("#" + menuid + " div:first").attr("ref_id");
    return first;
}


function closeMenu() {
    $("#cover").css("display", "none");
    $("#menu > div").each(function () {
        $(this).css("display", "none");
    });
}


var topMenu;
function clickMenu(id, myself) {
    if (($("#menuPanel").css("display") == "block" && isSameMenu(id)) || "undefined" == typeof (id) || id.length <= 0) {
        $("#menuPanel").css("display", "none");
        $("#cover").css("display", "none");
    } else {
        $("#menuPanel").css("display", "block");
        topMenu = myself;
        openSubMenu(getFirstSubMenuName(id), id);
        initFirstClickMenu(id);
    }
}

function setMenuValue(myself) {
    $($(topMenu), 'div').first().html("<div class='childNarText'>" + $(myself).text() + "</div>");
    closeMenu();
}

function setSingleMenuValue(myself) {
    $($(topMenu), 'span').first().html("<div class='childNarText'>" + $(myself).text() + "</div>");
    closeMenu();
}

function clickSingleMenu(id, myself) {
    if (($("#menuPanel").css("display") == "block" && isSameMenu(id)) || "undefined" == typeof (id) || id.length <= 0) {
        $("#menuPanel").css("display", "none");
        $("#cover").css("display", "none");
    } else {
        $("#menuPanel").css("display", "block");
        topMenu = myself;

        if (id.length <= 0) {
            return;
        }

        $("#menu > div").each(function () {
            $(this).css("display", "none");
        });

        $("#" + id + " > div").each(function () {
            $(this).css("background", "none");
        });

        $("#" + id).css("display", "block");
        $("#" + id).css("background", "white");
        $("#menuPanel").css("margin-top", getMenuMarginTopHeight() + "px");
        $("#cover").css("margin-top", getMenuMarginTopHeight() + "px");
        $("#cover").css("display", "block");
        $("#menu").css("display", "block");
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
    return $("#child_narvigation").height() + 10;
}

function setVaccineDetailHeight(parentId, childId) {
    var heightValue = $("#" + parentId).height();
    $("#" + childId).height(heightValue);
}