<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>AviX</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css' />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css' />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="../account_auth/js/auth.js"></script>
    <!-- CSS here -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../assets/css/slicknav.css">
    <link rel="stylesheet" href="../assets/css/animate.min.css">
    <link rel="stylesheet" href="../assets/css/hamburgers.min.css">
    <link rel="stylesheet" href="../assets/css/magnific-popup.css">
    <link rel="stylesheet" href="../assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/css/themify-icons.css">
    <link rel="stylesheet" href="../assets/css/themify-icons.css">
    <link rel="stylesheet" href="../assets/css/slick.css">
    <link rel="stylesheet" href="../assets/css/nice-select.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/responsive.css">
</head>
<body>
    <header>
        <!-- Header Start -->
        <div class="header-area">
            <div class="main-header ">
                <div class="header-top d-none d-lg-block">
                    <div class="container">
                        <div class="col-xl-12">
                            <div class="row d-flex justify-content-between align-items-center">
                                <div class="header-info-left">
                                    <ul>     
                                        <li><i class="fas fa-phone"></i> +233 26 192 7932</li>
                                        <li><i class="far fa-envelope"></i>nyantakyi42@gmail.com</li>
                                    </ul>
                                </div>
                                <div class="header-info-left">
                                    <ul>
                                        <button id="signin_btn" class="btn btn-sm btn-outline-success " type="button">Sign In</button>
                                        <img style="margin-right: 8pc;" id="avatar" class="signed_in hide">
                                        <li><p id="username" class="signed_in hide"></p></li>
                                        <button id="logout_btn" class="btn btn-sm btn-outline-success signed_in hide" type="button">Log Out</button>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-bottom  header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="../index.php"><img src="../assets/img/logo/logo.png" alt="" width=200 height=100></a>
                                </div>
                            </div>
                            <div class="col-xl-9 col-lg-8">
                                <div class="menu-wrapper  d-flex align-items-center">
                                    <!-- Main-menu -->
                                    <div class="main-menu d-none d-lg-block">
                                        <nav> 
                                            <ul id="navigation">                                                                                          
                                                <li><a href="../index.php">Home</a></li>
                                                <li><a href="../about.php">About</a></li>
                                                <li><a href="../services.php">Services</a>
                                                    <ul class="submenu">
                                                        <li><a href="comair.php">Commercial Aircrafts</a></li>
                                                        <li><a href="heli.php">Helicopters</a></li>
                                                        <li><a href="defence.php">Defence Aircrafts</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="../project.php">Project</a></li>
                                                <li class="active"><a href="comair.php">M320</a></li>
                                                <li class="hideupdate"><a href="update.php">Update</a></li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="cart.php"><i class="fas fa-shopping-cart"></i> <span id="cart-item" class="badge badge-danger"></span></a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div> 
                    
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    <main>
        <section class="sample-text-area">
            <div class="container box_1170">
                <h3 class="text-heading">Commercial Aircraft Model M320</h3>
                <p class="sample-text">
                    Here are some of our available aircrafts under this model
                </p>
            </div>
        </section>
        <!-- End Sample Area -->
        <div class="container">
            <div id="message"></div>
            <div class="row mt-2 pb-3">
                <?php
                    require '../config/db_connection.php';
                    $stmt = $con->prepare("SELECT AIRCRAFT.MODEL_ID, AIRCRAFT.AIRCRAFT_ID, AIRCRAFT.AIRCRAFT_CODE, AIRCRAFT.AIRCRAFT_IMAGE, AIRCRAFT.AIRCRAFT_NAME, AIRCRAFT.PRICE 
                    FROM `AIRCRAFT`
                    INNER JOIN MODEL ON MODEL.MODEL_ID = AIRCRAFT.MODEL_ID 
                    WHERE MODEL.MODEL_ID = '2'");
                    $stmt->execute();
                    $result = $stmt->get_result();
                    while ($row = $result->fetch_assoc()):
                ?>
                <div class="col-sm-6 col-md-4 col-lg-3 mb-2">
                    <div class="card-deck">
                        <div class="card p-2 border-secondary mb-2">
                            <img src="<?= $row['AIRCRAFT_IMAGE'] ?>" class="card-img-top" height="250">
                            <div class="card-body p-1">
                                <h4 class="card-title text-center text-info"><?= $row['AIRCRAFT_NAME'] ?></h4>
                                <h5 class="card-text text-center text-danger"><i class="fas fa-dollar-sign"></i>&nbsp;&nbsp;<?= number_format($row['PRICE'],2) ?></h5>
                            </div>
                            <div class="card-footer p-1">
                                <form action="" class="form-submit">
                                    <div class="row p-2">
                                    <div class="col-md-6 py-1 pl-4">
                                        <b>Quantity : </b>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="number" class="form-control pqty" value="1">
                                    </div>
                                    </div>
                                    <input type="hidden" class="user_id" value="">
                                    <input type="hidden" class="pid" value="<?= $row['AIRCRAFT_ID'] ?>">
                                    <input type="hidden" class="pname" value="<?= $row['AIRCRAFT_NAME'] ?>">
                                    <input type="hidden" class="pprice" value="<?= $row['PRICE'] ?>">
                                    <input type="hidden" class="pimage" value="<?= $row['AIRCRAFT_IMAGE'] ?>">
                                    <input type="hidden" class="pcode" value="<?= $row['AIRCRAFT_CODE'] ?>">
                                    <button class="btn btn-info btn-block addItemBtn">Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endwhile; ?>
            </div>
        </div>

       
        
    </main>
    <footer>
        <!-- Footer Start-->
        <div class="footer-area footer-padding">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-2 col-lg-2 col-md-4 col-sm-5">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Company</h4>
                                <ul>
                                    <li><a href="#">Why choose us</a></li>
                                    <li><a href="#"> Review</a></li>
                                    <li><a href="#">Customers</a></li>
                                    <li><a href="#">Blog</a></li>
                                    <li><a href="#">Carrier</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Production</h4>
                                <ul>
                                    <li><a href="#">Technology</a></li>
                                    <li><a href="#">Products</a></li>
                                    <li><a href="#">Quality</a></li>
                                    <li><a href="#">Sales geography</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-5 col-sm-8">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Contact Us</h4>
                                <div class="footer-pera">
                                    <p class="info1">Address: CA/52 Cantoments, Accra</p>
                                </div>
                            </div>
                            <div class="footer-number">
                                <p>Phone: +233 26 192 7932</p>
                                <p>Email: nyantakyi42@gmail.com</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle mb-50">
                                <h4>Newsletter</h4>
                                <p>Subscribe our newsletter to get updates about our services</p>
                            </div>
                            <!-- Form -->
                            <div class="footer-form">
                                <div id="mc_embed_signup">
                                    <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe_form relative mail_part" novalidate="true">
                                        <input type="email" name="EMAIL" id="newsletter-form-email" placeholder=" Email Address " class="placeholder hide-on-focus" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your email address'">
                                        <div class="form-icon">
                                            <button type="submit" name="submit" id="newsletter-submit" class="email_icon newsletter-submit button-contactForm">
                                                Subscribe
                                            </button>
                                        </div>
                                        <div class="mt-10 info"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer-bottom area -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="footer-border">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-xl-9 col-lg-8">
                            <div class="footer-copy-right">
                                <p>
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved </p>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-4">
                            <!-- Footer Social -->
                            <div class="footer-social f-right">
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-snapchat"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End-->
    </footer>
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
      <!-- JS here -->

      <script src="../assets/js/vendor/modernizr-3.5.0.min.js"></script>
      <!-- Jquery, Popper, Bootstrap -->
      <script src="../assets/js/vendor/jquery-1.12.4.min.js"></script>
      <script src="../assets/js/popper.min.js"></script>
      <script src="../assets/js/bootstrap.min.js"></script>
      <!-- Jquery Mobile Menu -->
      <script src="../assets/js/jquery.slicknav.min.js"></script>

      <!-- Jquery Slick , Owl-Carousel Plugins -->
      <script src="../assets/js/owl.carousel.min.js"></script>
      <script src="../assets/js/slick.min.js"></script>
      <!-- One Page, Animated-HeadLin -->
      <script src="../assets/js/wow.min.js"></script>
      <script src="../assets/js/animated.headline.js"></script>
      <script src="../assets/js/jquery.magnific-popup.js"></script>

      <!-- Date Picker -->
      <script src="../assets/js/gijgo.min.js"></script>
      <!-- Nice-select, sticky -->
      <script src="../assets/js/jquery.nice-select.min.js"></script>
      <script src="../assets/js/jquery.sticky.js"></script>
      
      <!-- counter , waypoint,Hover Direction -->
      <script src="../assets/js/jquery.counterup.min.js"></script>
      <script src="../assets/js/waypoints.min.js"></script>
      <script src="../assets/js/jquery.countdown.min.js"></script>
      <script src="../assets/js/hover-direction-snake.min.js"></script>

      <!-- contact js -->
      <script src="../assets/js/contact.js"></script>
      <script src="../assets/js/jquery.form.js"></script>
      <script src="../assets/js/jquery.validate.min.js"></script>
      <script src="../assets/js/mail-script.js"></script>
      <script src="../assets/js/jquery.ajaxchimp.min.js"></script>
      
      <!-- Jquery Plugins, main Jquery -->	
      <script src="../assets/js/plugins.js"></script>
      <script src="../assets/js/main.js"></script>

      <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
      <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js'></script>

      <script src="js/comair.js"></script>

      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
      <script src="../assets/js/homepage.js"></script>

      
      
    </body>
</html>