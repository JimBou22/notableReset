<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel='icon' href='images/favicon.ico' type='image/x-icon' />
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/myBoot.css">
<link rel="stylesheet" href="css/product.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Notable Wholesale</title>
</head>
<body>
<header>
        <div id="homeHeader">
            <div class="row" id="topRow">
                <div class="col-sm-4">
                    <a href="home?name=home"><img src="images/notableWholesaleLogo.png"
                        id="mainLogo" alt=""></a>
                </div>
                <div class="col-sm-4" id="searchForm">
                    <form class="form-inline-custom">
                        <input class="searchWidth mr-sm-2" type="search"
                            placeholder="Search" aria-label="Search">
                        <button class="headerButton btn my-2 my-sm-0" id="searchBtn"
                            type="submit">
                            <i class="fa fa-search"></i> Search
                        </button>
                    </form>
                </div>
                <div class="col-sm-4">
                    <div class="leftHeader">
                        <a class="headerButton btn" href="home?name=cart" role="button"><i
                            class="fa fa-shopping-cart"></i> Cart</a> 
                            <a class="headerButton btn" href="home?name=login" role="button"><i
							class="fa fa-address-card"></i> Sign In</a>
                            
                            <a class="headerButton btn"
                            href="home?name=account" id="navbarDropdownMenuLink" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user-circle"></i> My Account
                        </a>
                        <div class="dropdown-menu"
                            aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="home?name=account"><i
                                class="fa fa-user"></i> User Profile</a> <a class="dropdown-item"
                                href="home?name=orders"><i class="fa fa-list-ul"></i> Order
                                History</a> <a class="dropdown-item" href="home?name=wishlist.jsp"><i
                                class="fa fa-gift"></i> Wishlist</a> <a class="dropdown-item"
                                href="home?name=home"><i class="fa fa-power-off"></i> Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="productMenu">
            <div class="d-flex justify-content-center">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="nav-link dropdown-toggle" href=""
                        id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"> Groceries </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="home?name=groceries">All Groceries</a> <a
                            class="dropdown-item" href="home?name=meatSticks">Meat Sticks</a> <a
                            class="dropdown-item" href="home?name=crackers">Crackers</a> <a
                            class="dropdown-item" href="home?name=tofu">Free-range Tofu</a>
                    </div>
                </nav>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="nav-link dropdown-toggle" href=""
                        id="navbarDropdownMenuLink2" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"> Clothing </a>
                    <div class="dropdown-menu"
                        aria-labelledby="navbarDropdownMenuLink2">
                        <a class="dropdown-item" href="home?name=clothing">All Clothing</a> <a
                            class="dropdown-item" href="home?name=romphim">Romphims</a> <a
                            class="dropdown-item" href="home?name=onesie">Onesies</a> <a
                            class="dropdown-item" href="home?name=snuggy">Snuggies</a>
                    </div>
                </nav>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="nav-link dropdown-toggle" href="#"
                        id="navbarDropdownMenuLink3" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"> Electronics </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="home?name=electronics">All
                            Electronics</a> <a class="dropdown-item" href="home?name=computer">Computers</a>
                        <a class="dropdown-item" href="home?name=HDMI">HDMI Cables</a> <a
                            class="dropdown-item" href="home?name=TV">Televisions</a>
                    </div>
                </nav>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="nav-link dropdown-toggle" href="#"
                        id="navbarDropdownMenuLink4" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"> Sporting Goods </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="home?name=sporting-goods">All
                            Sporting Goods</a> <a class="dropdown-item" href="home?name=nunchucks">Nunchucks</a>
                        <a class="dropdown-item" href="home?name=javelin">Javelins</a> <a
                            class="dropdown-item" href="home?name=skates">Rocket Skates</a>
                    </div>
                </nav>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="nav-link dropdown-toggle" href="#"
                        id="navbarDropdownMenuLink5" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"> Office Supplies </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="home?name=office-supplies">All
                            Office Supplies</a> <a class="dropdown-item" href="home?name=stapler">Staplers</a>
                        <a class="dropdown-item" href="home?name=shredder">Paper Shredders</a>
                        <a class="dropdown-item" href="home?name=3dprinter">3D Printers</a>
                    </div>
                </nav>
            </div>
        </div>
    </header>
  <div class="container home">
    <div class="row">
      <div class="col-md-12">
        <h1>Featured Products</h1>
      </div>
    </div>
  </div>
  <div class="container home">
    <div class="row featureProducts">
      <div class="col-sm-3">
        <a href="home?name=javelin"><img src="images/javelin.jpg" alt="Roman Javelin"></a>
        <p>Authentic Roman Javelin</p>
        <p>$575.99</p>
      </div>
      <div class="col-sm-3">
        <a href="home?name=TV"><img src="images/television.jpg" alt="Television"></a>
        <p>Samsung 40in Television</p>
        <p>$299.00</p>
      </div>
      <div class="col-sm-3">
        <a href="home?name=stapler"><img src="images/stapler.jpg" alt="Stapler"></a>
        <p>Stapler</p>
        <p>$9.99</p>
      </div>
      <div class="col-sm-3">
        <a href="home?name=romphim"><img src="images/romphim.jpg" alt="Romphim"></a>
        <p>Stylish Romphim</p>
        <p>$59.99</p>
      </div>
    </div>
  </div>
   <footer>
    <nav class="" id="footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-4 mx-auto">
            <h5 class="font-weight-bold text-uppercase mt-3">About</h5>
            <ul class="list-unstyled">
              <li>
                <a href="#!">Contact Us</a>
              </li>
              <li>
                <a href="#!">About Us</a>
              </li>
              <li>
                <a href="#!">Careers</a>
              </li>
              <li>
                <a href="#!">User Stories</a>
              </li>
              <li>
                <a href="#!">Testimonials</a>
              </li>
              <li>
                <a href="#!">Press</a>
              </li>
              <li>
                <a href="#!">Photos</a>
              </li>
            </ul>
          </div>
          <div class="col-sm-4 mx-auto">
            <h5 class="font-weight-bold text-uppercase mt-3">Help</h5>
            <ul class="list-unstyled">
              <li>
                <a href="#!">Payments</a>
              </li>
              <li>
                <a href="#!">Shipping</a>
              </li>
              <li>
                <a href="#!">Cancellation & Returns</a>
              </li>
              <li>
                <a href="#!">FAQ</a>
              </li>
            </ul>
          </div>
          <div class="col-sm-4" id="socialMediaIcons">
            <h5 class="font-weight-bold text-uppercase mt-1">Social</h5>
            <span>
              <a class="fb-ic mr-3" role="button"><i class="fa fa-lg fa-facebook-f"></i></a>
              <a class="tw-ic mr-3" role="button"><i class="fa fa-lg fa-twitter"></i></a>
              <a class="ins-ic mr-3" role="button"><i class="fa fa-lg fa-instagram"></i></a>
            </span>
          </div>
        </div>
      </div>
    </nav>
    </div>
    <div id="footer-copyright" class="footer-copyright text-center py-3">© 2020 Notable Wholesale
    </div>
  </footer>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  <script src="js/account.js"></script>
  <script src="js/cart.js"></script>
  <script src="js/cartTest.js"></script>
  <script src="js/colors.js"></script>
  <script src="js/search.js"></script>
  <script src="js/zach.js"></script>
</body>
</html>