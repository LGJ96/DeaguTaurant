package mypage.service;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.RestDAO;
import dao.ReviewDAO;
import vo.RestVO;
import vo.ReviewVO;

public class ReviewUpdateProService {

	public boolean modifyReviewArticle(ReviewVO reviewVO) {
		
			boolean reviewmodifySuccess = false;
			Connection con = getConnection();
		    ReviewDAO reviewDAO = ReviewDAO.getInstance();
		    reviewDAO.setConnection(con);
			
			int reviewupdateCount = reviewDAO.updateReviewArticle(reviewVO);
			
			if(reviewupdateCount>0) {
				commit(con);
				reviewmodifySuccess = true;
			}
			else {
				rollback(con);
			}
			

			return reviewmodifySuccess;
		}

}
