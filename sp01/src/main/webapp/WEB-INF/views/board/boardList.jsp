<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체board조회</title>
<style type="text/css">
tr,td,th{
	border: black;
    border-style: solid;
}
</style>
</head>
<body>
	<h1>자유 게시판</h1>
	<br />
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${boardList}" var="info">
			<tr onclick="location.href='boardInfo?bno=${info.bno}'">
				<td>${info.bno}</td>
				<td>${info.title}</td>
				<td>${info.contents}</td>
				<td>${info.writer}</td>
				<td>
					<fmt:formatDate value="${info.regdate}"  pattern="yyyy년 MM월 dd일 " /> 
				</td>
				<td>${info.updatedate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<br/>
	<button type="button" onclick="location.href='boardInsert'">등록</button>
</body>
</html>