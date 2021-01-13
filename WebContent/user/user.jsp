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
	Connection con = DBConn.getConn();
	PreparedStatement ps = null;
	ResultSet rs = null;
	try {
		String sql = "select * from user_info";
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		out.println("<table border=\"1\">");
		out.println("<tr>");
		out.println("<th>번호</th>");
		out.println("<th>ID</th>");
		out.println("<th>비번</th>");
		out.println("<th>가입일</th>");
		out.println("<th>가입시간</th>");
		out.println("</tr>");
		while (rs.next()) {
			out.println("<tr>");
			String str = "<td>" + rs.getString("ui_num") + "</td>";
			str += "<td><a href=\"/user/user-update.jsp?uiNum=" + rs.getString("ui_num") + "\">" + rs.getString("ui_id") + "</a></td>";
			str += "<td>" + rs.getString("ui_pwd") + "</td>";
			str += "<td>" + rs.getString("ui_credat") + "</td>";
			str += "<td>" + rs.getString("ui_cretim") + "</td>";
			out.println(str);
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("<a href=\"/user/user-insert.jsp\">글쓰기</a>");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBConn.close(con, ps, rs);
	}
	%>
</body>
</html>