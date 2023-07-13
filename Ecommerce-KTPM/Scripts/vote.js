let selectedStar = null;

function rateProduct(starNumber) {
    selectedStar = starNumber;
    for (let i = 1; i <= 5; i++) {
        const star = document.getElementById(`star${i}`);
        star.classList.remove('active');
        if (i <= starNumber) {
            star.classList.add('active');
        }
    }
}

function submitVote() {
    if (selectedStar) {
        alert(`Bạn đã đánh giá sản phẩm ${selectedStar} sao.`);
        // Gửi đánh giá lên server tại đây
    } else {
        alert('Vui lòng chọn số sao để đánh giá.');
    }
}