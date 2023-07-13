const filterButton = document.getElementById('filter-button');
const productItems = document.querySelectorAll('.product-item');

filterButton.addEventListener('click', () => {
    const priceMin = document.getElementById('price-min').value;
    const priceMax = document.getElementById('price-max').value;

    productItems.forEach((item) => {
        const price = parseInt(item.dataset.price);

        if (
            (priceMin === '' || price >= priceMin) &&
            (priceMax === '' || price <= priceMax)
        ) {
            item.style.display = 'block';
        } else {
            item.style.display = 'none';
        }
    });
});