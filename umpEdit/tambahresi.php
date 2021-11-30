<?php
    $kdpenjualan = "";
    if (isset($_GET['proses'])) {
        $kdpenjualan = $_GET['proses'];
    }
    if (isset($_POST['save'])) {
        $pengiriman->simpan_pengiriman($_GET['proses'],$_POST['kdresi'],$_POST['ekspedisi'],$_POST['tglinputresi']);
        echo "<script>bootbox.alert('Data pengiriman berhasil diinput!', function(confirmed){
                if (confirmed) {
                    location = 'index.php?page=tambahresi';
                }
            });
            </script>";
        $kdpenjualan = "";
    }
?>
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading">
				Input Resi
			</div>
			<div class="panel-body">
				<form method="POST">
					<div class="form-group">
						<label>Kd Penjualan</label>
						<input type="text" class="form-control" id="kdpenjualan" name="kdpenjualan" disabled="disabled" value="<?php echo $kdpenjualan; ?>">
					</div>
					<div class="form-group">
						<label>Kd Resi</label>
						<input type="text" class="form-control" id="kdresi" name ="kdresi" style="text-transform:uppercase" required>
					</div>
					<div class="form-group">
						<label>Nama Ekspedisi</label>
						<input type="text" class="form-control" id="ekspedisi" name="ekspedisi" style="text-transform:uppercase" required>
					</div>
                    <div class="form-group">
                        <label>Tanggal Input Resi</label>
                        <input type="date" class="form-control" name="tglinputresi" id="tglinputresi" required>
                    </div>
			</div>
			<div class="panel-footer">
			<?php if ($kdpenjualan === ""): ?>				
				<button class="btn btn-primary" name="save" id="save" disabled="disabled"><i class="fa fa-save"></i> Save</button>
			<?php endif ?>
			<?php if ($kdpenjualan !== ""): ?>
				<button class="btn btn-primary" name="save" id="save"><i class="fa fa-save"></i> Save</button>
			<?php endif ?>
			</div>
				</form>
		</div>
	</div>
<!--End Form-->
<!--data penjualannya-->
<div class="row">
    <div class="col-md-12">
        <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                Data Penjualan
            </div>
            <div class="panel-body">
                <div class="table">
                    <table class="table table-striped table-bordered table-hover" id="tabelku">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kd Penjualan</th>
                                <th>Tgl Penjualan</th>
                                <th>Item</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php  
                                $pen = $pengiriman->tampil_penjualan();
                                foreach ($pen as $index => $data) {
                                    $jumlahp = $penjualan->hitung_item_penjualan($data['kd_penjualan']);
                            ?>
                            <tr class="odd gradeX">
                                <td><?php echo $index + 1; ?></td>
                                <td><?php echo $data['kd_penjualan']; ?></td>
                                <td><?php echo $data['tgl_penjualan']; ?></td>
                                <td><?php echo $jumlahp['jumlah']; ?></td>
                                <td>
                                <a id="tombolProses" href="index.php?page=tambahresi&proses=<?php echo $data['kd_penjualan']; ?>" class="btn btn-success btn-xs"><i class="fa fa-download"></i> Proses</a>
                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>   
            </div>
        </div>
        <!--End Advanced Tables -->
<script>
	//upper
	$(function(){
		$('#kdresi').focusout(function() {
        	// Uppercase-ize contents
        	this.value = this.value.toLocaleUpperCase();
    	});
	});
    $(function(){
		$('#ekspedisi').focusout(function() {
        	// Uppercase-ize contents
        	this.value = this.value.toLocaleUpperCase();
    	});
	});
</script>

