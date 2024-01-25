<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 책 조회</title>
<style type="text/css">
tr,td,th{
	border: black;
    border-style: solid;
}
</style>
</head>
<body>
	<h4>도서별 대여매출현황</h4>
	<br />
	<table>
		<thead>
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>대여총계</th>
				<th>대여횟수</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${rentList}" var="info">
			<tr>
				<td style="text-align : center; width: 100px">${info.bookNo}</td>
				<td style="text-align : left; width: 300px">${info.bookName}</td>
				<td style="text-align : right; width: 200px">${info.sum}</td>
				<td style="text-align : right; width: 200px">${info.count}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>