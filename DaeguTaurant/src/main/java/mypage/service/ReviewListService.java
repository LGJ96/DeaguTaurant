package mypage.service;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import dao.UserDAO;
import vo.RestVO;
import vo.ReviewVO;
import vo.UserVO;

public class ReviewListService {

	public ArrayList<ReviewVO> getReviewList(String user_id) {
		
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		ArrayList<ReviewVO> reviewList = reviewDAO.selectReviewList(user_id);
		 
		return reviewList;
		
	}

}
