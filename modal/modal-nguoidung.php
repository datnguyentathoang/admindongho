<!-- modal_edit.php -->
<div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title">Sửa thông tin người dùng: <?php echo $manguoidung; ?></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
        </button>
    </div>
    <div class="modal-body">
        <form method="POST" action="./lib/update_nguoidung.php">
            <input type="hidden" name="manguoidung" value="<?php echo $manguoidung; ?>">
            <div class="form-group">
                <label for="mand">Mã người dùng:</label>
                <input type="text" class="form-control" id="mand" name="mand" value="<?php echo $manguoidung; ?>" required readonly>
            </div>
            <div class="form-group">
                <label for="hvt">Họ và tên:</label>
                <input type="text" class="form-control" id="hvt" name="hvt" value="<?php echo $hvt; ?>" required>
            </div>
            <div class="form-group">
                <label for="tendn">Tên đăng nhập:</label>
                <input type="text" class="form-control" id="tendn" name="tendn" value="<?php echo $tendn; ?>" required>
            </div>
            <div class="form-group">
                <label for="mail">Email:</label>
                <input type="email" class="form-control" id="mail" name="mail" value="<?php echo $mail; ?>" required>
            </div>
            <div class="form-group">
                <label for="mk">Mật khẩu:</label>
                <input type="password" class="form-control" id="mk" name="mk" value="" placeholder="Để trống nếu không thay đổi">
            </div>
            <div class="form-group">
                <label for="dt">Số điện thoại:</label>
                <input type="text" class="form-control" id="dt" name="dt" value="<?php echo $dt; ?>" required>
            </div>
            <div class="form-group">
                <label for="vt">Vai trò:</label>
                <input type="text" class="form-control" id="vt" name="vt" value="<?php echo $vt; ?>" required>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
            </div>
        </form>
    </div>
</div>