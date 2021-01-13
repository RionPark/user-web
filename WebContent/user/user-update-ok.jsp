<%@page import="com.study.jwc.conn.DBConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String uiId = request.getParameter("uiId");
String uiPwd = request.getParameter("uiPwd");
String uiNum = request.getParameter("uiNum");

Connection con = DBConn.getConn();
PreparedStatement ps = null;
try{
	String sql = "update user_info";
	sql += " set ui_id=?,";
	sql += " ui_pwd=?";
	sql += " where ui_num=?";
	ps = con.prepareStatement(sql);
	ps.setString(1, uiId);
	ps.setString(2, uiPwd);
	ps.setString(3, uiNum);
	int cnt = ps.executeUpdate();
	if(cnt==1){
		DBConn.commit(con);
		response.sendRedirect("/user/user.jsp");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con, ps);
}
%>