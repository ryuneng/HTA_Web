<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>DOM</title><!-- 20240115 -->
</head>
<body>
<div class="container">
	<div class="col-12">
		<h1 class="mt-3 mb-3">HTML 컨텐츠 조회/변경하기</h1>
		
		<div id="box-1" class="border bg-light p-3 mb-3">
			<h3>메뉴</h3>
			<ul>
				<li>커피</li>
				<li>음료</li>
				<li>탄산수</li>
			</ul>
		</div>
		
		<div id="box-2" class="border bg-light p-3 mb-3">
		</div>
		
		<div id="box-3" class="border bg-light p-3 mb-3">
		</div>
	</div>
</div>
<script type="text/javascript">
	// 엘리먼트의 HTML 컨텐츠를 조회/변경하기
	let el1 = document.getElementById("box-1");
	let content1 = el1.innerHTML;	// InnerHTML 프로터피값 조회하기 (태그 포함한 값 조회됨)
	console.log(content1);
	
	let content2 = el1.textContent; // textContent 프로퍼티값 조회하기 (태그 제외한 값 조회됨)
	console.log(content2);
	
	// 엘리먼트의 HTML 컨텐츠 변경하기
	let el2 = document.getElementById("box-2");
	let content3 = `
		<h3>영화정보</h3>
		<dl>
			<dt>제목</dt><dd>외계+인 2부</dd>
			<dt>감독</dt><dd>최동원</dd>
			<dt>배우</dt><dd>류준열</dd><dd>김우빈</dd><dd>김태리</dd>
		</dl>
	`;
	el2.innerHTML = content3;
	
	let el3 = document.getElementById("box-3");
	
	let names = ['김유신', '홍길동', '강감찬'];
	let content4 = "<ul>";
	for (let index = 0; index < names.length; index++) {
		content4 += "<li>"+names[index]+"</li>";
	}
	content4 += "</ul>";
	
	el3.innerHTML = content4;
</script>
</body>
</html>