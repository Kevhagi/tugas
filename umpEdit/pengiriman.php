<div class="row">
    <div class="col-md-12">
        <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                Data Pengiriman
            </div>
            <div class="panel-body">
                <div class="table">
                    <table class="table table-striped table-bordered table-hover" id="tabelku">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kd Penjualan</th>
                                <th>Kd Resi</th>
                                <th>Ekspedisi</th>
                                <th>Tgl Input Resi</th>
                                <th>Cekresi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php  
                                $peng = $pengiriman->tampil_pengiriman();
                                foreach ($peng as $index => $data) {
                            ?>
                            <tr class="odd gradeX">
                                <td><?php echo $index + 1; ?></td>
                                <td><?php echo $data['kd_penjualan']; ?></td>
                                <td><?php echo $data['kd_resi']; ?></td>
                                <td><?php echo $data['ekspedisi'];?></td>
                                <td><?php echo $data['tgl_inputresi'];?></td>
                                <td>
                                    <a href="https://cekresi.com/?v=wdg&noresi=<?php echo $data['kd_resi']; ?>" target="_BLANK" class="btn btn-info btn-xs"><i class="fa fa-search"></i> Detail</a>
                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>   
            </div>
        </div>
        <!--End Advanced Tables -->
    </div>
</div>