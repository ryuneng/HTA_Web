<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Bootstrap2 - 20231229</title>
</head>
<body>
<!-- 
	그리드 시스템
		+ 그리드 시스템은 컨테이너, 행, 열을 사용하여 컨텐츠를 표시하는 레이아웃을 구성하고 정렬한다.
		+ .row는 행을 정의한다.
		+ .col은 열을 정의한다.
		+ 행은 열의 래퍼다.(즉, 모든 열은 반드시 특정 행에 포함되어야 한다.)
		+ 행 하나 당 12개의 열을 사용할 수 있다.
		+ 12개의 열을 다양하게 조합해서 레이아웃을 구성한다.
		+ 모든 컨텐츠는 반드시 열 안에서 표현해야 한다.
 -->
<div class="container">
	<div class="row bg-primary">
		<div class="col-12">
			Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
		  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
		  head태그에 meta태그로 viewport 메타태그를 추가한다.
		  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
		  Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
		  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
		  head태그에 meta태그로 viewport 메타태그를 추가한다.
		  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
		</div>
	</div>
	<div class="row bg-secondary">
		<div class="col-6">
			Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
		  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
		  head태그에 meta태그로 viewport 메타태그를 추가한다.
		  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
		  Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
		  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
		  head태그에 meta태그로 viewport 메타태그를 추가한다.
		  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
		</div>
		<div class="col-6">
			Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
		  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
		  head태그에 meta태그로 viewport 메타태그를 추가한다.
		  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
		  Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
		  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
		  head태그에 meta태그로 viewport 메타태그를 추가한다.
		  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
		</div>
	</div>
	<div class="row bg-warning">
		<div class="col-3">
			Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
		  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
		  head태그에 meta태그로 viewport 메타태그를 추가한다.
		  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
		  Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
		  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
		  head태그에 meta태그로 viewport 메타태그를 추가한다.
		  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
		</div>
		<div class="col-9">
			Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
		  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
		  head태그에 meta태그로 viewport 메타태그를 추가한다.
		  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
		  Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
		  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
		  head태그에 meta태그로 viewport 메타태그를 추가한다.
		  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
			Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
		  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
		  head태그에 meta태그로 viewport 메타태그를 추가한다.
		  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
		  Bootstrap은 모바일 기기를 우선으로 개발하기 때문에 모바일 기기에 최적화하기 위해
		  모든 모바일 장치에 화면이 올바르게 렌더링되고, 터치 확대 조절을 보장하기 위해서
		  head태그에 meta태그로 viewport 메타태그를 추가한다.
		  viewport 메타태그로 해당 모바일 장치의 너비와 확대축소 스케일을 지정한다.
		</div>
	</div>
</div>
</body>
</html>