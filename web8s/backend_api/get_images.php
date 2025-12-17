<?php
header('Content-Type: application/json');
$upload_dir = '../uploads/'; // Thư mục chứa ảnh thực tế
$images = [];

if (is_dir($upload_dir)) {
    $files = scandir($upload_dir);
    foreach ($files as $file) {
        if (in_array(strtolower(pathinfo($file, PATHINFO_EXTENSION)), ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
            $images[] = [
                'name' => $file,
                'url' => 'uploads/' . $file // Đường dẫn tương đối để hiển thị
            ];
        }
    }
}
echo json_encode(['status' => true, 'images' => $images]);
?>