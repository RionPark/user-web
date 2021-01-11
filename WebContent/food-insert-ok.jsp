<%@page import="java.sql.*"%>
<%@page import="com.study.jwc.conn.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String fiName = request.getParameter("fiName");
String fiPrice = request.getParameter("fiPrice");
String fiType = request.getParameter("fiType");

Connection con = DBConn.getConn();
PreparedStatement ps = null;
try{
	String sql = "insert into food_info(fi_num, fi_name, fi_price, fi_type, fi_credat, fi_cretim)";
	sql += " values(seq_fi_num.nextval, ?,?,?,to_char(sysdate,'YYYYMMDD'),to_char(sysdate,'HH24MISS'))";
	ps = con.prepareStatement(sql);
	ps.setString(1,fiName);
	ps.setString(2,fiPrice);
	ps.setString(3,fiType);
	int cnt = ps.executeUpdate();
	DBConn.commit(con);
	if(cnt==1){
		response.sendRedirect("/food.jsp");
	}
}catch(Exception e){
	DBConn.rollback(con);
	e.printStackTrace();
}finally{
	DBConn.close(con,ps);
}
%>