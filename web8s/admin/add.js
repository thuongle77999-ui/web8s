// --- BẢO MẬT ---
function checkAuth() {
    if (localStorage.getItem('adminLoggedIn') !== 'true') {
        window.location.href = 'loginadmin.html';
    }
}

function logoutAdmin() {
    localStorage.removeItem('adminLoggedIn');
    alert('Bạn đã đăng xuất thành công.');
    window.location.href = 'home.html';
}

checkAuth();

// --- 📸 PHẦN MỚI: CÁC HÀM QUẢN LÝ ẢNH (Đặt bên ngoài DOMContentLoaded để dễ gọi) ---

// 1. Hàm tải danh sách ảnh từ máy chủ
async function fetchImages() {
    const grid = document.getElementById('imageGrid');
    if (!grid) return;

    try {
        grid.innerHTML = '<p style="text-align:center;">Đang tải thư viện ảnh...</p>';
        const response = await fetch(API_BASE_URL + 'get_images.php');
        const data = await response.json();

        if (data.status && Array.isArray(data.images)) {
            grid.innerHTML = data.images.map(img => `
                <div class="image-card" style="border: 1px solid #ddd; padding: 10px; border-radius: 8px; background: #fff; text-align:center;">
                    <img src="${img.url}" style="width: 100%; height: 120px; object-fit: cover; border-radius: 4px;">
                    <p style="font-size: 11px; margin: 8px 0; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${img.name}</p>
                    <div style="display: flex; gap: 5px;">
                        <button class="action-btn btn-update" onclick="copyToClipboard('${img.url}')" style="flex: 1; font-size: 10px; padding: 5px;">Link</button>
                        <button class="action-btn btn-delete" onclick="deleteImage('${img.name}')" style="flex: 1; font-size: 10px; padding: 5px;">Xóa</button>
                    </div>
                </div>
            `).join('');
        } else {
            grid.innerHTML = '<p style="text-align:center; grid-column: 1/-1;">Thư viện ảnh trống.</p>';
        }
    } catch (error) {
        grid.innerHTML = '<p style="text-align:center; color:red; grid-column: 1/-1;">Lỗi kết nối server khi tải ảnh!</p>';
    }
}

// 2. Hàm tải ảnh lên
async function uploadImages() {
    const fileInput = document.getElementById('uploadInput');
    const status = document.getElementById('uploadStatus');
    if (!fileInput || fileInput.files.length === 0) return alert("Vui lòng chọn ít nhất 1 ảnh!");

    const formData = new FormData();
    for (let file of fileInput.files) {
        formData.append('images[]', file);
    }

    status.innerHTML = "⌛ Đang tải lên...";
    
    try {
        const response = await fetch(API_BASE_URL + 'upload_images.php', {
            method: 'POST',
            body: formData
        });
        const result = await response.json();
        
        if (result.status) {
            status.innerHTML = "✅ " + result.message;
            fileInput.value = ''; 
            fetchImages(); // Tải lại lưới ảnh ngay lập tức
        } else {
            status.innerHTML = "❌ " + result.message;
        }
    } catch (error) {
        status.innerHTML = "❌ Lỗi kết nối server!";
    }
}

// 3. Hàm copy link ảnh
function copyToClipboard(text) {
    // Tạo đường dẫn tuyệt đối dựa trên URL hiện tại nếu cần
    const fullUrl = window.location.origin + '/web8s/' + text;
    navigator.clipboard.writeText(fullUrl).then(() => {
        alert("Đã copy link ảnh vào bộ nhớ tạm!");
    });
}

// 4. Hàm xóa ảnh
async function deleteImage(fileName) {
    if (!confirm(`Bạn có chắc muốn xóa ảnh ${fileName}?`)) return;

    try {
        // Đảm bảo API_BASE_URL đã có gạch chéo ở cuối hoặc nối chính xác
        const response = await fetch(API_BASE_URL + 'delete_images.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ fileName: fileName })
        });

        const result = await response.json();
        if (result.status) {
            alert(result.message);
            fetchImages(); // Tải lại danh sách ảnh sau khi xóa thành công
        } else {
            alert("Lỗi: " + result.message);
        }
    } catch (error) {
        console.error("Lỗi xóa ảnh:", error);
        alert("Không thể kết nối đến máy chủ để xóa ảnh.");
    }
}

// --- LOGIC CHÍNH ---
document.addEventListener('DOMContentLoaded', function () {
    const topNavButtons = document.querySelectorAll('.main-nav .nav-item');
    const sidebarMenus = document.querySelectorAll('.menu-list');
    const sidebarMenuItems = document.querySelectorAll('.sidebar .menu-item');
    const contentViews = document.querySelectorAll('.content-view');
    const logoutButton = document.getElementById('logoutBtn');
    
    window.allUsers = []; 

    if (logoutButton) logoutButton.addEventListener('click', logoutAdmin);

    function renderOtherDataTable(dataToDisplay) {
        const container = document.getElementById('otherDataTableContainer');
        if (!container) return;

        if (dataToDisplay.length === 0) {
            container.innerHTML = '<p style="text-align:center;">Không tìm thấy dữ liệu.</p>';
            return;
        }

        let html = '<table><thead><tr><th>ID</th><th>Họ Tên</th><th>SĐT</th><th>Ghi Chú</th></tr></thead><tbody>';
        dataToDisplay.forEach(user => {
            html += `<tr>
                <td>${user.id}</td>
                <td>${user.ho_ten}</td>
                <td>${user.sdt}</td>
                <td>${user.ghi_chu || '-'}</td>
            </tr>`;
        });
        html += '</tbody></table>';
        container.innerHTML = html;
    }

    function switchMainMenu(targetContent) {
        topNavButtons.forEach(btn => btn.classList.remove('active'));
        const activeBtn = document.querySelector(`[data-content="${targetContent}"]`);
        if (activeBtn) activeBtn.classList.add('active');

        sidebarMenus.forEach(menu => menu.classList.remove('active-menu'));
        const targetMenu = document.getElementById(`${targetContent}-menu`);
        if (targetMenu) {
            targetMenu.classList.add('active-menu');
            const firstItem = targetMenu.querySelector('.menu-item');
            if (firstItem) firstItem.click();
        }
    }

    topNavButtons.forEach(button => {
        button.addEventListener('click', function () {
            switchMainMenu(this.getAttribute('data-content'));
        });
    });

    sidebarMenuItems.forEach(item => {
        item.addEventListener('click', function () {
            sidebarMenuItems.forEach(i => i.classList.remove('active'));
            this.classList.add('active');

            const viewId = this.getAttribute('data-view');
            contentViews.forEach(v => v.classList.remove('active-view'));
            
            const targetView = document.getElementById(viewId);
            if (targetView) targetView.classList.add('active-view');

            // --- SỬA TẠI ĐÂY: Kích hoạt load dữ liệu theo từng tab ---
            if (viewId === 'other-data') renderOtherDataTable(window.allUsers);
            if (viewId === 'web-settings' && typeof fetchAllContent === 'function') fetchAllContent();
            
            // THÊM: Nếu bấm vào tab ảnh thì tự động tải danh sách ảnh
            if (viewId === 'image-management') fetchImages();
        });
    });

    const searchInputOther = document.getElementById('searchInputOther');
    if (searchInputOther) {
        searchInputOther.addEventListener('keyup', function() {
            const term = this.value.toLowerCase();
            const filtered = window.allUsers.filter(u => 
                u.ho_ten.toLowerCase().includes(term) || (u.ghi_chu && u.ghi_chu.toLowerCase().includes(term))
            );
            renderOtherDataTable(filtered);
        });
    }

    switchMainMenu('data-management');
});