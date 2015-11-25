<!DOCTYPE html>
<html>
<head>
	<title>Pengumupulan Tugas</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->
	<!-- <link rel="stylesheet" href="css/bootstrap-theme.min.css"> -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery-1.11.1.js"></script>


</head>
<body>
	<?php include("layout_praktikan.php") ?>
	<div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">Upload Kelas IF A</h4>
                	<div class="dropdown">
    				<form action="upload.php" method="post" enctype="multipart/form-data">
		<table class="table table-hover" style="width: 50%">
			<tr>
				<td><strong>Pilih ID Tugas: </strong></td>
				<td><div align="left">
					<select name = "kelas">
						<option value="PD001">PD001</option>
						<option value="PD002">PD002</option>
						<option value="PD001">PD003</option>
					</select>
				</td>
			</tr>
			<tr>

				<td><strong>Select File: </strong></td>
				<td><div align="left"><input type="file" id="fileToUpload" name="fileToUpload" style="color: transparent"></div></td>
				<script>
					document.getElementById('fileToUpload').onchange = uploadOnChange;

					function uploadOnChange() {
					    var filename = this.value;
					    var lastIndex = filename.lastIndexOf("\\");
					    if (lastIndex >= 0) {
					        filename = filename.substring(lastIndex + 1);
					    }
			    		document.getElementById('filename').innerHTML = filename;
					}
				</script>
			</tr>
			<tr>
				<td><strong>File Name: </strong></td>
				<td><label id="filename">No file.</label></td>
			</tr>

		</table>

		<div class="alert alert-info" style="width: 50%">Upload berkas di haruskan menggunakan format archive (rar, zip, tar.gz, 7z)</div>
		<input type="submit" name="submit" value="Input Jawaban" class="btn btn-primary">
		<!-- <a href="home.php" class="btn btn-success" role="button">Lihat Daftar</a> -->
	</form>
  				</div>
                </div>
                
                
            </div>
        </div>
    </div>
	<footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    &copy; 2015 YourCompany | By : <a href="http://www.designbootstrap.com/" target="_blank">DesignBootstrap</a>
                </div>

            </div>
        </div>
    </footer>
</body>
</html>