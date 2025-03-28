<?php

function select_nguoidung(){
    include('connect.php'); // Kết nối MySQL
    $Query = "SELECT n.ma_nguoi_dung, n.ho_ten,n.tendangnhap,n.email,n.so_dien_thoai,n.vai_tro FROM nguoidung n;";
    $RunQuery = mysqli_query($conn, $Query);
    $Rows = mysqli_num_rows($RunQuery);

    if ($Rows == 0) {
        echo "<tr><td colspan='6'>Không có dữ liệu</td></tr>";
    } else {
        while ($ReadData = mysqli_fetch_assoc($RunQuery)) {
            $manguoidung = $ReadData["ma_nguoi_dung"];
            $hvt = $ReadData["ho_ten"];
            $tendn = $ReadData["tendangnhap"];
            $mail = $ReadData["email"];
            $dt = $ReadData["so_dien_thoai"];
            $vt = $ReadData["vai_tro"];

            echo "
                <tr>
                    <td>$manguoidung</td>
                    <td>$hvt</td>
                    <td>$tendn</td>
                    <td>$mail</td>
                    <td>$dt</td>
                    <td>$vt</td>
                    <td>
                        <!-- Nút Sửa mở Modal -->
                        <button type=\"button\" class=\"btn btn-warning\" data-toggle=\"modal\" data-target=\"#editModal$manguoidung\">Sửa</button>
                        
                        <!-- Form Xóa -->
                        <form method=\"POST\" action=\"lib\delete_nguoidung.php\" style=\"display: inline;\">
                            <input type=\"hidden\" name=\"manguoidung\" value=\"$manguoidung\">
                            <button type=\"submit\" class=\"btn btn-danger\" onclick=\"return confirm('Bạn có chắc muốn xóa?');\">Xóa</button>
                        </form>
                    </td>
                </tr>

                <!-- Modal -->
                <div class=\"modal fade\" id=\"editModal$manguoidung\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"editModalLabel$manguoidung\" aria-hidden=\"true\">
                    <div class=\"modal-dialog modal-lg\" role=\"document\">";
                        include ('./modal/modal-nguoidung.php'); // Nhúng modal từ file riêng
            echo "      </div>
                </div>";
        }
    }
    $conn->close();
}
function add_nguoidung(){
    include('connect.php'); 
    
    if(isset($_POST["them_nguoidung"])) { 
        $manguoidung = $_POST["manguoidung"];
        $hovaten = $_POST["hovaten"];
        $tendn = $_POST["tendangnhap"];
        $email = $_POST["mail"];
        $mk = $_POST["password"];
        $dt = $_POST["sdt"];
        $vt = $_POST["vaitro"];
        // Mã hóa mật khẩu
        $hashed_password = password_hash($mk, PASSWORD_BCRYPT);
        // Kiểm tra xem MSSV đã tồn tại chưa
        $checkQuery = "SELECT * FROM nguoidung WHERE ma_nguoi_dung = '$manguoidung'";
        $result = mysqli_query($conn, $checkQuery);
        $checkQuery2 = "SELECT * FROM nguoidung WHERE tendangnhap = '$tendn'";
        $result2 = mysqli_query($conn, $checkQuery2);
    

        $checkQuery3 = "SELECT * FROM nguoidung WHERE email = '$email'";
        $result3 = mysqli_query($conn, $checkQuery3);
        $checkQuery4 = "SELECT * FROM nguoidung WHERE so_dien_thoai = '$dt'";
        $result4 = mysqli_query($conn, $checkQuery4);
        if (mysqli_num_rows($result4) > 0) {
            echo "<script>alert('Số điện thoại đã tồn tại! Vui lòng nhập số khác.');</script>";
        }

        if (mysqli_num_rows($result3) > 0) {
            echo "<script>alert('email đã tồn tại! Vui lòng nhập email khác.');</script>";
        }

        if (mysqli_num_rows($result2) > 0) {
            echo "<script>alert('Tên đăng nhập đã tồn tại! Vui lòng nhập tên khác.');</script>";
        }
        else  if (mysqli_num_rows($result) > 0) {
            echo "<script>alert('Mã người dùng đã tồn tại! Vui lòng nhập mã khác.');</script>";
        } else {
            // Chèn dữ liệu mới
          $sql = "INSERT INTO nguoidung (ma_nguoi_dung, ho_ten, tendangnhap, email, mat_khau, so_dien_thoai, vai_tro) 
        VALUES ('$manguoidung', '$hovaten', '$tendn', '$email', '$hashed_password', '$dt', '$vt')";
            
            if(mysqli_query($conn, $sql)){
                echo "<script>alert('Thêm bạn đọc thành công!');</script>";
                echo "<script>window.location.href='nguoidung.php';</script>"; // Thay header() bằng JavaScript
                exit();
            } else {
                echo "Lỗi: " . mysqli_error($conn);
            }
        }
    }
    $conn->close();
}



?>