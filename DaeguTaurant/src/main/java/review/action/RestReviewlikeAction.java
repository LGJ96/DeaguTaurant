package review.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import review.service.ReviewListService;
import vo.ActionForward;
import vo.RestVO;
import vo.ReviewVO;


public class RestReviewlikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int rev_id = Integer.parseInt(request.getParameter("rev_id"));
		System.out.println(rev_id);

		/*int like_count = Integer.parseInt(request.getParameter("rev_like"));*/ //좋아요 클릭시
		
		
		ReviewListService reviewlikeService = new ReviewListService();	//리뷰
		ReviewVO reviewVO= reviewlikeService.getlikecount(rev_id);
		
		
		
		HttpSession session = request.getSession();
		 RestVO restVO = (RestVO)session.getAttribute("restVO");
		 //ReviewVO reviewVO = (ReviewVO)session.getAttribute("reviewVO");
		//모르겟다오
		session.setAttribute("reviewVO", reviewVO);
		//session.setAttribute("rev_id", restVO);
		ActionForward forward = new ActionForward();
		forward.setUrl("rest_content.dae?res_id="+restVO.getRes_id());
		forward.setRedirect(true);
		return forward;
	}

}
