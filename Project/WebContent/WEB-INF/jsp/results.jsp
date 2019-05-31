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
  <script type="text/javascript" src="../../assets/js/main.js"></script>
</head>

<body>
  <div class="wrapper">
    <!-- top navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top top-navbar">
      <button type="button" id="toggler" name="button"><i class="fa fa-align-left"></i></button>
      <a class="navbar-brand" href="dashboard.html"><span>Teaching and Marking System</span></a>
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
      <nav id="sidebar" class="bg-light navbar-light col-xs-2 col-sm-2 col-md-2 col-lg-2 visible">
        <ul class="list-unstyled">
            <li class="nav-item">
              <a class="nav-link" href="dashboard.html"><i class="fa fa-dashboard"></i><span>Dashboard</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="subject.html"><i class="fa fa-book"></i><span>Subject Information</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#markerSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-user"></i><span>Marker Information</span></a>
              <ul class="list-unstyled collapse" id="markerSubmenu">
                <li>
                  <a class="nav-link" href="marker_invite.html"><span>Marker Invitation</span></a>
                </li>
                <li>
                  <a class="nav-link" href="marker.html"><span>Marker Overview</span></a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="allocation.html"><i class="fa fa-tasks"></i><span>Marking Allocation</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="results.html"><i class="fa fa-file"></i><span>Scores & Results</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="score_charts.html"><i class="fa fa-bar-chart-o"></i><span>Score Charts</span></a>
            </li>
          </ul>
      </nav>

        <!-- page content -->
        <div class="page-content col-xs-10 col-sm-10 col-md-10 col-lg-10">
          <div class="content">
            <div class="row">
              <!-- breadcrumb -->
              <ol class="breadcrumb col-xs-9 col-sm-9 col-md-9 col-lg-9">
                <li class="breadcrumb-item"><a href="dashboard.html">Home</a></li>
                <li class="breadcrumb-item active">Scores & Results</a></li>
              </ol>

              <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <button class="sleeve" id="invite">
                  <i class="fa fa-envelope"></i><span class="sleeve_text">Result Email</span>
                  <span class="insert">SEND</span>
                </button>
              </div>
            </div>

            <!-- search bar -->
            <div class="row searchbar">
              <form class="results_selection" action="list" method="post">
                <div class="row charts_selection">
                  <div class="col-lg-4">
                    <label for="subject"><span class="badge badge-secondary check_subject"></span> Subject:</label>
                    <br>
                    <input type="text" class="showTooltip" id="subject_info" name="subject" list="subject" autocomplete="off">
                    <datalist id="subject">
                      <c:forEach items="${lessons }" var="lesson">
                        <option value="${lesson.classDict.classId } ${lesson.semester } ${lesson.year}" data-id="${lesson.lessonId }"></option>
                      
                      </c:forEach>
                    </datalist>
                    <input type="hidden" name="lessonId" id="answer-hidden">
                  </div>
                  <div class="col-lg-3">
                    <label for="assignment"><span class="badge badge-secondary check_assignment"></span> Assignment:</label>
                    <br>
                    <input type="text" class="showTooltip" id="assignment_info" name="assignment" list="assignment" autocomplete="off" placeholder=" Can Be None">
                    <datalist id="assignment">
                      <option value="1"></option>
                      <option value="2"></option>
                      <option value="3"></option>
                      <option value="4"></option>

                    </datalist>
                  </div>
                  <div class="col-lg-2">
                    <label>Operation:</label><br>
                    <button type="submit" class="button" id="generate" name="button">Show Results</button>
                  </div>
                  <div class="col-lg-1">
                    <label>TOTAL NUMBER of STUDENTS:</label>
                    <label>${number }</label>
                  </div>
                  <div class="col-lg-2">

                  </div>
                </div>
              </form>
            </div>

            <div class="">
              <div class="blank"></div>
              <div class="displayResults">
                <table id="results_table" class="table-responsive table table-hover">
                  <thead>
                    <tr>
                      <th>
                        All<input type="checkbox" name="" id="checkall" value="">
                      </th>
                      <th>No.</th>
                      <th>Subject</th>
                      <th>Tutor Email</th>
                      <th>Student ID</th>
                      <th>Student Email</th>
                      <th>Student Username</th>
                      <th>Student Name</th>
                      <th>Assignment</th>
                      <th>Mark</th>
                      <th>Max Mark</th>
                      <th>Comment</th>
                      <th><span id="table_th">Operations</span></th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${marks }" var="mark" varStatus="index"> 
	                    <tr id="${mark.markId }">
	                        <td>
	                          <input type="checkbox" class="checkbox" name="tick" value="${mark.markId }">
	                        </td>
	                        <td>${index.count }</td>
	                        <td id="subject">${mark.classId } ${mark.semester } ${mark.year }</td>
	                        <td>${mark.tutorEmail }</td>
	                        <td id="student_id">${mark.studentId }</td>
	                        <td id="student_email">${mark.studentEmail }</td>
	                        <td>${mark.studentUsername }</td>
	                        <td>${mark.studentSurname } ${mark.studentGivenname }</td>
	                        <td id="assignment">${mark.assignment }</td>
	                        <td id="mark">${mark.marks }</td>
	                        <td>${mark.maxMark }</td>
	                        <td id="comment">${mark.comment }</td>
	                        <td>
	                          <button type="button" class="update_button" name="button" id="update_results"><i class="fa fa-edit"></i><span>Update</span></button>
	                        </td>
	                    </tr>
                    </c:forEach>
                  </tbody>
                </table>

                <!-- update results -->
                <div class="form_vertical updateResults" style="display:none">
                  <a class="close" data-dismiss="updateResults">&times;</a>
                  <form class="popup_form" action="update" method="post">
                    <h5 class="popup_form_topic">Update Scores & Results</h5>
                    <div class="popup_form_row">
                      <label>Subject:</label>
                      <label class="showTooltip subject_label showLabel"></label>
                      <label>Student ID:</label>
                      <label class="showTooltip student_id_label showLabel"></label>
                      <label>Student Email:</label>
                      <label class="showTooltip student_email_label showLabel"></label>
                      <label>Assignment:</label>
                      <label class="showTooltip assignment-label showLabel"></label>
                      
                      <input id="hiddenMarkId" type="hidden" name="mark_id" value=""/>
                      
                      <label>Mark:</label>
                      <input type="text" class="showTooltip mark_label showLabel" name="mark" value="" required>
                      <label>Comment</label>
                      <textarea name="comment" rows="5" cols="62" class="comment_label" required></textarea>
                    </div>
                    <div class="row">
                      <button type="submit" name="button" class="disabled form_vertical_button col-lg-5 col-md-5 col-sm-5 col-xs-5" id="update_submit"><i class="fa fa-edit"></i><span>Update</span></button>
                      <button type="button" name="button" class="form_vertical_button cancel col-lg-5 col-md-5 col-sm-5 col-xs-5"><i class="fa fa-times-circle"></i></i><span>Cancel</span></button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <!-- display Results-->

          </div>
        </div>
      </div>

      <script language="javascript">
        $(document).ready(function () {
            $('#results_table').DataTable();
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
            	
  						if ($(".updateResults").css("display") == "none") {
  							$(".updateResults").show();
  				$("#hiddenMarkId").val($(this).parents("tr").attr("id"));
                $(".subject_label").html($(this).parents("tr").find("#subject").text());
                $(".student_id_label").html($(this).parents("tr").find("#student_id").text());
                $(".student_email_label").html($(this).parents("tr").find("#student_email").text());
                $(".assignment-label").html($(this).parents("tr").find("#assignment").text());
                $(".mark_label").val($(this).parents("tr").find("#mark").text());
                $(".comment_label").html($(this).parents("tr").find("#comment").text());
  						} else {
  							$(".updateResults").hide();
              }
						});

            $('#update_submit').click(function(){
                $(".updateResults").hide();
            });

            $('.cancel').click(function(){
                $(".updateResults").hide();
            });

            $('.close').click(function(){
                $(".updateResults").hide();
            });

            $('#checkall').click(function(){
              if(!$(this).hasClass("checked")){
                $('#checkall').addClass("checked")
                $(".checkbox").attr("checked", true);
              }else{
                $('#checkall').removeClass("checked")
                $(".checkbox").attr("checked", false);
              }
            });
            
            $('#invite').click(function(){
            	var $check_boxes = $("input[name='tick']:checked");
            	var mkids = new Array();
            	$check_boxes.each(function(){
            		mkids.push($(this).val());
            	});
            	$.post("sendEmails",{"mkids":mkids},function(result){
    				window.alert('Send Successfully!');
    			});
            });
            
          });
      </script>
    </div>
  </body>
</html>
