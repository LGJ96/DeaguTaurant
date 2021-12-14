package comm.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import comm.service.CommentUpdateProService;
import comm.vo.CommentVO;
import vo.ActionForward;

public class CommentUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		CommentVO commentVO = new CommentVO();
		commentVO.setComment_number(Integer.parseInt(request.getParameter("comment_number")));
		commentVO.setComment_date(new Timestamp(System.currentTimeMillis()));
		commentVO.setComment_content(request.getParameter("comment_content"));
		commentVO.setUser_nickname(request.getParameter("user_nickname"));
		commentVO.setComment_ref(Integer.parseInt(request.getParameter("comment_ref")));
		commentVO.setComment_re_step(Integer.parseInt(request.getParameter("comment_re_step")));
		commentVO.setComment_re_level(Integer.parseInt(request.getParameter("comment_re_level")));
		commentVO.setCom_number(Integer.parseInt(request.getParameter("com_number")));
	    
	    CommentUpdateProService commentUpdateProService = new CommentUpdateProService();
	    
	    boolean modifySuccess = commentUpdateProService.modifyArticle(commentVO);
	      
	    ActionForward forward = null;
	    if(modifySuccess) {
	       forward = new ActionForward();
	       //forward.setUrl("comment.dae?com_number="+request.getParameter("com_number")+"&"+"com_pageNum="+request.getParameter("com_pageNum"));
	       forward.setUrl("comm/comment-close.jsp");
	       forward.setRedirect(true);
	    }
	    else {
	       response.setContentType("text/html;charset=UTF-8");
	       PrintWriter out = response.getWriter();
	       out.println("<script>");
	       out.println("alert('등록실패')");
	       out.println("history.back();");
	       out.println("</script>");
	    }
	    return forward;
	}

}
