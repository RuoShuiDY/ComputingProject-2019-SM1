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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" />
</head>

<body>
	<div class="wrapper">
		<!-- top navigation -->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light fixed-top top-navbar">
			<a class="navbar-brand" href="#"><span>Teaching and
					Marking System</span></a>
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
							<a class="dropdown-item" href="#">Update Profile</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Logout</a>
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
					<li class="nav-item"><a class="nav-link" href="dashboard.html"><i
							class="fa fa-dashboard"></i><span>Dashboard</span></a></li>
					<li class="nav-item"><a class="nav-link active"
						href="subject.html"><i class="fa fa-book"></i><span>Subject
								Information</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#tutorSubmenu"
						data-toggle="collapse" aria-expanded="false"
						class="dropdown-toggle"><i class="fa fa-user"></i><span>Tutor
								Information</span></a>
						<ul class="collapse list-unstyled" id="tutorSubmenu">
							<li><a class="nav-link" href="tutor_invite.html"><span>Tutor
										Invitation</span></a></li>
							<li><a class="nav-link" href="tutor.html"><span>Tutor
										Overview</span></a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#"><i
							class="fa fa-file"></i><span>Scores & Results</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#emailSubmenu"
						data-toggle="collapse" aria-expanded="false"
						class="dropdown-toggle"><i class="fa fa-envelope"></i><span>Send
								Email</span></a>
						<ul class="collapse list-unstyled" id="emailSubmenu">
							<li><a class="nav-link" href="#"><span>Individual
										Sending</span></a></li>
							<li><a class="nav-link" href="#"><span>Group
										Sending</span></a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#"><i
							class="fa fa-bar-chart-o"></i><span>Score Charts</span></a></li>
				</ul>
			</nav>

			<!-- page content -->
			<div class="page-content col-xs-10 col-sm-10 col-md-10 col-lg-10">
				<div class="content">

					<!-- breadcrumb -->
					<ol class="breadcrumb row">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
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
										<td>${lesson.year }</td>
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
							<form class="popup_form" action="addlesson" method="post">
								<h5 class="popup_form_topic">Add Subject</h5>
								<label for="subject_id"><span
									class="badge badge-secondary"></span> Subject ID:</label> <input
									type="text" id="subjectid_add_input" class="showTooltip"
									name="class_id" list="subject" autocomplete="off">
								<datalist id="subject">
									<c:forEach items="${classes}" var="classes">
										<option value="${classes.classId } ${classes.className}"></option>

									</c:forEach>
								</datalist>
								<br> <label for="semester">Semester:</label> <select
									class="showTooltipSelect" name="semester">
									<option>Semester1</option>
									<option>Semester2</option>
									<option>Summer Term</option>
									<option>Winter Term</option>
								</select> <br> <label for="year">Year:</label> <input type="text"
									class="yearpicker showTooltip" value="" name="year" />
								<script src="../../assets/js/yearpicker.js" async></script>
								<br>
								<button type="submit" name="button"
									class="form_vertical_button disabled" id="add_submit">
									<i class="fa fa-plus"></i><span>Add</span>
								</button>
							</form>
						</div>

						<!-- update subject -->
						<div class="form_vertical updateSubject" style="display: none">
							<form class="popup_form" action="updatelesson" method="post">
								<input id="hidden_lesson_id" type="hidden" name="lesson_id" />
								<h5 class="popup_form_topic">Update Subject</h5>
								<label><span class="badge badge-secondary"></span>
									Subject ID:</label> <label class="showTooltip subjectid-label"></label>
								<br> <label for="semester">Semester:</label> <select class="showTooltipSelect" name="semester">
									<option>Semester1</option>
									<option>Semester2</option>
									<option>Summer Term</option>
									<option>Winter Term</option>
								</select> <br> <label for="year">Year:</label> <input type="text"
									class="yearpicker showTooltip" value="" name="year" />
								<script src="../../assets/js/yearpicker.js" async></script>
								<br>
								<button type="submit" name="button"
									class="disabled form_vertical_button" id="update_submit">
									<i class="fa fa-edit"></i><span>Update</span>
								</button>
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

	<script language="javascript">
		$(document)
				.ready(
						function() {
							$('#subject_table').DataTable();
							$('#year').val("");
							$('#dialog-confirm').hide();

							$('#add').click(function() {
								if ($(".addSubject").css("display") == "none") {
									$(".addSubject").show();
								} else {
									$(".addSubject").hide();
								}
							});

							$('#subjectid_add_input')
									.blur(
											function() {
												var flag = false;
												var options = $("#subject")
														.prop("options");
												for (var i = 0; i < options.length; i++) {
													var text = options[i].value;
													if (text == $('#subjectid_add_input').val()) {
														$('.badge').removeClass("badge-danger");
														$('.badge').addClass("badge-success");
														$('.badge').html("Valid");
														flag = true;
														$('#add_submit').removeClass("disabled")
														break;
													}
												}
												if (!flag) {
													$('.badge').removeClass("badge-success");
													$('.badge').addClass("badge-danger");
													$('.badge').html("Invalid");
													$('#add_submit').addClass("disabled")
												}
											});
							//showtooltip
							$('.showTooltip')
									.hover(
											function() {
												var text = $(this).val();
												$(this)
														.addClass(
																"data-toggle data-placement title");
												$(this).attr("data-toggle",
														"tooltip");
												$(this).attr("data-placement",
														"top");
												$(this).attr("title", text);
											});
							//showtooltip_select
							$('.showTooltipSelect')
									.hover(
											function() {
												var text = $(this).find(
														":selected").text();
												$(this)
														.addClass(
																"data-toggle data-placement title");
												$(this).attr("data-toggle",
														"tooltip");
												$(this).attr("data-placement",
														"top");
												$(this).attr("title", text);
											});

							$('.update_button').click(function() {
												if ($(".updateSubject").css("display") == "none") {
													$(".updateSubject").show();
													$(".subjectid-label").html($(this).parents("tr").find(".subject_id").text());
													$("#hidden_lesson_id").val($(this).parents("tr").attr("id"))
												} else {
													$(".updateSubject").hide();
												}
											});

							$('#update_submit').click(function() {
								$(".updateSubject").hide();
							});

							$('#add_submit').click(function() {
								if (!$('#add_submit').hasClass("disabled")) {
									$(".addSubject").hide();
								}
								;
							});

							$('.delete_button').click(function() {
								lesson_id = $(this).parents("tr").attr("id");
								$("#dialog-confirm").dialog({
									resizable : false,
									height : "auto",
									width : 350,
									modal : true,
									buttons : {
										"Delete" : function() {
											$.post("deletelesson",{"lesson_id":lesson_id},function(result){
												window.location.reload();
											});
											$(this).dialog("close");
										},
										Cancel : function() {
											$(this).dialog("close");
										}
									}
								});
							});
						});
	</script>
	</div>
</body>
</html>
