<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.study.jwc.food.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
FoodDAO fDAO = new FoodDAO();
List<Map<String,String>> foodList = fDAO.selectFoodList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>메뉴번호</th>
		<th>메뉴명</th>
		<th>가격</th>
		<th>분류</th>
		<th>등록일</th>
		<th>등록시간</th>
	</tr>
<%
for(int i=0;i<foodList.size();i++){
	Map<String,String> menu = foodList.get(i);
%>
	<tr>
		<td><%=menu.get("fi_num") %></td>
		<td><a href="/food/food-update.jsp?fiNum=<%=menu.get("fi_num")%>"><%=menu.get("fi_name")%></a></td>
		<td><%=menu.get("fi_price")%></td>
		<td><%=menu.get("fi_type")%></td>
		<td><%=menu.get("fi_credat")%></td>
		<td><%=menu.get("fi_cretim")%></td>
	</tr>
<%
}
%>
	<tr>
		<td colspan="6" align="right"><a href="/food/food-insert.jsp"><button>메뉴등록</button></a></td>
	</tr>
</table>

</body>
</html>