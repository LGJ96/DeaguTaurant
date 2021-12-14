package comm.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import comm.service.CommentUpdateFormService;
import comm.vo.CommentVO;
import vo.ActionForward;

public class CommentUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int comment_number = Integer.parseInt(request.getParameter("comment_number"));
	      String comment_pageNum = request.getParameter("comment_pageNum");
	      
	      CommentUpdateFormService commentUpdateFormService = new CommentUpdateFormService(); 
	      CommentVO commentArticle =  commentUpdateFormService.getArtcticle(comment_number);
	      
	      request.setAttribute("commentArticle", commentArticle);
	      request.setAttribute("comment_pageNum", comment_pageNum);
	      
	      ActionForward forward = new ActionForward();
	      //forward.setUrl("comment.dae?com_number="+request.getParameter("com_number")+"&"+"com_pageNum="+request.getParameter("com_pageNum"));
	      forward.setUrl("comm/comment-update.jsp");
	      
	      
	      
	      return forward;
	}

}
