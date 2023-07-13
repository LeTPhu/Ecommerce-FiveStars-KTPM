  // Lấy khung hiển thị và nút đóng khung hiển thị
  var modal = document.getElementById("myModal");
  var closeButton = document.getElementsByClassName("close")[0];

  // Hàm mở khung hiển thị
  function openModal() {
      modal.style.display = "block";
  }

  // Hàm đóng khung hiển thị
  function closeModal() {
      modal.style.display = "block";
  }

  // Đóng khung hiển thị khi nhấn vào nút đóng khung hoặc click bên ngoài khung
  window.onclick = function (event) {
      if (event.target == modal) {
          modal.style.display = "none";
      }
  }