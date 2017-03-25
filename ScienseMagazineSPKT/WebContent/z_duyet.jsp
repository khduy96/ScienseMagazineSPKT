<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapchikhspkt","root", "12345678");
Statement st = con.createStatement();
String sql = "UPDATE baiviet SET tinhtrang ='tbt',trangthai='duyet' WHERE baiviet_id='"+id+"'";
st.executeUpdate(sql);
%>
<html><body><label><center><b><h3>Bài viết đã được duyệt</h3></b></center></label></body></html>
<%
response.setHeader("Refresh", "0.5; URL=../ScienseMagazineSPKT/tbt_dsbt.jsp");
%>