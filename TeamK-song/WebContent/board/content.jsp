<%@page import="net.board.db.BoardDAO"%>
<%@page import="net.board.db.BoardReplyBean"%>
<%@page import="java.util.List"%>
<%@page import="net.board.db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
BoardBean bb =(BoardBean)request.getAttribute("bb");
BoardDAO bdao = new BoardDAO();
String pageNum = (String)request.getAttribute("pageNum");
String id = (String)session.getAttribute("id");
int num = Integer.parseInt(request.getParameter("num"));
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
		<div id="review_list">
<table border="1">
<tr><td>글번호</td><td><%=bb.getRe_ref()%></td><td>조회수</td><td><%=bb.getReadcount()%></td></tr>
<tr><td>글쓴이</td><td><%=bb.getId()%></td><td>작성일</td><td><%=bb.getDate()%></td></tr>
<tr><td>글제목</td><td colspan="3"><%=bb.getSubject()%></td></tr>
<%if(bb.getFile1()!=null){%>
<tr><td>첨부파일1</td><td colspan="3"><a href="./upload/<%=bb.getFile1()%>"><%=bb.getFile1()%></a><%if(bb.getFile1()!=null){%><img src="./upload/<%=bb.getFile1()%>" height="60"><%}%></td></tr>
<%}%>
<%if(bb.getFile2()!=null){%>
<tr><td>첨부파일2</td><td colspan="3"><a href="./upload/<%=bb.getFile2()%>"><%=bb.getFile2()%></a><%if(bb.getFile2()!=null){%><img src="./upload/<%=bb.getFile2()%>" height="60"><%}%></td></tr>
<%}%>
<%if(bb.getFile3()!=null){%>
<tr><td>첨부파일3</td><td colspan="3"><a href="./upload/<%=bb.getFile3()%>"><%=bb.getFile3()%></a><%if(bb.getFile3()!=null){%><img src="./upload/<%=bb.getFile3()%>" height="60"><%}%></td></tr>
<%}%>
<%if(bb.getFile4()!=null){%>
<tr><td>첨부파일4</td><td colspan="3"><a href="./upload/<%=bb.getFile4()%>"><%=bb.getFile4()%></a><%if(bb.getFile4()!=null){%><img src="./upload/<%=bb.getFile4()%>" height="60"><%}%></td></tr>
<%}%>
<%if(bb.getFile5()!=null){%>
<tr><td>첨부파일5</td><td colspan="3"><a href="./upload/<%=bb.getFile5()%>"><%=bb.getFile5()%></a><%if(bb.getFile5()!=null){%><img src="./upload/<%=bb.getFile5()%>" height="60"><%}%></td></tr>
<%}%>
<tr><td>글내용</td><td colspan="3">
<%=bb.getContent()%></td></tr>
<tr><td colspan="3">
<%
if(id!=null){
if(id.equals(bb.getId())){ %>
<input type="button" value="글수정" 
       onclick="location.href= './BoardUpdate.bo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<input type="button" value="글삭제" 
       onclick="location.href= './BoardDelete.bo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<%}}%>
<input type="button" value="글목록" 
       onclick="location.href='./BoardList.bo?pageNum=<%=pageNum%>'">
</td></tr>
</table>


<!-- ///////////////////댓글///////////////// -->
<%
//List boardReplyList=(List)request.getAttribute("boardReplyList");
List lrb = null;

//List<BoardReplyBean> lrb = (List)request.getAttribute("lrb");
int rcount = (int)request.getAttribute("rcount");
if(rcount!=0){lrb=(List)request.getAttribute("lrb");}//
%>
<table border="1">
<h3>댓글(<%=rcount%>개)</h3>
  
    <%   
    if(rcount!=0){%>
    	<tr><td>번호</td><td>ID</td><td>내용</td><td>날짜</td><td></td></tr> <%
    for(int i=0; i<lrb.size(); i++){
    	//자바빈(BoardBean) 변수 =배열한칸 접근  배열변수.get()
    	BoardReplyBean rb = (BoardReplyBean)lrb.get(i);
    			%>
<tr>
<td><%=i+1%></td>
<td><%=rb.getId()%></td>
<td><%=rb.getContent()%></td>
<td><%=rb.getDate()%></td>
<td><%
if(id!=null){
	if(id.equals(rb.getId())){ 
%>
<form action="./BoardReplyDel.bo?pageNum=<%=pageNum%>" method="post" name="replydel">
<input type="hidden" name="group_del" value="<%=bb.getNum()%>">
<input type="hidden" name="num" value="<%=rb.getNum()%>">
<input type="submit" value="리플삭제">
</form>
<%}}%></td>
</tr>
    <%
    }}
    %>
</table>
<form action="./BoardReplyAction.bo?pageNum=<%=pageNum%>" method="post" name="fr1">
<input type="hidden" name="group_del" value="<%=bb.getNum()%>">
ID:<input type="text" name="id" value="<%=id%>" readonly><br>
내용:<textarea rows="2" cols="20" name="content"></textarea><br>
<%if(id!=null){%>
<input type="submit" value="댓글달기">
    		<%}else{%>
    			<input type="button" value="댓글달기" 
    				   onclick="alert('로그인 해주세요')">
    		<%} %>
</form>
<!-- ///////////////////댓글///////////////// -->
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