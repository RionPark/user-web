<%@page import="java.sql.*"%>
<%@page import="com.study.jwc.conn.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String tiName = request.getParameter("tiName");
String tiAddress = request.getParameter("tiAddress");
String tiPhone1 = request.getParameter("tiPhone1");
String tiPhone2 = request.getParameter("tiPhone2");
Connection con = DBConn.getConn();
PreparedStatement ps = null;
try{
	String sql = "insert into theater_info";
	sql += " values(seq_ti_num.nextval,?,?,?,?)";
	ps = con.prepareStatement(sql);
	ps.setString(1,tiName);
	ps.setString(2,tiAddress);
	ps.setString(3,tiPhone1);
	ps.setString(4,tiPhone2);
	int cnt = ps.executeUpdate();
	if(cnt==1){
		DBConn.commit(con);
		response.sendRedirect("/theater/theater.jsp");
	}else{
		DBConn.rollback(con);
		response.sendRedirect("/theater/theater.jsp");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps);
}
%>