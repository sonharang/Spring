<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board 등록</title>
</head>
				<br>
<body>
		<form name="insertForm" action="boardInsert" method="post">
			<div>
			<h1>게시글 등록</h1>
				<br>
				<table>
				<tr>
					<th>title</th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>contents</th>
					<td><textarea name="contents"></textarea></td>
				</tr>
				<tr>
					<th>writer</th>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<th>image</th>
					<td><input type="text" name="image"></td>
				</tr>	
				</table>		
				</div>
				<br>
			<div>
				<button type="button" onclick="location.href='boardList'">목록으로</button>
				<button type="submit">등록</button>
			</div>
		</form>
		<!--자바 스크립트-->
		<script>
			document.querySelector('form[name="insertForm"]')
					.addEventListener('submit', boardInsertJs);

					function boardInsertJs(event){
						event.preventDefault();

						let title = document.getElementsByName('title')[0];
						let contents = document.getElementsByName('contents')[0];
						let writer = document.getElementsByName('writer')[0];

						if(title.value == ''){
							alert('js제목이 입력되지 않음.');
							title.focus();
							return;
						}
						if(contents.value == ''){
							alert('js내용이 입력되지 않음.');
							contents.focus();
							return;
						}
						if(writer.value == ''){
							alert('js작성자가 입력되지 않음.');
							writer.focus();
							return;
						}
						insertForm.submit();
					} 
					
					//이벤트 지우기
					document.querySelector('form[name="insertForm"]')
							.removeEventListener('submit', boardInsertJs);
							alert('event has been removed');
					
					
					//jQuery
					$('form[name="insertForm"]').on('submit', boardInsertJq);
					function boardInsertJq(event){
						event.preventDefault();
						let title = $('[name = "title"]');
						let contents = $('[name = "contents"]');
						let writer = $('[name = "writer"]');

						if(title.val() == ''){
							alert('jq제목이 입력되지 않음.');
							title.focus();
							return;
						}
						if(contents.val() == ''){
							alert('jq내용이 입력되지 않음.');
							contents.focus();
							return;
						}
						if(writer.val() == ''){
							alert('jq작성자가 입력되지 않음.');
							writer.focus();
							return;
						}
						insertForm.submit();
					}
		</script>
</body>
</html>