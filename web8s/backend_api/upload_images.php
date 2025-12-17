<?php
header('Content-Type: application/json');
$target_dir = "../uploads/";
if (!is_dir($target_dir)) mkdir($target_dir, 0777, true);

$success_count = 0;
foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
    $file_name = time() . '_' . $_FILES['images']['name'][$key]; // Tránh trùng tên
    if (move_uploaded_file($tmp_name, $target_dir . $file_name)) {
        $success_count++;
    }
}

echo json_encode(['status' => $success_count > 0, 'message' => "Đã tải lên $success_count ảnh."]);
?>