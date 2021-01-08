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
//
/*
*/
String n1 = request.getParameter("n1");
String n2 = request.getParameter("n2");
String op = request.getParameter("op");
int sum = 0;
if(n1!=null && !"".equals(n1)){
	if(n2!=null && !"".equals(n2)){
		int num1 = Integer.parseInt(n1);
		int num2 = Integer.parseInt(n2);
		if(op!=null){
			if("+".equals(op)){
				sum = num1 + num2;
			}else if("-".equals(op)){
				sum = num1 - num2;
			}else if("/".equals(op)){
				sum = num1 / num2;
			}else if("*".equals(op)){
				sum = num1 * num2;
			}
		}
	}
}
%>
<form method="post">
	<input type="number" name="n1">
	<select name="op">
		<option value="+">더하기</option>
		<option value="-">빼기</option>
		<option value="*">곱하기</option>
		<option value="/">나누기</option>
	</select>
	<input type="number" name="n2">
	<button>계산하기</button>
	<%=sum%>
</form>

</body>
</html>