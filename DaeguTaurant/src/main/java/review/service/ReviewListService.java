package review.service;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.RestDAO;
import dao.ReviewDAO;
import vo.RestVO;
import vo.ReviewVO;

public class ReviewListService {

	public ArrayList<ReviewVO> getReviewList() {
		 Connection con = getConnection();
		 ReviewDAO reviewDAO = ReviewDAO.getInstance();
		 reviewDAO.setConnection(con);
		 
		 ArrayList<ReviewVO> reviewList = reviewDAO.selectReviewList();
		 
		return reviewList;
	
	
	
	}

	
	
}



