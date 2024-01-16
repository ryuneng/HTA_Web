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
			<h1 class="mt-3 mb-3">이벤트 버블링</h1> <!-- 자식 엘리먼트에서 부모 엘리먼트로 데이터를 전달해주기 위해 사용됨 -->
			
			<div onclick="handler1(event)" class="border p-3">
				첫번째 박스
				<div onclick="handler2(event)" class="border p-3 mt-3">
					두번째 박스
					<div onclick="handler3(event)" class="border p-3 mt-3">
						세번째 박스
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function handler1(event) {
		console.log("1번 박스가 클릭되었습니다.")
		event.stopImmediatePropagation();
	}
	function handler2() {
		console.log("2번 박스가 클릭되었습니다.")
		event.stopImmediatePropagation();
	}
	function handler3() {
		console.log("3번 박스가 클릭되었습니다.")
		event.stopImmediatePropagation();
 	}
</script>
</body>
</html>