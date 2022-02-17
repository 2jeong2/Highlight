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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>로그인</title>
</head>
<body>
<header class="">
	<!-- Timeline-bar -->
	<div class="timeline-bar d-flex align-items-center">
		
		<!-- Logo -->
		<div class="logo  justify-content-start">
			<h4 class="d-flex  ml-3 my-3"><b>Highlight.</b></h4>
		</div>
		
		<!-- 검색창 -->
		<form id="searchForm" class="">
			<div class=" search text-center">
				<input type="text">
				<button type="button" class="btn btn-sm" id="searchInput">검색</button>
			</div>
		</form>
		
		<!-- Nav -->
		<div class="nav  justify-content-end ">
		
			<c:choose>
				<c:when test="${not empty userId }">
					<!-- 로그인을 하지 않았을 때 사라져야하는 항목 -->
					<div class="d-flex align-items-center">
						<ul class="nav nav-fill text-end ">
							<li class="nav-item"><a href="/post/timeline_view" class="nav-link text-dark"><i class="bi bi-house-door"></i></a></li>
							
							<li class="nav-item"><a href="/post/create" class="nav-link text-dark"><i class="bi bi-plus-square"></i></a></li>
							<li class="nav-item"><a href="#" class="nav-link text-dark"><i class="bi bi-heart"></i></a></li>
							<li class="nav-item"><a href="#" class="nav-link text-dark"><i class="bi bi-person-circle"></i></a></li>
						</ul>
						<div class="text-right mr-3 d-none">
							<c:choose>
								<c:when test="${not empty userId }">
									<div class="mr-3">${userName }님<a href="/user/sign_out">로그아웃</a></div>
								</c:when>
								<c:otherwise>
									<div class="mr-3"><a href="/user/signin_view">로그인</a></div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<!-- 로그인을 했을 때 사라져야할 항목 -->
					<div class="d-flex ">
						<a href="/user/signin_view" type="button" class="form-control btn btn-info" >로그인</a>
						<a href="/user/signup_view" type="button" class="form-control btn btn-white" >회원가입</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
	</div>
	<script>
		/* $(document).ready(function(){
			
			$("#searchForm").on("submit",function(e){
			e.preventDefault();
			
			var search = $("#searchInput").val().trim();
			
			if(search == ""){
				alert("검색어를 입력해주세요");
				return;
			}
			
			$.ajax({
				type:"get"
				url:"/user/search"
				data:{"userName":userName}
				success:function(data){
					
				}
					
			})
				
			}) 
		});*/
	
	</script>

</header>
</body>