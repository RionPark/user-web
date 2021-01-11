<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
//스크립트릿 jsp 태그
request.setCharacterEncoding("utf-8");
String uiId = request.getParameter("ui_id");
String uiPwd = request.getParameter("ui_pwd");
if(uiId!=null){
	out.println("니 아이디 : " + uiId);
	out.println("니 비밀번호 : " + uiPwd);
	out.println(uiId + "님 이군요~");
	Connection con = DBConn.getConn();
	String sql = "select * from user_info where ui_id=? and ui_pwd=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,uiId);
	ps.setString(2,uiPwd);
	ResultSet rs = ps.executeQuery();
	boolean isLogin = rs.next();
	if(isLogin){
		out.println(uiId + "님 반갑습니다.");
	}else{
		out.println("아이디나 비밀번호가 잘못되었습니다. 다시 로그인해주시기 바랍니다.");
	}
}else{
%> 
<form method="post">
아이디 : <input type="text" name="ui_id"><br>
비밀번호 : <input type="password" name="ui_pwd"><br>
<button>로그인</button>
</form>
<%
}
%>
</body>
</html>