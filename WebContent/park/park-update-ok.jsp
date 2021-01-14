<%@page import="com.study.jwc.conn.DBConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String tpNum = request.getParameter("tpNum");
String tpName = request.getParameter("tpName");
String tpAddress = request.getParameter("tpAddress");
String tpPhone = request.getParameter("tpPhone");
String tiNum = request.getParameter("tiNum");
Connection con = DBConn.getConn();
PreparedStatement ps = null;

String sql = "update theater_park";
sql += " set tp_name=?,";
sql += "  tp_Address=?,";
sql += "  tp_phone=?,";
sql += "  ti_num=?";
sql += " where tp_num=?";

try{
	ps = con.prepareStatement(sql);
	ps.setString(1,tpName);
	ps.setString(2,tpAddress);
	ps.setString(3,tpPhone);
	ps.setString(4,tiNum);
	ps.setString(5,tpNum);
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