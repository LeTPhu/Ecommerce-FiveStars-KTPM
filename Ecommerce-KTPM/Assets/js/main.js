const cookieNotice = document.getElementById('cookie-notice');
const acceptButton = document.getElementById('btn-accept');
const rejectButton = document.getElementById('btn-reject');


// star Scroll header
var prevScrollPos = window.pageYOffset;

window.addEventListener('scroll', function () {
    var currentScrollPos = window.pageYOffset;
    var heading = document.getElementById('set-followflex');
    var scrolledClass = 'set-followflexcss';

    if (currentScrollPos > prevScrollPos || currentScrollPos === 0){
        heading.classList.remove(scrolledClass);
    } else {
        heading.classList.add(scrolledClass);
    }

    prevScrollPos = currentScrollPos;
});
// end Scroll header

function setCookie() {
    // Code để lưu cookie vào website
}

acceptButton.addEventListener('click', () => {
    setCookie();
    cookieNotice.style.display = 'none';
});

rejectButton.addEventListener('click', () => {
    cookieNotice.style.display = 'none';
});

