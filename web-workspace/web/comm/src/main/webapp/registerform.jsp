<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>커뮤니티 - 20240102</title>
</head>
<body>
	<jsp:include page="include/navbar.jsp">
		<jsp:param value="register" name="menu" />
	</jsp:include>
	<div class="container">
		<div class="col-12">
			<h1 class="mb-3">회원가입 폼</h1>
			
	<%
		/*
			요청 URL
				회원가입 링크를 클릭한 경우
					localhost/comm/registerform.jsp
				회원가입 실패로 재요청하는 경우
					localhost/comm/registerform.jsp?fail=id
					localhost/comm/registerform.jsp?fail=email
					
			요청파라미터
				fail-xxx
				* 정상적인 요청인 경우 fail의 요청파라미터값을 조회했을 때 null이다.
				* 가입실패로 인한 재요청인 경우 fail의 요청파라미터값은 id 혹은 email이다.
		*/
		
		String fail = request.getParameter("fail");
	%>
	
	<%
		if ("id".equals(fail)) {
	%>
			<div class="alert alert-danger">
				<strong>회원가입 오류</strong> 이미 사용중인 아이디입니다.
			</div>
	<%
		}
	%>
	
	<%
		if ("email".equals(fail)) {
	%>
			<div class="alert alert-danger">
				<strong>회원가입 오류</strong> 이미 사용중인 이메일입니다.
			</div>
	<%
		}
	%>
			
			<form class="border bg-light p-3"
			      method="post"
			      action="register.jsp"
			      onsubmit="checkRegisterForm(event)">
				<div class="form-group mb-3">
					<label class="form-label">아이디</label>
					<input type="text" class="form-control" name="id" onkeyup="checkId()"/>
					<div id="id-feedback" class="form-text"></div>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">비밀번호</label>
					<input type="password" onkeyup="checkPassword()" class="form-control" name="password" />
					<div id="password-valid-feedback" class="form-text text-success d-none">
						유효한 비밀번호입니다.
					</div>
					<div id="password-invalid-feedback" class="form-text text-danger d-none">
						비밀번호는 8글자 이상, 15글자 이하, 영문+숫자+특수문자 조합이어야 합니다.
					</div>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">이름</label>
					<input type="text" class="form-control" name="name" />
				</div>
				<div class="form-group mb-3">
					<label class="form-label">이메일</label>
					<input type="text" class="form-control" name="email" />
				</div>
				<div class="form-group mb-3">
					<label class="form-label">전화번호</label>
					<input type="text" class="form-control" name="tel" />
				</div>
				<div class="text-end">
					<a href="" class="btn btn-secondary">취소</a>
					<button type="submit" class="btn btn-primary">가입</button>
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript">
	/* 20240117 */
	function checkId() {
		let idRegExp = /^[a-zA-Z0-9]{3,}$/;
		
		let feedbackDiv = document.getElementById("id-feedback");
		let idInput = document.querySelector("input[name=id]");
		let id = idInput.value;
		
		if (!idRegExp.test(id)) { // 유효하지 않은 아이디는 서버로 보내지 않는다.
			feedbackDiv.textContent = "아이디는 3글자 이상, 영어대소문자+숫자 조합이어야 합니다.";
			feedbackDiv.classList.remove('text-success');
			feedbackDiv.classList.add('text-danger');
			return;
		}
		
		let xhr = new XMLHttpRequest(); 	  		  // 객체 생성
		xhr.onreadystatechange = function() { 		  // 이벤트 생성
			if (xhr.readyState === 4 && xhr.status === 200) {
				// 서버가 보낸 응답데이터를 조회한다.
				let message = xhr.responseText;
				if (message === "exist") {
					feedbackDiv.textContent = "이미 사용중인 아이디입니다.";
					feedbackDiv.classList.remove('text-success');
					feedbackDiv.classList.add('text-danger');
					
				} else if (message === "none") {
					feedbackDiv.textContent = "사용 가능한 아이디입니다.";
					feedbackDiv.classList.remove('text-danger');
					feedbackDiv.classList.add('text-success');
				}
			}
		};
		xhr.open('GET', 'checkId.jsp?id=' + id); 	  // 초기화
		xhr.send(); 						  		  // 전송
	}
	
	function checkPassword() {
		let passwordRegExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
		
		let passwordInput = document.querySelector("input[name=password]");
		let validFeedbackDiv = document.getElementById("password-valid-feedback"); 
		let invalidFeedbackDiv = document.getElementById("password-invalid-feedback");
		
		// 유효한-피드백-클래스속성값과 유효하지않은-피드백-클래스속성값을 조회한다.
		// validClassList -> ['form-text', 'text-success', 'd-none']
		// invalidClassList -> ['form-text', 'text-danger', 'd-none']
		let validClassList = validFeedbackDiv.classList;
		let invalidClassList = invalidFeedbackDiv.classList;
		
		let password = passwordInput.value;
		if (passwordRegExp.test(password)) {
			validClassList.remove('d-none');
			invalidClassList.add('d-none');
		} else {
			validClassList.add('d-none');
			invalidClassList.remove('d-none');
		}
	}

/* 20240116
	회원가입 폼 입력값 유효성 체크하기
		1. 아이디, 비밀번호, 이름, 이메일, 전화번호는 필수 입력값이다.
		2. 아이디 : 6글자 이상, 영어대소문자/숫자 조합
		3. 비밀번호 : 9글자 이상, 영어대소문자/숫자/특수문자 조합
		4. 이름 : 2글자 이상, 한글
		5. 이메일 : 이메일형식에 맞는 문자열
		6. 전화번호 : 전화번호형식에 맞는 문자열
 */
	function checkRegisterForm(event) {
		// 0. 정규표현식 작성하기
		
		// 아이디 정규표현식 - 영어대소문자+숫자 조합의 3글자 이상
        let idRegExp = /^[a-zA-Z0-9]{3,}$/;
        let passwordRegExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/
        let nameRegExp = /^[가-힣]{2,}$/;
        let emailRegExp = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/
        let telRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
		
		// 1. 입력필드 엘리먼트 조회하기
		let idInput = document.querySelector("input[name=id]");
		let passwordInput = document.querySelector("input[name=password]");
		let nameInput = document.querySelector("input[name=name]");
		let emailInput = document.querySelector("input[name=email]");
		let telInput = document.querySelector("input[name=tel]");
		
		// 2. 입력필드의 입력값 조회하기
		let id = idInput.value;
		let password = passwordInput.value;
		let name = nameInput.value;
		let email = emailInput.value;
		let tel = telInput.value;
		
		// 3. 입력값 검증
		// 아이디 검증 - 필수입력값 검증
		if (id === "") {
			event.preventDefault();
			alert("아이디는 필수입력값입니다.");
			idInput.focus();
			return;
		}
		// 아이디 검증 - 6글자 이상, 영어대소문자/숫자 조합
		if (!idRegExp.test(id)) {
			event.preventDefault();
			alert("아이디는 영어대소문자 + 숫자 조합, 3글자 이상이어야 합니다.");
			idInput.focus();
			return;
		}
		
		// 비밀번호 검증 - 필수 입력값 검증
		if (!password) {
			event.preventDefault();
			alert("비밀번호는 필수입력값입니다.");
			passwordInput.focus();
			return;
		}
		
		// 비밀번호 검증 - 8글자이상, 영어대소문자/숫자/특수문자 조합
		if (!passwordRegExp.test(password)) {
			event.preventDefault();
			alert("비밀번호는 영어대소문자 + 숫자 + 특수문자 조합, 8글자 이상이어야 합니다.");
			passwordInput.foucs();
			return;
		}
		
		// 이름 검증
		// 이메일 검증
		// 전화번호 검증
	}
</script>
</body>
</html>