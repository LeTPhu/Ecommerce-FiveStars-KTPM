function searchfunc_1() {
    let menusearch = document.querySelector('#menu_search_1');
    let menuitems = Array.from(document.querySelectorAll('.menu_item_1'));
    //
    menuitems.forEach(function (el) {
        let text = el.innerText;
        if (text.indexOf(menusearch.value) > -1)
            el.style.display = "";
        else el.style.display = "none";
    })
}