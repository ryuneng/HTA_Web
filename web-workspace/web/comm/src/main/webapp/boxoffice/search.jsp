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
<title>커뮤니티::박스오피스</title><!-- 20240118 -->
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="movie" name="menu"/>
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1 class="mt-3 mb-3">날짜별 박스오피스 조회</h1>
			
			<form class="border bg-light px-3 py-2 my-3">
	            <div class="row my-3">
	               <label class="col-sm-2 col-form-label">날짜</label>
	               <div class="col-sm-8">
	                  <input type="date" class="form-control" name="date"/>
	               </div>
	               <div class="col-sm-2">
	                  <button onclick="getBoxoffice()" type="button" class="btn btn-primary">조회</button>
	               </div>
	            </div>
	         </form>
	         
	         <table class="table" id="table-boxoffice">
	         	<thead>
	         		<tr>
	         			<th>순위</th>
	         			<th>영화제목</th>
	         			<th>개봉일</th>
	         			<th>당일관객수</th>
	         			<th>누적관객수</th>
	         			<th>누적매출액</th>
	         		</tr>
	         	</thead>
	         	<tbody></tbody>
	         </table>
		</div>
	</div>
</div>
<script type="text/javascript">
	function getBoxoffice() {
		// 시작 전 tbody 내부 깨끗이 초기화하기(재검색할 때 이전 데이터 남지 않게 하려고)
		let tbody = document.querySelector("#table-boxoffice tbody");
		tbody.innerHTML = "";
		
		let input = document.querySelector("input[name=date]");
		let targetDate = input.value.replace(/-/g, ''); // '-'를 전부 찾아서 ''로 변경하는 정규표현식(날짜 사이에 - 들어가지 않게)
		let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=" + targetDate;
		
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let jsonText = xhr.responseText;
				let obj = JSON.parse(jsonText);
				
				let items = obj.boxOfficeResult.dailyBoxOfficeList;
				
				let htmlContent = "";
				for (let index = 0; index < items.length; index++) {
					let item = items[index];
					
					let rank = item.rank;					// 순위
					let title = item.movieNm;				// 제목
					let openDate = item.openDt;				// 개봉일
					let dayAudienceCount = item.audiCnt;	// 당일 관객수
					let totalAudienceCount = item.audiAcc;	// 누적 관객수
					let totalSales = item.salesAcc;			// 총 매출액
					
					let tr = `
						<tr>
							<td>\${rank}</td>
							<td>\${title}</td>
							<td>\${openDate}</td>
							<td>\${dayAudienceCount} 명</td>
							<td>\${totalAudienceCount} 명</td>
							<td>\${totalSales} 원</td>
						</tr>
					`;
					
					htmlContent += tr;
				}
				tbody.innerHTML = htmlContent;
			}
		}
		xhr.open("GET", url);
		xhr.send();
	}
</script>
</body>
</html>