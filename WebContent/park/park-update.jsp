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
<%
Connection con = DBConn.getConn();
PreparedStatement ps = null;
ResultSet rs = null;
String tpNum = request.getParameter("tpNum");
String tpName = "";
String tpAddress = "";
String tpPhone = "";
String tiNum = "";
try{
	String sql = "select * from theater_park where tp_num=?";
	ps = con.prepareStatement(sql);
	ps.setString(1,tpNum);
	rs = ps.executeQuery();
	if(rs.next()){
		tpName = rs.getString("tp_Name");
		tpAddress = rs.getString("tp_address");
		tpPhone = rs.getString("tp_phone");
		tiNum = rs.getString("ti_num");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps,rs);
}
%>
<form method="post" action="/park/park-update-ok.jsp">
	주차장명 : <input type="text" name="tpName" value="<%=tpName%>"><br>
	주차장주소 : <input type="text" name="tpAddress" value="<%=tpAddress%>"><br>
	주차장전번 : <input type="text" name="tpPhone" value="<%=tpPhone%>"><br>
	영화관번호 : <select name="tiNum">
	   		<option value="">선택</option>
<%
try{
	con = DBConn.getConn();
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
	<button>주차장수정</button>
</form>
</body>
</html>