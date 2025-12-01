// --- LOGIC CHUNG ---
function toggleTag(element) {
    element.classList.toggle('selected');
}

// --- LOGIC TRANG PROFILE (UPLOAD 9 ẢNH) ---
function triggerUpload(index) {
    document.getElementById(`fileInput-${index}`).click();
}

function previewImage(event, index) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const slot = document.getElementById(`slot-${index}`);
            slot.innerHTML = `<img src="${e.target.result}">`;
            slot.style.border = "none";
            slot.style.background = "#fff";
        }
        reader.readAsDataURL(file);
    }
}

// --- LOGIC QUẸT (INDEX) ---
function swipe(action) {
    const card = document.querySelector('.card-placeholder');
    if (!card) return;

    if (action === 'nope') {
        card.style.transform = 'translateX(-100vw) rotate(-30deg)'; // Bay ra khỏi màn hình
        card.style.opacity = '0';
    } else {
        card.style.transform = 'translateX(100vw) rotate(30deg)';
        card.style.opacity = '0';
    }
    
    // Tạo thẻ mới sau khi quẹt
    setTimeout(() => {
        card.style.transition = 'none';
        card.style.transform = 'translateX(0) rotate(0)';
        card.style.opacity = '1';
        
        // Đổi màu nền ngẫu nhiên để giả vờ là người mới
        const randomColor = '#' + Math.floor(Math.random()*16777215).toString(16);
        // card.style.backgroundColor = randomColor; 
        
        // Hoặc reset text
        card.querySelector('p').innerText = "Người tiếp theo (Ảnh trống)";

        setTimeout(() => card.style.transition = '0.5s ease-out', 50);
    }, 500);
}

// --- TỰ ĐỘNG LOAD THÔNG TIN ĐÃ NHẬP Ở SETUP ---
document.addEventListener('DOMContentLoaded', () => {
    // Nếu đang ở trang profile, load tên và ảnh
    const profileName = document.getElementById('profileNameDisplay');
    if(profileName) {
        const name = localStorage.getItem('userName') || "Bạn";
        const age = localStorage.getItem('userAge') || "18";
        profileName.innerText = `${name}, ${age}`;
    }
    
    // Load ảnh avatar vào slot 1 nếu có
    const savedAvatar = localStorage.getItem('userAvatar');
    const slot1 = document.getElementById('slot-1');
    if(savedAvatar && slot1 && !slot1.querySelector('img')) {
        slot1.innerHTML = `<img src="${savedAvatar}">`;
        slot1.style.border = "none";
    }
});
