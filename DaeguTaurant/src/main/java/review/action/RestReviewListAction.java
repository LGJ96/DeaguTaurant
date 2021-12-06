package review.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import rest.service.RestListService;
import review.service.ReviewListService;
import vo.ActionForward;
import vo.RestVO;
import vo.ReviewVO;

public class RestReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		  ReviewListService reviewListService = new ReviewListService();

	      ArrayList<ReviewVO> reviewList = reviewListService.getReviewList();
	    
	      

	  
	      request.setAttribute("reviewList", reviewList);
	      
	     ActionForward forward = new ActionForward();
	      
	      forward.setUrl("home_review/rest_content.jsp");
	    
	      return forward;
	   }
	}


