
<%@page import="net.board.db.BoardBean"%>
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
<%
BoardBean bb =(BoardBean)request.getAttribute("bb");
String pageNum = (String)request.getAttribute("pageNum");
String id = (String)session.getAttribute("id");
%>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="login_head">
			<div id="login_title">로그인</div>
			<div id="login_script">로그인이 필요합니다.</div>
		</div>
		<div id="clear"></div>
		<div id="login_form">
<form action="./BoardUpdateAction2.bo?pageNum=<%=pageNum%>" method="post" name="fr" enctype="multipart/form-data">
<input type="hidden" value="1" name="type">
<input type="hidden" name="num" value="<%=bb.getNum()%>">
ID:<input type="text" name="id" value="<%=id%>" readonly><br>
첨부파일1:<input type="file" name="file1">기존파일:<%if(bb.getFile1()!=null){%><input type="hidden" name="file2" value="<%=bb.getFile1()%>"><img src="./upload/<%=bb.getFile1()%>" width="100" ><%=bb.getFile1()%><%}%><br>
첨부파일2:<input type="file" name="file2">기존파일:<%if(bb.getFile2()!=null){%><input type="hidden" name="file2" value="<%=bb.getFile2()%>"><img src="./upload/<%=bb.getFile2()%>" width="100" ><%=bb.getFile2()%><%}%><br>
첨부파일3:<input type="file" name="file3">기존파일:<%if(bb.getFile3()!=null){%><input type="hidden" name="file2" value="<%=bb.getFile3()%>"><img src="./upload/<%=bb.getFile3()%>" width="100" ><%=bb.getFile3()%><%}%><br>
첨부파일4:<input type="file" name="file4">기존파일:<%if(bb.getFile4()!=null){%><input type="hidden" name="file2" value="<%=bb.getFile4()%>"><img src="./upload/<%=bb.getFile4()%>" width="100" ><%=bb.getFile4()%><%}%><br>
첨부파일5:<input type="file" name="file5">기존파일:<%if(bb.getFile5()!=null){%><input type="hidden" name="file2" value="<%=bb.getFile5()%>"><img src="./upload/<%=bb.getFile5()%>" width="100" ><%=bb.getFile5()%><%}%><br>
제목:<input type="text" name="subject" value="<%=bb.getSubject()%>"><br>
내용:<textarea rows="10" cols="20" name="content"><%=bb.getContent() %></textarea><br>
<input type="submit" value="글수정">
</form>
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