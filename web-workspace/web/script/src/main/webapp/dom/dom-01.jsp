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
<title>DOM - 엘리먼트</title><!-- 20240115 -->
</head>
<body>
<div class="container">
	<div class="col-12">
		<h1 class="mt-3 mb-3">엘리먼트 선택하기</h1>
<!-- 
	document.getElementById(id)
		- 지정된 id속성값으로 엘리먼트를 한 개 선택하고, 반환한다.
		- 일치하는 엘리먼트가 없으면 null을 반환한다.
		- 지정된 id속성값과 일치하는 엘리먼트가 여러 개 있으면, 첫번째 엘리먼트를 반환한다.
 -->
		<div>
			<p id="el-1">첫번째 p엘리먼트</p>
			<p id="el-2">두번째 p엘리먼트</p>
			<p id="el-3">세번째 p엘리먼트</p>
			<p id="el-4">네번째 p엘리먼트</p>
			<p id="el-5">다섯번째 p엘리먼트</p>
		</div>
	</div>
</div>
<script type="text/javascript">
	// 엘리먼트 하나 선택하기 - getElementById(id)
	
	let element1 = document.getElementById("el-1");
	console.log(element1);
	
	let element2 = document.getElementById("el-2");
	console.log(element2);
	
	// 선택된 엘리먼트의 컨텐츠 조회하기
	let element3 = document.getElementById("el-3");
	let text3 = element3.textContent;
	console.log("텍스트 : ", text3);
	
	// 선택된 엘리먼트의 컨텐츠 변경하기
	let element4 = document.getElementById("el-4");
	element4.textContent = "텍스트 컨텐츠 바꾸기";
	
	// 선택된 엘리먼트 삭제하기
	let element5 = document.getElementById("el-5");
	element5.remove();
</script>
</body>
</html>