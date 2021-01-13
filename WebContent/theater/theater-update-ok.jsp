<%@page import="java.sql.*"%>
<%@page import="com.study.jwc.conn.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
String tiNum = request.getParameter("tiNum");
String tiName = request.getParameter("tiName");
String tiAddress = request.getParameter("tiAddress");
String tiPhone1 = request.getParameter("tiPhone1");
String tiPhone2 = request.getParameter("tiPhone2");
Connection con =DBConn.getConn();
PreparedStatement ps = null;
try{
	String sql = "update theater_info";
	sql += " set ti_name =?,ti_address=?,ti_phone1=?,ti_phone2=?";
	sql += " where ti_num=?";
	ps = con.prepareStatement(sql);
	ps.setString(1,tiName);
	ps.setString(2,tiAddress);
	if(tiPhone1==null){
		ps.setString(3,"없음");
	}else if(tiPhone1!=null){
		ps.setString(3,tiPhone1);
	}
	if(tiPhone2==null){
		ps.setString(4,"없음");
	}else if(tiPhone2!=null){
		ps.setString(4,tiPhone2);
	}
	ps.setString(5,tiNum);
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