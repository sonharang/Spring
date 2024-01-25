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
	<h4>도서 조회/수정</h4>
	<br />
	<table>
		<thead>
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>표지</th>
				<th>출판일자</th>
				<th>금액</th>
				<th>출판사</th>
				<th>도서소개</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${bookList}" var="info">
			<tr>
				<td>${info.bookNo}</td>
				<td>${info.bookName}</td>
				<td><img style="width:50px" src="<c:url value="/resources/images/${info.bookCoverimg }" />"></td>
				<td>
					<fmt:formatDate value="${info.bookDate}"  pattern="yyyy/MM/dd" /> 
				</td>
				<td>
				<fmt:formatNumber value="${info.bookPrice}" pattern="#,###"/>
				</td>
				<td>${info.bookPublisher}</td>
				<td>${info.bookInfo}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>