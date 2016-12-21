<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	String value = request.getParameter("eingabe");
	String tieuchi = request.getParameter("tieuchi");
	String cv = (String) session.getAttribute("cv");
	String asd = (String) session.getAttribute("userid");
%>

<html>
<head>
<title>Tạp Chí KHSPKT</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=0.1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"
	charset="utf-8"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:1400/tapchikhspkt" user="root"
		password="12345678" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div align="center">
					<img src="image/Untitled.jpg" alt="logo" class="img-responsive"
						style="max-height: 75vh;" />
				</div>
				<form action="z_viewsearch.jsp" method="post">
					<table>
						<tr>
							<td><input type="text" name="eingabe" size="86"
								class="form-control" /></td>
							<td><select name="tieuchi" id="tieuchi" class="form-control">
									<option value="Tukhoa">Từ khóa</option>
									<option value="tacgia">Tác giả</option>
									<option value="ngay">Ngày</option>
									<option value="linhvuc">Lĩnh vực</option>
							</select></td>
							<td><input type="submit" name="submit" value="Search"
								class="btn btn-default" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<c:set var="user" value="<%=asd%>" />
	<div class="container-fluid">
		<nav class="navbar navbar-default" style="margin: 0 0 0 0;">
		<div class="container-fluid">
			<button type="button" class="navbar-toggle " data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-2">
				<span class="sr-only"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-2">
				<ul class="nav navbar-nav nav-tabs">
					<c:if test="${empty user}">
						<li><a href="tc.jsp"> TRANG CHỦ </a></li>
					</c:if>
					<c:if test="${not empty user}">
						<c:if test="${cv == 'TongBienTap'}">
							<li><a href="tbt_tc.jsp"> TRANG CHỦ </a></li>
						</c:if>
						<c:if test="${cv == 'Admin'}">
							<li><a href="ad_tc.jsp"> TRANG CHỦ </a></li>
						</c:if>
						<c:if test="${cv == 'PhanBienVien'}">
							<li><a href="pbv_tc.jsp"> TRANG CHỦ </a></li>
						</c:if>
						<c:if test="${cv == 'BienTapVien'}">
							<li><a href="btv_tc.jsp"> TRANG CHỦ </a></li>
						</c:if>
						<c:if test="${cv == 'TacGia'}">
							<li><a href="tg_tc.jsp"> TRANG CHỦ </a></li>
						</c:if>
						<c:if test="${cv == 'DocGia'}">
							<li><a href="dg_tc.jsp"> TRANG CHỦ </a></li>
						</c:if>
					</c:if>
					<li><a data-toggle="tab" href="#cctc">CƠ CẤU TỔ CHỨC</a></li>
					<li><a data-toggle="tab" href="#qd">QUY ĐỊNH</a></li>
					<li><a data-toggle="tab" href="#lh"> LIÊN HỆ </a></li>
				</ul>

				<c:if test="${empty user}">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="dk.jsp"><span
								class="glyphicon glyphicon-user"></span> Đăng Ký</a></li>
						<li><a href="dn.jsp"><span
								class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
					</ul>
				</c:if>
				<c:if test="${not empty user}">
					<sql:query dataSource="${snapshot}" var="tbdb">
SELECT * from baiviet where tinhtrang = 'tbt' and dang='F' and trangthai = 'chuaduyet' ;
</sql:query>
					<c:set var="bd" value="${tbdb.rowCount}" scope="session" />
					<sql:query dataSource="${snapshot}" var="tbdpb">
SELECT * from baiviet where (tinhtrang = 'tbt') and dang='F' and (trangthai = 'dapb') ;
</sql:query>
					<c:set var="pb" value="${tbdpb.rowCount}" scope="session" />
					<sql:query dataSource="${snapshot}" var="tbdbt">
SELECT * from baiviet where tinhtrang = 'tbt' and dang='F' and trangthai = 'dabientap' ;
</sql:query>
					<c:set var="bt" value="${tbdbt.rowCount}" scope="session" />
					<c:set var="tong" value="${bd+pb+bt}" scope="session" />
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								data-toggle="dropdown">
								<span class="glyphicon glyphicon-cog"></span>
								<c:if test="${cv == 'TongBienTap'}">Tổng biên tập<c:if
										test="${tong !=0 }">
										<span class="badge">${tong}</span>
									</c:if>
								</c:if>
								<c:if test="${cv == 'Admin'}">Admin</c:if>
								<c:if test="${cv == 'PhanBienVien'}">Phản biện viên</c:if>
								<c:if test="${cv == 'BienTapVien'}">Biên Tập Viên</c:if>
								<c:if test="${cv == 'TacGia'}">Tác Giả</c:if>
								<c:if test="${cv == 'DocGia'}">Đọc Giả</c:if>
							</button>
							<ul class="dropdown-menu">
								<c:if test="${cv == 'TongBienTap'}">
									<li><a href="tbt_dsyc.jsp">Danh sách yêu cầu đăng bài<c:if
												test="${db !=0 }">
												<span class="badge">${bd}</span>
											</c:if></a></li>
									<li><a href="tbt_dspb.jsp">Các bài viết đang phản biện</a></li>
									<li><a href="tbt_dsdpb.jsp">Các bài viết đã phản biện<c:if
												test="${pb !=0 }">
												<span class="badge">${pb}</span>
											</c:if></a></li>
									<li><a href="tbt_dsbt.jsp">Các bài viết đã biên tập<c:if
												test="${bt !=0 }">
												<span class="badge">${bt}</span>
											</c:if></a></li>
									<li><a href="tbt_db.jsp">Đăng bài</a></li>
								</c:if>
								<c:if test="${cv == 'PhanBienVien'}">
									<li><a href="pbv_dspb.jsp">Danh sách bài được giao</a></li>
								</c:if>
								<c:if test="${cv == 'TacGia'}">
									<li><a href="tg_dspb.jsp">Bài viết đang trong quá
											trình phản biện</a></li>
									<li><a href="tg_db.jsp">Đăng bài</a></li>
								</c:if>
								<c:if test="${cv == 'DocGia'}">
									<li>
										<form name="myForm" action="z_yeucau.jsp" method="post">
											<input type="hidden"
												value="<%=session.getAttribute("userid")%>" name="id" />

										</form> <a onclick="myFunction()">Yêu cầu cấp quyền tác giả</a> <script>
											function myFunction() {
												document.forms['myForm']
														.submit()

											}
										</script>
									</li>
								</c:if>
								<c:if test="${cv == 'Admin'}">
									<li><a href="ad_dstk.jsp">Danh sách tài khoản</a></li>
								</c:if>
								<c:if test="${cv == 'BienTapVien'}">
									<li><a href="btv_dsbt.jsp">Danh sách bài được giao</a></li>
								</c:if>
							</ul>
						</li>
						<li class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								data-toggle="dropdown">
								<span class="glyphicon glyphicon-user"></span><%=session.getAttribute("userid")%>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">Thông tin cá nhân</a></li>
								<li><a href="logout.jsp">Đăng xuất</a></li>
							</ul>
						</li>
					</ul>
				</c:if>
			</div>
		</div>
		</nav>
		<div class="tab-content">
			<div id="" class="tab-pane fade in active">
				<c:set var="value" value="<%=value%>" />
				<c:set var="tieuchi" value="<%=tieuchi%>" />
				<c:if test="${tieuchi=='Tukhoa'}">

					<sql:query dataSource="${snapshot}" var="Tukhoa">
SELECT * from baiviet where (tukhoa1 like '%<%=value%>%' or tukhoa2 like '%<%=value%>%' or tukhoa3 like '%<%=value%>%' or tukhoa4 like '%<%=value%>%' or tukhoa5 like '%<%=value%>%')and dang='T' ;

					</sql:query>
					<div class="container">
						<div class="panel panel-default navbar-nav">
							<div class="panel panel-heading">
								<h4 class="panel-tiile" align="center">Kết quả tìm kiếm</h4>
							</div>
							<div class="panel-body">
								<div class="container ">
									<c:forEach var="row" items="${Tukhoa.rows}">
										<c:set var="idbv" value="${row.baiviet_id}" scope="session" />
										<div class="row ">
											<div class="col-md-10">
												<a
													href="../ScienseMagazineSPKT/bl.jsp?idbv=${sessionScope['idbv']}"><c:out
														value="${row.tieude}"></c:out> </a>
											</div>
											<div class="col-md-2">
												<ul style="list-style: none;">
													<li>
														<button class="btn btn-default" type="submit"
															data-toggle="modal"
															data-target="#${sessionScope['idbv']}"
															style="float: left;">
															<span class="glyphicon glyphicon-option-horizontal"></span>
														</button>
													</li>
													<li><a
														href="../ScienseMagazineSPKT/downloadFileServlet?id=${sessionScope['idbv']}">
															<button class="btn btn-default" type="submit"
																style="float: left;">
																<span class="glyphicon glyphicon-download-alt"></span>
															</button>
													</a></li>
												</ul>
												<div class="modal fade bs-example-modal-lg"
													id="${sessionScope['idbv']}" role="dialog">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h1 class="modal-title">
																	<c:out value="${row.tieude}"></c:out>
																</h1>
															</div>
															<div class="modal-body">
																<div class="container-fluid">
																	<div class="row">
																		<div class="col-md-6">
																			<label>Tác giả</label>
																		</div>
																		<div class="col-md-6">
																			<label>Cơ quan công tác</label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id1}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan1}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id2}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan2}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id3}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan3}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id4}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan4}"></c:out></label>
																		</div>
																	</div>
																</div>
																<label>
																	<h2 id="${row.noidung}"></h2> <input type="hidden"
																	value='${row.noidung}' id="${row.noidung}s" /> <script>
													var nd = document
															.getElementById('${row.noidung}s').value;
													document
															.getElementById('${row.noidung}').innerHTML = nd;
												</script>
																</label>
																<div class="row">
																	<div class="col-md-2">Từ khóa:</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa1}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa2}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa3}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa4}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa5}"></c:out></label>
																	</div>
																</div>
																<a
																	href="../ScienseMagazineSPKT/downloadFileServlet?id=${sessionScope['idbv']}">
																	DƠNLOAD </a>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Close</button>
															</div>
														</div>

													</div>
												</div>
											</div>
										</div>
										<hr class="form-group" />
									</c:forEach>
								</div>

							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${tieuchi=='tacgia'}">
					<sql:query dataSource="${snapshot}" var="tacgia">
SELECT * from baiviet where (tacgia_id like '%<%=value%>%' or tacgia_id1 like '%<%=value%>%' or tacgia_id2 like '%<%=value%>%' or tacgia_id3 like '%<%=value%>%' or tacgia_id4 like '%<%=value%>%')and dang='T' ;
					</sql:query>
					<div class="container">
						<div class="panel panel-default navbar-nav">
							<div class="panel panel-heading">
								<h4 class="panel-tiile" align="center">Kết quả tìm kiếm</h4>
							</div>
							<div class="panel-body">
								<div class="container ">
									<c:forEach var="row" items="${tacgia.rows}">
										<c:set var="idbv" value="${row.baiviet_id}" scope="session" />
										<div class="row ">
											<div class="col-md-10">
												<a
													href="http://localhost:8080/ScienseMagazineSPKT/bl.jsp?idbv=${sessionScope['idbv']}"><c:out
														value="${row.tieude}"></c:out> </a>
											</div>
											<div class="col-md-2">
												<ul style="list-style: none;">
													<li>
														<button class="btn btn-default" type="submit"
															data-toggle="modal"
															data-target="#${sessionScope['idbv']}"
															style="float: left;">
															<span class="glyphicon glyphicon-option-horizontal"></span>
														</button>
													</li>
													<li><a
														href="../ScienseMagazineSPKT/downloadFileServlet?id=${sessionScope['idbv']}">
															<button class="btn btn-default" type="submit"
																style="float: left;">
																<span class="glyphicon glyphicon-download-alt"></span>
															</button>
													</a></li>
												</ul>
												<div class="modal fade bs-example-modal-lg"
													id="${sessionScope['idbv']}" role="dialog">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h1 class="modal-title">
																	<c:out value="${row.tieude}"></c:out>
																</h1>
															</div>
															<div class="modal-body">
																<div class="container-fluid">
																	<div class="row">
																		<div class="col-md-6">
																			<label>Tác giả</label>
																		</div>
																		<div class="col-md-6">
																			<label>Cơ quan công tác</label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id1}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan1}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id2}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan2}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id3}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan3}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id4}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan4}"></c:out></label>
																		</div>
																	</div>
																</div>
																<label>
																	<h2 id="${row.noidung}"></h2> <input type="hidden"
																	value='${row.noidung}' id="${row.noidung}s" /> <script>
													var nd = document
															.getElementById('${row.noidung}s').value;
													document
															.getElementById('${row.noidung}').innerHTML = nd;
												</script>
																</label>
																<div class="row">
																	<div class="col-md-2">Từ khóa:</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa1}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa2}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa3}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa4}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa5}"></c:out></label>
																	</div>
																</div>
																<a
																	href="../ScienseMagazineSPKT/downloadFileServlet?id=${sessionScope['idbv']}">
																	DƠNLOAD </a>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Close</button>
															</div>
														</div>

													</div>
												</div>
											</div>
										</div>
										<hr class="form-group" />
									</c:forEach>
								</div>

							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${tieuchi=='ngay'}">
					<sql:query dataSource="${snapshot}" var="ngay">
SELECT * from baiviet where ngay like '%<%=value%>%'  and dang='T' ;
					</sql:query>
					<div class="container">
						<div class="panel panel-default navbar-nav">
							<div class="panel panel-heading">
								<h4 class="panel-tiile" align="center">Kết quả tìm kiếm</h4>
							</div>
							<div class="panel-body">
								<div class="container ">
									<c:forEach var="row" items="${ngay.rows}">
										<c:set var="idbv" value="${row.baiviet_id}" scope="session" />
										<div class="row ">
											<div class="col-md-10">
												<a
													href="http://localhost:8080/ScienseMagazineSPKT/bl.jsp?idbv=${sessionScope['idbv']}"><c:out
														value="${row.tieude}"></c:out> </a>
											</div>
											<div class="col-md-2">
												<ul style="list-style: none;">
													<li>
														<button class="btn btn-default" type="submit"
															data-toggle="modal"
															data-target="#${sessionScope['idbv']}"
															style="float: left;">
															<span class="glyphicon glyphicon-option-horizontal"></span>
														</button>
													</li>
													<li><a
														href="../ScienseMagazineSPKT/downloadFileServlet?id=${sessionScope['idbv']}">
															<button class="btn btn-default" type="submit"
																style="float: left;">
																<span class="glyphicon glyphicon-download-alt"></span>
															</button>
													</a></li>
												</ul>
												<div class="modal fade bs-example-modal-lg"
													id="${sessionScope['idbv']}" role="dialog">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h1 class="modal-title">
																	<c:out value="${row.tieude}"></c:out>
																</h1>
															</div>
															<div class="modal-body">
																<div class="container-fluid">
																	<div class="row">
																		<div class="col-md-6">
																			<label>Tác giả</label>
																		</div>
																		<div class="col-md-6">
																			<label>Cơ quan công tác</label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id1}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan1}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id2}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan2}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id3}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan3}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id4}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan4}"></c:out></label>
																		</div>
																	</div>
																</div>
																<label>
																	<h2 id="${row.noidung}"></h2> <input type="hidden"
																	value='${row.noidung}' id="${row.noidung}s" /> <script>
													var nd = document
															.getElementById('${row.noidung}s').value;
													document
															.getElementById('${row.noidung}').innerHTML = nd;
												</script>
																</label>
																<div class="row">
																	<div class="col-md-2">Từ khóa:</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa1}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa2}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa3}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa4}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa5}"></c:out></label>
																	</div>
																</div>
																<a
																	href="../ScienseMagazineSPKT/downloadFileServlet?id=${sessionScope['idbv']}">
																	DƠNLOAD </a>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Close</button>
															</div>
														</div>

													</div>
												</div>
											</div>
										</div>
										<hr class="form-group" />
									</c:forEach>
								</div>

							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${tieuchi=='linhvuc'}">
					<sql:query dataSource="${snapshot}" var="linhvuc">
SELECT * from baiviet where linhvuc like '%<%=value%>%' and dang='T' ;
					</sql:query>
					<div class="container">
						<div class="panel panel-default navbar-nav">
							<div class="panel panel-heading">
								<h4 class="panel-tiile" align="center">Kết quả tìm kiếm</h4>
							</div>
							<div class="panel-body">
								<div class="container ">
									<c:forEach var="row" items="${linhvuc.rows}">
										<c:set var="idbv" value="${row.baiviet_id}" scope="session" />
										<div class="row ">
											<div class="col-md-10">
												<a
													href="http://localhost:8080/ScienseMagazineSPKT/bl.jsp?idbv=${sessionScope['idbv']}"><c:out
														value="${row.tieude}"></c:out> </a>
											</div>
											<div class="col-md-2">
												<ul style="list-style: none;">
													<li>
														<button class="btn btn-default" type="submit"
															data-toggle="modal"
															data-target="#${sessionScope['idbv']}"
															style="float: left;">
															<span class="glyphicon glyphicon-option-horizontal"></span>
														</button>
													</li>
													<li><a
														href="../ScienseMagazineSPKT/downloadFileServlet?id=${sessionScope['idbv']}">
															<button class="btn btn-default" type="submit"
																style="float: left;">
																<span class="glyphicon glyphicon-download-alt"></span>
															</button>
													</a></li>
												</ul>
												<div class="modal fade bs-example-modal-lg"
													id="${sessionScope['idbv']}" role="dialog">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h1 class="modal-title">
																	<c:out value="${row.tieude}"></c:out>
																</h1>
															</div>
															<div class="modal-body">
																<div class="container-fluid">
																	<div class="row">
																		<div class="col-md-6">
																			<label>Tác giả</label>
																		</div>
																		<div class="col-md-6">
																			<label>Cơ quan công tác</label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id1}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan1}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id2}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan2}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id3}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan3}"></c:out></label>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-md-6">
																			<label><c:out value="${row.tacgia_id4}"></c:out></label>
																		</div>
																		<div class="col-md-6">
																			<label><c:out value="${row.coquan4}"></c:out></label>
																		</div>
																	</div>
																</div>
																<label>
																	<h2 id="${row.noidung}"></h2> <input type="hidden"
																	value='${row.noidung}' id="${row.noidung}s" /> <script>
													var nd = document
															.getElementById('${row.noidung}s').value;
													document
															.getElementById('${row.noidung}').innerHTML = nd;
												</script>
																</label>
																<div class="row">
																	<div class="col-md-2">Từ khóa:</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa1}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa2}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa3}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa4}"></c:out></label>
																	</div>
																	<div class="col-md-2">
																		<label><c:out value="${row.tukhoa5}"></c:out></label>
																	</div>
																</div>
																<a
																	href="../ScienseMagazineSPKT/downloadFileServlet?id=${sessionScope['idbv']}">
																	DƠNLOAD </a>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Close</button>
															</div>
														</div>

													</div>
												</div>
											</div>
										</div>
										<hr class="form-group" />
									</c:forEach>
								</div>

							</div>
						</div>
					</div>
				</c:if>

			</div>
			<div id="cctc" class="tab-pane fade">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<form>
								<table cellpadding="0px" cellspacing="0px">
									<tr>
										<td
											style="border: 1px solid #191970; width: 300px; height: 50px;"
											align="center">Tài khoản</td>
										<td
											style="border: 1px solid #191970; width: 300px; height: 50px;"
											align="center"></td>
										<tr>
											<td
												style="border: 1px solid #191970; width: 300px; height: 50px;">
												Thanh Dũng</td>
											<td
												style="border: 1px solid #191970; width: 300px; height: 50px;">
												Tổng biên tập</td>
										</tr>
										<tr>
											<td
												style="border: 1px solid #191970; width: 300px; height: 50px;">
												Thanh Tâm</td>
											<td
												style="border: 1px solid #191970; width: 300px; height: 50px;">
												Admin</td>
										</tr>
										<tr>
											<td
												style="border: 1px solid #191970; width: 300px; height: 50px;">
												Gia Thuận</td>
											<td
												style="border: 1px solid #191970; width: 300px; height: 50px;">
												Phản biện viên</td>
										</tr>
										<tr>
											<td
												style="border: 1px solid #191970; width: border: 1px solid #191970 300px;">
												Ánh Minh</td>
											<td
												style="border: 1px solid #191970; width: 300px; height: 50px;">
												Biên tập viên</td>
										</tr>
								</table>
							</form>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>
			<div id="qd" class="tab-pane fade">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<pre>
 <h1>
							<b>Chương I 
 NHỮNG QUY ĐỊNH CHUNG</b>
						</h1>

<b>Điều 1. Tôn chỉ, mục đích hoạt động</b>
1. Tên giao dịch và trụ sở:
- Tên tiếng Việt: Tạp chí KHSPKT
- Trụ sở: Trường Đại Học Sư Phạm Kỹ Thuật - Tp.HCM
- Địa chỉ: 1 Võ Văn Ngân, Phường Linh Chiểu, Quận Thủ Đức, Thành phố Hồ Chí Minh.
- Điện thoại: (+84 - 8) 38968641 - (+84 - 8) 38961333
- E-mail: ic@hcmute.edu.vn
2. Tôn chỉ và mục đích hoạt động:
- Tuyên truyền chủ trương, đường lối của Đảng; chính sách, pháp luật của Nhà nước về khoa học tổ chức và ngành Nội vụ trong sự nghiệp xây dựng 
và phát triển đất nước;
- Trao đổi, phổ biến kinh nghiệm quản lý, hoạt động khoa học về tổ chức và nội vụ trong nước và thế giới;
- Là diễn đàn của các nhà quản lý, nhà tổ chức về các vấn đề có liên quan đến sự phát triển của ngành Nội vụ.
- Công bố giới thiệu các kết quả nghiên cứu khoa học tổ chức và nội vụ ở trong nước và ngoài nước; các công trình nghiên cứu về khoa học tổ chức
 và ngành Nội vụ  của giảng viên, cán bộ, sinh viên trong trường nhằm góp phần xây dựng và phát triển đội ngũ cán bộ khoa học phục vụ cho mục tiêu
  đào tạo, nghiên cứu giảng dạy của Trường.
- Góp phần thiết thực trong việc xây dựng hình ảnh và uy tín của Trường Đại học Nội vụ Hà Nội trong lĩnh vực nghiên cứu, giáo dục trong và ngoài nước. 

<b>Điều 2. Phạm vi  điều chỉnh và đối tượng áp dụng</b>
1. Quy chế này áp dụng đối với các thành viên của Tạp chí KHSPKT, các phản biện và các tác giả công bố kết quả nghiên cứu hoặc đăng tải các thông tin 
khoa học trên Tạp chí KHSPKT.
2. Đối tượng phục vụ của Tạp chí KHSPKT: là các nhà khoa học, các nhà nghiên cứu, cán bộ quản lý, giảng viên, viên chức, nghiên cứu sinh, học viên
 cao học, sinh viên và bạn đọc quan tâm.
3. Bài báo của các tác giả đăng trên Tạp chí KHSPKT bao gồm:
a. Bài tổng quan: là bài viết tổng hợp một cách đầy đủ nhất những hiểu biết về một vấn đề xuất phát từ việc phân tích toàn bộ mọi mặt các tư liệu và
 công trình nghiên cứu liên quan nhằm trình bày một lý thuyết và những nghiên cứu thử nghiệm lý thuyết này đã được thực hiện; trình bày một vấn đề và
  những giải pháp giải quyết vấn
 đề đã được các nghiên cứu đề xuất, thử nghiệm; tổng hợp những điểm chung giữa các nghiên cứu đã được thực hiện; nêu yêu cầu cho nghiên cứu tiếp theo.
b. Bài báo khoa học: trình bày những kết quả nghiên cứu khoa học mới có chất lượng, hay đề xuất một phương pháp mới, ý tưởng mới, giải pháp mới phục
vụ cho hoạt động của Bộ, ngành và đơn vị.
- Trình bày kết quả nghiên cứu của đề tài, công trình NCKH các cấp đã được nghiệm thu trong năm học (hoặc năm hành chính)
c. Diễn đàn khoa học gồm các bài viết:
- Công bố những kết quả nghiên cứu nhưng chưa đủ để cấu thành bài hoàn chỉnh.
- Các bài viết liên quan về khoa học Tổ chức và ngành Nội vụ, các sáng kiến, giải pháp có hiệu quả cao của cán bộ, viên chức trong trường và các cán bộ,
các nhà nghiên cứ của Bộ, ngành Nội vụ trong nước và quốc tế.
- Bài được tổng hợp từ các nguồn tư liệu thứ cấp  về một chủ đề cụ thể. 
d. Bài thông tin, trao đổi:
- Tuyên truyền chủ trương, chính sách của Đảng và Nhà nước, của Bộ Giáo dục&Đào tạo,Bộ Nội vụ về các lĩnh vực giáo dục đào tạo,Nội vụ,chính trị-xã hội…
- Bài viết ngắn đăng ý kiến của bạn đọc thảo luận về các vấn đề khoa học tổ chức và ngành Nội vụ
- Bài viết trao đổi thông tin hoạt động, sự kiện diễn ra trong toàn Trường. 

<b>Điều 3. Định kỳ xuất bản và phát hành</b>   
1. Thể thức xuất bản: 
  Ngôn ngữ thể hiện: tiếng Việt. 
Kỳ hạn xuất bản: 2 tháng 1 số
Khuôn khổ:  20cm x 28cm
Số trang:  50 trang
Số lượng: 500 bản/kỳ
Nơi in: Hà Nội
2. Tạp chí xuất bản 6 số mỗi năm, 2 tháng ra 1 số. Mỗi số định kỳ đăng tải 12 - 15 bài báo.
3. Các số đặc biệt phải được đăng ký trước và được Ban biên tập thông qua và đưa vào kế hoạch xuất bản hàng năm. Số đặc biệt được xuất bản thay
cho số định kỳ phát hành nếu được phê duyệt. Trong một số trường hợp, nếu hội nghị, hội thảo có nguồn kinh phí (thẩm định và xuất bản) thì có thể được 
xem xét xuất bản số đặc biệt riêng
không tính trong kỳ xuất bản.
4. Nộp lưu chiểu và phát hành:
a. Nộp lưu chiểu tại Cục Báo chí - Bộ Thông tin và truyền thông, Cục Thông tin Khoa học và Công nghệ Quốc gia - Bộ Khoa học và Công nghệ, Thư viện 
uốc gia, Thư viện Trường; đăng tải tóm tắt các bài viết trên website Trường.
b. Phạm vi phát hành trong cả nước.

Điều 4. Nội dung xuất bản 
Tạp chí đăng tải, công bố các công trình nghiên cứu về khoa học tổ chức và lĩnh vực ngành Nội vụ, công tác giáo dục đào tạo nguồn nhân lực cũng như
 đăng tải các bài viết đóng góp ý kiến, kiến nghị nhằm xây dựng và phát triển toàn diện Trường Đại học Nội vụ Hà Nội và ngành Nội vụ. 

Điều 5. Nguyên tắc hoạt động
Tạp chí hoạt động theo nguyên tắc tập trung dân chủ, tuân thủ các quy định của Luật Báo chí, quy định của Hội Nhà báo Việt Nam và quy định của Trường
Đại học Nội vụ Hà Nội. 
- Tạp chí làm việc theo nguyên tắc tập trung dân chủ. Các cán bộ, viên chức, phóng viên, biên tập viên, cộng tác viên chịu trách nhiệm về kết quả công
việc; chấp hành mọi quy định, sự phân công, điều động, bố trí công tác của Tạp chí và Nhà trường. 

<h1>
							<b>Chương II 
 TỔ CHỨC BỘ MÁY VÀ CHẾ ĐỘ LÀM VIỆC</b>
						</h1>

<b>Điều 6. Cơ cấu tổ chức</b>
- Tổng Biên tập
- Phó Tổng Biên tập
- Thư ký tòa soạn
- Hội đồng Biên tập
- Ban Biên tập
- Ban Trị sự - Tổng hợp
- Ban Phát hành - Quảng cáo

<b>Điều 7. Ban Biên tập</b>
1. Ban biên tập Tạp chí gồm: 01 Tổng biên tập, 01 Phó tổng biên tập, 01 Thư ký tòa soạn và các biên tập viên. 
2. Ban biên tập có trách nhiệm:
- Lập kế hoạch hoạt động, đề xuất nội dung và hình thức của các số tạp chí.
- Chọn người đánh giá, phản biện bài viết phù hợp, sửa chữa lại các thuật ngữ chuyên ngành cho đúng theo quy định. 
- Tổ chức biên tập, dự kiến các bài báo sẽ được đăng và trình Tổng Biên tạp duyệt đăng.
- Xem xét, bổ sung và có ý kiến về nội dung của bài viết với tác giả. 
- Quản lý website của Tạp chí.
- Ban biên tập định kỳ họp mỗi quý một lần trong năm.

<b>Điều 8. Hội đồng biên tập</b>
1. Cơ cấu tổ chức và nguyên tắc hoạt động của Hội đồng Biên tập:
Hội đồng biên tập gồm có Chủ tịch, Phó chủ tịch Hội đồng và các thành viên là những nhà khoa học, nhà nghiên cứu, nhà quản lý, có học hàm, học vị Tiến
sĩ trở lên, có uy tín trong và ngoài trường; được lựa chọn, mời tham gia và do Hiệu trưởng ra quyết định thành lập. 
Hội đồng Biên tập họp thường kỳ 2 lần trong năm do Chủ tịch Hội đồng triệu tập và họp bất thường (thành phần họp được triệu tập theo yêu cầu của Chủ
tịch Hội đồng).
2. Chức năng, nhiệm vụ của Hội đồng Biên tập:
- Tư vấn về các lĩnh vực khoa học chuyên ngành thuộc ngành Nội vụ;
- Tham gia vào định hướng phát triển của Tạp chí theo đúng tôn chỉ và mục đích hoạt động;
- Phản biện các bài báo đăng trên Tạp chí;
- Giúp Tạp chí xây dựng và tổ chức mạng lưới cộng tác viên theo lĩnh vực khoa học ngành Nội vụ;
- Tham gia các hoạt động hội thảo, tọa đàm khoa học do Tạp chí tổ chức.
3. Chế độ, quyền lợi của Hội đồng Biên tập:
- Nhận báo biếu theo các số ra của Tạp chí;
- Hưởng thù lao họp Hội đồng, hội nghị, hội thảo, tọa đàm;
- Hưởng thù lao phản biện bài báo, các ý kiến đóng góp bằng văn bản.  

<b>Điều 9. Tổng biên tập </b>
Tổng biên tập là nhà báo, được Bộ trưởng Bộ Nội vụ hoặc Bộ trưởng Bộ Nội vụ ủy quyền cho Hiệu trưởng Trường Đại học Nội vụ Hà Nội bổ nhiệm, miễn nhiệm 
sau khi có sự thống nhất ý kiến bằng văn bản của Bộ Thông tin và Truyền thông và Ban Tuyên giáo Trung ương.
1. Chịu trách nhiệm trước Bộ trưởng Bộ Nội vụ; Ban Giám hiệu Trường Đại học Nội vụ Hà Nội và trước pháp luật về tổ chức và hoạt động của Tạp chí; thực 
hiện điều hành Tạp chí theo chế độ thủ trưởng. 
2. Chịu trách nhiệm trước các cơ quan quản lý của Đảng và Nhà nước về nội dung các bài viết đăng trên Tạp chí.
3. Chịu trách nhiệm xuất bản các ấn phẩm của tạp chí theo quy định của Luật Báo chí, Luật Xuất bản và chỉ đạo của Ban giám hiệu Trường. Tổng biên tập là 
người duyệt cuối cùng các bản bông, ấn phẩm tạp chí trước khi in và quyết định nộp lưu chiểu, phát hành.
4. Ủy quyền, phân công trách nhiệm quản lý, điều hành và quyết định giải quyết từng mặt công việc cho phó tổng biên tập, cán bộ, viên chức, phóng viên, 
biên tập viên trong Tạp chí.

<b>Điều 10. Phó Tổng biên tập </b>
Phó Tổng biên tập là người có nghiệp vụ báo chí, được Hiệu trưởng Trường Đại học Nội vụ bổ nhiệm, miễn nhiệm theo quy định của pháp luật và theo chức 
năng,nhiệm vụ của Trường.
1. Giúp Tổng biên tập điều hành, quyết định các công việc được Tổng biên tập phân công phụ trách và chịu trách nhiệm trước Tổng biên tập về các quyết 
định 
của mình.
2. Ký thay Tổng biên tập các văn bản thuộc lĩnh vực được phân công phụ trách và các văn bản theo sự ủy nhiệm của Tổng biên tập.
3. Nghiên cứu, đề xuất nội dung xuất bản, cải tiến nghiệp vụ báo chí nhằm nâng cao chất lượng tạp chí; tổ chức, chỉ đạo thực hiện những đợt tuyên truyền 
xuất bản theo sự phân công của Tổng biên tập.

<b>Điều 11. Thư ký tòa soạn </b>
Thư ký tòa soạn là người được Tổng biên tập giao nhiệm vụ thực hiện chức năng quản lý nghiệp vụ của Tạp chí. 
1. Xây dựng kế hoạch xuất bản, nội dung của từng số Tạp chí và định hướng nội dung của số tạp chí tiếp theo.
2. Tiếp nhận bài, ảnh và tổ chức biên tập; sắp xếp nội dung và yêu cầu của từng trang theo mục lục tạp chí đã dự kiến; xử lý những trường hợp đột xuất 
về nội dung và kỹ thuật.
3. Trình Tổng biên tập duyệt bản thảo trong mỗi số tạp chí.
4. Giúp Tổng biên tập, Phó tổng biên tập xây dựng các chính sách và thủ tục của tạp chí. 

<b>Điều 12. Các biên tập viên </b>
Các biên tập viên là thành viên trong Ban biên tập do Tổng biên tập đề xuất. 
1. Biên tập viên chuyên mục quản lý việc phản biện; trao đổi và theo dõi quá trình sửa chữa của tác giả và biên tập của các bài gửi đăng. Biên tập viên 
chuyên mục dựa trên các ý kiến của phản biện và đánh giá của mình để trao đổi với tác giả. Biên tập viên này chịu trách nhiệm về nội dung bài thuộc 
lĩnh vực mình phụ trách.
2. Biên tập viên bản thảo, biên tập viên trình bày là người chế bản và soát lỗi các bài viết được chấp nhận đăng trên tạp chí, chịu trách nhiệm về thể 
thức trình bày của các bài viết. Biên tập viên bản thảo sửa các bài nộp làm cho các bài viết mạch lạc hơn và chuẩn về ngữ pháp, đảm bảo bài viết đã đầy 
đủ và tuân thủ các qui định chuẩn
 về thư mục, văn bản để chuyển thành các bản bông sạch dùng cho việc xuất bản tạp chí. 

<b>Điều 13. Ban Trị sự - Tổng hợp</b>
Ban Trị sự - Tổng hợp là đơn vị thực hiện các công tác về lĩnh vực hành chính, xuất bản, lưu trữ tư liệu và các nhiệm vụ khác do Tổng Biên tập giao, làm 
nhiệm vụ cầu nối giữa Tạp chí với cơ quan cấp trên và các đơn vị bên ngoài. Ban Trị sự - Tổng hợp có trách nhiệm:
1. Lập kế hoạch công việc, theo dõi việc thực hiện cho đúng tiến độ;
2. Thực hiện các công tác hành chính của Tạp chí;
3. Lập dự toán kinh phí hoạt động, theo dõi, báo cáo tài chính định kỳ theo quy định của Trường;
4. Tiếp nhận bản thảo từ tác giả và chuyển tới thư ký tòa soạn;
5. Tổ chức thực hiện công tác xuất bản, tham gia trình bày maket, đánh máy bản thảo theo kế hoạch;
6. Quản lý tư liệu (bài viết, ảnh ... ) và lưu trữ thông tin của Tạp chí;
7. Tổ chức lưu trữ Tạp chí theo quy định;
8. Tổ chức các hội nghị, hội thảo, tọa đàm về chuyên môn, nghiệp vụ phục vụ cho công tác xuất bản của Tạp chí.

<b>Điều 14. Ban Phát hành - Quảng cáo</b>
1. Xây dựng kế hoạch phát hành Tạp chí; tổ chức việc phát hành, nộp lưu chiểu Tạp chí trong và ngoài Trường theo quy định.
2. Xây dựng và thực hiện kế hoạch mời các đơn vị, doanh nghiệp tham gia quảng cáo trên Tạp chí; tiếp nhận, tổng hợp các yêu cầu quảng cáo trình Tổng biên
 tập phê duyệt.
3. Tổ chức các hoạt động dịch vụ, sự kiện truyền thông phục vụ công tác tuyên truyền, quảng bá các hoạt động của Trường Đại học Nội vụ Hà Nội.

<h1>
							<b>Chương III 
PHẢN BIỆN</b>
						</h1>

<b>Điều 15. Quyền hạn, trách nhiệm của người phản biện</b>
1. Người phản biện bài viết cho Tạp chí là các thành viên Hội đồng Biên tập, Hội đồng Khoa học và Đào tạo Trường Đại học Nội vụ Hà Nội, nhà khoa học ở các 
đại học, trường đại học, viện nghiên cứu trong và ngoài nước có cùng chuyên môn hoặc gần với chuyên môn mà nội dung các bài viết của Tạp chí đề cập, có 
trình độ từ tiến sĩ trở lên 
(trường hợp đặc biệt do Tổng Biên tập quyết định), cùng chuyên môn hoặc gần với chuyên môn mà nội dung bài viết đề cập, có khả năng đánh giá chất lượng 
công trình nghiên cứu. 
2. Người phản biện có trách nhiệm đánh giá bài viết khách quan, trung thực và đúng thời hạn. 
3. Người phản biện có trách nhiệm tư vấn cho Ban biên tập Tạp chí về chất lượng nội dung khoa học của bài báo và chất lượng thông tin, tư vấn cho Tổng Biên 
tập lựa chọn bài đăng trên Tạp chí.
4. Thời gian phản biện không quá 15 ngày tùy theo dung lượng của bài báo. 5. Thù lao phản biện được trả theo quy chế chi tiêu nội bộ hiện hành của Trường 
Đại học Nội vụ Hà Nội. 
6. Mẫu phiếu phản biện (theo phụ lục 1).

<h1>
							<b>Chương IV  
TÁC GIẢ VÀ BÀI BÁO</b>
						</h1>

<b>Điều 16. Quyền lợi và trách nhiệm của tác giả bài báo</b>
1. Các tác giả chịu trách nhiệm trước Tạp chí về nội dung, chất lượng, tính hợp pháp và bản quyền của bài viết.
2. Tuân thủ quy định về thể lệ đăng bài trên Tạp chí tại Điều 17 chương V Quy chế này.
3. Không được gửi bản thảo bài viết đến tạp chí khác cho đến khi có quyết định xét duyệt cuối cùng của Ban biên tập Tạp chí NCKHNV.
4. Tác giả được quyền rút lại bản thảo hoặc bổ sung, điều chỉnh thông tin trong bản thảo trong vòng 3 ngày sau khi tòa soạn nhận được bản thảo.
5. Tác giả không được cung cấp thông tin liên quan đến mình trong bài viết; không được tiếp xúc với phản biện trong quá trình tòa soạn xử lý bài.
6. Tác giả có trách nhiệm rà soát, chỉnh sửa bài viết, làm rõ các nội dung theo yêu cầu của người phản biện và ban biên tập.
7. Nghiêm cấm hành vi sao chép, sử dụng ý tưởng, kết quả hay câu văn của người khác bất hợp pháp. Phải trích dẫn rõ ràng, chi tiết những câu, đoạn văn
được mượn từ bài viết, tài liệu của tác giả khác.
8. Tác giả phải đảm bảo việc sử dụng các dữ liệu đã được sự đồng ý của các cá  nhân hay tổ chức sở hữu các dữ liệu này. Đối với các công trình nghiên 
cứu chưa được công bố mà được sử dụng trong bài viết, tác giả phải cung cấp cho Ban biên tập Tạp chí văn bản đồng ý của cá nhân hay tổ chức là tác giả thực 
hiện  công trình đó.
9. Tác giả có bài đăng được Tạp chí thanh toán nhuận bút và nhuận báo. 

<h1>
							<b>Chương V 
QUY ĐỊNH XÉT DUYỆT VÀ ĐĂNG BÀI TRÊN TẠP CHÍ</b>
						</h1>

<b>Điều 17. Điều kiện và thể lệ đăng bài trên Tạp chí</b>
1.  Điều kiện đăng bài
- Bài báo gửi đăng phải có nội dung khoa học  và chưa được công bố trên bất kỳ tạp chí nào hoặc các dạng xuất bản phẩm khác.  
- Bài gửi đăng có nội dung thuộc lĩnh vực đúng với tiêu chí của Tạp chí Nghiên cứu Khoa học Nội vụ, có liên quan đến các lĩnh vực của Trường Đại học Nội 
vụ Hà Nội. Trường hợp bài viết có nội dung khác thì phải được xem xét và được Tổng Biên tập quyết định duyệt đăng.
- Bài gửi đăng phải là kết quả từ công trình nghiên cứu khoa học đã được đánh giá, nghiệm thu.
- Bài viết chỉ được đăng khi đã được tác giả chỉnh sửa theo góp ý của người phản biện và Hội đồng Biên tập.
- Kết quả nghiên cứu của luận văn, luận án được bảo vệ thành công.
- Bài tổng quan, bài thông tin, trao đổi được Ban Biên tập và Tổng Biên tập chấp thuận.
2. Thể lệ gửi bài đăng trên Tạp chí Nghiên cứu Khoa học Nội vụ (theo phụ lục 2).
3. Phiếu đăng ký nộp bài (theo mẫu trong phụ lục 3).

<b>Điều 18. Các bước xét duyệt</b>
1. Ban Trị sự - Tổng hợp nhận bài viết từ tác giả và chuyển cho thư ký tòa soạn để rà soát các yêu cầu về nội dung và hình thức, sau đó thông báo cho tác giả 
biết về tình trạng bài viết trong vòng 5 ngày kể từ khi nhận được bài gửi đăng. Nếu đạt yêu cầu, bài báo sẽ được chuyển tới các biên tập viên chuyên mục. 
2. Biên tập viên chuyên mục liên hệ mời phản biện bài viết sau khi nhận bài.
3. Sau khi nhận được ý kiến đánh giá của phản biện, biên tập viên chuyên mục đánh giá bài báo và phản hồi tới các tác giả về chất lượng bài viết. Những bài 
báo chất lượng kém sẽ bị từ chối. Những bài báo tốt sẽ được thông báo chấp nhận mà không cần sửa chữa. Những bài báo có chất lượng khá và trung bình, sẽ được 
ấn định thời hạn sửa chữa 
trong vòng từ 2 - 10 ngày, tùy theo mức độ yêu cầu. 
4. Biên tập viên chuyên mục tiếp tục mời phản biện thẩm định lần 2 đối với những bài báo được đánh giá loại trung bình và có nhiều sai sót về nội dung hoặc 
chưa có sự thống nhất giữa tác giả và phản biện (sau khi tác giả sửa và gửi lại). Thời hạn phản biện từ 5 - 10 ngày.
5. Các tác giả hoàn chỉnh bài báo sau các lần thẩm định, đối với các bài viết được chấp nhận đăng và hiệu đính lần cuối. Hạn định thời gian từ 5 - 10 ngày.
6. Thư ký tòa soạn tổng hợp và Tổng biên tập duyệt các bài báo đã được hoàn thiện. Thời gian để thực hiện các công việc này từ 10-15 ngày.
7. Biên tập bản thảo, chế bản, đọc soát lỗi trong thời gian 10 ngày.
8. In ấn, nộp lưu chiểu và phát hành Tạp chí.
9. Đưa tóm tắt bài báo lên website Trường trong vòng 10 ngày
  </pre>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>
			<div id="lh" class="tab-pane fade">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10" align="center">
							<h3>
								<p>Copyright © 2013, Trường Đại Học Sư Phạm Kỹ Thuật -
									Tp.HCM</p>
								<p>Địa chỉ: 1 Võ Văn Ngân, Phường Linh Chiểu, Quận Thủ Đức,
									Thành phố Hồ Chí Minh.</p>
								<p>Điện thoại: (+84 - 8) 38968641 - (+84 - 8) 38961333</p>
								<p>E-mail: ic@hcmute.edu.vn</p>
							</h3>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="site-footer" style="clear: both; margin: 0 0 0 0;">
	<nav class="navbar navbar-inverse" style="margin: 0 0 0 0;">
	<div class="container-fluid">
		<div class="navbar-header navbar-right">
			<button type="button" class="navbar-toggle " data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<div class="nav navbar-nav">
					<ul class="nav navbar-nav nav-tabs">
						<li><a data-toggle="tab" href="tbt_tc.jsp"> TRANG CHỦ </a></li>
						<li><a data-toggle="tab" href="#cctc">CƠ CẤU TỔ CHỨC</a></li>
						<li><a data-toggle="tab" href="#qd">QUY ĐỊNH</a></li>
						<li><a data-toggle="tab" href="#lh"> LIÊN HỆ </a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</nav>
	<div class="container-fluid" align="center"
		style="background-color: #DDDDDD;">
		<div class="row">
			<h4>
				<p>Copyright © 2013, Trường Đại Học Sư Phạm Kỹ Thuật - Tp.HCM</p>
				<p>Địa chỉ: 1 Võ Văn Ngân, Phường Linh Chiểu, Quận Thủ Đức,
					Thành phố Hồ Chí Minh.</p>
				<p>Điện thoại: (+84 - 8) 38968641 - (+84 - 8) 38961333</p>
				<p>E-mail: ic@hcmute.edu.vn</p>
			</h4>
		</div>
	</div>
	</footer>
	<script>
		CKEDITOR.replace('editor1');
	</script>
</body>
</html>
<%
	
%>