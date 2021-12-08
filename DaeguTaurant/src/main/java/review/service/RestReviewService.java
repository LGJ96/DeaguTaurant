package review.service;


import static db.JdbcUtil.*;


import java.sql.Connection;

import dao.ReviewDAO;
import vo.RestVO;
import vo.ReviewVO;
import vo.UserVO;

public class RestReviewService {

	public boolean reviewRest(ReviewVO reviewVO, String review, RestVO restVO,UserVO userVO) {
	
		 boolean reviewSuccess = false;
		 Connection con = getConnection();
		 ReviewDAO reviewDAO = ReviewDAO.getInstance();
		 reviewDAO.setConnection(con);
		
	     int insertCount = reviewDAO.insertReview(reviewVO, review,restVO,userVO);
	     if(insertCount > 0 ) {
	    	 reviewSuccess = true;
	    	 commit(con);
	    	 
	     }
	     else {
	    	 
	    	 rollback(con);
	     }
		return reviewSuccess;
	}

	
}
