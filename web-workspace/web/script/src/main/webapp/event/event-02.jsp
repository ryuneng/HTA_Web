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
<title>이벤트</title> <!-- 20240115 -->
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1 class="mt-3 mb-3">mouseenter/mouseleave 이벤트</h1>
			
			<h3>* mouseenter와 mouseleave *</h3>
			<h6>- 자식도 한 요소로 포함됨</h6>
			<div class="border bg-light p-3 mb-3"
				onmouseenter="handler1()" onmouseleave="handler2()">
				부모
				<div class="border bg-light p-3">자식</div>
			</div>
			
			<h3>mouseover와 mouseout</h3>
			<h6>- 자식은 한 요소로 포함되지 않음</h6>
			<div class="border bg-light p-3 mb-3"
				onmouseover="handler1()" onmouseout="handler2()">
				부모
				<div class="border bg-light p-3">자식</div>
			</div>
			
		</div>
	</div>
</div>
<script type="text/javascript">
	function handler1() {
		console.log("요소 안으로 들어왔다.")
	}
	function handler2() {
		console.log("요소 밖으로 나왔다.")
	}
</script>
</body>
</html>