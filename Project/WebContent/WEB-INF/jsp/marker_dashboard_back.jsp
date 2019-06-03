<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Teaching and Marking System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- bootstrap 4.1.0 css -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <!-- jQuery 3.2.1 -->
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <!-- poper.min.js -->
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <!-- bootstrap 4.1.0 javascript -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <!-- font-awesome.css -->
    <link href="../../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- system main css -->
    <link href="../../assets/css/main_style.css" rel="stylesheet" />
    <style>
      /* Make the image fully responsive */
      .carousel-inner img {
          width: 100%;
          height: 100%;
      }
    </style>
  </head>

  <body>
    <div class="wrapper">
        <!-- top navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top top-navbar">
          <a class="navbar-brand" href="/dashboard/markerDashboard"><span>Teaching and Marking System</span></a>
          <!-- navbar toggler -->
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <!-- navbar content -->
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- navbar user -->
            <ul class="navbar-nav ml-auto">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fa fa-user"><span>Hello, ${tutor.tutorName }</span></i>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="/marker/updateProfile">Update Profile</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="/user/logout">Logout</a>
                </div>
              </li>
            </ul>
          </div>
        </nav>

        <!--  page -->
        <div class="row" id="page">
          <!-- sidebar -->
          <nav id="sidebar" class="bg-light navbar-light col-xs-2 col-sm-2 col-md-2 col-lg-2">
            <ul class="list-unstyled">
                <li class="nav-item">
                  <a class="nav-link active" href="/dashboard/markerDashboard"><i class="fa fa-dashboard"></i><span>Dashboard</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#markerSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-user"></i><span>Marker Information</span></a>
                  <ul class="collapse list-unstyled" id="markerSubmenu">
                    <li>
                      <a class="nav-link" href="/marker/updateProfile"><span>Update Profile</span></a>
                    </li>
                  </ul>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#spreadsheetSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-file"></i><span>Spreadsheets</span></a>
                  <ul class="collapse list-unstyled" id="spreadsheetSubmenu">
                    <li>
                      <a class="nav-link" href="/file/downloadUI"><span>Download Document</span></a>
                    </li>
                    <li>
                      <a class="nav-link" href="/file/uploadUI"><span>Upload Document</span></a>
                    </li>
                  </ul>
                </li>
              </ul>
          </nav>

          <!-- page content -->
          <div class="page-content col-xs-10 col-sm-10 col-md-10 col-lg-10">
            <!-- breadcrumb -->
            <ol class="breadcrumb row">
              <li class="breadcrumb-item"><a href="/dashboard/markerDashboard">Home</a></li>
              <li class="breadcrumb-item active">Dashboard</a></li>
            </ol>
            <!-- welcome -->
            <div id="welcome" class="carousel slide row" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#welcome" data-slide-to="0" class="active"></li>
                <li data-target="#welcome" data-slide-to="1" c></li>
              </ol>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="https://static.runoob.com/images/mix/img_fjords_wide.jpg">
                  <div class="carousel-caption">
                    <h4>Welcome to Teaching and Marking System</h4>
                    <h5>${tutor.tutorName }</h5>
                  </div>
                </div>
                <div class="carousel-item">
                  <img src="https://static.runoob.com/images/mix/img_nature_wide.jpg">
                  <div class="carousel-caption">
                    <h4 id="date"></h4>
                    <h5 id="weekday"></h5>
                  </div>
                </div>
              </div>
              <a class="carousel-control-prev" href="#welcome" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#welcome" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
        </div>
      </div>

      <script type="text/javascript">
        $(document).ready(function () {
          setInterval(function(){
            var d = new Date($.now());
            var months = ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"];
            var input = d.getDate()+" "+(months[d.getMonth()])+" "+d.getFullYear();
            var weekday = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];
            var index =  d.getDay()-1;
            var text = weekday[index]+", "+input;
            $('#date').html(text);
            var time = d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
            $('#weekday').html(time);
          },1000);
        });
      </script>
  </body>
</html>