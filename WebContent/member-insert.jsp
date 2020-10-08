<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.Connector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String rPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="common/test.css">
</head>
<body>

	<header>
		<h1>쇼핑몰 회원관리 ver 1.0</h1>
	</header>

	<ul>
		<li><a href="<%=rPath%>/member-insert.jsp">회원등록</a></li>
		<li><a href="<%=rPath%>/member-list.jsp">회원목록조회/수정</a></li>
		<li><a href="<%=rPath%>/member-sales.jsp">회원 매출조회</a></li>
		<li><a href="/">홈으로</a></li>
	</ul>
	<section>
		<h3>쇼핑몰 회원목록 조회/수정</h3>
		<%
			request.setCharacterEncoding("utf-8");
		if (request.getParameter("custname") != null) {
			Connection con = Connector.getConnection();
			String sql = "insert into member_tbl_02 (custno, custname, phone, address, joindate, grade, city)\r\n"
			+ "VALUES(seq_custno.nextval,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, request.getParameter("custname"));
			ps.setString(2, request.getParameter("phone"));
			ps.setString(3, request.getParameter("address"));
			ps.setString(4, request.getParameter("joindate"));
			ps.setString(5, request.getParameter("grade"));
			ps.setString(6, request.getParameter("city"));
			int result = ps.executeUpdate();
			if (result == 1) {
				out.write("<script>");
				out.write("alert('등록 성공!')");
				out.write("</script>");

			}

		}
		%>
		<form method="post">
			<table border="1">
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" required>
					<td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" required>
					<td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" required>
					<td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="date" name="joindate" required>
					<td>
				</tr>
				<tr>
					<th>회원등급[A:VIP,B:일반,C:직원]</th>
					<td><select name="grade">
							<option value="A">VIP</option>
							<option value="B" selected="selected">일반 회원</option>
							<option value="C">직원</option>
					</select>
					<td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" required>
					<td>
				</tr>
				<tr>
					<td colspan="2"><button>등록</button>
						<button>조회</button></td>
				</tr>
			</table>
		</form>
	</section>


	<footer>이용약관</footer>
</body>
</html>