<%@page import="java.sql.*"%>
<%@page import="com.study.jwc.conn.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uiNum = request.getParameter("uiNum");
Connection con = DBConn.getConn();
String sql = "delete from user_info where ui_num=?";
PreparedStatement ps = null;
try{
	ps = con.prepareStatement(sql);
	ps.setString(1, uiNum);
	int cnt = ps.executeUpdate();
	if(cnt==1){
		DBConn.commit(con);
		response.sendRedirect("/user/user.jsp");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps);
}
%>