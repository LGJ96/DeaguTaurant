package mypage.service;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.*;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ReviewDAO;
import dao.UserDAO;

public class ReviewDeleteProService {

	public boolean removeReview(int rev_id, String user_id){
		
		boolean reviewdeleteSuccess = false;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		int deleteCount = reviewDAO.deleteReview(rev_id,user_id);
		
		if(deleteCount >0) {
			reviewdeleteSuccess = true;                 //삭제성공
			commit(con);
		}
		else {
			rollback(con);
		}
		
		return reviewdeleteSuccess;
	}

}
