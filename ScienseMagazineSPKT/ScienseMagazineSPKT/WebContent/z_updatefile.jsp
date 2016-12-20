<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.InputStream"%>
<%
	String idbv = request.getParameter("idbv");
%>
<html>
<body>
	<center><h3><%=request.getAttribute("Message")%></h3>
	<form action="tg_pb.jsp" method="get">
		<input type="hidden" value="<%=idbv%>" name="idbv" /> <input
			class="btn btn-default" type="submit" value="Quay lại" />
	</form></center>
</body>
</html>