<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>게시물 업로드</title>
</head>
<body>

<div id="wrap">
		뒤로가기 아이콘
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
	<header class="d-flex justify-content-center align-items-center ">
		<h4 class="justify-content-between"><b>새 게시물</b></h4>
		
	</header>
	
		<a href="#">공유하기</a>

	<section class="content">
		<div class="upload-box my-5">
			<textarea class="form-control text-secondary" rows="5" id="contentInput">문구 입력...</textarea>
			<div class="mb-5">
				<input type="file" class="mt-3" id="fileInput">
				<button type="button" class="btn btn-info text-white" id="saveBtn">업로드</button>
			</div>
		</div>
	
	</section>

</div>

<script>

	$(document).ready(function(){
		
		$("#saveBtn").on("click",function(){
			
			
			let content = $("#contentInput").val().trim();
			
			
			if(content == ""){
				alert("내용을 입력하세요");
				return;
			}
			
			//
			var formData = new FormData();
		
			formData.append("userName",userName);
			formData.append("content",content);
			formData.append("file",$("#fileInput")[0].files[0]);
			
			$.ajax({
				type:"post",
				url:"/post/create",
				data:formData,
				encType:"multipart/form-data",//파일 업로드 필수 
				processData:false,//파일 업로드 필수 
				contentType:false,//파일 업로드 필수 
				success:function(data){
					if(data.result == "success"){
						location.href="/post/timeline_view";
					}else{
						alert("글쓰기 실패");
					}
				},
				error:function(){
					alert("에러 발생")
				}
			})
			
		});
	});
</script>

</body>
</html>