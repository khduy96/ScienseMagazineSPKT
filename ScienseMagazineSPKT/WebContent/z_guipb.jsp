<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapchikhspkt","root", "12345678");
Statement st = con.createStatement();
String sqls = "select * from baiviet  WHERE baiviet_id='"+id+"' and trangthai='chuaduyet' ";
ResultSet rs;
rs=st.executeQuery(sqls);
int count=0;
while(rs.next())
{
count++;
}
String sql = "UPDATE baiviet SET tinhtrang ='pbv',trangthai='dangpb' WHERE baiviet_id='"+id+"'";
st.executeUpdate(sql);
%>
<html><body><label><center><b><h3>Bài viết đã được chuyển tới phản biện viên</h3></b></center></label></body></html>
<%
if(count>0){
response.setHeader("Refresh", "0.5; URL=../ScienseMagazineSPKT/tbt_dsyc.jsp");
}else response.setHeader("Refresh", "0.5; URL=../ScienseMagazineSPKT/tbt_dsdpb.jsp");
%>