<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!-- <link rel="stylesheet" href="css/sl-slide.css"> -->
    <!-- <link rel="stylesheet" href="css/bootstrap-responsive.min.css"> -->
    <!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Free Responsive Admin Theme - ZONTAL</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
     <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

    <header>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <strong>Email: </strong>labkomdas.ptiik@ub.ac.id
                    &nbsp;&nbsp;
                    <strong>Support: </strong>+90-897-678-44
                </div>

            </div>
        </div>
    </header>

    <!-- HEADER END-->
    <div class="navbar navbar-inverse set-radius-zero">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php">

                    <img src="assets/img/logo.png" />
                </a>

            </div>

            <div class="left-div">
                <div class="user-settings-wrapper">
                    <ul class="nav">

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                <span class="glyphicon glyphicon-user" style="font-size: 25px;"></span>
                            </a>
                            <div class="dropdown-menu dropdown-settings">
                                <div class="media">
                                    <a class="media-left" href="#">
                                        <img src="assets/img/avatar.jpg" alt="" class="img-rounded" />
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">Jhon Deo Alex </h4>
                                        <h5>Informatika Kelas H</h5>

                                    </div>
                                </div>
                                <!-- <hr />
                                <h5><strong>Personal Bio : </strong></h5>
                                Anim pariatur cliche reprehen derit.
                                <hr /> -->
                                <!-- <a href="#" class="btn btn-info btn-sm">Full Profile</a>&nbsp;  -->
                                <a href="login.php" class="btn btn-danger btn-sm">Logout</a>

                            </div>
                        </li>


                    </ul>
                </div>
            </div>
        </div>
    </div>
      <!-- LOGO HEADER END-->
    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                        <?php 
                            // $id = $_GET["class"];
                            // if($id == 1){
                            //     $class1 = "menu-top-active";
                            // }
                            // else if($class == 2){
                            //     $class2 = "menu-top-active";
                            // }
                            // else if($class == 3){
                            //     $class3 = "menu-top-active";
                            // }
                            // else if($class == 4){
                            //     $class4 = "menu-top-active";
                            // }
                            // else if($class == 5){
                            //     $class5 = "menu-top-active";
                            // }
                            // else if($class == 6){
                            //     $class6 = "menu-top-active";
                            // }
                            
                        ?>
                            <?php echo "<li><a href=\"index.php?\">Home</a></li>" ?>
                            <?php echo "<li><a href=\"announce.php\">Pengumuman</a></li>" ?>
                            <?php echo "<li><a href=\"forum.php?\">Forum Tanya Jawab</a></li>" ?> 
                            <?php echo "<li><a href=\"asisten.php?\">Data Asisten</a></li>"  ?> 
                            <?php echo "<li><a href=\"soal.php?\">Lihat Soal</a></li>"  ?>
                            <?php echo "<li><a href=\"tugas.php?\">Pengumpulan Tugas</a></li>" ?> 
                            <?php echo "<li><a href=\"nilai.php?\">Lihat Nilai</a></li>" ?>
                            <!-- 
                            <li><a href="index.php">Pengumuman</a></li>
                            <li><a href="index.php">Forum Tanya Jawab</a></li>
                            <li><a href="index.php">Data Asisten</a></li>
                            <li><a href="index.php">Pengumpula Tugas</a></li>
                            <li><a href="index.php">Lihat Nilai</a></li> -->

<!--                             <li><a href="index.php">Dashboard</a></li>
                            <li><a href="ui.php">UI Elements</a></li>
                            <li><a href="table.php">Data Tables</a></li>
                            <li><a href="forms.php">Forms</a></li>
                             <li><a href="login.php">Login Page</a></li>
                            <li><a href="blank.php">Blank Page</a></li>
 -->
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- LOGO HEADER END-->
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
</body>
</html>
