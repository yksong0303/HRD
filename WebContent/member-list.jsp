<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.Connector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String rPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="common/test.css">
</head>
<body>

<header><h1>쇼핑몰 회원관리 ver 1.0</h1></header>
	
	<ul>
		<li><a href="<%=rPath %>/member-insert.jsp">회원등록</a></li>
		<li><a href="<%=rPath %>/member-list.jsp">회원목록조회/수정</a></li>
		<li><a href="<%=rPath %>/member-sales.jsp">회원 매출조회</a></li>
		<li><a href="/">홈으로</a></li>
	</ul>
<section>
<h3>쇼핑몰 회원목록 조회/수정</h3>
<%
Connection con = Connector.getConnection();
String sql = "select custno, custname, phone, address, to_char(JOINDATE, 'YYYY-MM-DD') as joindate,\r\n" + 
		"decode(grade, 'A','VIP','B','일반회원','C','직원') as grade, city from member_tbl_02";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

%>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
<%
while(rs.next()){
%>
		<tr>
			<td><%=rs.getString("custno") %></td>
			<td><%=rs.getString("custname") %></td>
			<td><%=rs.getString("phone") %></td>
			<td><%=rs.getString("address") %></td>
			<td><%=rs.getString("joindate") %></td>
			<td><%=rs.getString("grade") %></td>
			<td><%=rs.getString("city") %></td>

			
		</tr>	
<%
}
%>
	</table>

</section>


<footer>이용약관</footer>
</body>
</html>