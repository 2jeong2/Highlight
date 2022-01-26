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

<title>회원가입 화면</title>
</head>
<body>
<div id="wrap">

	<header class="bg-info">
	
	</header>
	
	<section class="content  d-flex justify-content-center">
		<div class="join-box my-5">
			
			 	<h2 class="text-center">Highlight.</h2>
				<form id="signupForm">
					<label>전화번호</label><input type="text" class="form-control" placeholder="전화번호" id="phoneNumberInput">
					<label>아이디</label><input type="text" class="form-control" placeholder="아이디" id="loginIdInput">
					<label>이름</label><input type="text" class="form-control" placeholder="이름 " id="nameInput">
					<label>비밀번호</label><input type="password" class="form-control" placeholder="비밀번호" id="passwordInput">
					<label>비밀번호 확인</label><input type="password" class="form-control" placeholder="비밀번호 확인" id="passwordConfirmInput">
					<label>이메일</label><input type="text" class="form-control" placeholder="이메일 주소" id="emailInput">
					<button type="submit"  class="btn btn-secdondary btn-block mt-3">가입하기</button> 
				</form>
			
		</div>
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>


</div>

<script>
	$(document).ready(function(){
		$("#signupForm").on("submit",function(e){
			e.preventDefault();
			
			var phoneNumber = $("#phoneNumberInput").val();
			var loginId = $("#loginIdInput").val();
			var name = $("#nameInput").val();
			var password = $("#passwordInput").val();
			var passwordConfirm = $("#passwordConfirmInput").val();
			var email  = $("#emailInput").val();
			
			if(phoneNumber ==""){
				alert("전화번호를 입력하세요");
				return;
			}
			if(loginId == ""){
				alert("아이디를 입력하세요");
				return;
			}
			if(name ==""){
				alert("이름을 입력하세요");
				return;
				
			}
			if(password ==""){
				alert("비밀번호를 입력하세요.");
				return;
			}
			if(password != passwordConfirm){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			if(email ==""){
				alert("이메일을 입력하세요");
				return;
			}
			
			$.ajax({
				type:"post",
				url:"/user/sign_up",
				data:{"phoneNumber":phoneNumber,"loginId":loginId,"name":name,"password":password,"email":email},
				success:function(data){
					if(data.result == "success"){
						
						//로그인 화면으로 이동
						location.href="/user/signin_view";
						
					}else{
						alert("로그인에 실패하였습니다.");
					}
				},
				error:function(){
					alert("에러발생");
				}
			});
		});
	});




</script>

</body>
</html>