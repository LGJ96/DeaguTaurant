package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.RestVO;
import vo.ReviewVO;

public class ReviewDAO {

	private Connection con;
	   //singleton ����
	   
	   private static ReviewDAO instance;
	   
	   private ReviewDAO() {}
	   
	   public static ReviewDAO getInstance() {
	      if(instance == null) {
	         instance = new ReviewDAO();
	      }
	      return instance;
	   }
	   
	   
	   public void setConnection(Connection con) {
	      this.con = con;
	   }
	

	public int insertReview(ReviewVO reviewVO, String review) {
		
		 int insertCount = 0;
		 
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 int rev_id = reviewVO.getRev_id();
		
	
	     int rev_re_step = reviewVO.getRev_re_step();
	     double res_score = reviewVO.getRes_score();
	   
	     
	     int number = 0;
	     String sql = "";
		    
		    
		    try {
		    	 pstmt = con.prepareStatement("SELECT MAX(rev_id) FROM review");
		         rs = pstmt.executeQuery();
   
		         if(rs.next()) { 
		            number = rs.getInt(1) + 1;
		         } else {
		            number = 1;
		       }
		         
		         if(rev_id != 0) {
		         
		            sql = "UPDATE review SET rev_re_step = rev_re_step + 1 WHERE rev_re_step > ?";
		          
		            pstmt = con.prepareStatement(sql);
		            pstmt.setInt(1, rev_re_step);
		          
		            pstmt.executeUpdate();
		            
		            rev_re_step = rev_re_step + 1;
		           
		         }
		         else {
		        
		        	 rev_re_step = 0;
		            
		         }
		         
		         if(review == "1") {
		             
	                  
	                  sql = "UPDATE review SET res_score = ?";
	                  pstmt = con.prepareStatement(sql);
	                  pstmt.setDouble(1, res_score);
	                  pstmt.executeUpdate();
	                     
	                  
	                  
	               }
	               else if(review == "2") {
	                  sql = "UPDATE review SET res_score = ?";
	                  pstmt = con.prepareStatement(sql);
	                  pstmt.setDouble(1, res_score);
	                  pstmt.executeUpdate();
	                   
	               }
	               else if(review == "3") {
	                  sql = "UPDATE review SET res_score = ?";
	                  pstmt = con.prepareStatement(sql);
	                  pstmt.setDouble(1, res_score);
	                  pstmt.executeUpdate();
	               }
	               else if(review == "4") {
	                  sql = "UPDATE review SET res_score = ?";
	                  pstmt = con.prepareStatement(sql);
	                  pstmt.setDouble(1, res_score);
	                  pstmt.executeUpdate();
	                   
	               }
	               else if(review == "5") {
	                  sql = "UPDATE review SET res_score = ?";
	                  pstmt = con.prepareStatement(sql);
	                  pstmt.setDouble(1, res_score);
	                  pstmt.executeUpdate();
	                   
	               }
		        
		         
		         sql = "INSERT INTO review(rev_id, res_score,"
		        		 + "rev_notice_date, rev_pic, rev_content, rev_re_step, rev_like)"
		        		 + "VALUES(review_seq.nextval,?,?,?,?,?,0)";
		    	
		       pstmt = con.prepareStatement(sql);
		       
		       
		       pstmt.setDouble(1, res_score);
		       pstmt.setTimestamp(2, reviewVO.getRev_notice_date());
		       pstmt.setString(3, reviewVO.getRev_pic());
		       pstmt.setString(4, reviewVO.getRev_content());
		       pstmt.setInt(5, reviewVO.getRev_re_step());
    
		       
		       insertCount = pstmt.executeUpdate();
		       
		    }catch (Exception e) {
		       // TODO: handle exception
		       e.printStackTrace();
		    }
		    finally {
		       close(pstmt);
		    }
		    return insertCount;
		 }

	
	public ArrayList<ReviewVO> selectReviewList() {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReviewVO> reviewList = null;
		ArrayList<RestVO> restList = null;
		
		String sql = "select * from review";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
		
				reviewList = new ArrayList<ReviewVO>();
				ReviewVO reviewVO = null;
				RestVO restVO = null;
				
				do {
					

				
					reviewVO = new ReviewVO();
					restVO = new RestVO();
					
					reviewVO.setRes_score(rs.getDouble("res_score"));
					reviewVO.setRev_content(rs.getString("rev_content"));
					reviewVO.setRev_id(rs.getInt("rev_id"));
					reviewVO.setRev_like(rs.getInt("rev_like"));
					reviewVO.setRev_notice_date(rs.getTimestamp("rev_notice_date"));
					reviewVO.setRev_pic(rs.getString("rev_pic"));
					reviewVO.setRev_re_step(rs.getInt("rev_re_step"));
					restVO.setRes_id(rs.getInt("res_id"));
					
					
					
					reviewList.add(reviewVO);
					
				} while (rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			
			close(rs);
			close(pstmt);
		}
		
		return reviewList;
	}


	
	
}

