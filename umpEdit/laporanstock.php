<div class="row">
	<div class="col-md-12">
		<h2>Laporan Persediaan</h2>
	</div>
	<br/><br/>
	<hr/>
	<br/>
	<div class="col-md-12">
		<form method="POST" class="form-inline">
			<div class="form-group">
				<button class="btn btn-success" name="semua"><i class="fa fa-play-circle-o"></i> Semua Data</button>
			</div>
		</form>
	</div>
</div>
<hr/>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading" align="center">
				<?php if (isset($_POST['semua'])): ?>
					<a href="laporan/cetaklaporanstock.php?semua" target="_BLANK" class="btn btn-info"><i class="fa fa-print"></i> Cetak</a>
				<?php endif ?>
				<?php if (!isset($_POST['semua'])): ?>
					<a href="#" class="btn btn-info" disabled="disabled"><i class="fa fa-print"></i> Cetak</a>
				<?php endif ?>
			</div>
			<div class="panel-body">
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="active">
							<th>No</th>
							<th>Kode Barang</th>
							<th>Nama Barang</th>
							<th>Satuan</th>
							<th>Stok</th>
						</tr>
					</thead>
					<tbody>
					<?php
						if (isset($_POST['semua'])) {
							$lap = $barang->tampil_barang();
							foreach ($lap as $index => $data) {
					?>
						<tr>
							<td><?php echo $index + 1; ?></td>
							<td><?php echo $data['kd_barang']; ?></td>
							<td><?php echo $data['nama_barang']; ?></td>
							<td><?php echo $data['satuan']; ?></td>
							<td><?php echo $data['stok']; ?></td>
						</tr>
					<?php
						    }
						}
                    ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>