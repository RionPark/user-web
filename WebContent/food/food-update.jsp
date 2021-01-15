<%@page import="java.util.Map"%>
<%@page import="com.study.jwc.food.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String fiNum = request.getParameter("fiNum");
FoodDAO fDAO = new FoodDAO();
Map<String,String> food = fDAO.selectFood(Integer.parseInt(fiNum));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/food/food-update-ok.jsp">
	<input type="hidden" name="fiNum" value="<%=fiNum%>">
	메뉴명 : <input type="text" name="fiName" value="<%=food.get("fi_name")%>"><br>
	가격 : <input type="text" name="fiPrice" value="<%=food.get("fi_price")%>"><br>
	분류 : <input type="text" name="fiType" value="<%=food.get("fi_type")%>"><br>
	<button>메뉴수정</button>
</form>
<form method="post" action="/food/food-delete-ok.jsp">
	<input type="hidden" name="fiNum" value="<%=fiNum%>">
	<button>메뉴삭제</button>
</form>
</body>
</html>