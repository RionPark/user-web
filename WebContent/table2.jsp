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
	<table border="1">
		<tr>
			<th>유저번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>가입일</th>
			<th>가입시간</th>
		</tr>
<%
Connection con = DBConn.getConn();
PreparedStatement ps = null;
ResultSet rs = null;
try{
	String sql = "select * from user_info order by ui_num";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	while(rs.next()){
		String tag = "<tr>";
		tag += "<td>" + rs.getString("ui_num") + "</td>";
		tag += "<td>" + rs.getString("ui_id") + "</td>";
		tag += "<td>" + rs.getString("ui_pwd") + "</td>";
		tag += "<td>" + rs.getString("ui_credat") + "</td>";
		tag += "<td>" + rs.getString("ui_cretim") + "</td>";
		tag += "</tr>";
		out.println(tag);
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con, ps, rs);
}
%>
	</table>
	
</body>
</html>