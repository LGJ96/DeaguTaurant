package mypage.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import mypage.service.ReviewListService;
import rest.service.RestListService;
import vo.ActionForward;
import vo.RestVO;
import vo.ReviewVO;
import vo.UserVO;

public class MyReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		 String user_id = request.getParameter("user_id");
		 
		  ReviewListService reviewListService = new ReviewListService();

	      ArrayList<ReviewVO> reviewList = reviewListService.getReviewList(user_id);
	  	 // HttpSession session = request.getSession();
	      //session.setAttribute("restList", restList);
	      request.setAttribute("reviewList", reviewList);
	      
	     ActionForward forward = new ActionForward();
	      
	      forward.setUrl("mypage/mypage.jsp");
	    
	      return forward;
	   }
	
		

}
