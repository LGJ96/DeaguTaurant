package comm.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import comm.service.CommentDeleteProService;
import vo.ActionForward;

public class CommentDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int comment_number = Integer.parseInt(request.getParameter("comment_number"));
		String comment_pageNum = request.getParameter("comment_pageNum");
		
		CommentDeleteProService commentDeleteProService = new CommentDeleteProService();
		boolean deleteSuccess = commentDeleteProService.deleteArticle(comment_number);
		
		ActionForward forward = null;
		if(deleteSuccess) {
			forward = new ActionForward();
			forward.setUrl("comment.dae?com_number="+request.getParameter("com_number")+"&"+"com_pageNum="+request.getParameter("com_pageNum"));
			forward.setRedirect(true);
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("arert('삭제실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		return forward;
	}

}
