package dao;

import static db.JdbcUtil.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import servicecenter.vo.NoticeVO;


public class NoticeDAO {
	private Connection con;
	
	private static NoticeDAO instance;
	   
	   private NoticeDAO() {
	      
	   }
	   
	   public static NoticeDAO getInstance() {
	      if(instance == null) {
	         instance = new NoticeDAO();
	      }
	      return instance;
	   }
	   
	   public void setConnection(Connection con) {
	       
	      this.con = con;
	   }
	   public int insertArticle(NoticeVO noticeVO) throws Exception{
		      // TODO Auto-generated method stub
		      int insertCount = 0;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      
		      //???占쏙옙???????占�????????????? ?????占쏙옙???????? ????????????
		      int cus_notice_number = noticeVO.getCus_notice_number();
		      
		      
		      int number =0;
		      //?????占쏙옙???????? ???????????? ?????????????????? ?????? ???????????? ???占쏙옙?占쏙옙???????? ??????????占�??? ???????占쏙옙?????? ?????????????????? ????????????
		      String sql = "";
		      
		      try {
		         pstmt = con.prepareStatement("SELECT MAX(cus_notice_number) FROM Notice");
		         rs = pstmt.executeQuery();
		         //???????????? ?????占쏙옙???????? ???????????? ?????????????????? ??????占�??????? ????????????占�? ????????????.
		         
		         if(rs.next()) {//?????????占쏙옙????????? ?????占쏙옙???????? ???????????? ???占쏙옙?????????? ??????????????????...
		            number = rs.getInt(1)+1;
		            
		         }
		         else {
		            number =1;
		            
		         }
		         
		         sql = "INSERT INTO Notice(cus_notice_number, cus_notice_title, cus_notice_date"
		               + ", cus_notice_content)"
		               + "VALUES(Notice_seq.nextval,?,?,?)";
		         
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, noticeVO.getCus_notice_title());
		         pstmt.setTimestamp(2, noticeVO.getCus_notice_date());
		         pstmt.setString(3, noticeVO.getCus_notice_content());
		         
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
	         pstmt = con.prepareStatement("SELECT COUNT(*) FROM Notice");
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

	public List<NoticeVO> selectArticleList(int startRow, int pageSize) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<NoticeVO> articleList = null;
	      try {
	         //???????? ???????????????????????? ??????占�???占�? ?????占쏙옙? ?????????????占쏙옙?? ??????
	         pstmt = con.prepareStatement(""
	               + "SELECT list2.* FROM (SELECT ROWNUM r, list1.* "
	               + " FROM (SELECT * FROM Notice ORDER BY cus_notice_number DESC, cus_notice_date ASC) list1)"
	               + " list2 WHERE r BETWEEN ? AND ?");
	         pstmt.setInt(1, startRow);
	         pstmt.setInt(2, startRow+pageSize-1);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            articleList = new ArrayList<NoticeVO>();
	            do {
	            	NoticeVO  noticeVO = new NoticeVO();
	            	noticeVO.setCus_notice_number(rs.getInt("cus_notice_number"));
	            	noticeVO.setCus_notice_title(rs.getString("cus_notice_title"));
	            	noticeVO.setCus_notice_date(rs.getTimestamp("cus_notice_date"));
	            	noticeVO.setCus_notice_content(rs.getString("cus_notice_content"));
	               articleList.add(noticeVO);
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
	      return articleList;
	}

	public NoticeVO selectUpdateArticle(int cus_notice_number) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      NoticeVO article = null;
	      try {
	         
	         pstmt = con.prepareStatement(""
	               + "SELECT * FROM Notice WHERE cus_notice_number = ?");
	         pstmt.setInt(1, cus_notice_number);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	               article = new NoticeVO();
	               article.setCus_notice_number(rs.getInt("cus_notice_number"));
	               article.setCus_notice_title(rs.getString("cus_notice_title"));
	               article.setCus_notice_date(rs.getTimestamp("cus_notice_date"));
	               article.setCus_notice_content(rs.getString("cus_notice_content"));
	         }
	      } catch (Exception e) {
	         // TODO: handle exception
	         e.printStackTrace();
	      }
	      finally {
	           close(rs);
	           close(pstmt);
	        }
	      return article;
	}

	public int updateArticle(NoticeVO noticeVO) throws Exception{
		// TODO Auto-generated method stub
		int updateCount = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "";
	    try {
	       pstmt = con.prepareStatement("SELECT * FROM Notice WHERE cus_notice_number = ?");
	       pstmt.setInt(1, noticeVO.getCus_notice_number());
	       rs = pstmt.executeQuery();
	       if(rs.next()) {
	    		   sql = "UPDATE Notice SET cus_notice_title = ?, cus_notice_content = ?"
	    				   + " WHERE cus_notice_number = ?";
	    		   pstmt = con.prepareStatement(sql);
	    	       pstmt.setString(1, noticeVO.getCus_notice_title());
	    	       pstmt.setString(2, noticeVO.getCus_notice_content());
	    	       pstmt.setInt(3, noticeVO.getCus_notice_number());
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

	public int deleteArticle(int cus_notice_number) throws Exception{
		// TODO Auto-generated method stub
		int deleteCount = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "";
	    //?占쏙옙?占쏙옙?占쏙옙??占쏙옙?占쏙옙???? 占�??占쏙옙?? 占�?占�?占�???
	    try {
	       pstmt = con.prepareStatement("SELECT * FROM Notice WHERE cus_notice_number = ?");
	       pstmt.setInt(1, cus_notice_number);
	       rs = pstmt.executeQuery();
	       //???? ???????? ?????? ???? 占�??? 占�?占�?占�??占쏙옙?? 占�??占쏙옙??
	       
	          
	       if(rs.next()) {
	          //?占쏙옙?? 占�?占�??占쏙옙?? 占�?占�?占�? ???? 占�??? ???占쎈㈃
	    	   
	    		   sql = "DELETE FROM Notice"
	    		   		+ " WHERE cus_notice_number = ?";
	    		   pstmt = con.prepareStatement(sql);
	    	       pstmt.setInt(1, cus_notice_number);
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
