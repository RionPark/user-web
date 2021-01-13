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
String tiNum = request.getParameter("tiNum");
String tiName ="";
String tiAddress ="";
String tiPhone1 ="";
String tiPhone2 ="";
Connection con = DBConn.getConn();
PreparedStatement ps = null;
ResultSet rs = null;
try{
	String sql = "select * from theater_info where ti_num=?";
	ps = con.prepareStatement(sql);
	ps.setString(1,tiNum);
	rs = ps.executeQuery();
	if(rs.next()){
		tiName = rs.getString("ti_name");
		tiAddress = rs.getString("ti_address");
		tiPhone1 = rs.getString("ti_phone1");
		tiPhone2 = rs.getString("ti_phone2");
		if(tiPhone2==null){
			tiPhone2 = "";
		}
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps,rs);
}
%>
<form method ="post" action ="/theater/theater-update-ok.jsp">
번호 <input type="text" name ="tiNum" value="<%=tiNum%>" readonly><br>
극장명 <input type="text" name ="tiName" value="<%=tiName%>"><br>
극장주소  <input type="text" name ="tiAddress" value="<%=tiAddress%>"><br>
극장번호1 <input type="text" name ="tiPhone1" value="<%=tiPhone1%>"><br>
극장번호2 <input type="text" name ="tiPhone2" value="<%=tiPhone2%>"><br>
<button>수정</button>
</form>
</body>
</html>