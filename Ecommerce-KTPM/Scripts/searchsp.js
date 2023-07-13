function searchfunc() {
    let menusearch = document.querySelector('#menu_search');
    let menuitems = Array.from(document.querySelectorAll('.menu_item'));
    //
    menuitems.forEach(function (el) {
        let text = el.innerText;
        if (text.indexOf(menusearch.value) > -1)
            el.style.display = "";
        else el.style.display = "none";
    })
}