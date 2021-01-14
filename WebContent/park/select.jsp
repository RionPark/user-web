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
	   		<option value="1">CGV 상봉</option>
	   		<option value="2" selected>CGV 김포</option>
	   		<option value="3">CGV 여의도</option>
	   	</select>
</form>
</body>
</html>