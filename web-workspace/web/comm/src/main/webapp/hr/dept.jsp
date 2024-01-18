<%@page import="vo.Department"%>
<%@page import="java.util.List"%>
<%@page import="dao.HrDao"%>
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
<title>커뮤니티::인사관리</title><!-- 20240118 -->
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="hr" name="menu"/>
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1 class="mt-3 mb-3">부서관리</h1>
			
			<div class="row">
				<div class="col-3">
<%
	HrDao hrDao = new HrDao();

	List<Department> deptList = hrDao.getAllDepartments();
%>
					<h3 class="mb-3">부서목록</h3>
					<div class="list-group">
<%
	for (Department dept : deptList) {
%>
						<a href=""
						   class="list-group-item list-group-item-action"
						   onclick="getEmployees(<%=dept.getId() %>, event)">
						   <%=dept.getName() %>
						</a>
<%
	}
%>
					</div>
				</div>
				<div class="col-9">
					<h3 class="mb-3">사원목록</h3>
					<table class="table" id="table-employees">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>입사일</th>
								<th>직종</th>
								<th>급여</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	// 스크립트 코딩은 항상 점진적으로 ! 한 단계 작성할 때마다 그때그때 실행해서 검증해나가기
	function getEmployees(id, event) {
		event.preventDefault();
		
		let prevElement = document.querySelector(".list-group-item.active");
		if (prevElement) { // -> true일 때(null이 아닐 때)
			prevElement.classList.remove("active");
		}
		
		let element = event.target; // target -> 현재 엘리먼트(a태그) 획득
		element.classList.add("active");
		
		let xhr = new XMLHttpRequest();						// 1. xhr 객체 생성
		xhr.onreadystatechange = function() {				// 2. 이벤트 핸들러 등록
			if (xhr.readyState == 4 && xhr.status == 200) {
				/*
					jsonText
						[
							{"id":100, "firstName":"홍", "lastName":"길동",
							 "hireDate":"2021-01-01", "jobId":"IT_PROG", "salary":4000.0},
							 
							{"id":100, "firstName":"홍", "lastName":"길동",
							 "hireDate":"2021-01-01", "jobId":"IT_PROG", "salary":4000.0},
							 
							{"id":100, "firstName":"홍", "lastName":"길동",
							 "hireDate":"2021-01-01", "jobId":"IT_PROG", "salary":4000.0}
						]
				*/
				let jsonText = xhr.responseText;
				// arr에는 jsonText가 자바배열객체로 변환되어 대입된다.
				let arr = JSON.parse(jsonText);
				
				let htmlContent = "";
				for (let index = 0; index < arr.length; index++) {
					// emp -> {id:100, firstName:"홍", lastName:"길동", ...}
					let emp = arr[index];
					
					let tr = `
						<tr>
							<td>\${emp.id}</td>
							<td>\${emp.firstName} \${emp.lastName}</td>
							<td>\${emp.hireDate}</td>
							<td>\${emp.jobId}</td>
							<td>\${emp.salary}</td>
						</tr>
					`;
					
					htmlContent += tr;
				}
				
				document.querySelector("#table-employees tbody").innerHTML = htmlContent;
			}
		};
		xhr.open("GET", "employees.jsp?deptId=" + id);		// 3. xhr 초기화 (*404에러날 때 jsp 주소 확인)
		xhr.send();											// 4. 서버로 요청 보내기
	}
</script>
</body>
</html>