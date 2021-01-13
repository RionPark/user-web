<%@page import="java.sql.*"%>
<%@page import="com.study.jwc.conn.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
String tiNum = request.getParameter("tiNum");
Connection con = DBConn.getConn();
PreparedStatement ps = null;
try{
	String sql =" delete from theater_info where ti_num=?";
	ps= con.prepareStatement(sql);
	ps.setString(1,tiNum);
	int cnt = ps.executeUpdate();
	if(cnt==1){
		con.commit();
		response.sendRedirect("/theater/theater.jsp");
	}else{
		con.rollback();
		response.sendRedirect("/theater/theater.jsp");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps);
}
%>