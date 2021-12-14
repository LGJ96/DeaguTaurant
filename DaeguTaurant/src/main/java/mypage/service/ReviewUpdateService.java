package mypage.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewVO;




public class ReviewUpdateService {

	public ReviewVO getUpdateReviewArticle(int rev_id) {
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		ReviewVO reviewarticle = reviewDAO.selectUpdateReviewArticle(rev_id);
		close(con);
		return reviewarticle;
	}

}
