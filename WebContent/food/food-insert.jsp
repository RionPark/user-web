<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/food/food-insert-ok.jsp">
	메뉴명 : <input type="text" name="fiName"><br>
	가격 : <input type="text" name="fiPrice"><br>
	분류 : <input type="text" name="fiType"><br>
	<button>메뉴저장</button>
</form>
</body>
</html>