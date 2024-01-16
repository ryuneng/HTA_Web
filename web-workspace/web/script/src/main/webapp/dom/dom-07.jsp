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
<title>Bootstrap</title><!-- 20240116 -->
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1 class="mt-3 mb-3">엘리먼트의 속성 조회/변경</h1>
			
			<div>
				<img id="img-big" src="../resources/images/1.jpeg" style="width:400px; height:420px;">
			</div>
			<div>
				<img onclick="changeImage(event)" src="../resources/images/1.jpeg" style="width:64px; height:84px;">
				<img onclick="changeImage(event)" src="../resources/images/2.jpeg" style="width:64px; height:84px;">
				<img onclick="changeImage(event)" src="../resources/images/3.jpeg" style="width:64px; height:84px;">
				<img onclick="changeImage(event)" src="../resources/images/4.jpeg" style="width:64px; height:84px;">
				<img onclick="changeImage(event)" src="../resources/images/5.jpeg" style="width:64px; height:84px;">
				<img onclick="changeImage(event)" src="../resources/images/6.jpeg" style="width:64px; height:84px;">
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	// 발생한 이벤트 객체 전달받기
	function changeImage(event) {
		// 1. 이벤트가 발생한 엘리먼트 조회
		let img = event.target;
		// 2. 큰 이미지가 표시될 img 엘리먼트 조회
		let bigImg = document.querySelector("#img-big");
		
		// 3. 클릭한 img의 src 속성값 조회
		let imgPath = img.getAttribute("src");
		
		// 4. 큰 이미지가 표시될 Img 엘리먼트의 src 속성값 변경하기
		bigImg.setAttribute("src", imgPath); // 이 때, bigImg에 src속성이 없으면 자동으로 추가도 해줌
	}
</script>
</body>
</html>