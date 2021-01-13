<%@page import="com.study.jwc.conn.DBConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String tpName = request.getParameter("tpName");
String tpAddress = request.getParameter("tpAddress");
String tpPhone = request.getParameter("tpPhone");
String tiNum = request.getParameter("tiNum");

Connection con = DBConn.getConn();
PreparedStatement ps = null;
try{
	String sql = "insert into theater_park(tp_num, tp_name, tp_address, tp_phone, ti_num)";
	sql += " values(seq_tp_num.nextval,?,?,?,?)";
	ps = con.prepareStatement(sql);
	ps.setString(1, tpName);
	ps.setString(2, tpAddress);
	ps.setString(3, tpPhone);
	ps.setString(4, tiNum);
	int cnt = ps.executeUpdate();
	if(cnt==1){
		DBConn.commit(con);
		response.sendRedirect("/park/park.jsp");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps);
}
%>