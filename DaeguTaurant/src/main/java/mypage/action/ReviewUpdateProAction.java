package mypage.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import mypage.service.ReviewUpdateProService;
import rest.service.RestUpdateProService;
import vo.ActionForward;
import vo.ReviewVO;

public class ReviewUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ReviewVO reviewVO = new ReviewVO();
		
		 String review = request.getParameter("review"); //평점
		  reviewVO.setRes_score(Double.parseDouble(review));
		 
		reviewVO.setRev_content(request.getParameter("rev_content"));
		reviewVO.setRev_id(Integer.parseInt(request.getParameter("rev_id")));
		reviewVO.setRev_notice_date(new Timestamp(System.currentTimeMillis()));
		
		ReviewUpdateProService reviewUpdateproService = new ReviewUpdateProService();
		
		boolean reviewmodifySuccess =reviewUpdateproService.modifyReviewArticle(reviewVO);
		
		ActionForward forward = null;
		if(reviewmodifySuccess) {
			forward = new ActionForward();
			
			/*forward.setUrl("home_review/index.jsp");*/
			forward.setUrl("mypage/reviewUpdateEnd.jsp");
			
			forward.setRedirect(true);
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패')");
			out.println("history.back();");
			out.println("</script>");
		}
	
		return forward;
	}

}
