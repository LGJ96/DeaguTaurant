package dao;

import static db.JdbcUtil.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import servicecenter.vo.FaqVO;
import servicecenter.vo.OtoVO;
import vo.ReviewVO;
import vo.UserVO;

public class OtoDAO {
	
private Connection con;
	
	private static OtoDAO instance;
	   
	   private OtoDAO() {
	      
	   }
	   
	   public static OtoDAO getInstance() {
	      if(instance == null) {
	         instance = new OtoDAO();
	      }
	      return instance;
	   }
	   
	   public void setConnection(Connection con) {
	       
	      this.con = con;
	   }

	public int insertArticle(OtoVO otoVO, UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		int insertCount = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	      
	      int cus_oto_number = otoVO.getCus_oto_number();
	      int cus_ref = otoVO.getCus_ref();
	      int cus_re_step = otoVO.getCus_re_step();
	      int cus_re_level = otoVO.getCus_re_level();
	      String oto_user_id = userVO.getUser_id();
	      
	      int number =0;
	      String sql = "";
	      
	      try {
	         pstmt = con.prepareStatement("SELECT MAX(cus_oto_number) FROM OTO");
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            number = rs.getInt(1)+1;
	            
	         }
	         else {
	            number =1;
	            
	         }
	         if(cus_oto_number !=0) {
	             //답글일때
	             sql = "UPDATE OTO SET cus_re_step = cus_re_step +1 WHERE cus_ref = ? AND"
	                   + " cus_re_step > ?";
	             
	             //답변을 달려는 대상글의 ref값과 같은 ref값을 가지고 있고, 답변을 달려는 대상글의 
	             //re_step 값보다 큰 re_step 값을 가지고 있는 글들의 re_step 값을 1씩 증가시켜라
	             pstmt = con.prepareStatement(sql);
	             pstmt.setInt(1, cus_ref);
	             pstmt.setInt(2, cus_re_step);
	             pstmt.executeUpdate();
	             
	             cus_re_step = cus_re_step + 1;
	             cus_re_level = cus_re_level + 1;
	          }
	          else {
	        	  cus_ref = number;
	        	  cus_re_step = 0;
	        	  cus_re_level = 0;
	          }
	         
	         sql = "INSERT INTO OTO(cus_oto_number, cus_oto_title, cus_oto_date"
	               + ", cus_oto_content, user_nickname, cus_ref, cus_re_step, cus_re_level, oto_user_id)"
	               + "VALUES(OTO_seq.nextval,?,?,?,?,?,?,?,?)";
	         
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, otoVO.getCus_oto_title());
	         pstmt.setTimestamp(2, otoVO.getCus_oto_date());
	         pstmt.setString(3, otoVO.getCus_oto_content());
	         pstmt.setString(4, otoVO.getUser_nickname());
	         pstmt.setInt(5, cus_ref);
	         pstmt.setInt(6, cus_re_step);
	         pstmt.setInt(7, cus_re_level);
	         pstmt.setString(8, oto_user_id);
	         
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
	      int articleCount = 0;
	      try {
	         pstmt = con.prepareStatement("SELECT COUNT(*) FROM OTO");
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

	public List<OtoVO> selectArticleList(int oto_startRow, int oto_pageSize) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<OtoVO> otoArticleList = null;
	      try {
	         pstmt = con.prepareStatement(""
	               + "SELECT list2.* FROM (SELECT ROWNUM r, list1.* "
	               + " FROM (SELECT * FROM OTO ORDER BY  cus_ref DESC, cus_re_step ASC) list1)"
	               + " list2 WHERE r BETWEEN ? AND ?");
	         pstmt.setInt(1, oto_startRow);
	         pstmt.setInt(2, oto_startRow+oto_pageSize-1);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	 otoArticleList = new ArrayList<OtoVO>();
	            do {
	            	OtoVO otoVO = new OtoVO();
	            	otoVO.setCus_oto_number(rs.getInt("cus_oto_number"));
	            	otoVO.setCus_oto_title(rs.getString("cus_oto_title"));
	            	otoVO.setCus_oto_date(rs.getTimestamp("cus_oto_date"));
	            	otoVO.setCus_oto_content(rs.getString("cus_oto_content"));
	            	otoVO.setUser_nickname(rs.getString("user_nickname"));
	            	otoVO.setCus_ref(rs.getInt("cus_ref"));
	            	otoVO.setCus_re_step(rs.getInt("cus_re_step"));
	            	otoVO.setCus_re_level(rs.getInt("cus_re_level"));
	            	otoArticleList.add(otoVO);
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
	      return otoArticleList;
	}

	public OtoVO selectArticle(int cus_oto_number) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        OtoVO otoArticle = null;
        try {
           
           pstmt = con.prepareStatement(""
                 + "SELECT * FROM OTO WHERE cus_oto_number = ?");
           pstmt.setInt(1, cus_oto_number);
           rs = pstmt.executeQuery();
           
           if(rs.next()) {
        	   otoArticle = new OtoVO();
        	   otoArticle.setCus_oto_number(rs.getInt("cus_oto_number"));
        	   otoArticle.setCus_oto_title(rs.getString("cus_oto_title"));
        	   otoArticle.setUser_nickname(rs.getString("User_nickname"));
        	   otoArticle.setCus_oto_date(rs.getTimestamp("cus_oto_date"));
        	   otoArticle.setCus_oto_content(rs.getString("cus_oto_content"));
        	   otoArticle.setCus_ref(rs.getInt("cus_ref"));
        	   otoArticle.setCus_re_step(rs.getInt("cus_re_step"));
        	   otoArticle.setCus_re_level(rs.getInt("cus_re_level"));
           }
           
        } catch (Exception e) {
           // TODO: handle exception
           e.printStackTrace();
        }
        finally {
           close(rs);
           close(pstmt);
        }
        
        return otoArticle;
	}

	public int deleteArticle(int cus_oto_number) {
		// TODO Auto-generated method stub
		int deleteCount = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "";

	    try {
	       pstmt = con.prepareStatement("SELECT * FROM OTO WHERE cus_oto_number = ?");
	       pstmt.setInt(1, cus_oto_number);
	       rs = pstmt.executeQuery();
	          
	       if(rs.next()) {
	    		   sql = "DELETE FROM OTO"
	    		   		+ " WHERE cus_oto_number = ?";
	    		   pstmt = con.prepareStatement(sql);
	    	       pstmt.setInt(1, cus_oto_number);
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

	public ArrayList<OtoVO> selectOtoList(String searchword1) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OtoVO> otosearchword = null;

		
		String sql = "select * from oto where cus_oto_title like ? OR cus_oto_content like ?";
		

		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchword1+"%");
			pstmt.setString(2, "%"+searchword1+"%");
			

			rs = pstmt.executeQuery();

			if (rs.next()) {

				otosearchword = new ArrayList<OtoVO>();
				OtoVO otoArticle = null;

				do {
					
					 otoArticle = new OtoVO();
		        	 otoArticle.setCus_oto_number(rs.getInt("cus_oto_number"));
		        	 otoArticle.setCus_oto_title(rs.getString("cus_oto_title"));
		        	 otoArticle.setUser_nickname(rs.getString("User_nickname"));
		        	 otoArticle.setCus_oto_date(rs.getTimestamp("cus_oto_date"));
		        	 otoArticle.setCus_oto_content(rs.getString("cus_oto_content"));
		        	 otoArticle.setCus_ref(rs.getInt("cus_ref"));
		        	 otoArticle.setCus_re_step(rs.getInt("cus_re_step"));
		        	 otoArticle.setCus_re_level(rs.getInt("cus_re_level"));
		        	 
		        	 otosearchword.add(otoArticle);
				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {

			close(rs);
			close(pstmt);
		}

		return otosearchword;
	}

	public ArrayList<OtoVO> selectMyOtoList(String user_id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OtoVO> myOtoList = null;
		
		
		String sql = "select * from oto where oto_user_id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
		
				myOtoList = new ArrayList<OtoVO>();
				OtoVO otoVO = null;
				
				do {
					
					otoVO = new OtoVO();
					
					otoVO.setCus_oto_content(rs.getString("cus_oto_content"));
					otoVO.setUser_nickname(rs.getString("user_nickname"));
					otoVO.setCus_oto_date(rs.getTimestamp("cus_oto_date"));
					otoVO.setCus_oto_number(rs.getInt("cus_oto_number"));
					otoVO.setCus_oto_title(rs.getString("cus_oto_title"));
					otoVO.setOto_user_id(rs.getString("oto_user_id"));
					
				
					myOtoList.add(otoVO);
					
				} while (rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			
			close(rs);
			close(pstmt);
		}
		
		return myOtoList;
	}

	public int deleteMyOto(int cus_oto_number, String user_id) {
	
		int deleteCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		
		try {
			pstmt = con.prepareStatement(""
					+ "SELECT * FROM oto");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			
			
			sql = "DELETE from oto "
					+ "WHERE cus_oto_number = ? and oto_user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cus_oto_number);
			pstmt.setString(2, user_id);
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
