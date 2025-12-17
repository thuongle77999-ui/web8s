<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

// Nhận dữ liệu từ Fetch API (JSON)
$data = json_decode(file_get_contents("php://input"), true);
$fileName = isset($data['fileName']) ? $data['fileName'] : '';

if (empty($fileName)) {
    echo json_encode(['status' => false, 'message' => 'Tên file không hợp lệ.']);
    exit;
}

// Đường dẫn đến thư mục chứa ảnh (đi ngược ra từ backend_api/ vào uploads/)
$target_file = "../uploads/" . $fileName;

// Kiểm tra file có tồn tại hay không và tiến hành xóa
if (file_exists($target_file)) {
    if (unlink($target_file)) {
        echo json_encode(['status' => true, 'message' => 'Đã xóa ảnh thành công.']);
    } else {
        echo json_encode(['status' => false, 'message' => 'Không thể xóa file trên server.']);
    }
} else {
    echo json_encode(['status' => false, 'message' => 'File không tồn tại: ' . $fileName]);
}
?>