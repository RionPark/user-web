<%@page import="com.study.jwc.conn.DBConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String tpNum = request.getParameter("tpNum");
Connection con = DBConn.getConn();
PreparedStatement ps = null;
String sql = "delete from theater_park where tp_num=?";
try{
	ps = con.prepareStatement(sql);
	ps.setString(1,tpNum);
	int cnt = ps.executeUpdate();
	if(cnt==1){
		DBConn.commit(con);
		response.sendRedirect("/park/park-list.jsp");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps);
}
%>