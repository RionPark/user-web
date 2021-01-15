<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.study.jwc.food.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String fiName = request.getParameter("fiName");
String fiPrice = request.getParameter("fiPrice");
String fiType = request.getParameter("fiType");
Map<String, String> food = new HashMap<String,String>();
food.put("fiName", fiName);
food.put("fiPrice", fiPrice);
food.put("fiType", fiType);
FoodDAO fDAO = new FoodDAO();
int cnt = fDAO.insertFood(food);
if(cnt==1){
	out.println("정상적으로 등록되었습니다.");
}else{
	out.println("아이씨... 몰랑~~ 에러났엉~~");
}
%>