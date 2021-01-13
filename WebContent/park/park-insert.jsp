<%@page import="com.study.jwc.conn.DBConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/park/park-insert-ok.jsp">
	주차장명 : <input type="text" name="tpName"><br>
	주차장주소 : <input type="text" name="tpAddress"><br>
	주차장전번 : <input type="text" name="tpPhone"><br>
	영화관번호 : <select name="tiNum">
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
	   </select><br>
	<button>주차장등록</button>
</form>
</body>
</html>