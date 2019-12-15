function menu_show_hide() {
    var dislaycurrent = document.getElementById("header_btn_left").style.display;
    if (dislaycurrent == "none" || dislaycurrent == "") {
        document.getElementById("header_btn_left").style.display = "block";
    } else {
        document.getElementById("header_btn_left").style.display = "none";
    }
}

function sb_open() {
    document.getElementById("sb").style.display = "block";
    document.getElementById("sb").style.position = "fixed";
    document.getElementById("sb").style.overflowX = "auto";
    document.getElementById("sb").style.right = "0px";
    document.getElementById("sb").style.top = "0px";
    document.getElementById("btn_show_basket").style.display = "none";
    document.getElementById("overlay_disable").style.display = "block";
}

function sb_close() {
    document.getElementById("sb").style.display = "none";
    document.getElementById("btn_show_basket").style.display = "block";
    document.getElementById("overlay_disable").style.display = "none";
}

function setYellowStar(index) {
    var star_df_id = "star_default_" + index;
    var star_li_id = "star_light_" + index;
    var temp = document.getElementById(star_df_id).style.display;
    document.getElementById(star_df_id).style.display = document.getElementById(star_li_id).style.display;
    document.getElementById(star_li_id).style.display = temp;
}

function change_cbx_preferredFare(disableCbx, nameTemp) {
    var nameT = "Changeable_" + nameTemp;
    document.getElementById(nameT).disabled = disableCbx;
    nameT = "Refundable_" + nameTemp;
    document.getElementById(nameT).disabled = disableCbx;
}

function showHidePassenger(nameSelect) {
    var select_id = "select_" + nameSelect;
    var valueTemp = document.getElementById(select_id).value;
    var maxCount = 4;

    if (nameSelect == 'Adt') {
        maxCount = 9;
    };

    for (var i = 1; i <= maxCount; i++) {
        select_id = nameSelect + "_" + i;
        if (i <= valueTemp) {
            document.getElementById(select_id).style.display = "table";
        } else {
            document.getElementById(select_id).style.display = "none";
        }
    }

}

function formatPhoneNumber() {
    var phoneN = document.getElementById("phoneNumber").value;
    if ((phoneN.length == 2) || (phoneN.length == 7)) {
        document.getElementById("phoneNumber").value = phoneN + "-";
    }
}

function changeNameRequest() {
    document.getElementById("surname_TravelerInformation").value = document.getElementById("surname_RequestInformation").value;
    document.getElementById("name_TravelerInformation").value = document.getElementById("name_RequestInformation").value;
}
