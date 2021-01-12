<%@page import="java.sql.*"%>
<%@page import="com.study.jwc.conn.DBConn"%>
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
String fiNum = request.getParameter("fiNum");
Connection con = DBConn.getConn();
PreparedStatement ps = null;
ResultSet rs = null;
try{
	String sql = "select * from food_info where fi_num=?";
	ps = con.prepareStatement(sql);
	ps.setString(1,fiNum);
	rs = ps.executeQuery();
	if(rs.next()){
		out.println("<form method=\"post\" action=\"/food-update-ok.jsp\">");
		out.println("메뉴명 : <input type=\"text\" name=\"fiName\" value=\"" + rs.getString("fi_name") + "\"><br>");
		out.println("가격 : <input type=\"text\" name=\"fiPrice\" value=\"" + rs.getString("fi_price") + "\"><br>");
		out.println("종류 : <input type=\"text\" name=\"fiType\" value=\"" + rs.getString("fi_type") + "\"><br>");
		out.println("<input type=\"hidden\" name=\"fiNum\" value=\"" + rs.getString("fi_num") + "\">");
		out.println("<button>수정</button>");
		out.println("</form>");

		out.println("<form method=\"post\" action=\"/food-delete-ok.jsp\">");
		out.println("<input type=\"hidden\" name=\"fiNum\" value=\"" + rs.getString("fi_num") + "\">");
		out.println("<button>삭제</button>");
		out.println("</form>");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps, rs);
}
%>
</body>
</html>