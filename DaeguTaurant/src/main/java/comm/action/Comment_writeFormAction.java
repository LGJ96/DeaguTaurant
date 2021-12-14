package comm.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import comm.vo.CommentReplyVO;
import vo.ActionForward;

public class Comment_writeFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int comment_number = 0;
		if(request.getParameter("comment_number") !=null) {
			comment_number = Integer.parseInt(request.getParameter("comment_number"));
			
		}
		
		CommentReplyVO commentReplyVO = new CommentReplyVO();
		commentReplyVO.setComment_number(comment_number);
		
		
		request.setAttribute("commentReplyVO", commentReplyVO);
		
		ActionForward forward = new ActionForward();
		/* forward.setUrl("comm/comm_content.jsp"); */
		forward.setUrl("commContent.dae?com_number="+request.getParameter("com_number")+"&"+"com_pageNum="+request.getParameter("com_pageNum"));
		return forward;
	}

}
