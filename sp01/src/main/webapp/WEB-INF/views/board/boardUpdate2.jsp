<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board 수정</title>
</head>
				<br>
<body>
		<form name="updateForm">
			<div>
			<h1>게시글 수정2</h1>
				<br>
				<table>
				<tr>
					<th>번호</th>
					<td><input type="text" name="bno" value="${boardInfo.bno }" readonly></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="${boardInfo.title }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="contents">${boardInfo.contents }</textarea></td>
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
				<button type="button">저장</button>
			</div>
		</form>
		<script>
			$('form button:contains(저장)').on('click', boardUpdateAjax);

			function boardUpdateAjax(event){
				//통신 진행 여부 결정
				if(!Validation()) return;
				//통신하기 위한 데이터 가져오기
				let boardDta = getBoardInfo();
				console.log('boardDta', boardDta);
				
				$.ajax('boardUpdate',{
					type : 'post',
					data : boardDta
				})
				.then(result=>{
					console.log(result);
				})
				.fail(err=>console.log(err));
			}
			function Validation(){
				let title = $('[name = "title"]');
				let contents = $('[name = "contents"]');
				let writer = $('[name = "writer"]');

						if(title.val() == ''){
							alert('제목이 입력되지 않음.');
							title.focus();
							return false;
						}
						if(contents.val() == ''){
							alert('내용이 입력되지 않음.');
							contents.focus();
							return false;
						}
						if(writer.val() == ''){
							alert('작성자가 입력되지 않음.');
							writer.focus();
							return false;
						}
						return true;
		}
			function getBoardInfo(){
				let formAry = $('form[name="updateForm"]').serializeArray();
				console.log(formAry);
				let formObj = {};
				$(formAry).each((idx, tag)=>{
					console.log(tag);
					formObj[tag.name] = tag.value;
				});
				return formObj;
			}










		</script>
</body>
</html>