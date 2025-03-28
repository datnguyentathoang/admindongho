<?php
include 'connect.php'; // Kết nối CSDL

// Kiểm tra kết nối
if (!$conn) {
    die("Kết nối thất bại: " . mysqli_connect_error());
}

// Nhận dữ liệu từ form
$ma_nguoi_dung = $_POST['mand'];
$ho_ten = $_POST['hvt'];
$ten_dang_nhap = $_POST['tendn'];
$email = $_POST['mail'];
$mat_khau = $_POST['mk'];
$so_dien_thoai = $_POST['dt'];
$vai_tro = $_POST['vt'];

// Kiểm tra xem có cập nhật mật khẩu không
$update_mat_khau = "";
if (!empty($mat_khau)) {
    $hashed_password = password_hash($mat_khau, PASSWORD_BCRYPT);
    $update_mat_khau = ", mat_khau = ?";
}

// Câu lệnh SQL cập nhật dữ liệu
$query = "UPDATE nguoidung SET 
            ho_ten = ?, 
            tendangnhap = ?, 
            email = ?, 
            so_dien_thoai = ?, 
            vai_tro = ?" . $update_mat_khau . " 
            WHERE ma_nguoi_dung = ?";

// Chuẩn bị câu lệnh
$stmt = $conn->prepare($query);

// Ràng buộc giá trị vào câu lệnh SQL
if (!empty($mat_khau)) {
    $stmt->bind_param("ssssssi", $ho_ten, $ten_dang_nhap, $email, $so_dien_thoai, $vai_tro, $hashed_password, $ma_nguoi_dung);
} else {
    $stmt->bind_param("sssssi", $ho_ten, $ten_dang_nhap, $email, $so_dien_thoai, $vai_tro, $ma_nguoi_dung);
}

// Thực thi truy vấn
if ($stmt->execute()) {
    echo "<script>alert('Cập nhật thành công!'); window.location='../nguoidung.php';</script>";
} else {
    echo "<script>alert('Lỗi khi cập nhật: " . $conn->error . "'); window.location='../nguoidung.php';</script>";
}

// Đóng kết nối
$stmt->close();
$conn->close();
?>