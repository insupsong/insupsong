package net.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class BoardFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//가상주소 뽑아오기
		//  http://localhost:8080/Model2/BoardWrite.bo 
		//		/Model2/BoardWrite.bo
		String requestURI = request.getRequestURI();
		//  	/Model2
		String contextPath = request.getContextPath();
		//			   /BoardWrite.bo
		String command = requestURI.substring(contextPath.length());
		//가상주소 비교하기
		
		
		ActionForward forward=null;
		Action action = null;
		if(command.equals("/BoardWrite.bo")){
			//	./board/writeForm.jsp
			// 이동정보 저장 net.board.action.ActionForward
			forward=new ActionForward();
	   		forward.setPath("./board/writeForm.jsp");
	   		forward.setRedirect(false);			
		}else if(command.equals("/BoardWriteAction.bo")){
			// 처리할파일 틀 제시 net.board.action.Action
			// 파일 BoardWriteAction execute()
			action = new BoardWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardWrite2.bo")){
			//	./board/writeForm.jsp
			// 이동정보 저장 net.board.action.ActionForward
			forward=new ActionForward();
	   		forward.setPath("./board2/writeForm2.jsp");
	   		forward.setRedirect(false);			
		}else if(command.equals("/BoardWriteAction2.bo")){
			// 처리할파일 틀 제시 net.board.action.Action
			// 파일 BoardWriteAction execute()
			action = new BoardWriteAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardList.bo")){
			// 	 BoardListAction		execute()
			action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardList2.bo")){
			// 	 BoardListAction		execute()
			action = new BoardListAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardContent.bo")){
			action = new BoardContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardContent2.bo")){
			action = new BoardContentAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardUpdate.bo")){
			action = new BoardUpdate();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardUpdate2.bo")){
			action = new BoardUpdate2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardUpdateAction.bo")){
			action = new BoardUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardUpdateAction2.bo")){
			action = new BoardUpdateAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardDelete.bo")){
	   		 forward=new ActionForward();
	   		 forward.setPath("./board/deleteForm.jsp");
	   		 forward.setRedirect(false);
	   		try {
	   			forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   	 }else if(command.equals("/BoardDeleteAction.bo")){
			   	action = new BoardDeleteAction();
			   	try {
			   		forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		 }else if(command.equals("/BoardDelete2.bo")){
	   		 forward=new ActionForward();
	   		 forward.setPath("./board2/deleteForm2.jsp");
	   		 forward.setRedirect(false);
	   		try {
	   			forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   	 }else if(command.equals("/BoardDeleteAction2.bo")){
			   	action = new BoardDeleteAction2();
			   	try {
			   		forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		 }else if(command.equals("/BoardReplyAction.bo")){
				action = new BoardReplyAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		}else if(command.equals("/BoardReplyAction2.bo")){
			action = new BoardReplyAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}else if(command.equals("/BoardMain.bo")){
	   		 forward=new ActionForward();
	   		 forward.setPath("./BoardMain.jsp");
	   		 forward.setRedirect(false);
	   		try {
	   			forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   	 }else if(command.equals("/BoardReplyDel.bo")){
	   		 System.out.println("/BoardReplyDel");
				action = new BoardReplyDel();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
	   	 }else if(command.equals("/BoardReplyDel2.bo")){
				action = new BoardReplyDel();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
	   	 }else if(command.equals("/main.bo")){
				forward=new ActionForward();
		   		forward.setPath("./main/main.jsp");
		   		forward.setRedirect(false);			
		}else if(command.equals("/index.bo")){
			forward=new ActionForward();
	   		forward.setPath("./main/index.jsp");
	   		forward.setRedirect(false);			
		}else if(command.equals("/listSearch.bo")){
			action = new BoardlistSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/listSearch2.bo")){
			action = new BoardlistSearchAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		 
	
		//이동하기
		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	

}
