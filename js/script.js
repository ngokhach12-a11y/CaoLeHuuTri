// --- LOGIC TRANG PROFILE (UPLOAD 9 ẢNH) ---
function triggerUpload(index) {
    // Kích hoạt input file ẩn tương ứng
    document.getElementById(`fileInput-${index}`).click();
}

function previewImage(event, index) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            // Hiển thị ảnh vào ô
            const slot = document.getElementById(`slot-${index}`);
            slot.innerHTML = `<img src="${e.target.result}">`;
            slot.style.border = "none";
        }
        reader.readAsDataURL(file);
    }
}

// --- LOGIC CHỌN SỞ THÍCH ---
function toggleTag(element) {
    element.classList.toggle('selected');
}

// --- LOGIC QUẸT (INDEX) ---
function swipe(action) {
    const card = document.querySelector('.card-placeholder');
    if (!card) return;

    if (action === 'nope') {
        card.style.transform = 'translateX(-200%) rotate(-30deg)';
        card.style.opacity = '0';
    } else {
        card.style.transform = 'translateX(200%) rotate(30deg)';
        card.style.opacity = '0';
    }
    
    // Reset lại sau 0.5s để demo (thực tế sẽ load thẻ mới)
    setTimeout(() => {
        card.style.transition = 'none';
        card.style.transform = 'translateX(0) rotate(0)';
        card.style.opacity = '1';
        setTimeout(() => card.style.transition = '0.5s', 50);
    }, 500);
}
