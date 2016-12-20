<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String cv =(String)session.getAttribute("cv");
	if ((session.getAttribute("userid") == null)
			|| (session.getAttribute("userid") == "")
			|| (session.getAttribute("cv") == null)
			|| (session.getAttribute("cv") == "")) {
		response.sendRedirect("dn.jsp");
	} else if (new String("DocGia").equals(cv)) {
		response.sendRedirect("dg_tc.jsp");
	} else if (new String("TacGia").equals(cv)) {
		response.sendRedirect("tg_tc.jsp");
	} else if (new String("TongBienTap").equals(cv)) {
		response.sendRedirect("tbt_tc.jsp");
	} else if (new String("PhanBienVien").equals(cv)) {
		response.sendRedirect("pbv_tc.jsp");
	} else if (new String("BienTapVien").equals(cv)) {
		response.sendRedirect("btv_tc.jsp");
	} else if (new String("Admin").equals(cv)) {
		response.sendRedirect("ad_tc.jsp");
	}else{response.sendRedirect("dn.jsp");}
%>