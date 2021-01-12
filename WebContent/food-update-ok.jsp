<%@page import="java.sql.*"%>
<%@page import="com.study.jwc.conn.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String fiName = request.getParameter("fiName");
String fiPrice = request.getParameter("fiPrice");
String fiType = request.getParameter("fiType");
String fiNum = request.getParameter("fiNum");

String sql = "update food_info";
sql += " set fi_name=?,";
sql += " fi_price=?,";
sql += " fi_type=?";
sql += " where fi_num=?";

Connection con = DBConn.getConn();
PreparedStatement ps = null;
try{
	ps = con.prepareStatement(sql);
	ps.setString(1, fiName);
	ps.setString(2, fiPrice);
	ps.setString(3, fiType);
	ps.setString(4, fiNum);
	int cnt = ps.executeUpdate();
	if(cnt==1){
		DBConn.commit(con);
		response.sendRedirect("/food.jsp");
	}else{
		DBConn.rollback(con);
		response.sendRedirect("/food-update.jsp?fiNum=" + fiNum);
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps);
}
%>