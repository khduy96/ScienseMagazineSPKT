<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body>
	<center>
		<label><b><h3>Đăng ký thành công.</h3></b>
		</label>
	</center>
</body>
</html>
<%
	response.setHeader("Refresh",
			"0.5; URL=../ScienseMagazineSPKT/dn.jsp");
%>