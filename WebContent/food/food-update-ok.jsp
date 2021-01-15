<%@page import="com.study.jwc.food.FoodDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String fiNum = request.getParameter("fiNum");
String fiName = request.getParameter("fiName");
String fiPrice = request.getParameter("fiPrice");
String fiType = request.getParameter("fiType");
Map<String,String> food = new HashMap<String,String>();
food.put("fiNum", fiNum);
food.put("fiName", fiName);
food.put("fiPrice", fiPrice);
food.put("fiType", fiType);
FoodDAO fDAO = new FoodDAO();
int cnt = fDAO.updateFood(food);
if(cnt==1){
	out.println("정상수정 완료");
}else{
	out.println("수정 중 에러가 발생하였습니다.");
}
%>
<a href="/food/food-list.jsp"><button>메뉴리스트</button></a>
