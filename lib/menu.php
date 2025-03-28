<?php
$host = 'localhost'; 
$username = 'root';  
$password = '';      
$database = 'quanlydongho'; 

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Truy vấn dữ liệu menu (Không lấy parent_id)
$sql = "SELECT id, Menu AS name, url FROM menu";
$result = $conn->query($sql);

$menu = [];

// Lưu dữ liệu vào mảng
while ($row = $result->fetch_assoc()) {
    $menu[] = $row;
}

// Hàm hiển thị menu (Không có menu con)
function displayMenu($menu) {
    $html = '<ul>';
    foreach ($menu as $item) {
        $name = $item['name'] ?? 'Không có tên'; // Kiểm tra nếu 'name' không tồn tại
        $html .= '<li><a href="' . $item['url'] . '">' . $name . '</a></li>';
    }
    $html .= '</ul>';
    return $html;
}

// Hiển thị menu chính
echo displayMenu($menu);

$conn->close();
?>
