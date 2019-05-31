<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <a class="nav-link" href="#markerSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-user"></i><span>Marker Information</span></a>
                <ul class="list-unstyled" id="markerSubmenu">
                  <li>
                    <a class="nav-link" href="marker_invite.html"><span>Marker Invitation</span></a>
                  </li>
                  <li>
                    <a class="nav-link" href="marker.html"><span>Marker Overview</span></a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="allocation.html"><i class="fa fa-tasks"></i><span>Marking Allocation</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="results.html"><i class="fa fa-file"></i><span>Scores & Results</span></a>
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
                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                  <ol class="breadcrumb row">
                    <li class="breadcrumb-item"><a href="dashboard.html">Home</a></li>
                    <li class="breadcrumb-item active"><a href="#">Marking Allocation</a></li>
                  </ol>
                </div>
                <!-- Invite Marker-->
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                  <button class="sleeve" id="allocate">
                    <i class="fa fa-envelope"></i><span class="sleeve_text">Allocation</span>
                    <span class="insert">SETUP</span>
                  </button>
                </div>
            </div>

            <!-- display Marking Information-->
            <div class="displayMarker">
              <table id="marker_table" class="table table-hover">
                <thead>
                  <tr>
                    <th>No.</th>
                    <th>Marker Email</th>
                    <th>Subject ID</th>
                    <th>Subject Name</th>
                    <th>Semester</th>
                    <th>Year</th>
                    <th>Assignment</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${allocationList}" var="list" varStatus="index">
	                  <tr>
	                      <td>${index.count }</td>
	                      <td>${list.tutorLesson.tutor.tutorEmail }</td>
	                      <td>${list.tutorLesson.lesson.classDict.classId }</td>
	                      <td>${list.tutorLesson.lesson.classDict.className }</td>
	                      <td>${list.tutorLesson.lesson.semester }</td>
	                      <td>${list.tutorLesson.lesson.year }</td>
	                      <td>Assignment${list.assignment }</td>
	                      <td>Allocated</td>
	                  </tr>
	                 </c:forEach>
	                
                </tbody>
              </table>

              <!-- allocate marking -->
              <div class="form_vertical allocation" style="display:none">
                <a class="close" data-dismiss="addSubject">&times;</a>
                <form class="popup_form" action="allocate" method="post" enctype="multipart/form-data">
                  <h5 class="popup_form_topic">Marking Allocation</h5>
                  <div class="popup_form_row">
                    <label for="subject"><span class="badge badge-secondary check_subject"></span> Subject:</label>
                    <input type="text" class="showTooltip form_content" id="subject_info" name="subject" list="subject" autocomplete="off">
                    <datalist id="subject">
                      <c:forEach items="${lesson}" var="lessonItem">
                        <option value="${lessonItem.classDict.classId} ${lessonItem.semester } ${lessonItem.year } " data-id="${lessonItem.lessonId }"></option>
                      </c:forEach>
                    </datalist>
                    <input type="hidden" id="answer-hidden" name="lessonId">
                  </div>
                  <div class="popup_form_row">
                    <label for="assignment"><span class=""></span> Assignment:</label>
                    <input type="assignment" class="showTooltip" name="assignment" id="assignment" value="" autocomplete="off" name="assignment"/>
                  </div>
          				<div class="row">
                    <div class="col-lg-11">
                      <label for="file" class="col-lg-4 left-align"><span class=""></span> Students:</label>
                      <div class="custom-file col-lg-8 row">
                        <input type="file" class="custom-file-input col-lg-12" name="stuExcel">
                        <label class="custom-file-label">Choose a File from Folder</label>
                      </div>
                    </div>
          				</div>
                    <div class="row">
                      <button type="submit" name="button" class="form_vertical_button disabled col-lg-5 col-md-5 col-sm-5 col-xs-5" id="allocate_submit"><i class="fa fa-refresh"></i><span>Allocate</span></button>
                      <button type="button" name="button" class="form_vertical_button cancel col-lg-5 col-md-5 col-sm-5 col-xs-5"><i class="fa fa-times-circle"></i></i><span>Cancel</span></button>
                    </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

      <script language="javascript">
        $(document).ready(function () {
            $('input[list]').on('input', function(e) {
                var $input = $('#subject_info'),
                    $options = $('#' + $input.attr('list') + ' option'),
                    $hiddenInput = $('#answer-hidden'),
                    label = $input.val();

                for(var i = 0; i < $options.length; i++) {
                    var $option = $options.eq(i);
                    if($option.val() === label) {
                        $hiddenInput.val( $option.attr('data-id') );
                        console.log($hiddenInput.val());
                        break;
                    }
                }
            });

            $('#marker_table').DataTable();
            $('#year').val("");
            var flag1 = false;
            var flag2 = false;
            var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;

            $('#allocate').click(function() {
  						if ($(".allocation").css("display") == "none") {
                $('#allocate').blur();
  							$(".allocation").show();
  						} else {
  							$(".allocation").hide();
              }
						});

            //validation
            $('#subject_info').blur(function(){
              flag1 = false;
              var options=$("#subject").prop("options");
              for(var i=0;i<options.length;i++){
                var text = options[i].value;
                if(text==$('#subject_info').val()){
                  $('.check_subject').removeClass("badge-danger");
                  $('.check_subject').addClass("badge-success");
                  $('.check_subject').html("Valid");
                  flag1 = true;
                  break;
                }
              }
              if(!flag1){
                $('.check_subject').removeClass("badge-success");
                $('.check_subject').addClass("badge-danger");
                $('.check_subject').html("Invalid");
                $('#allocate_submit').addClass("disabled");
              }
              else if(flag1){
                $('#allocate_submit').removeClass("disabled");
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

            $('#allocate_submit').click(function(){
              if(!$('#allocate_submit').hasClass("disabled")){
                $(".allocation").hide();
              };
            });

            $('.cancel,.close').click(function(){
              $(this).parents(".form_vertical").hide();
            });
        });
      </script>

      <script type="text/javascript" src="../../assets/js/bs-custom-file-input.js"></script>
      <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
            bsCustomFileInput.init()

            var btn = document.getElementById('btnResetForm')
            var form = document.querySelector('form')
            btn.addEventListener('click', function () {
              form.reset()
            })
          });
      </script>
    </div>
  </body>
</html>
