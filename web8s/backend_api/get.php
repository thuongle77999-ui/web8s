<?php
// FILE: api_get_users.php (hoặc tên file mà Front-end đang gọi để lấy DS)

// 1. Cấu hình Headers cho JSON
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); 
header('Access-Control-Allow-Methods: GET');
// ... (các headers khác)

// 2. Thông tin kết nối Database
$servername = "localhost";
$username = "root";       
$password = "";           
$dbname = "db_nhanluc";   

// 3. Kết nối Database
$conn = new mysqli($servername, $username, $password, $dbname);
// ... (Xử lý lỗi kết nối)

// 4. Thực thi truy vấn SELECT
$sql = "SELECT ID, HoTen, SĐT, NamSinh, DiaChi, ChuongTrinh, QuocGia, GhiChu, created_at FROM user";
$result = $conn->query($sql);
$data = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        // Xử lý ID
        $created_time_str = $row['created_at']; 
        $timestamp = strtotime($created_time_str); 
        $formatted_time = date('y/m/d_H/i/s', $timestamp);
        $display_id = $formatted_time . '_' . $row['ID']; 
        
        $row['display_ID'] = $display_id;
        $data[] = $row;
    }
    // Trả về dữ liệu thành công
    http_response_code(200);
    echo json_encode($data);
} else {
    // Không tìm thấy dữ liệu
    http_response_code(200);
    echo json_encode(array("message" => "Không tìm thấy người dùng nào.", "status" => true, "data" => []));
}

// 6. Đóng kết nối
$conn->close();
// KHÔNG CÓ CODE NÀO KHÁC SAU DÒNG NÀY (Không có code xuất TXT)
?>