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
<form>
영화관 : <select name="tiNum">
	   		<option value="">선택</option>
<%
Connection con = DBConn.getConn();
PreparedStatement ps = null;
ResultSet rs = null;
try{
	String sql = "select * from theater_info";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	while(rs.next()){
%>
			<option value="<%=rs.getString("ti_num")%>">
				<%=rs.getString("ti_name")%>
			</option>
<%
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps, rs);
}
%>
	   </select>
</form>
</body>
</html>