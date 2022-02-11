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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>타임라인</title>
</head>
<body>

<div id="wrap">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
	
	
	
	<section class="  ">

		<!-- 업로드 박스 -->
		<article  class="d-flex justify-content-center my-4">
			<div class="border upload-box ">
				<div class="">
				
					<!-- 게시물 올린사람 -->
					<div class="post-header d-flex align-items-center">
						<a href="#" class="text-dark col-11">${userName }</a>
						<i class="bi bi-three-dots col-1"></i>
					</div>
					
					<textarea class="textarea form-control my-3" rows="4" id="contentInput">내용을 입력해주세요</textarea>
					
					<!-- button -->
					<div class="d-flex justify-content-between p-2 ">
						
						<span class="img-icon"><i class="bi bi-images" id="imgBtn"></i></span>
						<input type="file" class="mt-3 d-none" id="fileInput">
						
						<button type="button" class="btn btn-sm btn-info text-white" id="uploadBtn">업로드</button>
					</div>
				</div>
				
			</div>
		</article >
		
		
		
		<!-- 업로드한 게시물 -->
		<c:forEach var="post" items="${postList}">
			<article class=" d-flex justify-content-center my-3">
					<div class="post-box  ">
				
						<!-- post-header -->
						<div class="post-header d-flex align-items-center ">
							<div class="col-11"><a href="#" class="text-dark">${post.userName }</a></div>
							<i class="bi bi-three-dots col-1"></i>
						</div>
						
						<img src="${post.imagePath }" width="497" height="500">
						
						<div class="item-box d-flex align-items-center justify-content-between">
							<div class="d-flex">
								<!-- 좋아요,댓글 -->
								<div class="like"><i class="bi bi-heart ml-2"> 좋아요</i></div>
							</div>
								<!-- bookmark -->
								<div class="bookmark justify-content-end mr-3"><i class="bi bi-bookmark"></i></div>
							
							</div>
							<div class="p-2">
								<div class="post-content">${post.userName } ${post.content }</div>
							</div>
						<div class="comment-box p-2">
								<div class="comment"><i class="bi bi-chat"></i></div>
								<!-- 게시된 comment -->
								<div class="comment my-2">
									<div>1</div>
									<div>1</div>
									<div>1</div>
									<div>1</div>
								</div>
								
								<!-- 댓글 입력-->
								<div class="commentInput-box d-flex">
									<input type="text" class="form-control" id="commentInput${post.id}">
									<button type="button" class="commentBtn btn" data-post-id="${post.id }">게시</button><!-- data-post-id 여기 대문자 숫자x-->
								</div>
						</div>
					</div>
			</article>
		</c:forEach>
		
				
					
	</section>
				
				
				
			
			
		
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>

</div>

<script>
	$(document).ready(function(){
		//alert("");
		$("#imgBtn").on("click", function() {
			//fileInput 클릭 효과
			$("#fileInput").click();
		}); 
		
		$(".commentBtn").on("click",function(){
			
			let postId = $(this).data("post-id");
			let content = $("#commentInput"+postId).val();
			
			
			if(content == ""){
				alert("댓글을 입력해주세요");
				return;
			}
			
			$.ajax({
				type:"post",
				url:"/post/comment/create",
				data:{"postId":postId,"content":content},
				success:function(data){
					if(data.result == "success"){
						location.reload();
					}else{
						alert("댓글쓰기 실패")
					}
				},error:function(){
					alert("에러발생");
				}
			});
		});
		
		$("#uploadBtn").on("click",function(){
		
			
			let content = $("#contentInput").val().trim();
			
			
			if(content == ""){
				alert("내용을 입력해주세요");
				return;
			}
			//파일 유효성 검사
			if($("#fileInput")[0].files.length == 0){
				alert("사진을 선택해주세요");
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
						location.reload();
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