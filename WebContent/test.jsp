<!-- 
jsp의 확장자명은 반드시 jsp여야 한다(jspx, jspf 등이 있지만 지금은 몰라두됨)
이유는 tomcat이 파일의 확장자명이 jsp일때만 servlet(이거 어려움)으로 파싱하라는 설정이 되어 있기 때문
jsp태그는 일단 < % 로 시작해서 %>로 끝나는데
시작에 붙는것에 따라 사용처가 다르며 총 4가지가 있다.
1. < %@ <-- 디렉티브(지시자) : jsp페이지 상단에 들어가는 것으로 페이지에 대한 설명을 나태낸다
2. < %  <-- 스크립트릿 : 일반 java코딩이 가능한 영역, 메소드의 선언은 불가능하다.
3. < %! <-- 디클레이션(선언부) : 위의 스크립트릿과 비슷해보이지만 선언만 가능하다. 메소드의 선언도 가능하다.
4. < %= <-- 익스프레션(표현식) : out.print의 줄임말이라고 생각하면 됨. 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나 타이틀이야~</title>
</head>
<body>
<%
String str = "별거 아님";
out.print(str); 
%><br>
<%=str%>
</body>
</html>