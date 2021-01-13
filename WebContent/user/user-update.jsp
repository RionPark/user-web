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
String uiId = "";
String uiPwd = "";
String uiNum = request.getParameter("uiNum");
try{
	String sql = "select * from user_info where ui_num=?";
	ps = con.prepareStatement(sql);
	ps.setString(1, uiNum);
	rs = ps.executeQuery();
	if(rs.next()){
		uiId = rs.getString("ui_id");
		uiPwd = rs.getString("ui_pwd");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps);
}
%>
<form method="post" action="/user/user-update-ok.jsp">
	번호 : <input type="text" name="uiNum" value="<%=uiNum%>" readonly><br>
	아이디 : <input type="text" name="uiId" value="<%=uiId%>"><br>
	비밀번호 : <input type="text" name="uiPwd" value="<%=uiPwd%>"><br>
	<button>수정</button>
</form>
<form method="post" action="/user/user-delete-ok.jsp">
	<input type="hidden" name="uiNum" value="<%=uiNum%>">
	<button>삭제</button>
</form>
</body>
</html>