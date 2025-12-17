<?php
// 1. Cấu hình Headers
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); 
header('Access-Control-Allow-Methods: POST, GET');
header('Access-Control-Allow-Headers: Content-Type');

date_default_timezone_set('Asia/Ho_Chi_Minh'); 

// 2. Kết nối Database (giữ nguyên thông tin của bạn)
$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "db_nhanluc";
$conn = new mysqli($servername, $username, $password, $dbname);
$conn->set_charset("utf8mb4");

// 3. Tiếp nhận dữ liệu ID từ Frontend
$data = json_decode(file_get_contents("php://input"), true);
$ids = isset($data['ids']) ? $data['ids'] : [];

// 4. Xây dựng câu truy vấn
$sql = "SELECT id, ngay_nhan, ho_ten, sdt, nam_sinh, dia_chi, chuong_trinh, quoc_gia, ghi_chu FROM user";

// Nếu có danh sách ID, thì lọc theo ID
if (!empty($ids)) {
    // Làm sạch mảng ID để tránh SQL Injection
    $clean_ids = array_map('intval', $ids);
    $id_list = implode(',', $clean_ids);
    $sql .= " WHERE id IN ($id_list)";
}

$sql .= " ORDER BY id ASC";
$result = $conn->query($sql);

// 5. Xử lý xuất nội dung file (giữ nguyên logic cũ của bạn)
if ($result && $result->num_rows > 0) {
    $txt_content = "|ID|NGÀY NHẬN|HỌ TÊN|SĐT|NĂM SINH| ĐỊA CHỈ|CHƯƠNG TRÌNH|QUỐC GIA | GHI CHÚ|\n";

    while ($row = $result->fetch_assoc()) {
        foreach ($row as $key => $value) {
            $row[$key] = str_replace(["\n", "\r", "\t"], ' ', $value ?? '');
        }
        $line = "|" . $row['id'] . "| " . $row['ngay_nhan'] . "|" . $row['ho_ten'] . "| " . $row['sdt'] . "|" . $row['nam_sinh'] . "| " . $row['dia_chi'] . "|" . $row['chuong_trinh'] . "|" . $row['quoc_gia'] . "| " . $row['ghi_chu'] . "|";
        $txt_content .= $line . "\n";
    }

    $file_name = 'user_export_filtered_' . date('Ymd_His') . '.txt';
    $export_dir = __DIR__ . '/exports/';
    if (!is_dir($export_dir)) mkdir($export_dir, 0777, true);

    $file_path = $export_dir . $file_name;
    $success = file_put_contents($file_path, "\xEF\xBB\xBF" . $txt_content); 

    if ($success) {
        echo json_encode(array("status" => true, "file_url" => "backend_api/exports/" . $file_name));
    } else {
        echo json_encode(array("message" => "Lỗi ghi file.", "status" => false));
    }
} else {
    echo json_encode(array("message" => "Không có dữ liệu.", "status" => false));
}
$conn->close();
?>