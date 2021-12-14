package mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import mypage.service.ReviewUpdateService;
import rest.service.RestUpdateService;
import vo.ActionForward;
import vo.RestVO;
import vo.ReviewVO;

public class ReviewUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int rev_id = Integer.parseInt(request.getParameter("rev_id"));
		ReviewUpdateService reviewUpdateService = new ReviewUpdateService();
		
		
		ReviewVO reviewarticle = reviewUpdateService.getUpdateReviewArticle(rev_id);  
		request.setAttribute("reviewarticle", reviewarticle);
		
		
		ActionForward forward = new ActionForward();
		forward.setUrl("mypage/reviewUpadate.jsp");	
		return forward;
	}

}
