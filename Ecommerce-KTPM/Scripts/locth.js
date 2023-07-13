
    const brandFilterInput = document.getElementById("brandFilter");
    const productList = document.getElementById("productList");

    brandFilterInput.addEventListener("keyup", filterProducts);

    function filterProducts() {
        const filterValue = brandFilterInput.value.toUpperCase();
        const productItems = productList.getElementsByClassName("productItem");

        for (let i = 0; i < productItems.length; i++) {
            const productBrand = productItems[i].getElementsByClassName("productBrand")[0];
            const brandValue = productBrand.textContent || productBrand.innerText;
            if (brandValue.toUpperCase().indexOf(filterValue) > -1) {
                productItems[i].style.display = "";
            } else {
                productItems[i].style.display = "none";
            }
        }
    }
