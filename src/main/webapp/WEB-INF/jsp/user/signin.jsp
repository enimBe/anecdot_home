<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>

	<div class="container">
	
		<section class="content">
		
			<div class="user=box">
				<div class="box-logo text-center">
					<h1>AnecDOT</h1>
				</div>
				
				<div class="signin-box mx-2">
					<form id="signinForm">
						<input type="text" id="userIDInput" class="form-control" placeholder="ID">
						<input type="password" id="passwordInput" class="form-control mt-2" placeholder="Password">
						
						<button type="submit" id="signupBtn" class="btn btn-block mt-2">Login</button>
						
					</form>
				</div>
				
				<div class="d-flex justify-content-center mt-3" style="height: 100px;">
					Do you want to join?
					<a href="/anecdot/user/signup" class="ml-2">Sign up</a>
				</div>
			</div>
		
		</section>
	
	</div>
	
	<script type="text/javascript">
	
		$(document).ready(function() {
				
			$("#signinForm").on("submit", function(e) {
				
				e.preventDefault();
				
				var userID = $("#userIDInput").val();
				var password = $("#passwordInput").val();
				
				if(userID == "" || userID == null) {
					alert("Enter your ID");
					return;
				}
				
				if(password == "" || password == null) {
					alert("Enter your password");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"userID":userID, "password":password},
					success:function(data) {
						if(data.result == "success") {
							
							// 임시로 로그인시 create post로 가게 해둠 -> timeline으로 수정 필
							location.href="/anecdot/post/create";
						} else {
							alert("로그인 실패");
						}
					},
					error:function(e) {
						alert("Error");
					}
				});
				
			});
			
		});
	
	</script>

</body>
</html>




















