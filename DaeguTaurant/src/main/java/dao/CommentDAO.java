package dao;

import static db.JdbcUtil.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import comm.vo.CommentVO;

public class CommentDAO {

   private Connection con;
   
   private static CommentDAO instance;
         
       private CommentDAO() {
            
       }
         
       public static CommentDAO getInstance() {
          if(instance == null) {
             instance = new CommentDAO();
          }
          return instance;
       }
         
       public void setConnection(Connection con) {
             
        this.con = con;
       }

      public int insertArticle(CommentVO commentVO) throws Exception {
         // TODO Auto-generated method stub
         int insertCount = 0;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            int comment_number = commentVO.getComment_number();
            int comment_ref = commentVO.getComment_ref();
            int comment_re_step = commentVO.getComment_re_step();
            int comment_re_level = commentVO.getComment_re_level();
            
            int number =0;
            String sql = "";
            
            try {
               pstmt = con.prepareStatement("SELECT MAX(comment_number) FROM comm_register_comment");
               rs = pstmt.executeQuery();
               
               if(rs.next()) {
                  number = rs.getInt(1)+1;
                  
               }
               else {
                  number =1;
                  
               }
               if(comment_number !=0) {
                   sql = "UPDATE comm_register_comment SET comment_re_step = comment_re_step +1 WHERE comment_ref = ? AND"
                         + " comment_re_step > ?";
                   
                   pstmt = con.prepareStatement(sql);
                   pstmt.setInt(1, comment_ref);
                   pstmt.setInt(2, comment_re_step);
                   pstmt.executeUpdate();
                   
                   comment_re_step = comment_re_step + 1;
                   comment_re_level = comment_re_level + 1;
                }
                else {
                   comment_ref = number;
                   comment_re_step = 0;
                   comment_re_level = 0;
                }
               
               sql = "INSERT INTO comm_register_comment(comment_number, comment_date"
                     + ", comment_content, user_nickname, comment_ref, comment_re_step, comment_re_level, com_number)"
                     + "VALUES(comm_register_comment_seq.nextval,?,?,?,?,?,?,?)";
               
               pstmt = con.prepareStatement(sql);
               pstmt.setTimestamp(1, commentVO.getComment_date());
               pstmt.setString(2, commentVO.getComment_content());
               pstmt.setString(3, commentVO.getUser_nickname());
               pstmt.setInt(4, comment_ref);
               pstmt.setInt(5, comment_re_step);
               pstmt.setInt(6, comment_re_level);
               pstmt.setInt(7, commentVO.getCom_number());
               
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
               pstmt = con.prepareStatement("SELECT COUNT(*) FROM comm_register_comment");
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

      public List<CommentVO> selectArticleList(int comment_startRow, int comment_pageSize) throws Exception {
         // TODO Auto-generated method stub
         PreparedStatement pstmt = null;
            ResultSet rs = null;
            List<CommentVO> commentArticleList = null;
            try {
             
               pstmt = con.prepareStatement(""
                     + "SELECT list2.* FROM (SELECT ROWNUM r, list1.* "
                     + " FROM (SELECT * FROM comm_register_comment ORDER BY com_number DESC, comment_ref ASC, comment_re_step DESC) list1)"
                     + " list2 WHERE r BETWEEN ? AND ?");
               pstmt.setInt(1, comment_startRow);
               pstmt.setInt(2, comment_startRow+comment_pageSize-1);
               rs = pstmt.executeQuery();
               
               if(rs.next()) {
                  commentArticleList = new ArrayList<CommentVO>();
                  do {
                     CommentVO commentVO = new CommentVO();
                     commentVO.setComment_number(rs.getInt("comment_number"));
                     commentVO.setComment_date(rs.getTimestamp("comment_date"));
                     commentVO.setComment_content(rs.getString("comment_content"));
                     commentVO.setUser_nickname(rs.getString("user_nickname"));
                     commentVO.setComment_ref(rs.getInt("comment_ref"));
                     commentVO.setComment_re_step(rs.getInt("comment_re_step"));
                     commentVO.setComment_re_level(rs.getInt("comment_re_level"));
                     commentVO.setCom_number(rs.getInt("com_number"));
                     commentArticleList.add(commentVO);
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
            return commentArticleList;
      }

      

	public int deleteArticle(int comment_number) throws Exception {
		// TODO Auto-generated method stub
		int deleteCount = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "";
	    try {
	       pstmt = con.prepareStatement("SELECT * FROM comm_register_comment WHERE comment_number = ?");
	       pstmt.setInt(1, comment_number);
	       rs = pstmt.executeQuery();
	       
	          
	       if(rs.next()) {
	    	   		
	    		   sql = "DELETE FROM comm_register_comment"
	    		   		+ " WHERE comment_number = ?";
	    		   pstmt = con.prepareStatement(sql);
	    	       pstmt.setInt(1, comment_number);
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

	public CommentVO selectUpdateArticle(int comment_number) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      CommentVO commentArticle = null;
	      try {
	         
	         pstmt = con.prepareStatement(""
	               + "SELECT * FROM comm_register_comment WHERE comment_number = ?");
	         pstmt.setInt(1, comment_number);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 commentArticle = new CommentVO();
	        	 commentArticle.setComment_number(rs.getInt("comment_number"));
                 commentArticle.setComment_date(rs.getTimestamp("comment_date"));
                 commentArticle.setComment_content(rs.getString("comment_content"));
                 commentArticle.setUser_nickname(rs.getString("user_nickname"));
                 commentArticle.setComment_ref(rs.getInt("comment_ref"));
                 commentArticle.setComment_re_step(rs.getInt("comment_re_step"));
                 commentArticle.setComment_re_level(rs.getInt("comment_re_level"));
                 commentArticle.setCom_number(rs.getInt("com_number"));
	         }
	      } catch (Exception e) {
	         // TODO: handle exception
	         e.printStackTrace();
	      }
	      finally {
	           close(rs);
	           close(pstmt);
	        }
	      return commentArticle;
	}

	public int updateArticle(CommentVO commentVO) {
		// TODO Auto-generated method stub
		int updateCount = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "";
	    try {
	       pstmt = con.prepareStatement("SELECT * FROM comm_register_comment WHERE comment_number = ?");
	       pstmt.setInt(1, commentVO.getComment_number());
	       rs = pstmt.executeQuery();
	       if(rs.next()) {
	    		   sql = "UPDATE comm_register_comment SET comment_content = ?"
	    				   + " WHERE comment_number = ?";
	    		   pstmt = con.prepareStatement(sql);
	    	       pstmt.setString(1, commentVO.getComment_content());
	    	       pstmt.setInt(2, commentVO.getComment_number());
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
       
       
}