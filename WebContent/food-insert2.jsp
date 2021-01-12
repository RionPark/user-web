<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
-- 일단 암기 --
html의 form태그에서 쓸수 있는 method는 2개 밖에 없다.
GET, POST
form태그에서 method값을 생략할경우 기본값은 GET

HTTP에서 정의 된 method는 여러개가 있는데 일단 4개만 외우자
GET, POST, PUT, DELETE
-->


	<form method="GET" action="/food-insert-ok.jsp">
		메뉴명 : <input type="text" name="fiName"><br>
		가격 : <input type="text" name="fiPrice"><br>
		종류 : <input type="text" name="fiType"><br>
		<button>메뉴등록</button>
	</form>
</body>
</html>