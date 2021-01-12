<%@page import="com.study.jwc.conn.DBConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String fiNum = request.getParameter("fiNum");

Connection con = DBConn.getConn();
PreparedStatement ps = null;
try{
	String sql = "delete from food_info where fi_num=?";
	ps = con.prepareStatement(sql);
	ps.setString(1,fiNum);
	int cnt = ps.executeUpdate();
	if(cnt==1){
		DBConn.commit(con);
		response.sendRedirect("/food.jsp");
	}else{
		DBConn.rollback(con);
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con, ps);
}
%>