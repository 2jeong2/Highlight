<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>타임라인</title>
</head>
<body>

<div id="wrap">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
	
	
	
	<section class="content d-flex justify-content-center my-5">

			<div class="border rounded upload-box ">
				<div>
					<textarea class="form-control" rows="5" id="contentInput">내용을 입력해주세요</textarea>
				</div>
				<div class="d-flex justify-content-between">
					<a href="#" id="imageUploadBtn"></a>
					<input type="file" class="mt-3" id="fileInput">
					<button type="button" class="btn btn-sm btn-info text-white" id="saveBtn">업로드</button>
				</div>
				
			</div>
			
			<div>
				
			
			</div>
		
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>


</div>
<script>
	$(document).ready(function(){
		
		$("#imageUploadBtn").on("click", function() {
			$("#fileInput").click();
		});
		
		$("#saveBtn").on("click",function(){
		
			
			let content = $("#contentInput").val().trim();
			
			
			if(content == ""){
				alert("내용을 입력해주세요");
				return;
			}
			if($("#fileInput")[0].files.length == 0){
				alert("사진을 업로드해주세요");
				return;
			}
			
			var formData = new FormData();
			formData.append("content",content);
			formData.append("file",$("#fileInput")[0].files[0]);
			
			$.ajax({
				type:"post",
				url:"/post/timeline",
				data:formData,
				encType:"multipart/form-data",
				processData:false,
				contentType:false,
				success:function(data){
					if(data.result == "success"){
						location.href="/post/timeline_view";
					}else{
						alert("글쓰기 실패");
					}
				},error:function(){
					alert("에러발생");
				}
				
			});
			
			
			
		});
		
		
	});
	

</script>

</body>
</html>