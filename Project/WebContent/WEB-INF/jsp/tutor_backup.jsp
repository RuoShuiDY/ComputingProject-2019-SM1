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
        <a class="navbar-brand" href="#"><span>Teaching and Marking System</span></a>
        <!-- navbar toggler -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <!-- navbar content -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- navbar user -->
          <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-user"><span>Hello, ${lecturer.lecturerName}</span></i>
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Update Profile</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Logout</a>
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
                <a class="nav-link" href="dashboard.html"><i class="fa fa-dashboard"></i><span>Dashboard</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="subject.html"><i class="fa fa-book"></i><span>Subject Information</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#tutorSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-user"></i><span>Tutor Information</span></a>
                <ul class="list-unstyled" id="tutorSubmenu">
                  <li>
                    <a class="nav-link" href="tutor_invite.html"><span>Tutor Invitation</span></a>
                  </li>
                  <li>
                    <a class="nav-link active" href="#"><span>Tutor Overview</span></a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="results.html"><i class="fa fa-file"></i><span>Scores & Results</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#emailSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-envelope"></i><span>Send Email</span></a>
                <ul class="collapse list-unstyled" id="emailSubmenu">
                  <li>
                    <a class="nav-link" href="individual_email.html"><span>Individual Sending</span></a>
                  </li>
                  <li>
                    <a class="nav-link" href="group_sending.html"><span>Group Sending</span></a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="score_charts.html"><i class="fa fa-bar-chart-o"></i><span>Score Charts</span></a>
              </li>
            </ul>
        </nav>

        <!-- page content -->
        <div class="page-content col-xs-10 col-sm-10 col-md-10 col-lg-10">
          <div class="content">

            <!-- breadcrumb -->
            <ol class="breadcrumb row">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="#">Tutor Information</a></li>
              <li class="breadcrumb-item active">Tutor Overview</a></li>
            </ol>

            <!-- display Tutor-->
            <div class="displayTutor">
              <table id="tutor_table" class="table-responsive table table-hover">
                <thead>
                  <tr>
                    <th id="id">ID</th>
                    <th>No.</th>
                    <th>Tutor ID</th>
                    <th>Tutor Email</th>
                    <th>Tutor Name</th>
                    <th>Contact</th>
                    <th>Subject ID</th>
                    <th>Subject Name</th>
                    <th>Semester</th>
                    <th>Year</th>
                    <th><span id="table_th">Operations</span></th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${activatedList}" var="tl" varStatus="index">
                	<tr>
                      <td id="id">${tl.tutorLessonId }</td>
                      <td>${index.count}</td>
                      <td id="tutor_id">${tl.tutor.tutorId }</td>
                      <td id="tutor_email">${tl.tutor.tutorEmail }</td>
                      <td id="tutor_name">${tl.tutor.tutorName }</td>
                      <td id="tutor_contact">${tl.tutor.tutorPhone }</td>
                      <td id="subject_id">${tl.lesson.classDict.classId }</td>
                      <td id="subject_name">${tl.lesson.classDict.className }</td>
                      <td id="semester">${tl.lesson.semester }</td>
                      <td id="year">${tl.lesson.year }</td>
                      <td>
                        <button type="button" class="update_button" name="button"><i class="fa fa-edit"></i><span>Update</span></button>
                        <button type="button" class="delete_button" name="button"><i class="fa fa-minus"></i><span>Delete</span></button>
                      </td>
                  </tr>
                </c:forEach>
                  

                </tbody>
              </table>

              <!-- update tutor -->
              <div class="form_vertical updateTutor" style="display:none">
                <a class="close" data-dismiss="addSubject">&times;</a>
                <form class="popup_form" action="updateInfo" method="post">
                  <h5 class="popup_form_topic">Update Tutor Information</h5>
                  <label><span class="badge badge-secondary"></span> Tutor ID:</label>
                  <label class="showTooltip tutor-id-label showLabel"></label>
                  <label><span class="badge badge-secondary"></span> Tutor Email:</label>
                  <label class="showTooltip tutor-email-label showLabel"></label>
                  <label><span class="badge badge-secondary"></span> Tutor Name:</label>
                  <label class="showTooltip tutor-name-label showLabel"></label>
                  <label><span class="badge badge-secondary"></span> Contact:</label>
                  <label class="showTooltip tutor-contact-label showLabel"></label>
                  <label><span class="badge badge-secondary"></span> Subject ID:</label>
                  <label class="showTooltip subject-id-label showLabel"></label>
                  <label><span class="badge badge-secondary"></span> Subject Name:</label>
                  <label class="showTooltip subject-name-label showLabel"></label>
                  <!--
                  <label><span class="badge badge-secondary"></span> Semester:</label>
                  <label class="showTooltip subject-semester-label"></label>
                  <label><span class="badge badge-secondary"></span> Year:</label>
                  <label class="showTooltip subject-year-label"></label>
                  -->
                  <input type="hidden" name="tutorLessonId" id= "tutorLessonId" value=""/>
                  <input type="hidden" name="classId" id= "classId" value=""/>
                  <label for="semester">Semester:</label>
                  <select class="showTooltipSelect showLabel" name="semester">
                    <option>Semester1</option>
                    <option>Semester2</option>
                    <option>Summer Term</option>
                    <option>Winter Term</option>
                  </select>
                  <br>
                  <label for="year">Year:</label>
                  <input type="text" class="yearpicker showTooltip showLabel" value="" name="year"/>
                  <br>
                  <div class="row">
                    <button type="submit" name="button" class="form_vertical_button disabled col-lg-5 col-md-5 col-sm-5 col-xs-5" id="update_submit"><i class="fa fa-envelope"></i><span>Update</span></button>
                    <button type="button" name="button" class="form_vertical_button cancel col-lg-5 col-md-5 col-sm-5 col-xs-5"><i class="fa fa-times-circle"></i></i><span>Cancel</span></button>
                  </div>                </form>
              </div>

              <!-- confirm dialog-->
              <div id="dialog-confirm" title="Delete?">
                <p>This items will be permanently deleted and </br> <strong>cannot</strong> be recovered. Are you sure?</p>
              </div>
          </div>
            </div>
          </div>
        </div>
      </div>

      <script language="javascript">
        $(document).ready(function () {
            $('#tutor_table').DataTable();
            $('#year').val("");
            $('#dialog-confirm').hide();
            $('#tutor_table tr').find('#id').hide();
            
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

            $('.update_button').click(function() {
  						if ($(".updateTutor").css("display") == "none") {
  							$(".updateTutor").show();
  				$("#classId").val($(this).parents("tr").find("#subject_id").text());			
  				$("#tutorLessonId").val($(this).parents("tr").find("#id").html());
                $(".tutor-id-label").html($(this).parents("tr").find("#tutor_id").text());
                $(".tutor-email-label").html($(this).parents("tr").find("#tutor_email").text());
                $(".tutor-name-label").html($(this).parents("tr").find("#tutor_name").text());
                $(".tutor-contact-label").html($(this).parents("tr").find("#tutor_contact").text());
                $(".subject-id-label").html($(this).parents("tr").find("#subject_id").text());
                $(".subject-name-label").html($(this).parents("tr").find("#subject_name").text());
                //$(".subject-semester-label").html($(this).parents("tr").find("#semester").text());
                //$(".subject-year-label").html($(this).parents("tr").find("#year").text());
  						} else {
  							$(".updateTutor").hide();
              }
						});

            $('#update_submit').click(function(){
                $(".updateTutor").hide();
            });

            $('.delete_button').click(function(){
              tutorLessonId = $(this).parents('tr').find('#id').html();
              $("#dialog-confirm").dialog({
                resizable: false,
                height: "auto",
                width: 350,
                modal: true,
                buttons: {
                  "Delete": function() {  
                	  $.post("deleteId",{"tutorLessonId":tutorLessonId},function(result){
							window.location.reload();
						});
                    $( this ).dialog( "close" );
                  },
                  Cancel: function() {
                    $( this ).dialog( "close" );
                  }
                }
              });
            });

            $('.cancel,.close').click(function(){
              $(this).parents(".form_vertical").hide();
            });
        });
      </script>
    </div>
  </body>
</html>
