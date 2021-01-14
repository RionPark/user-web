<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.study.jwc.conn.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection con = DBConn.getConn();
PreparedStatement ps = null;
ResultSet rs = null;
%>
<table border="1">
	<tr>
		<th>번호</th>
		<th>주차장명</th>
		<th>전화번호</th>
		<th>극장명</th>
	</tr>
<%
try{
	String sql = "select tp.*,ti.ti_name from THEATER_PARK tp, THEATER_INFO ti";
	sql += " where ti.ti_num=tp.ti_num";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>" + rs.getString("tp_num") + "</td>");
		out.println("<td><a href=\"/park/park-update.jsp?tpNum=" + rs.getString("tp_num") + "\">" + rs.getString("tp_name") + "</a></td>");
		out.println("<td>" + rs.getString("tp_phone") + "</td>");
		out.println("<td>" + rs.getString("ti_name") + "</td>");
		out.println("</tr>");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps,rs);
}
%>
</table>
</body>
</html>