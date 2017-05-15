<%@page import="net.member.db.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="member_head">
			<div id="member_title">회원정보</div>
			<div id="member_script">회원님이 입력하신 정보를 확인하고, 수정 및 삭제합니다.</div>
		</div>
		<div id="clear"></div>
		<div id="member">
			<div id="info_form">
				<%
				String id = (String) session.getAttribute("id");
				if (id == null) {
					response.sendRedirect("./MemberLogin.me");
				}
				MemberBean mb = (MemberBean) request.getAttribute("mb");
				%>
				<table>
				<tr><th>아이디</th><td><%=mb.getId()%></td></tr>
				<tr><th>비밀번호</th><td>※ 비밀번호는 암호화 되어있습니다.</td></tr>
				<tr><th>이름</th><td><%=mb.getName()%></td></tr>
				<tr><th>우편번호</th><td><%=mb.getPostcode()%></td></tr>
				<tr><th>주소</th><td><%=mb.getAddress1()%></td></tr>
				<tr><th>상세주소</th><td><%=mb.getAddress2()%></td></tr>
				<tr><th>전화번호</th><td><%=mb.getMobile()%></td></tr>
				<tr><th>이메일</th><td><%=mb.getEmail()%></td></tr>
				</table>
				<input type="button" value="메인으로" onclick="location.href='./main.bo'">
				<input type="button" value="회원정보수정" onclick="location.href='./MemberUpdate.me'">
				<input type="button" value="회원정보삭제" onclick="location.href='./MemberDelete.me'">
			</div>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!--오른쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	</div>
	<!--오른쪽 메뉴 -->
</body>
</html>