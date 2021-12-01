package dao;

import static db.JdbcUtil.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import servicecenter.vo.FaqVO;

public class FaqDAO {
	
	private Connection con;
	
	private static FaqDAO instance;
	   
	   private FaqDAO() {
	      
	   }
	   
	   public static FaqDAO getInstance() {
	      if(instance == null) {
	         instance = new FaqDAO();
	      }
	      return instance;
	   }
	   
	   public void setConnection(Connection con) {
	       
	      this.con = con;
	   }

	public int insertArticle(FaqVO faqVO) {
		// TODO Auto-generated method stub
		int insertCount = 0;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      int cus_faq_number = faqVO.getCus_faq_number();
	      
	      
	      int number =0;
	      String sql = "";
	      
	      try {
	         pstmt = con.prepareStatement("SELECT MAX(cus_faq_number) FROM Faq");
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            number = rs.getInt(1)+1;
	            
	         }
	         else {
	            number =1;
	            
	         }
	         
	         sql = "INSERT INTO Faq(cus_faq_number, cus_faq_title, cus_faq_date"
	               + ", cus_faq_content)"
	               + "VALUES(Faq_seq.nextval,?,?,?)";
	         
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, faqVO.getCus_faq_title());
	         pstmt.setTimestamp(2, faqVO.getCus_faq_date());
	         pstmt.setString(3, faqVO.getCus_faq_content());
	         
	         insertCount = pstmt.executeUpdate();
	         
	      } catch (Exception e) {
	         // TODO: handle exception
	         e.printStackTrace();
	      }
	      finally {
	         close(rs);
	         close(pstmt);
	      }
	      return insertCount;
	}

	public int selectArticleCount() throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int articleCount =0;
	      try {
	         pstmt = con.prepareStatement("SELECT COUNT(*) FROM Faq");
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            articleCount = rs.getInt(1);
	         }
	         
	      } catch (Exception e) {
	         // TODO: handle exception
	         e.printStackTrace();
	      }
	      return articleCount;
	}

	public List<FaqVO> selectArticleList(int faq_startRow, int faq_pageSize) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<FaqVO> faqArticleList = null;
	      try {
	         pstmt = con.prepareStatement(""
	               + "SELECT list2.* FROM (SELECT ROWNUM r, list1.* "
	               + " FROM (SELECT * FROM Faq ORDER BY cus_faq_number DESC, cus_faq_date ASC) list1)"
	               + " list2 WHERE r BETWEEN ? AND ?");
	         pstmt.setInt(1, faq_startRow);
	         pstmt.setInt(2, faq_startRow+faq_pageSize-1);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	 faqArticleList = new ArrayList<FaqVO>();
	            do {
	            	FaqVO faqVO = new FaqVO();
	            	faqVO.setCus_faq_number(rs.getInt("cus_faq_number"));
	            	faqVO.setCus_faq_title(rs.getString("cus_faq_title"));
	            	faqVO.setCus_faq_date(rs.getTimestamp("cus_faq_date"));
	            	faqVO.setCus_faq_content(rs.getString("cus_faq_content"));
	            	faqArticleList.add(faqVO);
	            } while (rs.next());
	         }
	         
	      } catch (Exception e) {
	         // TODO: handle exception
	         e.printStackTrace();
	      }
	      finally {
	         close(rs);
	         close(pstmt);
	      }
	      return faqArticleList;
	}

	public FaqVO selectUpdateArticle(int cus_faq_number) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      FaqVO faqArticle = null;
	      try {
	         
	         pstmt = con.prepareStatement(""
	               + "SELECT * FROM Faq WHERE cus_faq_number = ?");
	         pstmt.setInt(1, cus_faq_number);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 faqArticle = new FaqVO();
	        	 faqArticle.setCus_faq_number(rs.getInt("cus_faq_number"));
	        	 faqArticle.setCus_faq_title(rs.getString("cus_faq_title"));
	        	 faqArticle.setCus_faq_date(rs.getTimestamp("cus_faq_date"));
	        	 faqArticle.setCus_faq_content(rs.getString("cus_faq_content"));
	         }
	      } catch (Exception e) {
	         // TODO: handle exception
	         e.printStackTrace();
	      }
	      finally {
	           close(rs);
	           close(pstmt);
	        }
	      return faqArticle;
	}

	public int updateArticle(FaqVO faqVO) {
		// TODO Auto-generated method stub
		int updateCount = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "";
	    try {
	       pstmt = con.prepareStatement("SELECT * FROM Faq WHERE cus_faq_number = ?");
	       pstmt.setInt(1, faqVO.getCus_faq_number());
	       rs = pstmt.executeQuery();
	       if(rs.next()) {
	    		   sql = "UPDATE Faq SET cus_faq_title = ?, cus_faq_content = ?"
	    				   + " WHERE cus_faq_number = ?";
	    		   pstmt = con.prepareStatement(sql);
	    	       pstmt.setString(1, faqVO.getCus_faq_title());
	    	       pstmt.setString(2, faqVO.getCus_faq_content());
	    	       pstmt.setInt(3, faqVO.getCus_faq_number());
	    	       updateCount = pstmt.executeUpdate();
	    	       
	       }
	       
	    }
	       catch (Exception e) {
	       // TODO: handle exception
	       e.printStackTrace();
	    }
	    finally {
	       close(rs);
	       close(pstmt);
	    }
		return updateCount;
	}

	public int deleteArticle(int cus_faq_number) {
		// TODO Auto-generated method stub
		int deleteCount = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "";
	    //?占쏙옙?占쏙옙?占쏙옙??占쏙옙?占쏙옙???? 占�??占쏙옙?? 占�?占�?占�???
	    try {
	       pstmt = con.prepareStatement("SELECT * FROM Faq WHERE cus_faq_number = ?");
	       pstmt.setInt(1, cus_faq_number);
	       rs = pstmt.executeQuery();
	       //???? ???????? ?????? ???? 占�??? 占�?占�?占�??占쏙옙?? 占�??占쏙옙??
	       
	          
	       if(rs.next()) {
	          //?占쏙옙?? 占�?占�??占쏙옙?? 占�?占�?占�? ???? 占�??? ???占쎈㈃
	    	   
	    		   sql = "DELETE FROM Faq"
	    		   		+ " WHERE cus_faq_number = ?";
	    		   pstmt = con.prepareStatement(sql);
	    	       pstmt.setInt(1, cus_faq_number);
	    	       deleteCount = pstmt.executeUpdate();
	    	       
	    	   
	       	}
	    }
	    	catch (Exception e) {
	    		// TODO: handle exception
	    		e.printStackTrace();
	    	}
	    	finally {
	    	close(rs);
	    	close(pstmt);
	    }
			return deleteCount;
	}

	   
}
