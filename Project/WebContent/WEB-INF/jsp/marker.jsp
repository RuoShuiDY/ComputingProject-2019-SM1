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
									${lecturer.lecturerName}</span></i>
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
							<li><a class="nav-link" href="/tutor/tutor_invite_list"><span>Marker
										Invitation</span></a></li>
							<li><a class="nav-link active" href="/tutor/overview"><span>Marker
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

					<!-- breadcrumb -->
					<ol class="breadcrumb row">
						<li class="breadcrumb-item"><a href="/dashboard/dashboardUI">Home</a></li>
						<li class="breadcrumb-item"><a href="#">Marker
								Information</a></li>
						<li class="breadcrumb-item active">Marker Overview</a></li>
					</ol>

					<!-- display Marker-->
					<div class="displayMarker">
						<table id="marker_table"
							class="table-responsive table table-hover">
							<thead>
								<tr>
									<th id="id">ID</th>
									<th>No.</th>
									<th>Marker ID</th>
									<th>Marker Email</th>
									<th>Marker Name</th>
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
										<td id="marker_id">${tl.tutor.tutorId }</td>
										<td id="marker_email">${tl.tutor.tutorEmail }</td>
										<td id="marker_name">${tl.tutor.tutorName }</td>
										<td id="marker_contact">${tl.tutor.tutorPhone }</td>
										<td id="subject_id">${tl.lesson.classDict.classId }</td>
										<td id="subject_name">${tl.lesson.classDict.className }</td>
										<td id="semester">${tl.lesson.semester }</td>
										<td id="year">${tl.lesson.year }</td>
										<td>
											<button type="button" class="update_button" name="button">
												<i class="fa fa-edit"></i><span>Update</span>
											</button>
											<button type="button" class="delete_button" name="button">
												<i class="fa fa-minus"></i><span>Delete</span>
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- update marker -->
						<div class="form_vertical updateMarker" style="display: none">
							<a class="close" data-dismiss="addSubject">&times;</a>
							<form class="popup_form" action="updateInfo" method="post"
								id="updateInfo">
								<h5 class="popup_form_topic">Update Marker Information</h5>
								<div class="popup_form_row">
									<label><span class="badge badge-secondary"></span>
										Marker ID:</label> <label
										class="showTooltip marker-id-label showLabel"></label>
								</div>
								<div class="popup_form_row">
									<label><span class="badge badge-secondary"></span>
										Marker Email:</label> <label
										class="showTooltip marker-email-label showLabel"></label>
								</div>
								<div class="popup_form_row">
									<label><span class="badge badge-secondary"></span>
										Marker Name:</label> <label
										class="showTooltip marker-name-label showLabel"></label>
								</div>
								<div class="popup_form_row">
									<label><span class="badge badge-secondary"></span>
										Contact:</label> <label
										class="showTooltip marker-contact-label showLabel"></label>
								</div>
								<div class="popup_form_row">
									<label for="subject"><span
										class="badge badge-secondary check_subject"></span> Subject:</label> <input
										type="text" class="showTooltip form_content" id="subject_info"
										name="subject" list="subject" autocomplete="off" autofocus>
									<datalist id="subject">
										<c:forEach items="${lesson }" var="lesson">
											<option data-id="${lesson.lessonId}"
												value="${lesson.classDict.classId } ${lesson.semester } ${lesson.year }"></option>
										</c:forEach>
										<!-- 
                      <option value="COMP90004 JAVA SEM1 2019"></option>
                      <option value="COMP90024 CCC SEM2 2019"></option>
                      -->
									</datalist>
								</div>
								<input type="hidden" name="tutorLessonId" id="tutorLessonId"
									value="" /> <input type="hidden" name="subject_id"
									id="answer-hidden">
								<!--
                  <label><span class="badge badge-secondary"></span> Semester:</label>
                  <label class="showTooltip subject-semester-label"></label>
                  <label><span class="badge badge-secondary"></span> Year:</label>
                  <label class="showTooltip subject-year-label"></label>
                  -->
								<div class="row">
									<button type="button" name="button"
										class="form_vertical_button col-lg-5 col-md-5 col-sm-5 col-xs-5"
										id="update_submit">
										<i class="fa fa-envelope"></i><span>Update</span>
									</button>
									<button type="button" name="button"
										class="form_vertical_button cancel col-lg-5 col-md-5 col-sm-5 col-xs-5">
										<i class="fa fa-times-circle"></i></i><span>Cancel</span>
									</button>
								</div>
							</form>
						</div>

						<!-- confirm dialog-->
						<div id="dialog-confirm" title="Delete?">
							<p>
								This items will be permanently deleted and </br> <strong>cannot</strong>
								be recovered. Are you sure?
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- alert -->
		<div class="alert alert-warning alert-dismissible fade show warning"
			hidden>
			<button type="button" class="close" data-dismiss="alert"
				style="margin: 10px; padding: 0">&times;</button>
			<strong>Warning!</strong>&nbsp;<span id="warning"></span>
		</div>
		<!-- alert -->
		<div class="alert alert-danger alert-dismissible fade show error"
			hidden>
			<button type="button" class="close" data-dismiss="alert"
				style="margin: 10px; padding: 0">&times;</button>
			<strong>Error!</strong>&nbsp;<span id="error"></span>
		</div>
		<!-- alert -->
		<div class="alert alert-success alert-dismissible fade show success"
			hidden>
			<button type="button" class="close" data-dismiss="alert"
				style="margin: 10px; padding: 0">&times;</button>
			<strong>Success!</strong>&nbsp;<span id="success"></span>
		</div>
	</div>
	</body>
	<script language="javascript">
	  (function ($) {
        $(document).ready(function () {
            $('#marker_table').DataTable();
            $('#year').val("");
            $('#dialog-confirm').hide();
            $('#marker_table tr').find('#id').hide();

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
            
            //validation
            $('#subject_info').blur(function(){
              var flag1 = false;
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
                $('#update_submit').addClass("disabled");
              }
              else if(flag1){
                $('#update_submit').removeClass("disabled");
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

            $('.update_button').click(function() {
  						if ($(".updateMarker").css("display") == "none") {
  							$(".updateMarker").show();
  							
  				$("#tutorLessonId").val($(this).parents("tr").find("#id").html());
  							
                $(".marker-id-label").html($(this).parents("tr").find("#marker_id").text());
                $(".marker-email-label").html($(this).parents("tr").find("#marker_email").text());
                $(".marker-name-label").html($(this).parents("tr").find("#marker_name").text());
                $(".marker-contact-label").html($(this).parents("tr").find("#marker_contact").text());
                $(".subject-id-label").html($(this).parents("tr").find("#subject_id").text());
                $(".subject-name-label").html($(this).parents("tr").find("#subject_name").text());
                //$(".subject-semester-label").html($(this).parents("tr").find("#semester").text());
                //$(".subject-year-label").html($(this).parents("tr").find("#year").text());
  						} else {
  							$(".updateMarker").hide();
              }
						});

            $('#update_submit').click(function(){
              if($('#subject_info').val().trim()!=""){
            	$("#updateInfo").submit();  
                $(".updateMarker").hide();
              }else{
              	 $('#warning').text("Please input subject!");
      	         $('.warning').removeAttr("hidden");
      	         setTimeout(function(){
      	            $('.warning').attr("hidden", true);
      	         }, 5000);
              }
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
                		  var url = window.location.href; 
                    		var operation = result["operation"];
                    		var msg = result["msg"];
                    		if(url.indexOf("?") == -1){
                    			url = url+"?operation="+operation+"&msg="+msg;
                    		}else{
                    			url = url.substring(0,url.indexOf("?"));
                    			url = url+"?operation="+operation+"&msg="+msg;
                    		}
                    		console.log(url);
                    		window.location.href = url;
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
	  } (jQuery));
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

</html>
