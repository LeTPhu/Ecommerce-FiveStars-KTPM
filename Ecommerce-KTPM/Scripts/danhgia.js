const commentsList = document.getElementById("comments-list");
const commentForm = document.getElementById("comment-form");

commentForm.addEventListener("submit", function (event) {
    event.preventDefault();
    const name = document.getElementById("name").value;
    const comment = document.getElementById("comment").value;
    const rating = document.querySelector('input[name="rating"]:checked').value;

    // Create new comment
    const newComment = document.createElement("li");
    newComment.innerHTML = `
    <div>
      <strong>${name}</strong> 
      (${rating} &#9733;)
    </div>
    <div>${comment}</div>
  `;
    commentsList.appendChild(newComment);

    // Clear form inputs
    document.getElementById("name").value = "";
    document.getElementById("comment").value = "";
    document.querySelectorAll('input[name="rating"]').forEach((radio) => (radio.checked = false));

    const totalReviews = document.querySelectorAll('#comments-list li').length;
    document.getElementById('total-reviews').textContent = totalReviews;

});

