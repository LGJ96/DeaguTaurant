package mypage.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import mypage.service.MyComListService;
import mypage.service.MyOtoListService;
import mypage.service.ReviewListService;
import rest.service.RestListService;
import comm.vo.CommVO;
import servicecenter.vo.OtoVO;
import vo.ActionForward;
import vo.RestVO;
import vo.ReviewVO;
import vo.UserVO;

public class MyReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		 String user_id = request.getParameter("user_id");
		 
		  ReviewListService reviewListService = new ReviewListService();
		  MyOtoListService myOtoListService = new MyOtoListService();
		  MyComListService myComListService = new MyComListService();

	      ArrayList<ReviewVO> reviewList = reviewListService.getReviewList(user_id);
	      ArrayList<OtoVO> myOtoList = myOtoListService.getMyOtoList(user_id);
	      ArrayList<CommVO> myComList = myComListService.getMyComList(user_id);
	  	 // HttpSession session = request.getSession();
	      //session.setAttribute("restList", restList);
	      request.setAttribute("reviewList", reviewList);
	      request.setAttribute("myOtoList", myOtoList);
	      request.setAttribute("myComList", myComList);
	
	      ActionForward forward = new ActionForward();
	      
	      forward.setUrl("mypage/mypage.jsp");
	    
	      return forward;
	   }
	
		

}
