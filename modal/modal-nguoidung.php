<!-- modal-nguoidung.php -->
 
<div class="modal-content">
    <div class="modal-header bg-primary text-white">
        <h4 class="modal-title" id="editModalLabel<?php echo $manguoidung; ?>">Sửa thông tin người dùng: <?php echo $manguoidung; ?></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body p-4">
        <form method="POST" action="./lib/update_nguoidung.php">
            <input type="hidden" name="manguoidung" value="<?php echo $manguoidung; ?>">
            <div class="form-group mb-3">
                <label for="mand<?php echo $manguoidung; ?>" class="form-label fw-bold">Mã người dùng:</label>
                <input type="text" class="form-control form-control-lg" id="mand<?php echo $manguoidung; ?>" name="mand" value="<?php echo $manguoidung; ?>" required readonly>
            </div>
            <div class="form-group mb-3">
                <label for="hvt<?php echo $manguoidung; ?>" class="form-label fw-bold">Họ và tên:</label>
                <input type="text" class="form-control form-control-lg" id="hvt<?php echo $manguoidung; ?>" name="hvt" value="<?php echo $hvt; ?>" required>
            </div>
            <div class="form-group mb-3">
                <label for="tendn<?php echo $manguoidung; ?>" class="form-label fw-bold">Tên đăng nhập:</label>
                <input type="text" class="form-control form-control-lg" id="tendn<?php echo $manguoidung; ?>" name="tendn" value="<?php echo $tendn; ?>" required>
            </div>
            <div class="form-group mb-3">
                <label for="mail<?php echo $manguoidung; ?>" class="form-label fw-bold">Email:</label>
                <input type="email" class="form-control form-control-lg" id="mail<?php echo $manguoidung; ?>" name="mail" value="<?php echo $mail; ?>" required>
            </div>
            <div class="form-group mb-3">
                <label for="mk<?php echo $manguoidung; ?>" class="form-label fw-bold">Mật khẩu:</label>
                <input type="password" class="form-control form-control-lg" id="mk<?php echo $manguoidung; ?>" name="mk" value="" placeholder="Để trống nếu không thay đổi">
            </div>
            <div class="form-group mb-3">
                <label for="dt<?php echo $manguoidung; ?>" class="form-label fw-bold">Số điện thoại:</label>
                <input type="text" class="form-control form-control-lg" id="dt<?php echo $manguoidung; ?>" name="dt" value="<?php echo $dt; ?>" required>
            </div>
            <div class="form-group mb-3">
                <label for="vt<?php echo $manguoidung; ?>" class="form-label fw-bold">Vai trò:</label>
                <input type="text" class="form-control form-control-lg" id="vt<?php echo $manguoidung; ?>" name="vt" value="<?php echo $vt; ?>" required>
            </div>
            <div class="modal-footer border-0">
                <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-primary btn-lg">Lưu thay đổi</button>
            </div>
        </form>
    </div>
</div>