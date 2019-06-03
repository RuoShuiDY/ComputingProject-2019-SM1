<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                  <a class="dropdown-item" href="/marker/profile_list">Update Profile</a>
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
          <nav id="sidebar" class="bg-light navbar-light col-xs-2 col-sm-2 col-md-2 col-lg-2 visible">
            <ul class="list-unstyled">
                <li class="nav-item">
                  <a class="nav-link" href="/dashboard/markerDashboard"><i class="fa fa-dashboard"></i><span>Dashboard</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#markerSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-user"></i><span>Marker Information</span></a>
                  <ul class="collapse list-unstyled" id="markerSubmenu">
                    <li>
                      <a class="nav-link" href="/marker/profile_list"><span>Update Profile</span></a>
                    </li>
                  </ul>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#spreadsheetSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-file"></i><span>Spreadsheets</span></a>
                  <ul class="list-unstyled" id="spreadsheetSubmenu">
                    <li>
                      <a class="nav-link active" href="/file/downloadUI"><span>Download Document</span></a>
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
                <li class="breadcrumb-item"><a href="#">Spreadsheet</a></li>
                <li class="breadcrumb-item active">Download Document</a></li>
              </ol>
              <!-- Download -->
              <div class="row" id="download">
                  <form id="centre_form" class="col-lg-8 col-md-8 col-sm-8 col-xs-8" action="downloadFile" method="post">
                    <h5 class="form_topic">Download Spreadsheet</h5>
                    <div class="form_row">
                      <label for="subject"><span class="badge badge-secondary check_subject"></span> Subject:</label>
                      <input type="text" class="showTooltip form_content" id="subject_info" name="subject" list="subject" autocomplete="off" autofocus required>
                      <datalist id="subject">
                        <c:forEach items="${lessons}" var="lesson">
                        	<option value="${lesson.classDict.classId} ${lesson.classDict.className}-${lesson.semester}-${lesson.year}" data-id="${lesson.lessonId }"></option>
                        </c:forEach>
                      </datalist>
                      <input type="hidden" name="answer" id="answer-hidden">
                    </div>
                    <div class="form_row">
                      <label for="assignment"><span class="badge badge-secondary check_assignment"></span> Assignment:</label>
                      <input type="text" class="showTooltip form_content" id="assignment_info" name="assignment" list="assignment" autocomplete="off" autofocus required>
                      <datalist id="assignment">
                        <option value="1"></option>
                        <option value="2"></option>
                        <option value="3"></option>
                        <option value="4"></option>
                        <option value="5"></option>
                      </datalist>
                    </div>
                    <!-- <div class="row">
                      <div class="file">
                        <label for="file" class="col-lg-4 file_title"><span class=""></span> Marking File:</label>
                        <div class="custom-file col-lg-8 row">
                          <input type="file" class="custom-file-input col-lg-12">
                          <label class="custom-file-label">Choose a File from Folder</label>
                        </div>
                      </div>
                    </div> -->
                    <div class="row">
                      <button type="button" name="button" class="disabled col-lg-5 col-md-5 col-sm-5 col-xs-5" id="download"><i class="fa fa-download"></i><span>Download</span></button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
        </div>

      <script type="text/javascript">
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

          var flag1 = false;
          var flag2 = false;

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
              $('#download').addClass("disabled");
            }
            else if(flag1 && flag2){
              $('#download').removeClass("disabled");
            }
          });

          $('#assignment_info').blur(function(){
            flag2 = false;
            var options=$("#assignment").prop("options");
            for(var i=0;i<options.length;i++){
              var text = options[i].value;
              if(text==$('#assignment_info').val()){
                $('.check_assignment').removeClass("badge-danger");
                $('.check_assignment').addClass("badge-success");
                $('.check_assignment').html("Valid");
                flag2 = true;
                break;
              }
            }
            if(!flag2){
              $('.check_assignment').removeClass("badge-success");
              $('.check_assignment').addClass("badge-danger");
              $('.check_assignment').html("Invalid");
              $('#download').addClass("disabled");
            }
            else if(flag1 && flag2){
              $('#download').removeClass("disabled");
            }
          });
        });
        
        $('#download').click(function(){
            if($('#subject_info').val().trim()!=="" && $('#assignment_info').val().trim()!==""){
           	 $('#centre_form').submit();
             }else{
             	 $('#warning').text("Please input a valid Subject/Assignment!");
     	         $('.warning').removeAttr("hidden");
     	         setTimeout(function(){
     	            $('.warning').attr("hidden", true);
     	         }, 5000);
             }
        });       
      </script>
      
  <script type="text/javascript">
	  console.log("ok");
	  $.noConflict();
	  if (${operation} == false){
		  var msg = "${msg}";
	  	//window.alert("Username or password wrong");
	  	 (function ($) {
	  		$('#error').text(msg);
	  		$('.error').attr("hidden", false);
	      	setTimeout(function(){
	    	  $('.error').attr("hidden", true);
	      	}, 5000)
	     } (jQuery));
	  }
  </script>
  
  <script type="text/javascript">
  if (${operation} == true){
	  var msg = "${msg}";
  	//window.alert("Username or password wrong");
  	 (function ($) {
  		$('#success').text(msg);
  		$('.success').attr("hidden", false);
      	setTimeout(function(){
    	  $('.success').attr("hidden", true);
      	}, 5000)
     } (jQuery));
  }
  </script>

  </body>
</html>
