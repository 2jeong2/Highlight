<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<header class="">
	<div class="timeline-bar d-flex justify-content-between">
		<h1 class="d-flex  ml-3">Highlight.</h1>
		<div class="">
			<ul class="nav nav-fill ">
				<li class="nav-item"><a href="#" class="nav-link text-dark">홈아이콘</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark">검색아이콘</a></li>
				<li class="nav-item"><a href="/post/create_view" class="nav-link text-dark">게시물업로드아이콘 +</a></li>
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