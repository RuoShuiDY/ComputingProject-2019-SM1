<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="../../assets/css/bootstrap.css" rel="stylesheet" />
<link href="../../assets/css/font-awesome.css" rel="stylesheet" />
<link href="../../assets/css/login_style.css" rel="stylesheet" />

</head>
<body>
	<div class="wrapper">
		<div class="icon">
			<img src="../../assets/img/Uni_of_Melb_logo.jpg"
				alt="The University of Melbourne">
		</div>
		<header>
			<h1 class="topic">Teaching and Marking System</h1>
		</header>
		<div class="content">
			<!-- login form -->
			<div class="login-form">
				<form class="login" action="login" method="post">
					<h2>LOGIN NOW</h2>
					<p>Email</p>
					<input type="text" name="email" placeholder="" required autofocus"/>
					<p>Password</p>
					<input type="password" name="password" placeholder="" required />
					<div class="identity">
						<input type="radio" name="id" value="PROFESSOR">&nbspADMIN&nbsp
						<input type="radio" name="id" value="TUTOR">&nbspTUTOR&nbsp
					</div>
					<div class="forget_pwd">
						<p>
							<a href="">Forget Password</a>
						</p>
					</div>
					<div class="clear"></div>
					<button class="button" style="vertical-align: middle" type="submit">
						<span>Login</span>
					</button>
				</form>
			</div>
			<!-- //login form -->
		</div>
		<footer> </footer>
	</div>
</body>
<script type="text/javascript">
	if (${msg} == false) {
		window.alert("Username or password wrong");
	}
</script>
</html>