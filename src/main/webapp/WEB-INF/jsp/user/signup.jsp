<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>

	<div class="container">
	
		<section class="content d-flex justify-content-center align-items-center">
		
			<div class="user-box">
				<div class="box-logo text-center">
					<h1>AnecDOT</h1>
				</div>
				
				<div class="signup-box mx-2">
					<form id="signupForm">
						<div class="d-flex mt-3">
							<input type="text" id="userIDInput" class="form-control" placeholder="ID">
							<button type="button" class="btn btn-sm ml-1" id="isDuplicateBtn">중복확인</button>
						</div>
						<div id="duplicateDiv" class="d-none"><small class="text-danter">중복된 ID 입니다.</small></div>
						<div id="noneDuplicateDiv" class="d-none"><small class="text-success">사용가능한 ID </small></div>
						
						<input type="password" id="passwordInput" class="form-control mt-2" placeholder="Password">
						<input type="password" id="passwordConfirmInput" class="form-control mt-2" placeholder="Password Confirm">
						<small id="errorPassword" class="d-none text-danger">비밀번호가 일치하지 않습니다.</small>
						
						<input type="text" id="nameInput" class="form-control mt-2" placeholder="Name">
						<input type="text" id="emailInput" class="form-control mt-2" placeholder="Email">
						
						<button type="submit" id="signupBtn" class="btn btn-block mt-2">Sign up</button>
						
					</form>
				</div>
				
				<div class="d-flex justify-content-center mt-3" style="height: 100px;">
					Do you have an account?
					<a href="/anecdot/user/login" class="ml-2">Log in</a>
				</div>
			</div>
		
		</section>
		
	</div>
	
	
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			var isIdCheck = false;
			var isDuplicateId = true;
			
			// 아이디에 입력이 있을 경우 중복체크 상태를 초기화한다. 
			$("#userIDInput").on("input", function() {
				
				$("#duplicateDiv").addClass("d-none");
				$("#noneDuplicateDiv").addClass("d-none");
				isIdCheck = false;
				isDuplicateId = true;
				
			});

			$("#signupForm").on("submit", function(e) {
				
				e.preventDefault();
				
				var userID = $("#userIDInput").val();
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				var name = $("#nameInput").val();
				var email = $("#emailInput").val();
				
				if(userID == "" || userID == null) {
					alert("Enter your ID");
					return;
				}
				
				if(password == "" || password == null) {
					alert("Enter your password");
					return;
				}
				
				if(password != passwordConfirm) {
					$("#errorPassword").removeClass("d-none");
					return;
				}
				
				if(name == "" || name == null) {
					alert("Enter your name");
					return;
				}
				
				if(email == "" || email == null) {
					alert("Enter your email");
					return;
				}
				
				if(isIdCheck == false) {
					alert("ID 중복체크를 진행하세요");
					return;
				}
				
				if(isDuplicate == true) {
					alert("중복된 ID 입니다.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"userID":userID, "password":password, "name":name, "email":email},
					success:function(data) {
						if(data.result == "success") {
							location.href="/anecdot/user/login";
						} else {
							alert("회원가입 실패");
						}
					},
					error:function(e) {
						alert("Error");
					}
				});
				
			});
			

			$("#isDuplicateBtn").on("click", function(){
				
				var userID = $("#userIDInput").val();
				
				if(userID == "" || userID == null) {
					alert("Enter your ID");
					return;
				}
				
				$.ajax({
					type:"get",
					url:"/user/is_duplicate_id",
					data:{"userID":userID},
					success:function(data) {
						isIdCheck = true;
						
						if(data.is_duplicate) {
							isDuplicate = true;
							$("#duplicateDiv").removeClass("d-none");
							$("#noneDuplicateDiv").addClass("d-none");
						} else {
							isDuplicate = false;
							$("#duplicateDiv").addClass("d-none");
							$("#noneDuplicateDiv").removeClass("d-none");
						}
					},
					error:function(e) {
						alert("중복확인 실패");
					}
				});
				
			});
			
		});
		
		
	
	</script>
	
	

</body>
</html>

















