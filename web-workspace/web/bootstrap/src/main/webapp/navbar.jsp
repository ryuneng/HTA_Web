<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Bootstrap12 - 20231229</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-5">
		<div class="container-fluid">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="" class="nav-link">링크1</a>
				</li>
				<li class="nav-item">
					<a href="" class="nav-link active">링크2</a>
				</li>
				<li class="nav-item">
					<a href="" class="nav-link">링크3</a>
				</li>
				<li class="nav-item">
					<a href="" class="nav-link">링크4</a>
				</li>
			</ul>
		</div>
	</nav>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-5">
		<div class="container-fluid">
			<!--
				회사 로그이미지 혹은 회사명이 위치한다.
				보통 클릭하면 해당 웹사이트의 홈페이지로 이동한다. 
			 -->
			<a class="navbar-brand" href="home.jsp">
				중앙HTA
			</a>
		</div>	
	</nav>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-5">
		<div class="container-fluid">
			<a class="navbar-brand" href="">
				<img src="resources/images/sample.jpg" style="width:40px;" class="rounded-pill">
			</a>
			<ul class="navbar-nav me-auto">
				<li class="nav-item">
					<a href="" class="nav-link">링크1</a>
				</li>
				<li class="nav-item">
					<a href="" class="nav-link active">링크2</a>
				</li>
				<li class="nav-item">
					<a href="" class="nav-link">링크3</a>
				</li>
				<li class="nav-item">
					<a href="" class="nav-link">링크4</a>
				</li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="" class="nav-link">로그인</a>
				</li>
				<li class="nav-item">
					<a href="" class="nav-link active">회원가입</a>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="row">
			<div class="col-12">
				  Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
				  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
				  head태그에 meta태그로 viewport 메타태그를 추가한다.
				  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
			</div>
		</div>
	</div>
</body>
</html>