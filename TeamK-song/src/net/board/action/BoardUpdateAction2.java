package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;


public class BoardUpdateAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BoardUpdateAction2 execute()");
		request.setCharacterEncoding("utf-8");
		
		String realPath=request.getRealPath("/upload");
		System.out.println("물리적경로:"+realPath);
		int maxSize=5*1024*1024; //5MB
		MultipartRequest multi = new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		BoardDAO bdao = new BoardDAO();
		BoardBean bb = new BoardBean();
		
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("num"));
		bb.setNum(Integer.parseInt(multi.getParameter("num")));
		bb.setId(multi.getParameter("id"));
		bb.setSubject(multi.getParameter("subject"));
		bb.setContent(multi.getParameter("content"));
		bb.setFile1(multi.getFilesystemName("file1"));
		bb.setFile2(multi.getFilesystemName("file2"));
		bb.setFile3(multi.getFilesystemName("file3"));
		bb.setFile4(multi.getFilesystemName("file4"));
		bb.setFile5(multi.getFilesystemName("file5"));
		
		int check = bdao.updateBoard(bb);
		if(check == -1){
			    response.setContentType("text/html; charset=UTF-8");
			    PrintWriter out=response.getWriter();
			    out.println("<script>");
			    out.println("alert('글 없음');");
			    out.println("history.back();"); 
			    out.println("</script>");
			    out.close();
			    return null;
		}		
		ActionForward forward=new ActionForward();
		forward.setPath("./BoardList2.bo");
		forward.setRedirect(true);
			   
	    return forward;
	    
	}

}
