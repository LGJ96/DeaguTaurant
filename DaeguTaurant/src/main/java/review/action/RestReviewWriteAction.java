package review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import vo.ActionForward;
import vo.ReviewReplyVO;

public class RestReviewWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int rev_id = 0,rev_re_step =0;
		if(request.getParameter("rev_id") !=null) {
			rev_id = Integer.parseInt(request.getParameter("rev_id"));
			rev_re_step = Integer.parseInt(request.getParameter("re_step"));
		}
		
		
		ReviewReplyVO reviewreplyVO = new ReviewReplyVO();
		reviewreplyVO.setRev_id(rev_id);
		reviewreplyVO.setRev_re_step(rev_re_step);

	     HttpSession session = request.getSession();

		session.setAttribute("reviewreplyVO", reviewreplyVO);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("home_review/reviewWrite.jsp");
		return forward;
	}


}
