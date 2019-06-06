<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>Teaching and Marking System</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- bootstrap 4.1.0 css -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<!-- jQuery 3.2.1 -->
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<!-- poper.min.js -->
<script
	src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<!-- bootstrap 4.1.0 javascript -->
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- font-awesome.css -->
<link href="../../assets/css/font-awesome.css" rel="stylesheet" />
<!-- system main css -->
<link href="../../assets/css/main_style.css" rel="stylesheet" />
<!-- year picker css -->
<link rel="stylesheet" href="../../assets/css/yearpicker.css">
<!-- jquery ui css and js -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- dataTables -->
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" />
<script type="text/javascript" src="../../assets/js/main.js"></script>
</head>

<body>
	<div class="wrapper">
		<!-- top navigation -->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light fixed-top top-navbar">
			<button type="button" id="toggler" name="button"><i class="fa fa-align-left"></i></button>
			<a class="navbar-brand" href="/dashboard/dashboardUI"><span>Teaching
					and Marking System</span></a>
			<!-- navbar toggler -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- navbar content -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<!-- navbar user -->
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fa fa-user"><span>Hello,
									${lecturer.lecturerName }</span></i>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/user/logout">Logout</a>
						</div></li>
				</ul>
			</div>
		</nav>

		<!--  page -->
		<div class="row" id="page">
			<!-- sidebar -->
			<nav id="sidebar"
				class="bg-light navbar-light col-xs-2 col-sm-2 col-md-2 col-lg-2">
				<ul class="list-unstyled">
					<li class="nav-item"><a class="nav-link"
						href="/dashboard/dashboardUI"><i class="fa fa-dashboard"></i><span>Dashboard</span></a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="/lesson/lessonlist"><i class="fa fa-book"></i><span>Subject
								Information</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#markerSubmenu"
						data-toggle="collapse" aria-expanded="false"
						class="dropdown-toggle"><i class="fa fa-user"></i><span>Marker
								Information</span></a>
						<ul class="list-unstyled" id="markerSubmenu">
							<li><a class="nav-link active"
								href="/tutor/tutor_invite_list"><span>Marker
										Invitation</span></a></li>
							<li><a class="nav-link" href="/tutor/overview"><span>Marker
										Overview</span></a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="/assign/list"><i
							class="fa fa-tasks"></i><span>Marking Allocation</span></a></li>
					<li class="nav-item"><a class="nav-link" href="/mark/list"><i
							class="fa fa-file"></i><span>Scores & Results</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="/mark/showChart"><i class="fa fa-bar-chart-o"></i><span>Score
								Charts</span></a></li>
				</ul>
			</nav>

			<!-- page content -->
			<div class="page-content col-xs-10 col-sm-10 col-md-10 col-lg-10">
				<div class="content">
					<div class="row">
						<!-- breadcrumb -->
						<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
							<ol class="breadcrumb row">
								<li class="breadcrumb-item"><a
									href="/dashboard/dashboardUI">Home</a></li>
								<li class="breadcrumb-item"><a href="#">Marker
										Information</a></li>
								<li class="breadcrumb-item active">Marker Invitation</a></li>
							</ol>
						</div>
						<!-- Invite Marker-->
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
					<!-- display Marker-->
					<div class="displayMarker">
						<table id="marker_table" class="table-responsive table table-hover">
							<thead>
								<tr>
									<th>No.</th>
									<th>Marker Email</th>
									<th>Subject ID</th>
									<th>Subject Name</th>
									<th>Semester</th>
									<th>Year</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="tutorLesson" varStatus="varStatus"
									items="${tutorInfo}">
									<tr>
										<td>${varStatus.count }</td>
										<td>${tutorLesson.tutor.tutorEmail }</td>
										<td>${tutorLesson.lesson.classDict.classId }</td>
										<td>${tutorLesson.lesson.classDict.className }</td>
										<td>${tutorLesson.lesson.semester }</td>
										<td>${tutorLesson.lesson.year }</td>
										<td><c:if test="${tutorLesson.status != 'ACTIVATED'}">
	                      		INVITED
	                      	</c:if> <c:if
												test="${tutorLesson.status == 'ACTIVATED'}">
	                      		ACTIVATED
	                      	</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- invite marker -->
						<div class="form_vertical inviteMarker" style="display: none">
							<a class="close" data-dismiss="addSubject">&times;</a>
							<form class="popup_form" action="invite_tutor" method="post"
								id="invite_form">
								<h5 class="popup_form_topic">Marker Invitation</h5>
								<div class="popup_form_row">
									<label for="email"><span
										class="badge badge-secondary check_email"></span> Marker
										Email:</label> <input type="email" class="showTooltip" name="email"
										id="email" value="" autocomplete="off" autofocus />
								</div>
								<div class="popup_form_row">
									<label for="subject"><span
										class="badge badge-secondary check_subject"></span> Subject:</label> <input
										type="text" class="showTooltip form_content" id="subject_info"
										name="subject" list="subject" autocomplete="off">
									<datalist id="subject">
										<c:forEach items="${lesson }" var="lesson">
											<option data-id="${lesson.lessonId}"
												value="${lesson.classDict.classId } ${lesson.semester } ${lesson.year }"></option>
										</c:forEach>
									</datalist>
									<input type="hidden" name="subject_id" id="answer-hidden">

								</div>
								<div class="row">
									<button type="button" name="button"
										class="form_vertical_button col-lg-5 col-md-5 col-sm-5 col-xs-5"
										id="invite_submit" disabled>
										<i class="fa fa-envelope"></i><span>Invite</span>
									</button>
									<button type="button" name="button"
										class="form_vertical_button cancel col-lg-5 col-md-5 col-sm-5 col-xs-5">
										<i class="fa fa-times-circle"></i></i><span>Cancel</span>
									</button>
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

            $('#invite').click(function() {
  						if ($(".inviteMarker").css("display") == "none") {
                $('#invite').blur();
  							$(".inviteMarker").show();
  						} else {
  							$(".inviteMarker").hide();
              }
						});
            //validation
            $('#email').blur(function(){
              flag2 = false;
              if(reg.test($('#email').val())){
                  $('.check_email').removeClass("badge-danger");
                  $('.check_email').addClass("badge-success");
                  $('.check_email').html("Valid");
                  flag2 = true;
              }
              if(!flag2){
                $('.check_email').removeClass("badge-success");
                $('.check_email').addClass("badge-danger");
                $('.check_email').html("Invalid");
                $('#invite_submit').addClass("disabled");
              }
              else if(flag1 && flag2 && $('#email').val().trim()!="" && $('#subject_info').val().trim()!=""){
                $('#invite_submit').removeClass("disabled");
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
                $('#invite_submit').addClass("disabled");
              }
              else if(flag1 && flag2 && $('#email').val().trim()!="" && $('#subject_info').val().trim()!=""){
                $('#invite_submit').removeClass("disabled");
                $('#invite_form').submit();
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
                $(".inviteMarker").hide();
              };
            });

            $('.cancel,.close').click(function(){
              $(this).parents(".form_vertical").hide();
            });
        });
      </script>
	</div>
</body>
</html>
