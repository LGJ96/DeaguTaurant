package review.service;


import static db.JdbcUtil.*;


import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewVO;

public class RestReviewService {

	public boolean reviewRest(ReviewVO reviewVO, String review) {
	
		 boolean reviewSuccess = false;
		 Connection con = getConnection();
		 ReviewDAO reviewDAO = ReviewDAO.getInstance();
		 reviewDAO.setConnection(con);
		
	     int insertCount = reviewDAO.insertReview(reviewVO, review);
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
