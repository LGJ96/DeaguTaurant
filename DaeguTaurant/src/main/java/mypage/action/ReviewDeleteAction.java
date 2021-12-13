package mypage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;

import mypage.service.ReviewDeleteProService;
import vo.ActionForward;

public class ReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		int rev_id = Integer.parseInt(request.getParameter("rev_id"));
		String user_id = request.getParameter("user_id");
	
		
		ReviewDeleteProService reviewDeleteProService = new ReviewDeleteProService();
		
		boolean reviewdeleteSuccess = reviewDeleteProService.removeReview(rev_id,user_id);
		
		ActionForward forward = null;
		if(reviewdeleteSuccess) {
			
			forward = new ActionForward();
			forward.setUrl("mypage/reviewDelete.jsp");  //인덱스로 이동
			forward.setRedirect(true);
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		
	
		return forward;
	}

}
