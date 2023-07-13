//const apiUrl = 'https://ecommercefivestars.bsite.net/';
//const apiKey = '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';

//const chatbotContainer = document.querySelector('.chatbot-container');
//const chatbotMessages = chatbotContainer.querySelector('.chatbot-messages');
//const chatbotInput = chatbotContainer.querySelector('.chatbot-input input');
//const chatbotClose = chatbotContainer.querySelector('.chatbot-close');
//const sendbtn = chatbotContainer.querySelector('.send-btn');

//chatbotClose.addEventListener('click', () => {
//    chatbotContainer.style.display = 'none';
//});

//function sendMessage() {
//    const message = chatbotInput.value;
//    if (!message) {
//        return;
//    }
//    const chatbotMessage = document.createElement('div');
//    chatbotMessage.classList.add('chatbot-message');
//    chatbotMessage.innerHTML = message;
//    chatbotMessages.appendChild(chatbotMessage);
//    chatbotInput.value = '';

//    fetch(apiUrl, {
//        method: 'POST',
//        headers: {
//            'Content-Type': 'application/json',
//            'Authorization': `Bearer ${apiKey}`
//        },
//        body: JSON.stringify({
//            message: message
//        })
//    })
//        .then(response => response.json())
//        .then(data => {
//            try {
//                const chatbotMessage = document.createElement('div');
//                chatbotMessage.classList.add('chatbot-message');
//                chatbotMessage.innerHTML = data.response;
//                chatbotMessages.appendChild(chatbotMessage);
//                chatbotMessages.scrollTop = chatbotMessages.scrollHeight;
//            } catch (error) {
//                console.log(error);
//                const chatbotMessage = document.createElement('div');
//                chatbotMessage.classList.add('chatbot-message');
//                chatbotMessage.innerHTML = "Xin lỗi tôi không thể nhận được phản hồi.";
//                chatbotMessages.appendChild(chatbotMessage);
//            }
//        })
//        .catch(error => console.log(error));
//}

const chatbotContainer = document.querySelector('.chatbot-container');
const chatbotMessages = chatbotContainer.querySelector('.chatbot-messages');
const chatbotInput = chatbotContainer.querySelector('.chatbot-input input');
const chatbotClose = chatbotContainer.querySelector('.chatbot-close');
const sendbtn = chatbotContainer.querySelector('.send-btn');

chatbotClose.addEventListener('click', () => {
    chatbotContainer.style.display = 'none';
});

function getChatbotResponse(message) {
    if (message.toLowerCase().includes('xin') || message.toLowerCase().includes('chào')) {
        return 'Xin chào! Tôi là chatbot của FiveStars. Bạn cần hỗ trợ gì?';
    } else if (message.toLowerCase().includes('điện')) {
        return 'Website chúng tôi có bán thiết bị điện tử.';
    } else if (message.toLowerCase().includes('thông') || message.toLowerCase().includes('tin')) {
        return 'FiveStars gồm 5 thành viên bao gồm: Bạch Sý Khang, Nguyễn Phước Hải, Nguyễn Xuân Hiếu, Lê Tấn Phú, Nguyễn Thái Tâm';
    } else if (message.toLowerCase().includes('trái cây')) {
        return 'Chúng tôi có trái cây và trái cây sấy';
    } else if (message.toLowerCase().includes('máy tính') || message.toLowerCase().includes('laptop')) {
        return 'Chúng tôi có các sản phẩm máy tính giá phù hợp';
    } else if (message.toLowerCase().includes('nước ngọt')) {
        return 'Nước ngọt giá chỉ từ 10k đến 50k';
    } else if (message.toLowerCase().includes('nước uống')) {
        return 'Chúng tôi có các loại nước giải khát như coca, pepsi,...';
    }
    switch (message.toLowerCase()) {
        case 'bạn là ai':
            return 'Tôi là chatbot của FiveStars';
        default:
            return 'Xin lỗi! Tôi không có câu trả lời cho câu hỏi này. Vui lòng liên hệ Zalo: 037.559.5019 để được hỗ trợ';
    }
}


function sendMessage() {
    const message = chatbotInput.value.trim();
    const response = getChatbotResponse(message);

    const chatbotMessage = document.createElement('div');
    chatbotMessage.classList.add('chatbot-message');
    chatbotMessage.innerHTML = message;
    chatbotMessages.appendChild(chatbotMessage);
    chatbotInput.value = '';

    const botMessage = document.createElement('div');
    botMessage.classList.add('chatbot-message', 'bot-message');
    botMessage.innerHTML = response;
    chatbotMessages.appendChild(botMessage);
}



chatbotInput.addEventListener('keydown', event => {
    if (event.key === 'Enter') {
        sendMessage();
    }
});

sendbtn.onclick = function () {
    sendMessage();
}


chatbotContainer.style.display = 'block';


/* update chat */
// Lấy các phần tử trong HTML
const chatIcon = document.getElementById("chat-icon");
const chatBox = document.getElementById("chat-box");
const closeBtn = document.getElementById("close-btn");

// Hiển thị khung liên hệ khi ấn vào biểu tượng
chatIcon.addEventListener("click", function () {
    chatBox.style.display = "block";
    chatbotContainer.style.display = 'block';
});

// Đóng khung liên hệ khi ấn vào nút đóng
closeBtn.addEventListener("click", function () {
    chatBox.style.display = "none";
});

//// Lưu trữ trạng thái của khung liên hệ vào cookie
//function setCookie(cname, cvalue, exdays) {
//    const d = new Date();
//    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
//    const expires = "expires=" + d.toUTCString();
//    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
//}

//function getCookie(cname) {
//    const name = cname + "=";
//    const decodedCookie = decodeURIComponent(document.cookie);
//    const ca = decodedCookie.split(';');
//    for (let i = 0; i < ca.length; i++) {
//        let c = ca[i];
//        while (c.charAt(0) == ' ') {
//            c = c.substring(1);
//        }
//        if (c.indexOf(name) == 0) {
//            return c.substring(name.length, c.length);
//        }
//    }
//    return "";
//}

//function checkCookie() {
//    const chatBoxStatus = getCookie("chatBoxStatus");
//    if (chatBoxStatus != "") {
//        chatBox.style.display = chatBoxStatus;
//    } else {
//        setCookie("chatBoxStatus", "none", 30);
//    }
//}

//// Kiểm tra cookie khi tải trang
//window.onload = checkCookie;

