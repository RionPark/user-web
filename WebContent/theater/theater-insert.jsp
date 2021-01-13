<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/theater/theater-insert-ok.jsp">
		<table>
			<tr>
				<th>극장명</th>
				<td><input type="text" name="tiName"></td>
			</tr>
			<tr>
				<th>극장주소</th>
				<td><input type="text" name="tiAddress"></td>
			</tr>
			<tr>
				<th>번호1</th>
				<td><input type="text" name="tiPhone1"></td>
			</tr>
			<tr>
				<th>번호2</th>
				<td><input type="text" name="tiPhone2"></td>
			</tr>
			<tr>
				<th><button>등록</button></th>
			</tr>
		</table>
	</form>
</body>
</html>