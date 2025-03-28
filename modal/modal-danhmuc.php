<!-- modal-nguoidung.php -->
 
<div class="modal-content">
    <div class="modal-header bg-primary text-white">
        <h4 class="modal-title" id="editModalLabel<?php echo $madm; ?>">Sửa thông tin danh mục: <?php echo $madm; ?></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body p-4">
        <form method="POST" action="./lib/update_danhmuc.php">
            <input type="hidden" name="madm" value="<?php echo $madm; ?>">
            <div class="form-group mb-3">
                <label for="madm<?php echo $madm; ?>" class="form-label fw-bold">Mã danh mục:</label>
                <input type="text" class="form-control form-control-lg" id="madm<?php echo $madm; ?>" name="madm" value="<?php echo $madm; ?>" required readonly>
            </div>
            <div class="form-group mb-3">
                <label for="hvt<?php echo $tendm; ?>" class="form-label fw-bold">Tên danh mục:</label>
                <input type="text" class="form-control form-control-lg" id="hvt<?php echo $tendm; ?>" name="tendm" value="<?php echo $tendm; ?>" required>
            </div>
            <div class="form-group mb-3">
                <label for="mt<?php echo $madm; ?>" class="form-label fw-bold">Mô tả:</label>
                <textarea class="form-control" id="mt<?php echo $madm; ?>" name="mt" rows="4" placeholder="Nhập mô tả" required><?php echo $mt; ?></textarea>
            </div>
           
            <div class="modal-footer border-0">
                <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-primary btn-lg">Lưu thay đổi</button>
            </div>
        </form>
    </div>
</div>