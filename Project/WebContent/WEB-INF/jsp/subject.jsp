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
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!--script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>


    <!--script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <!--script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script-->
<!--script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script-->
<link href="../../assets/css/font-awesome.css" rel="stylesheet" />

<!--link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css"-->
<link href="../../assets/css/main_style.css" rel="stylesheet" />
<link rel="stylesheet" href="../../assets/css/yearpicker.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

</head>
<body>
	<div class="wrapper">
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light top-navbar fixed-top">
			<a class="navbar-brand" href="#"><span>Teaching and
					Marking System</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<!--
              <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
              </li>
              -->
					<li class="nav-item dropdown nav-user"><a
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

		<div class="page row">
			<nav id="sidebar" class="bg-light navbar-light">
				<ul class="list-unstyled" id="main-menu">
					<div class="sidebar-list">
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fa fa-dashboard"></i><span>Dashboard</span></a></li>
						<li class="nav-item"><a class="nav-link active" href="#"><i
								class="fa fa-book"></i><span>Subject Information</span></a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fa fa-user"></i><span>Tutor Information</span></a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fa fa-file"></i><span>Scores & Results</span></a></li>
						<li class="nav-item"><a class="nav-link" href="#emailSubmenu"
							data-toggle="collapse" aria-expanded="false"
							class="dropdown-toggle"><i class="fa fa-envelope"></i><span>Send
									Email</span></a>
							<ul class="collapse list-unstyled" id="emailSubmenu">
								<li class=""><a class="nav-link" href="#"><span>Individual
											Sending</span></a></li>
								<li class=""><a class="nav-link" href="#"><span>Group
											Sending</span></a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fa fa-bar-chart-o"></i><span>Score Charts</span></a></li>
					</div>
				</ul>
			</nav>

			<div class="page-content">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">Subject Information</a></li>
				</ol>

				<!-- search Subject-->
				<div class="searchSubject">
				<form action="lessonlist" method="post">
					<label for="subject">Subject ID/Subject Name:</label> <input
						type="text" name="queryClassId" list="subject">
					<datalist id="subject">
						<c:forEach items="${classes}" var="classes">
							<option value="${classes.classId } ${classes.className}"></option>
						</c:forEach>
						<!--  
						<option value="COMP90004 Cloud Computing"></option>
						<option value="COMP90024 Java"></option>
						-->
					</datalist>
					<label for="semester">Semester:</label> <select id="semester" name="querySemester">
						<option selected="selected"></option>
						<option>Semester1</option>
						<option>Semester2</option>
						<option>Summer Term</option>
						<option>Winter Term</option>
					</select> <label for="year">Year:</label> <input type="text" id="year"
						class="yearpicker" value="" name="queryYear"/>
					<script src="../../assets/js/yearpicker.js" async></script>
					<button type="submit" name="button">Search</button>
				</form>
				</div>
				<!-- display Subject-->
				<div class="displaySubject">
					<table class="table table-hover" id="table">
						<thead>
							<tr>
								<th>No.</th>
								<th>Subject ID</th>
								<th>Subject Name</th>
								<th>Semester</th>
								<th>Year</th>
								<th>Operations
									<button type="button" name="button" id="add">
										<i class="fa fa-plus"></i><span>Add</span>
									</button>
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${lessonlist }" var="lesson">
								<tr>
									<td>${lesson.lessonId }</td>
									<td>${lesson.classDict.classId }</td>
									<td>${lesson.classDict.className }</td>
									<td>${lesson.semester }</td>
									<td>${lesson.year }</td>
									<td>
										<button type="button" name="button" >
											<i class="fa fa-edit"></i><span>Update</span>
										</button>
										<button type="button" name="button" >
											<i class="fa fa-minus"></i><span>Delete</span>
										</button>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<!-- page number -->
					<div class="page-number">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#">Previous</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><span>...</span></li>
							<li class="page-item"><a class="page-link" href="#">19</a></li>
							<li class="page-item"><a class="page-link" href="#">20</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</div>

					<!-- add Subject -->
					<div class="addSubject" style="display: none">
						<form class="add_form" action="addlesson" method="post">
							<label for="subject_id">Subject ID:</label> <input type="text"
								name="class_id" list="class">
							<datalist id="class">
								<!-- 
								<option value="COMP90004"></option>
								<option value="COMP90024"></option>
							 -->
								<c:forEach items="${classes}" var="classes">
									<option value="${classes.classId } ${classes.className}"></option>

								</c:forEach>
							</datalist>
							<br> <label for="semester">Semester:</label> <select
								id="semester" name="semester">
								<option>Semester1</option>
								<option>Semester2</option>
								<option>Summer Term</option>
								<option>Winter Term</option>
							</select> <br> <label for="year">Year:</label> <input type="text"
								id="year" class="yearpicker" value="" name="year" />
							<script src="../../assets/js/yearpicker.js" async></script>
							<br>
							<button type="submit" name="button" id="add_submit">
								<i class="fa fa-plus"></i><span>Add</span>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script language="javascript">
		$(document).ready(
				function() {
					$('.table').on(
							"dblclick",
							"td",
							function() {
								var td = $(this);
								var text = td.text();
								var width = td.width();
								var height = td.height();
								td.html("");
								var input = $("<input type='text'/>");
								input.appendTo(td).width(width).height(height)
										.val(text).focus().blur(function() {
											td.html($(this).val());
										});
							});

					$('#add').click(function() {
						if ($(".addSubject").css("display") == "none") {
							$(".addSubject").show();
						} else {
							$(".addSubject").hide();
						}
					});
				});
		
	</script>
	</div>
</body>
</html>
