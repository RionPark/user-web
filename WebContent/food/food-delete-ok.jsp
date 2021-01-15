<%@page import="com.study.jwc.food.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String fiNum = request.getParameter("fiNum");
FoodDAO fDAO = new FoodDAO();
int cnt = fDAO.deleteFood(Integer.parseInt(fiNum));
if(cnt==1){
	out.println("정상적으로 삭제 되었습니다.");
}else{
	out.println("삭제 중에 오류가 발생하였습니다.");
}
%>

<a href="/food/food-list.jsp"><button>메뉴리스트</button></a>