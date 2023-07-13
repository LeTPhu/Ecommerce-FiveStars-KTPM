// Sử dụng tìm kiếm nhị phân để tìm sản phẩm
const searchInput = document.getElementById("search");
const lists = Array.from(document.querySelectorAll(".list"));
const tongtheSearches = Array.from(document.querySelectorAll(".tongthe-search"));
const tongtheSearches1 = Array.from(document.querySelectorAll(".tongthe-search1"));

searchInput.addEventListener("input", function (event) {
    const searchTerm = event.target.value.trim().toLowerCase();
    let visibleItemCount = 0;
    lists.forEach((list, index) => {
        const items = Array.from(list.getElementsByTagName("li"));
        let isVisible = false;
        items.forEach(function (item) {
            const text = item.textContent.trim().toLowerCase();
            if (text.includes(searchTerm)) {
                isVisible = true;
                visibleItemCount++;
            }
            item.hidden = !text.includes(searchTerm);
        });
        if (!isVisible) {
            tongtheSearches[index].style.display = "none";
        } else {
            tongtheSearches[index].style.display = "block";
        }
    });
    if (visibleItemCount === 0) {
        tongtheSearches.forEach((tongtheSearch) => {
            tongtheSearch.style.display = "none";
        });
    }
});

searchInput.addEventListener("input", function (event) {
    const searchTerm = event.target.value.trim().toLowerCase();
    let visibleItemCount = 0;
    lists.forEach((list, index) => {
        const items = Array.from(list.getElementsByTagName("li"));
        let isVisible = false;
        items.forEach(function (item) {
            const text = item.textContent.trim().toLowerCase();
            if (text.includes(searchTerm)) {
                isVisible = true;
                visibleItemCount++;
            }
            item.hidden = !text.includes(searchTerm);
        });
        if (!isVisible) {
            tongtheSearches1[index].style.display = "none";
        } else {
            tongtheSearches1[index].style.display = "none";
        }
    });
    if (visibleItemCount === 0) {
        tongtheSearches1.forEach((tongtheSearch) => {
            tongtheSearch1.style.display = "none";
        });
    }
});