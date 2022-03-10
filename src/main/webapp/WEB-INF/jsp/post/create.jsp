<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Post</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>
<body>

	<div class="container">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="content">
			<div class="create-post">
				<form class="postForm" method="post" enctype="multipart/form-data">
					<div class="post-title">
						<input id="titleInput" type="file" name="uploadFile" class="form-control form-control-lg" style="border:none" placeholder="제목">
					</div>
					
					<div class="post-content">
						<textarea id="contentInput" name="uploadFile" class="form-control" rows="20" style="border:none"></textarea>
					</div>
					
					<div class="post-upload">
						<div class="post-upload-files">
							<div class="selectImage">					
								<i class="bi-image imgBtn"></i>
								<input id="imageInput" type="file" name="uploadFile" class="d-none">
							</div>
								
							<!-- <div class="select-image-options">
								<i class="bi-link imgPublicBtn d-none"></i>
								<i class="bi-tag imgGalleryBtn d-none"></i>
							</div> -->
						</div>
							
						<div class="post-upload-buttons">
							<button type="button" id="deleteBtn" class="btn btn-secondary">Delete</button>
							<button type="submit" id="submitBtn" class="btn btn-secondary">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
		
		$(document).ready(function() {
			
			$(".imgBtn").on("click", function() {
				$("#imageInput").click();
			});
			
			
			$(".postForm").on("submit", function() {
				
				let title = $("#titleInput").val().trim();
				let content = $("#contentInput").val().trim();
				var images = $("#imageInput");
				
				if(title == "" || title == null) {
					alert("Enter title");
					return;
				}
				
				var formData = new FormData();
				formData.append('title', title);
				formData.append('content', content);
				
				for(var i = 0; i < images.length; i++) {
					
					if(images[i].files.length > 0) {
						for(var j = 0; j < images[i].files.length; j++) {
							console.log("images[i].files[j] :::" + images[i].files[j]);
							
							formData.append('image', $("#imageInput")[i].files[j]);
						}
					}
					
				}
				
				formData.append('key', new Blob([ JSON.stringify(data)], {type: "application/json"}));
				
				$.ajax({
					type:"post",
					url:"/post/create",
					data:formData,
					contentType:false,
					processData:false,
					enctype:'multipart/form-data',
					success:function(data) {
						if(data.result == "success") {
							alert("success");
						} else {
							alert("failes");
						}
					},
					error:function() {
						alert("error");
					}
				});
				
				
				
				
				
				
			
				
			});
			
			
		});
		
	
	</script>

</body>
</html>