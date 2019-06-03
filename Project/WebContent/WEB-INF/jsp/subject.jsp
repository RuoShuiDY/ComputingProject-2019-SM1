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
			<button type="button" id="toggler" name="button">
				<i class="fa fa-align-left"></i>
			</button>
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
				class="bg-light navbar-light col-xs-2 col-sm-2 col-md-2 col-lg-2 visible">
				<ul class="list-unstyled">
					<li class="nav-item"><a class="nav-link"
						href="/dashboard/dashboardUI"><i class="fa fa-dashboard"></i><span>Dashboard</span></a>
					</li>
					<li class="nav-item"><a class="nav-link active"
						href="/lesson/lessonlist"><i class="fa fa-book"></i><span>Subject
								Information</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#markerSubmenu"
						data-toggle="collapse" aria-expanded="false"
						class="dropdown-toggle"><i class="fa fa-user"></i><span>Marker
								Information</span></a>
						<ul class="collapse list-unstyled" id="markerSubmenu">
							<li><a class="nav-link" href="/tutor/tutor_invite_list"><span>Marker
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

					<!-- breadcrumb -->
					<ol class="breadcrumb row">
						<li class="breadcrumb-item"><a href="/dashboard/dashboardUI">Home</a></li>
						<li class="breadcrumb-item active">Subject Information</a></li>
					</ol>

					<!-- display Subject-->
					<div class="displaySubject">
						<table id="subject_table" class="table table-hover">
							<thead>
								<tr>
									<th>No.</th>
									<th>Subject ID</th>
									<th class="subject_name">Subject Name</th>
									<th>Semester</th>
									<th>Year</th>
									<th><span id="table_th">Operations</span>
										<button type="button" name="button" id="add">
											<i class="fa fa-plus"></i><span>Add</span>
										</button></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${lessonlist }" var="lesson"
									varStatus="status">
									<tr id="${lesson.lessonId }">
										<td>${status.count }</td>
										<!-- <td>${lesson.lessonId }</td> -->
										<td class="subject_id">${lesson.classDict.classId }</td>
										<td class="subject_name">${lesson.classDict.className }</td>
										<td>${lesson.semester }</td>
										<td class="year_dis">${lesson.year }</td>
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

						<!-- add subject -->
						<div class="form_vertical addSubject" style="display: none">
							<a class="close" data-dismiss="addSubject">&times;</a>
							<form class="popup_form" action="addlesson" method="post"
								id="add_form">
								<h5 class="popup_form_topic">Add Subject</h5>
								<div class="popup_form_row">
									<label><span class="badge badge-secondary"></span>
										Subject ID:</label> <input type="text" name="class_id"
										id="subjectid_add_input" class="showTooltip" list="subject"
										autocomplete="off" autofocus required>
									<datalist id="subject">
										<c:forEach items="${classes}" var="classes">
											<option value="${classes.classId } ${classes.className}"></option>
										</c:forEach>
									</datalist>
								</div>
								<div class="popup_form_row">
									<label for="semester">Semester:</label> <select
										class="showTooltipSelect" name="semester" id="semester"
										required>
										<option>Semester1</option>
										<option>Semester2</option>
										<option>Summer Term</option>
										<option>Winter Term</option>
									</select>
								</div>
								<div class="popup_form_row">
									<label for="year">Year:</label> <input type="text"
										class="yearpicker showTooltip" value="" name="year" id="year_add"
										autocomplete="off" required />
									<script src="../../assets/js/yearpicker.js" async></script>
								</div>
								<div class="row">
									<button type="button" name="button"
										class="form_vertical_button col-lg-5 col-md-5 col-sm-5 col-xs-5"
										id="add_submit" disabled>
										<i class="fa fa-plus"></i><span>Add</span>
									</button>
									<button type="button" name="button"
										class="form_vertical_button cancel col-lg-5 col-md-5 col-sm-5 col-xs-5">
										<i class="fa fa-times-circle"></i></i><span>Cancel</span>
									</button>
								</div>
							</form>
						</div>

						<!-- update subject -->
						<div class="form_vertical updateSubject" style="display: none">
							<a class="close" data-dismiss="updateSubject">&times;</a>
							<form class="popup_form" action="updatelesson" method="post"
								id="update_form">
								<input id="hidden_lesson_id" type="hidden" name="lesson_id" />
								<h5 class="popup_form_topic">Update Subject</h5>
								<div class="popup_form_row">
									<label>Subject ID:</label> <label
										class="showTooltip subjectid-label"></label>
								</div>
								<input type ="hidden" id="hidden_subject_id" name="subject_id"/>
								<div class="popup_form_row">
									<label for="semester">Semester:</label> <select
										class="showTooltipSelect" name="semester">
										<option>Semester1</option>
										<option>Semester2</option>
										<option>Summer Term</option>
										<option>Winter Term</option>
									</select>
								</div>
								<div class="popup_form_row">
									<label for="year">Year:</label>  <input type="text"
										class="yearpicker showTooltip" value="" name="year" id="year_update"
										autocomplete="off" required autofocus/>
									<script src="../../assets/js/yearpicker.js" async></script>
								</div>
								<div class="row">
									<button type="button" name="button"
										class="form_vertical_button col-lg-5 col-md-5 col-sm-5 col-xs-5"
										id="update_submit" active>
										<i class="fa fa-edit"></i><span>Update</span>
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

					<!-- search Subject-->
					<!--
            <div class="searchSubject row">
              <form action="lessonlist" class="row" method="post">
                <div class="form_horizontal">
                  <label for="subjectlist">Subject ID/Subject Name:</label>
                  <input type="text" name="subject" class="showTooltip" list="subjectlist">
                  <datalist id="subjectlist">
                    <option title="COMP90004 Cloud Computing" value="COMP90004 Cloud Computing"></option>
                    <option title="COMP90024 Java" value="COMP90024 Java"></option>
                  </datalist>
                </div>
                <div class="form_horizontal">
                  <label for="semester">Semester:</label>
                  <select class="showTooltipSelect">
                    <option selected="selected"></option>
                    <option>Semester1</option>
                    <option>Semester1</option>
                    <option>Semester2</option>
                    <option>Summer Term</option>
                    <option>Winter Term</option>
                  </select>
                </div>
                <div class="form_horizontal">
                    <label for="year">Year:</label>
                    <input type="text" class="yearpicker showTooltip" autocomplete="off" value=""/>
                    <script src="assets/js/yearpicker.js" async></script>
                </div>
                <div class="form_horizontal">
                  <button type="button" name="button"><i class="fa fa-search" ></i><span>Search</span></button>
                </div>
              </form>
            </div>
            -->

					<!--
                  <thead>
                    <tr class="row">
                      <th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">No.</th>
                      <th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Subject ID</th>
                      <th class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Subject Name</th>
                      <th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Semester</th>
                      <th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">Year</th>
                      <th class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><span id="table_th">Operations</span>
                        <button type="button" name="button" id="add"><i class="fa fa-plus"></i><span>Add</span></button>
                      </th>
                    </tr>
                  </thead>

                <tbody>
                  <tr class="row">
                      <td class="col-lg-1 col-md-1 col-sm-1 col-xs-1">1</td>
                      <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2 subject_id">COMP90024</td>
                      <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Cloud Computing</td>
                      <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Semester1</td>
                      <td class="col-lg-1 col-md-1 col-sm-1 col-xs-1">2019</td>
                      <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                        <button type="button" class="update_button" name="button"><i class="fa fa-edit"></i><span>Update</span></button>
                        <button type="button" class="delete_button" name="button"><i class="fa fa-minus"></i><span>Delete</span></button>
                      </td>
                  </tr>
                  <tr class="row">
                      <td class="col-lg-1 col-md-1 col-sm-1 col-xs-1">2</td>
                      <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2 subject_id">COMP90024</td>
                      <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">Cloud Computing</td>
                      <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Semester1</td>
                      <td class="col-lg-1 col-md-1 col-sm-1 col-xs-1">2019</td>
                      <td class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                        <button type="button" class="update_button" name="button"><i class="fa fa-edit"></i><span>Update</span></button>
                        <button type="button" class="delete_button" name="button"><i class="fa fa-minus"></i><span>Delete</span></button>
                      </td>
                  </tr>
                </tbody>
              -->

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

	<script language="javascript">
      (function ($) {
        $(document).ready(function () {
            $('#subject_table').DataTable();
            //$('#year').val("");
            $('#dialog-confirm').hide();

            $('#add').click(function() {
  						if ($(".addSubject").css("display") == "none") {
  							$(".addSubject").show();
  						} else {
  							$(".addSubject").hide();
              }
						});

            $('#subjectid_add_input').blur(function(){
              var flag = false;
              var options=$("#subject").prop("options");
              for(var i=0;i<options.length;i++){
                var text = options[i].value;
                if(text==$('#subjectid_add_input').val()){
                  $('.badge').removeClass("badge-danger");
                  $('.badge').addClass("badge-success");
                  $('.badge').html("Valid");
                  flag = true;
                  $('#add_submit').removeAttr("disabled");
                  break;
                }
              }
              if(!flag){
                $('.badge').removeClass("badge-success");
                $('.badge').addClass("badge-danger");
                $('.badge').html("Invalid");
                $('#add_submit').attr("disabled", true);
              }
            });
            
            $('#add_submit').click(function(){
 
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
  						if ($(".updateSubject").css("display") == "none") {
  							$(".updateSubject").show();
  							$("#hidden_lesson_id").val($(this).parents("tr").attr("id"))
  							$("#hidden_subject_id").val($(this).parents("tr").find(".subject_id").text());
                			$(".subjectid-label").html($(this).parents("tr").find(".subject_id").text());
                			$("#year_update").val($(this).parents("tr").find(".year_dis").text());
  						} else {
  							$(".updateSubject").hide();
              }
						});

/*             $('.yearpicker').blur(function(){
            	console.log($(".yearpicker").val());
            	if($(".yearpicker").val().trim()==""){
	               	 $('#warning').text("Please input Year!");
	      	          $('.warning').attr("hidden", false);
	      	            setTimeout(function(){
	      	            $('.warning').attr("hidden", true);
	      	          }, 5000);
            	}
            }); */
            
            $('#update_submit').click(function(){
                if($("#year_update").val().trim()!=""){
                    $("#update_form").submit();
                    $(".updateSubject").hide();
               	}else if($("#year_update").val().trim()==""){
	               	 $('#warning').text("Please input Year!");
	      	          $('.warning').attr("hidden", false);
	      	            setTimeout(function(){
	      	            $('.warning').attr("hidden", true);
	      	          }, 5000);
                }
            });

            $('#add_submit').click(function(){
                 if($("#year_add").val().trim()!=""){
                     $("#add_form").submit();
                     $(".addSubject").hide();
                 }else if($("#year_add").val().trim()==""){
	               	 $('#warning').text("Please input Year!");
	      	          $('.warning').attr("hidden", false);
	      	            setTimeout(function(){
	      	            $('.warning').attr("hidden", true);
	      	          }, 5000);
                 }
            });

            $('.delete_button').click(function(){
              lesson_id = $(this).parents("tr").attr("id");
              $("#dialog-confirm").dialog({
                resizable: false,
                height: "auto",
                width: 350,
                modal: true,
                buttons: {
                	"Delete": function() {
                        $.post("deletelesson",{"lesson_id":lesson_id},function(result){
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
             //window.location.reload();
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
	      $.noConflict();
	      var msg = "${msg}";
	      console.log(msg);
	      if (${operation} == true){
	         (function ($) {
	          $('#success').text(msg);
	          $('.success').attr("hidden", false);
	            setTimeout(function(){
	            $('.success').attr("hidden", true);
	          }, 5000);
	         } (jQuery));
	      }else if (${operation} == false){
	        (function ($) {
	          $('#error').text(msg);
	          $('.error').attr("hidden", false);
	            setTimeout(function(){
	            $('.error').attr("hidden", true);
	          }, 5000);
	         } (jQuery));
	      }
  	  </script>
	</div>
</body>
</html>
