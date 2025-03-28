<?php
include ('./connect.php');

$mnd = $_POST['manguoidung'];

$query = "
DELETE FROM nguoidung WHERE ma_nguoi_dung = '$mnd';";
if (mysqli_multi_query($conn, $query)) {
    echo "<script>alert('Xóa thành công!'); window.location='../nguoidung.php';</script>";
} else {
    echo "Lỗi: " . mysqli_error($conn);
}

$conn->close();
?>