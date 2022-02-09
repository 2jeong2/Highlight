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
<title>로그인</title>
</head>
<body>
<header class="">
	<div class="timeline-bar d-flex justify-content-between">
		<h1 class="d-flex  ml-3">Highlight.</h1>
		<div class="">
			<ul class="nav nav-fill ">
				<li class="nav-item"><a href="#" class="nav-link text-dark">홈아이콘</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark">검색아이콘</a></li>
				<li class="nav-item"><a href="/post/create_view" class="nav-link text-dark"><img src="" width=100></a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark">알림아이콘 ❤</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark">내게시물아이콘</a></li>
			</ul>
		</div>
		
	</div>
	<div class="text-right mr-3">
	<c:choose>
		<c:when test="${not empty userId }">
			<div class="mr-3">${userName }님<a href="/user/sign_out">로그아웃</a></div>
		</c:when>
		<c:otherwise>
			<div class="mr-3"><a href="/user/signin_view">로그인</a></div>
		</c:otherwise>
	</c:choose>
	</div>

</header>
</body>