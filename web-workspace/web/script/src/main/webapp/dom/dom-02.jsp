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
	<div class="row">
		<div class="col-12">
			<h1>엘리먼트 선택하기</h1>
			
			<div id="box" class="border p-2 mb-3">
				<p id="intro" class="box-text">첫번째 엘리먼트</p>
				<p class="box-text">두번째 엘리먼트</p>
				<p>세번째 엘리먼트</p>
				<p>네번째 엘리먼트</p>
				<p>다섯번째 엘리먼트</p>
			</div>
			<div class="border p3 mt-3">
				<button onclick="handler1()">아이디로 선택하기</button>
				<button onclick="handler2()">태그명으로 선택하기</button>
				<button onclick="handler3()">클래스명으로 선택하기</button>
				<button onclick="handler4()">css 선택자로 엘리먼트 하나 선택하기</button>
				<button onclick="handler5()">css 선택자로 엘리먼트 여러 개 선택하기</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	/*
		엘리먼트 선택하기
			Element		getElementById(id)
			NodeList	getElementByTagName(tagName)
			NodeList	getElementByClassName(className)
	
			Element		querySelector(css선택자)
			NodeList	querySelectorAll(css선택자)
	
			* NodeList : 배열과 유사한 객체
	*/
	
	function handler1() {
		let el = document.getElementById("intro");
		// 선택된 엘리먼트의 스타일 변경하기
		el.style.color = 'red';
	}
	
	function handler2() {
		let nodeList = document.getElementsByTagName("p");
		for (let index = 0; index < nodeList.length; index++) {
			let el = nodeList[index];
			// display 스타일 속성을 none으로 지정하면 엘리먼트가 화면에서 사라진다.
			// 엘리먼트가 삭제되지는 않음
			el.style.display = 'none';
		}
	}
	
	function handler3() {
		let nodeList = document.getElementsByClassName("box-text");
		for (let index = 0; index < nodeList.length; index++) {
			let el = nodeList[index];
			// display 스타일 속성을 "block"으로 지정하면 엘리먼트가 화면에 표시된다.
			el.style.display = 'block';
		}
	}
	
	function handler4() {
		// 엘리먼트 하나 찾기(첫번째 엘리먼트 하나)
		let el1 = document.querySelector("#intro");
		let el2 = document.querySelector("p");
		let el3 = document.querySelector(".box-text");
		
		el1.style.border = '1px solid red';
		el2.style.color = 'green';
		el3.style.backgroundColor = '#eee';
	}
	
	function handler5() {
		// 엘리먼트 전부 찾기
		
		// p엘리먼트 5개가 선택된다.
		let nodeList1 = document.querySelectorAll("p");
		// p엘리먼트 2개가 선택된다.
		let nodeList2 = document.querySelectorAll(".box-text");
		
		for (let index = 0; index < nodeList1.length; index++) {
			let el = nodeList1[index];
			el.style.border = '1px solid red';
		}
		for (let index = 0; index < nodeList2.length; index++) {
			let el = nodeList2[index];
			el.style.backgroundColor = '#eee';
		}
	}
</script>
</body>
</html>