<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board 정보 조회 및 수정</title>
</head>
				<br>
<body>
		<form action="">
			<div>
			<h1>게시글 수정1</h1>
			<br/>
			<table>
				<tr>
					<th>번호</th>
					 <td><input type="number" name="bno" value="${boardInfo.bno }" readonly></td> 
					
				</tr>
				<tr>
					<th>제목</th>
					 <td><input type="text" name="title" value="${boardInfo.title }"></td> 
					
				</tr>
				<tr>
					<th>내용</th>
					 <td><input type="text" name="contents" value="${boardInfo.contents }"></td> 
					
				</tr>
				<tr>
					<th>작성자</th>
					 <td><input type="text" name="writer" value="${boardInfo.writer }"></td> 
					
				</tr>
				<tr>
					<th>이미지</th>
					 <td><input type="text" name="image" value="${boardInfo.image }"></td>
					
				</tr>
				</table>
			</div>
				<br>
			<div>
				<button type="button" onclick="location.href='boardList'">목록으로</button>
				<button type="button" id="updateBtn" >수정</button> 
				<button type="button" onclick="location.href='boardDelete?bno=${boardInfo.bno}'">삭제</button>
			</div>
		</form>
		<script>
			document.querySelector('#updateBtn')
					.addEventListener('click', updateBoardInfo);
			function updateBoardInfo(event){
			//form 태그 내부의 입력태그를 기반으로 정보를 가져옴
				let boardInfo = getBoardInfo();
			
			//해당 정보를 기반으로 Ajax     QueryString (key=value&key=value...)
				fetch('boardUpdate',{
					method: 'post',
					body: new URLSearchParams(boardInfo)
				})
				.then(response=>response.json())
				.then(result=>{
					console.log('QueryString', result);
				})
				.catch(err => console.log(err));
				
				//JSON                 JSON ("key":"value", "key":"value"...)
				fetch('boardUpdateAjax',{
					method: 'post',
					headers:{
						'content-type' : 'Application/json'
					},
					body: JSON.stringify(boardInfo)
				})
				.then(response=>response.json())
				.then(result=>{
					console.log('JSON', result);
				})
				.catch(err => console.log(err));
			}
			
			
			function getBoardInfo(){
				let inputList = document.querySelectorAll('form input');
				let objData = {};
				inputList.forEach(tag =>{
				objData[tag.name] = tag.value;
			}); //name이 사용하기 쉬움 다른 거 써도 가능함 id나 class는 X
				return objData;	
			}
		</script>
</body>
</html>