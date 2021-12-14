package dao;

import static db.JdbcUtil.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import comm.vo.CommVO;

public class CommDAO {

	private Connection con;
		
	private static CommDAO instance;
		   
		 private CommDAO() {
		      
		 }
		   
		 public static CommDAO getInstance() {
		    if(instance == null) {
		       instance = new CommDAO();
		    }
		    return instance;
		 }
		   
		 public void setConnection(Connection con) {
		       
	     this.con = con;
		 }

		public int insertArticle(CommVO commVO) {
			// TODO Auto-generated method stub
			int insertCount = 0;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      
		      int com_number = commVO.getCom_number();
		      
		      
		      int number =0;
		      String sql = "";
		      
		      try {
		         pstmt = con.prepareStatement("SELECT MAX(com_number) FROM comm_register");
		         rs = pstmt.executeQuery();
		         
		         if(rs.next()) {
		            number = rs.getInt(1)+1;
		            
		         }
		         else {
		            number =1;
		            
		         }
		         
		         sql = "INSERT INTO comm_register(com_number, com_title, com_date"
		               + ", com_subject, com_content, user_nickname, com_pic)"
		               + "VALUES(comm_register_seq.nextval,?,?,?,?,?,?)";
		         
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, commVO.getCom_title());
		         pstmt.setTimestamp(2, commVO.getCom_date());
		         pstmt.setString(3, commVO.getCom_subject());
		         pstmt.setString(4, commVO.getCom_content());
		         pstmt.setString(5, commVO.getUser_nickname());
		         pstmt.setString(6, commVO.getCom_pic());
		         
		         
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
		         pstmt = con.prepareStatement("SELECT COUNT(*) FROM comm_register");
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
		

		public List<CommVO> selectArticleList(int com_startRow, int com_pageSize) throws Exception {
			// TODO Auto-generated method stub
			PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      List<CommVO> comArticleList = null;
		      try {
		    	
		         pstmt = con.prepareStatement(""
		               + "SELECT list2.* FROM (SELECT ROWNUM r, list1.* "
		               + " FROM (SELECT * FROM comm_register ORDER BY com_number DESC, com_date ASC) list1)"
		               + " list2 WHERE r BETWEEN ? AND ?");
		         pstmt.setInt(1, com_startRow);
		         pstmt.setInt(2, com_startRow+com_pageSize-1);
		         rs = pstmt.executeQuery();
		         
		         if(rs.next()) {
		        	 comArticleList = new ArrayList<CommVO>();
		            do {
		            	CommVO commVO = new CommVO();
		            	commVO.setCom_number(rs.getInt("com_number"));
		            	commVO.setCom_title(rs.getString("com_title"));
		            	commVO.setCom_date(rs.getTimestamp("com_date"));
		            	commVO.setCom_subject(rs.getString("com_subject"));
		            	commVO.setCom_content(rs.getString("com_content"));
		            	commVO.setUser_nickname(rs.getString("user_nickname"));
		            	commVO.setCom_readcount(rs.getInt("com_readcount"));
		            	comArticleList.add(commVO);
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
		      return comArticleList;
		}

		public CommVO selectArticle(int com_number) throws Exception {
			// TODO Auto-generated method stub
			PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        CommVO comArticle = null;
	        try {
	        	//조회 수 증가 작업
	        	pstmt = con.prepareStatement(""
	        			+ "UPDATE comm_register SET com_readcount = com_readcount + 1 / 2 WHERE com_number = ?");
	        	pstmt.setInt(1, com_number);
	        	int updateCount = pstmt.executeUpdate();
	        	if(updateCount > 0) {
	        		commit(con);
	        	}else {
	        		rollback(con);
	        	}
	           
	           pstmt = con.prepareStatement(""
	                 + "SELECT * FROM comm_register WHERE com_number = ?");
	           pstmt.setInt(1, com_number);
	           rs = pstmt.executeQuery();
	           
	           if(rs.next()) {
	        	   comArticle = new CommVO();
	        	   comArticle.setCom_number(rs.getInt("com_number"));
	        	   comArticle.setCom_title(rs.getString("com_title"));
	        	   comArticle.setUser_nickname(rs.getString("User_nickname"));
	        	   comArticle.setCom_date(rs.getTimestamp("com_date"));
	        	   comArticle.setCom_content(rs.getString("com_content"));
	        	   comArticle.setCom_subject(rs.getString("com_subject"));
	        	   comArticle.setCom_readcount(rs.getInt("com_readcount"));
	        	   comArticle.setCom_pic(rs.getString("com_pic"));
	           }
	           
	        } catch (Exception e) {
	           // TODO: handle exception
	           e.printStackTrace();
	        }
	        finally {
	           close(rs);
	           close(pstmt);
	        }
	        
	        return comArticle;
		}

		public CommVO selectUpdateArticle(int com_number) {
			// TODO Auto-generated method stub
			PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      CommVO comArticle = null;
		      try {
			    	  
		         
		         pstmt = con.prepareStatement(""
		               + "SELECT * FROM comm_register WHERE com_number = ?");
		         pstmt.setInt(1, com_number);
		         rs = pstmt.executeQuery();
		         if(rs.next()) {
		        	 comArticle = new CommVO();
		        	 comArticle.setCom_number(rs.getInt("com_number"));
		        	 comArticle.setCom_title(rs.getString("com_title"));
		        	 comArticle.setCom_date(rs.getTimestamp("com_date"));
		        	 comArticle.setCom_content(rs.getString("com_content"));
		        	 comArticle.setCom_subject(rs.getString("com_subject"));
		        	 comArticle.setUser_nickname(rs.getString("user_nickname"));
		        	 comArticle.setCom_readcount(rs.getInt("com_readcount"));
		        	 comArticle.setCom_pic(rs.getString("com_pic"));
		         }
		      } catch (Exception e) {
		         // TODO: handle exception
		         e.printStackTrace();
		      }
		      finally {
		           close(rs);
		           close(pstmt);
		        }
		      return comArticle;
		}

		public int updateArticle(CommVO commVO) {
			// TODO Auto-generated method stub
			int updateCount = 0;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String sql = "";
		    try {
		       pstmt = con.prepareStatement("SELECT * FROM comm_register WHERE com_number = ?");
		       pstmt.setInt(1, commVO.getCom_number());
		       rs = pstmt.executeQuery();
		       if(rs.next()) {
		    	   sql = "UPDATE comm_register SET com_title = ?, com_content = ?, com_pic = ?"
	    				   + " WHERE com_number = ?";
	    		   pstmt = con.prepareStatement(sql);
	    	       pstmt.setString(1, commVO.getCom_title());
	    	       pstmt.setString(2, commVO.getCom_content());
	    	       pstmt.setString(3, commVO.getCom_pic());
	    	       pstmt.setInt(4, commVO.getCom_number());
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

		public int deleteArticle(int com_number) {
			// TODO Auto-generated method stub
			int deleteCount = 0;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String sql = "";
		    try {
		       pstmt = con.prepareStatement("SELECT * FROM comm_register WHERE com_number = ?");
		       pstmt.setInt(1, com_number);
		       rs = pstmt.executeQuery();
		       
		          
		       if(rs.next()) {
		    	   
		    		   sql = "DELETE FROM comm_register"
		    		   		+ " WHERE com_number = ?";
		    		   pstmt = con.prepareStatement(sql);
		    	       pstmt.setInt(1, com_number);
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

		public int selectComCount() throws Exception {
			// TODO Auto-generated method stub
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int comCount = 0;
			try {
			   pstmt = con.prepareStatement("SELECT COUNT(*) FROM comm_register");
			   rs = pstmt.executeQuery();
			      
			    if(rs.next()) {
			    	comCount = rs.getInt(1);
			     }
			 } catch (Exception e) {
			      // TODO: handle exception
			      e.printStackTrace();
			 }
			 return comCount;
		}

		public List<CommVO> selectComCountList(int com_startRow, int com_pageSize) {
			// TODO Auto-generated method stub
			PreparedStatement pstmt = null;
			 ResultSet rs = null;
			 List<CommVO> comListt = null;
			 String sql = "";
			
			   try {
			      
			      pstmt = con.prepareStatement(""
			            + "SELECT list2.* FROM (SELECT ROWNUM r, list1.* "
			            + " FROM (SELECT * FROM comm_register ORDER BY com_number DESC, com_date ASC) list1)"
			            + " list2 WHERE r BETWEEN ? AND ?");
			      pstmt.setInt(1, com_startRow);
			      pstmt.setInt(2, com_startRow + com_pageSize -1);
			      rs = pstmt.executeQuery();
			      
			      if(rs.next()) {
			    	  comListt = new ArrayList<CommVO>();
			    	
			         do {
			        	 
			
			        	CommVO commVO = new CommVO();
			        	commVO.setCom_number(rs.getInt("com_number"));
		            	commVO.setCom_title(rs.getString("com_title"));
		            	commVO.setCom_subject(rs.getString("com_subject"));
		            	commVO.setCom_date(rs.getTimestamp("com_date"));
		            	commVO.setCom_content(rs.getString("com_content"));
		            	commVO.setUser_nickname(rs.getString("user_nickname"));
		            	commVO.setCom_readcount(rs.getInt("com_readcount"));
						
						comListt.add(commVO);
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

			   return comListt;
		}

		public ArrayList<CommVO> selectComWordList(String searchword) {
			// TODO Auto-generated method stub
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<CommVO> comsearchwordList = null;

			
			String sql = "select * from comm_register where com_title like ? OR com_content like ?";
			

			try {
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchword+"%");
				pstmt.setString(2, "%"+searchword+"%");

				rs = pstmt.executeQuery();

				if (rs.next()) {

					comsearchwordList = new ArrayList<CommVO>();
					CommVO commVO = null;

					do {
						commVO = new CommVO();
						commVO.setCom_number(rs.getInt("com_number"));
		            	commVO.setCom_title(rs.getString("com_title"));
		            	commVO.setCom_subject(rs.getString("com_subject"));
		            	commVO.setCom_date(rs.getTimestamp("com_date"));
		            	commVO.setCom_content(rs.getString("com_content"));
		            	commVO.setUser_nickname(rs.getString("user_nickname"));
		            	commVO.setCom_readcount(rs.getInt("com_readcount"));

						comsearchwordList.add(commVO);
					} while (rs.next());
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			finally {

				close(rs);
				close(pstmt);
			}

			return comsearchwordList;
		}

		 public List<CommVO> selectArticBestList(int com_startRow, int com_pageSize) {
	         // TODO Auto-generated method stub
	         PreparedStatement pstmt = null;
	            ResultSet rs = null;
	            List<CommVO> comBestArticleList = null;
	            try {
	             
	               pstmt = con.prepareStatement(""
	                     + "SELECT list2.* FROM (SELECT ROWNUM r, list1.* "
	                     + " FROM (SELECT * FROM comm_register ORDER BY com_readcount DESC) list1)"
	                     + " list2 WHERE r BETWEEN ? AND ?");
	               pstmt.setInt(1, com_startRow);
	               pstmt.setInt(2, com_startRow+com_pageSize-1);
	               rs = pstmt.executeQuery();
	               
	               if(rs.next()) {
	            	   comBestArticleList = new ArrayList<CommVO>();
	                  do {
	                     CommVO commVO = new CommVO();
	                     commVO.setCom_number(rs.getInt("com_number"));
	                     commVO.setCom_title(rs.getString("com_title"));
	                     commVO.setCom_date(rs.getTimestamp("com_date"));
	                     commVO.setCom_subject(rs.getString("com_subject"));
	                     commVO.setCom_content(rs.getString("com_content"));
	                     commVO.setUser_nickname(rs.getString("user_nickname"));
	                     commVO.setCom_readcount(rs.getInt("com_readcount"));
	                     comBestArticleList.add(commVO);
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
	            return comBestArticleList;
	      }

}
