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
                <i class="fa fa-user"><span>Hello, ${lecturer.lecturerName }</span></i>
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
                    <a class="nav-link active" href="#"><span>Tutor Invitation</span></a>
                  </li>
                  <li>
                    <a class="nav-link" href="tutor.html"><span>Tutor Overview</span></a>
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
                    <a class="nav-link" href="group_sending."><span>Group Sending</span></a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="score_charts.html"><i class="fa fa-bar-chart-o"></i><span>Score Charts</span></a>
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
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Tutor Information</a></li>
                    <li class="breadcrumb-item active">Tutor Invitation</a></li>
                  </ol>
                </div>
                <!-- Invite Tutor-->
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                  <button class="sleeve" id="invite">
                    <i class="fa fa-envelope"></i><span class="sleeve_text">Invitation</span>
                    <span class="insert">SEND</span>
                  </button>
                  <!--
                  <div class="sendInvitation row">
                    <button type="button" class="btn-primary" id="invite" name="button"> </button>
                  </div>
                  -->
                </div>
            </div>
            <!-- display Tutor-->
            <div class="displayTutor">
              <table id="tutor_table" class="table table-hover">
                <thead>
                  <tr>
                    <th>No.</th>
                    <th>Tutor Email</th>
                    <th>Subject ID</th>
                    <th>Subject Name</th>
                    <th>Semester</th>
                    <th>Year</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="tutorLesson" varStatus="varStatus" items="${tutorInfo}">                  
	                  <tr>
	                      <td>${varStatus.count }</td>
	                      <td>${tutorLesson.tutor.tutorEmail }</td>
	                      <td>${tutorLesson.lesson.classDict.classId }</td>
	                      <td>${tutorLesson.lesson.classDict.className }</td>
	                      <td>${tutorLesson.lesson.semester }</td>
	                      <td>${tutorLesson.lesson.year }</td>
	                      <td>
	                      	<c:if test="${tutorLesson.status != 'ACTIVATED'}">
	                      		INVITED
	                      	</c:if>
	                      	<c:if test="${tutorLesson.status == 'ACTIVATED'}">
	                      		ACTIVATED
	                      	</c:if>
	                      </td>
	                  </tr>
                  </c:forEach>
                </tbody>
              </table>

              <!-- invite tutor -->
              <div class="form_vertical inviteTutor" style="display:none">
                <a class="close" data-dismiss="addSubject">&times;</a>
                <form class="popup_form" action="invite_tutor" method="post">
                  <h5 class="popup_form_topic">Tutor Invitation</h5>
                  <label for="year">Tutor Email:</label>
                  <input type="text" class="showTooltip" value="" name="tutor_email"/>
                  <label for="subject_id"><span class="badge badge-secondary"></span> Subject ID:</label>
                  <input type="text" id="check" class="showTooltip" name="subject_id" list="subject" autocomplete="off">
                  <datalist id="subject">
                  <c:forEach items="${classDict }" var="classdict">
                  	<option value="${classdict.classId } ${classdict.className}"></option>
	                  <!--
	                    <option value="COMP90004"></option>
	                    <option value="COMP90024"></option>
	                  -->
                  </c:forEach>
                  </datalist>
                  <br>
                  <label for="semester">Semester:</label>
                  <select class="showTooltipSelect" name = "semester">
                    <option>Semester1</option>
                    <option>Semester2</option>
                    <option>Summer Term</option>
                    <option>Winter Term</option>
                  </select>
                  <br>
                  <label for="year">Year:</label>
                  <input type="text" class="yearpicker showTooltip" value="" name = "year"/>
                  <script src="../../assets/js/yearpicker.js" async></script>
                  <br>
                  <div class="row">
                    <button type="submit" name="button" class="form_vertical_button disabled col-lg-5 col-md-5 col-sm-5 col-xs-5" id="invite_submit"><i class="fa fa-envelope"></i><span>Invite</span></button>
                    <button type="button" name="button" class="form_vertical_button cancel col-lg-5 col-md-5 col-sm-5 col-xs-5"><i class="fa fa-times-circle"></i></i><span>Cancel</span></button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>


    <!-- alert -->
    <div class="alert alert-warning alert-dismissible fade show warning" hidden>
      <button type="button" class="close" data-dismiss="alert" style="">&times;</button>
      <strong>Warning!</strong>&nbsp;<span id="warning"></span>
    </div>
    <!-- alert -->
    <div class="alert alert-danger alert-dismissible fade show error" hidden>
      <button type="button" class="close" data-dismiss="alert" style="">&times;</button>
      <strong>Error!</strong>&nbsp;<span id="error"></span>
    </div>
    <!-- alert -->
    <div class="alert alert-success alert-dismissible fade show success" hidden>
      <button type="button" class="close" data-dismiss="alert" style="margin:10px;padding:0">&times;</button>
      <strong>Success!</strong>&nbsp;<span id="success"></span>
    </div>	
    
      <script language="javascript">
        $(document).ready(function () {
            $('#tutor_table').DataTable();
            $('#year').val("");

            $('#invite').click(function() {
  						if ($(".inviteTutor").css("display") == "none") {
                $('#invite').blur();
  							$(".inviteTutor").show();
  						} else {
  							$(".inviteTutor").hide();
              }
						});

            $('#check').blur(function(){
              var flag = false;
              var options=$("#subject").prop("options");
              for(var i=0;i<options.length;i++){
                var text = options[i].value;
                if(text==$('#check').val()){
                  $('.badge').removeClass("badge-danger");
                  $('.badge').addClass("badge-success");
                  $('.badge').html("Valid");
                  flag = true;
                  $('#invite_submit').removeClass("disabled")
                  break;
                }
              }
              if(!flag){
                $('.badge').removeClass("badge-success");
                $('.badge').addClass("badge-danger");
                $('.badge').html("Invalid");
                $('#invite_submit').addClass("disabled")
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

            $('#invite_submit').click(function(){
              if(!$('#invite_submit').hasClass("disabled")){
                $(".inviteTutor").hide();
              };
            });

            $('.cancel,.close').click(function(){
              $(this).parents(".form_vertical").hide();
            });
        });
      </script>
      
      <script type="text/javascript">
	      $.noConflict();
	      var msg = "${msg}";
	      console.log(msg);
	      if (${operation} == true){
	         (function ($) {
	          $('#success').text(msg);
	          $('.success').removeAttr("hidden");
	            setTimeout(function(){
	            $('.success').attr("hidden", true);
	          }, 5000);
	         } (jQuery));
	      }else if (${operation} == false){
	        (function ($) {
	          $('#error').text(msg);
	          $('.error').removeAttr("hidden");
	            setTimeout(function(){
	            $('.error').attr("hidden", true);
	          }, 5000);
	         } (jQuery));
	      }
  	  </script>
    </div>
  </body>
</html>
