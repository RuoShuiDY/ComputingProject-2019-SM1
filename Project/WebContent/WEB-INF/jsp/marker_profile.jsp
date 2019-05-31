<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
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
    <!-- year picker css -->
    <link rel="stylesheet" href="../../assets/css/yearpicker.css">
    <!-- jquery ui css and js -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- dataTables -->
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
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
                  <a class="nav-link" href="/dashboard/markerDashboard"><i class="fa fa-dashboard"></i><span>Dashboard</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#markerSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-user"></i><span>Marker Information</span></a>
                  <ul class="list-unstyled" id="markerSubmenu">
                    <li>
                      <a class="nav-link active" href="/marker/updateProfile"><span>Update Profile</span></a>
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
        <div class="page-content col-xs-9 col-sm-9 col-md-9 col-lg-9">
          <div class="content">
              <div class="row">
                <!-- breadcrumb -->
                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                  <ol class="breadcrumb row">
                    <li class="breadcrumb-item"><a href="/dashboard/markerDashboard">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Marker Information</a></li>
                    <li class="breadcrumb-item active">Marker Proile</li>
                  </ol>
                </div>

                <!-- Invite Marker-->
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                  <button class="sleeve" id="view">
                    <i class="fa fa-envelope"></i><span class="sleeve_text">Subject</span>
                    <span class="insert">View</span>
                  </button>
                  <!--
                  <div class="sendInvitation row">
                    <button type="button" class="btn-primary" id="invite" name="button"> </button>
                  </div>
                  -->
                </div>
            </div>

            <div class="row" id="profile">
                <form id="centre_form" class="col-lg-8 col-md-8 col-sm-8 col-xs-8" action="updateProfile" method="post">
                  <h5 class="form_topic">Marker Profile</h5>
                    <input type="hidden" value="${tutor.tutorId }" name="tutor_id">
                    <div class="form_row">
                      <label for="marker_email">Marker Email:</label>
                      <label name="marker_email" class="showTooltip form_content" id="marker_email"><span>${tutor.tutorEmail }</span></label>
                    </div>
                    <div class="form_row">
                      <label for="marker_name">Marker Name:</label>
                      <input type="text" name="tutor_name" class="form_content" id="marker_name" value="${tutor.tutorName }" autofocus>
                    </div>
                    <div class="form_row">
                      <label for="marker_contact">Marker Contact:</label>
                      <input type="text" name="tutor_phone" class="form_content" id="marker_contact" value="${tutor.tutorPhone }">
                    </div>
                    <div class="form_row">
                      <label for="marker_oldpwd">Original Password:</label>
                      <input type="password" name="o_password" class="form_content" id="marker_oldpwd" value="">
                    </div>
                    <div class="form_row">
                      <label for="marker_newpwd">New Password:</label>
                      <input type="password" name="n_password" class="form_content" id="marker_newpwd" value="">
                    </div>
                    <div class="row">
                      <button type="submit" name="button" class="col-lg-5 col-md-5 col-sm-5 col-xs-5" id="profile"><i class="fa fa-edit"></i><span>Update</span></button>
                    </div>
                </form>
              </div>

              <div class="form_vertical subject_view" style="display:none">
                <div class="">
                  <a class="close view" data-dismiss="view">&times;</a>
                  <form class="popup_view">
                      <h5 class="popup_form_topic">Subject History</h5>
                      <div class="row">
                        <table id="marker_subject_table" class="table table-hover">
                        <thead>
                          <tr>
                            <th>No.</th>
                            <th>Subject ID</th>
                            <th class="subject_name">Subject Name</th>
                            <th>Semester</th>
                            <th>Year</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${history }" var="lesson" varStatus="index">
	                          <tr>
	                            <td>${index.count }</td>
	                            <td class="subject_id">${lesson.classDict.classId }</td>
	                            <td class="subject_name">${lesson.classDict.className }</td>
	                            <td>${lesson.semester }</td>
	                            <td>${lesson.year }</td>
	                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </form>
              </div>

            </div>
          </div>
        </div>
      </div>

      <script language="javascript">
        $(document).ready(function () {
            //$('#marker_subject_table').DataTable();
            $('#view').click(function() {
  						if ($(".subject_view").css("display") == "none") {
                $('#view').blur();
  							$(".subject_view").show();
  						} else {
  							$(".subject_view").hide();
              }
						});

            //showtooltip
            $('.showTooltip').hover(function(){
              var text = $(this).val();
              $(this).addClass("data-toggle data-placement title");
              $(this).attr("data-toggle","tooltip");
              $(this).attr("data-placement","top");
              $(this).attr("title",text);
            });
            //showtooltip_select
            $('.showTooltipSelect').hover(function(){
              var text = $(this).find(":selected").text();
              $(this).addClass("data-toggle data-placement title");
              $(this).attr("data-toggle","tooltip");
              $(this).attr("data-placement","top");
              $(this).attr("title",text);
            });

            $('.cancel,.close').click(function(){
              $(this).parents(".form_vertical").hide();
            });
        });
      </script>
    </div>
  </body>
</html>
