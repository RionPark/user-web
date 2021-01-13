<%@page import="com.study.jwc.conn.DBConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
</head>
<%
String tiNum = request.getParameter("tiNum");
Connection con = DBConn.getConn();
PreparedStatement ps = null;
ResultSet rs = null;
try{
	String sql ="select * from theater_info where ti_num =?";
	ps = con.prepareStatement(sql);
	ps.setString(1,tiNum);
	rs = ps.executeQuery();
	if(rs.next()){
		out.println("<h3>정말 삭제할까요?</h3>");
		out.println("<form method=\"post\" action =\"/theater/theater-delete-ok.jsp\">");
		out.println("<button>예</button>");
		out.println("<input type=\'hidden\' name =\"tiNum\" value=\""+rs.getString("ti_num")+"\"<br>");
		out.println("</form>");
		out.println("<form method=\"post\" action =\"/theater/theater.jsp\">");
		out.println("<button>아니오</button>");
		out.println("</form>");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps,rs);
}
%>
</body>
</html>