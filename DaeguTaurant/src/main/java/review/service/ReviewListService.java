package review.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import dao.ReviewDAO;
import vo.RestVO;
import vo.ReviewVO;
import vo.UserVO;

public class ReviewListService {

	public List<ReviewVO> getReviewList(int rest_startRow, int rest_pageSize,int res_id,ReviewVO reviewVO) throws Exception {
		 Connection con = getConnection();
		 ReviewDAO reviewDAO = ReviewDAO.getInstance();
		 reviewDAO.setConnection(con);
		 
		 List<ReviewVO> reviewList = reviewDAO.selectReviewList(rest_startRow,rest_pageSize,res_id, reviewVO);
		 
		return reviewList;
	
	
	
	}

	public int getReviewCount(int res_id) throws Exception{               //리뷰수
		// TODO Auto-generated method stub
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		int reviewCount = reviewDAO.selectReviewCount(res_id);
		close(con);
		return reviewCount;
	}


	public ReviewVO getlikecount(int rev_id) throws Exception{
		 Connection con = getConnection();
		 ReviewDAO reviewDAO = ReviewDAO.getInstance();
		 reviewDAO.setConnection(con);
		 
		 ReviewVO reviewVO = reviewDAO.selectlikeCount(rev_id);	
		 
		return reviewVO;
	}

	public double getTotalScore(int res_id) {
		 Connection con = getConnection();
		 ReviewDAO reviewDAO = ReviewDAO.getInstance();
		 reviewDAO.setConnection(con);
		 
		 double updateCount = reviewDAO.selectTotalScore(res_id);	
		 
		return updateCount;
	}

	

	
}



