package dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.RestVO;
import vo.ReviewVO;
import vo.UserVO;

public class ReviewDAO {

	private Connection con;
	// singleton ����

	private static ReviewDAO instance;

	private ReviewDAO() {
	}

	public static ReviewDAO getInstance() {
		if (instance == null) {
			instance = new ReviewDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertReview(ReviewVO reviewVO, String review, RestVO restVO,UserVO userVO) {

		int insertCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int rev_id = reviewVO.getRev_id();
		int rev_res_id = restVO.getRes_id();
		String rev_user_id=userVO.getUser_id();

		int rev_re_step = reviewVO.getRev_re_step();
		double res_score = reviewVO.getRes_score();

		int number = 0;
		String sql = "";

		try {
			pstmt = con.prepareStatement("SELECT MAX(rev_id) FROM review");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}

			if (rev_id != 0) {

				sql = "UPDATE review SET rev_re_step = rev_re_step + 1 WHERE rev_re_step > ?";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rev_re_step);

				pstmt.executeUpdate();

				rev_re_step = rev_re_step + 1;

			} else {

				rev_re_step = 0;

			}

			if (review == "1") {

				sql = "UPDATE review SET res_score = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setDouble(1, res_score);
				pstmt.executeUpdate();

			} else if (review == "2") {
				sql = "UPDATE review SET res_score = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setDouble(1, res_score);
				pstmt.executeUpdate();

			} else if (review == "3") {
				sql = "UPDATE review SET res_score = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setDouble(1, res_score);
				pstmt.executeUpdate();
			} else if (review == "4") {
				sql = "UPDATE review SET res_score = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setDouble(1, res_score);
				pstmt.executeUpdate();

			} else if (review == "5") {
				sql = "UPDATE review SET res_score = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setDouble(1, res_score);
				pstmt.executeUpdate();

			}

			sql = "INSERT INTO review(rev_id, res_score,"
					+ "rev_notice_date, rev_pic,rev_res_id,rev_user_id, rev_content, rev_re_step, rev_like)"
					+ "VALUES(review_seq.nextval,?,?,?,?,?,?,?,0)";

			pstmt = con.prepareStatement(sql);

			pstmt.setDouble(1, res_score);
			pstmt.setTimestamp(2, reviewVO.getRev_notice_date());
			pstmt.setString(3, reviewVO.getRev_pic());
			pstmt.setInt(4, rev_res_id);
			pstmt.setString(5, rev_user_id);
			pstmt.setString(6, reviewVO.getRev_content());
			pstmt.setInt(7, reviewVO.getRev_re_step());

			insertCount = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return insertCount;
	}

	public List<ReviewVO> selectReviewList(int rest_startRow, int rest_pageSize, int res_id, ReviewVO reviewVO)
			throws Exception {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewVO> reviewList = null;
		/*		String sql = "";*/

			try {
			

		pstmt = con.prepareStatement("" + "SELECT list2.* FROM (SELECT ROWNUM r, list1.* "
				+ " FROM (SELECT * FROM review WHERE rev_res_id = ? ORDER BY rev_id DESC, rev_re_step ASC) list1)"
				+ " list2 WHERE r BETWEEN ? AND ?");

		pstmt.setInt(1, res_id);
		pstmt.setInt(2, rest_startRow);
		pstmt.setInt(3, rest_startRow + rest_pageSize - 1);
		rs = pstmt.executeQuery();

		if (rs.next()) {

			reviewList = new ArrayList<ReviewVO>();

			do {

				reviewVO = new ReviewVO();

				reviewVO.setRes_score(rs.getDouble("res_score"));
				reviewVO.setRev_content(rs.getString("rev_content"));
				reviewVO.setRev_id(rs.getInt("rev_id"));
				reviewVO.setRev_like(rs.getInt("rev_like"));
				reviewVO.setRev_notice_date(rs.getTimestamp("rev_notice_date"));
				reviewVO.setRev_pic(rs.getString("rev_pic"));
				reviewVO.setRev_re_step(rs.getInt("rev_re_step"));
				reviewVO.setRev_res_id(rs.getInt("rev_res_id"));
				reviewVO.setRev_user_id(rs.getString("rev_user_id"));

				reviewList.add(reviewVO);

			} while (rs.next());
		
		}

	}catch(

	Exception e)
	{
		e.printStackTrace();
	}

	finally
	{

		close(rs);
		close(pstmt);
	}

	return reviewList;
	}

	public int selectReviewCount(int res_id)  {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int reviewCount =0;
		try {
			pstmt = con.prepareStatement("SELECT COUNT(*) FROM review where rev_res_id = ?");
			pstmt.setInt(1, res_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reviewCount = rs.getInt(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return reviewCount;
	}

	public ReviewVO selectlikeCount(int rev_id)throws Exception {
		
		
		ReviewVO reviewVO = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
				String sql = "";

			try {
					
				
				sql = " UPDATE review SET rev_like = rev_like + 1 WHERE rev_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rev_id);
				int updateCount = pstmt.executeUpdate();
				if(updateCount > 0) {
					commit(con);
					
				}
				
				else {
					rollback(con);
					
				}
			

				sql = "SELECT * FROM review WHERE rev_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rev_id);
				rs = pstmt.executeQuery();
		

		if (rs.next()) {


				reviewVO = new ReviewVO();

				reviewVO.setRes_score(rs.getDouble("res_score"));
				reviewVO.setRev_content(rs.getString("rev_content"));
				reviewVO.setRev_id(rs.getInt("rev_id"));
				reviewVO.setRev_like(rs.getInt("rev_like"));
				reviewVO.setRev_notice_date(rs.getTimestamp("rev_notice_date"));
				reviewVO.setRev_pic(rs.getString("rev_pic"));
				reviewVO.setRev_re_step(rs.getInt("rev_re_step"));
				reviewVO.setRev_res_id(rs.getInt("rev_res_id"));
				reviewVO.setRev_user_id("rev_user_id");



			} 
			
		

	}catch(

	Exception e)
	{
		e.printStackTrace();
	}

	finally
	{

		close(rs);
		close(pstmt);
	}

	return reviewVO;
	}

	public double selectTotalScore(int res_id) {
		
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//double a = Double.parseDouble(null).getRes_score();
		
		double totalScore=0.00;

		try {
				
			pstmt = con.prepareStatement(""
					+"SELECT ROUND((SUM(res_score)/COUNT(*)),2) AS totalScore FROM review WHERE rev_res_id = ? GROUP BY rev_res_id");
			pstmt.setInt(1, res_id);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				
				
				totalScore = rs.getDouble("totalScore");
				
			

			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return totalScore;	
	}

}
