<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:1400/tapchikhspkt","root", "12345678");
Statement st = con.createStatement();
String sql = "UPDATE members SET yeucau ='T' WHERE username='"+id+"'";
st.executeUpdate(sql);
%>
<html><body><label><center><b><h3>Lời yêu cầu của bạn đã được chuyển tới Admin</h3></b></center></label></body></html>
<%
response.setHeader("Refresh", "0.5; URL=http://localhost:8080/ScienseMagazineSPKT/dg_tc.jsp");
%>