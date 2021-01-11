<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>메뉴등록</h3>
	<form method="post" action="/food-insert-ok.jsp">
		<table border="1">
			<tr>
				<th>메뉴명</th>
				<td><input type="text" name="fiName"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="fiPrice"></td>
			</tr>
			<tr>
				<th>음식분류</th>
				<td><input type="text" name="fiType"></td>
			</tr>
			<tr>
				<th colspan="2"><button>등록</button></th>
			</tr>
		</table>
	</form>
</body>
</html>