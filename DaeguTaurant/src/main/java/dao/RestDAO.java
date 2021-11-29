package dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.RestVO;

public class RestDAO {

	private Connection con;
	   //singleton ����
	   
	   private static RestDAO instance;
	   
	   private RestDAO() {}
	   
	   public static RestDAO getInstance() {
	      if(instance == null) {
	         instance = new RestDAO();
	      }
	      return instance;
	   }
	   
	   public void setConnection(Connection con) {
	      this.con = con;
	   }
	
	
	
	public int insertRest(RestVO restVO) throws Exception{
		
		 int insertCount = 0;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 int res_id = restVO.getRes_id();
		 int res_ref = restVO.getRes_ref();
	     int res_re_step = restVO.getRes_re_step();
	     int res_Addr1_ref = restVO.getRes_Addr1_ref();
	     
	     int number = 0;
	     String sql = "";
		    
		    
		    try {
		    	 pstmt = con.prepareStatement("SELECT MAX(res_id) FROM restaurant");
		         rs = pstmt.executeQuery();
   
		         if(rs.next()) { 
		            number = rs.getInt(1) + 1;
		         } else {
		            number = 1;
		         }
		         
		         if(res_id != 0) {
		         
		            sql = "UPDATE restaurant SET res_re_step = res_re_step + 1 WHERE res_ref = ? AND res_re_step > ? AND res_Addr1_ref > ?";
		          
		            pstmt = con.prepareStatement(sql);
		            pstmt.setInt(1, res_ref);
		            pstmt.setInt(2, res_re_step);
		            pstmt.setInt(3, res_Addr1_ref);
		            pstmt.executeUpdate();
		            
		            res_re_step = res_re_step + 1;
		           
		         }
		         else {
		        	 res_ref = number;
		        	 res_re_step = 0;
		            
		         }
		         sql = "INSERT INTO restaurant(res_id, res_name, res_score,"
		        		 + "res_category, res_mainmenu, res_number, res_Addr1, res_Addr2, res_hours, res_ref, "
		        		 + "res_re_step,res_notice_date,res_Addr1_ref, res_pic, res_readcount) "
		        		 + "VALUES(restaurant_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,0)";
		    	
		       pstmt = con.prepareStatement(sql);
		       pstmt.setString(1, restVO.getRes_name());
		       pstmt.setDouble(2, restVO.getRes_score());
		       pstmt.setString(3, restVO.getRes_category());
		       pstmt.setString(4, restVO.getRes_mainmenu());
		       pstmt.setString(5, restVO.getRes_number());
		       pstmt.setString(6, restVO.getRes_Addr1());
		       pstmt.setString(7, restVO.getRes_Addr2());
		       pstmt.setString(8, restVO.getRes_hours());
		       pstmt.setInt(9, res_ref);
		       pstmt.setInt(10, res_re_step);
		       pstmt.setTimestamp(11, restVO.getRes_notice_date());
		       pstmt.setInt(12,res_Addr1_ref);
		       pstmt.setString(13, restVO.getRes_pic());
		       
		    
		      
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

	
	

	public RestVO selectRest(int res_id) throws Exception{
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RestVO restVO = null;
		String sql = "";

		try {
			
			sql = " UPDATE restaurant SET res_readcount = res_readcount + 1 WHERE res_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, res_id);
			int updateCount = pstmt.executeUpdate();
			if(updateCount > 0) {
				commit(con);
				
			}
			
			else {
				rollback(con);
				
			}
			sql = "SELECT * FROM restaurant WHERE res_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, res_id);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
					
					restVO = new RestVO();
					
					restVO.setRes_Addr1(rs.getString("res_Addr1"));
					restVO.setRes_Addr2(rs.getString("res_Addr2"));
					restVO.setRes_category(rs.getString("res_category"));
					restVO.setRes_hours(rs.getString("res_hours"));
					restVO.setRes_id(rs.getInt("res_id"));
					restVO.setRes_mainmenu(rs.getString("res_mainmenu"));
					restVO.setRes_name(rs.getString("res_name"));
					restVO.setRes_number(rs.getString("res_number"));
					restVO.setRes_pic(rs.getString("res_pic"));
					
					restVO.setRes_re_step(rs.getInt("res_re_step"));
					restVO.setRes_readcount(rs.getInt("res_readcount"));
					restVO.setRes_score(rs.getInt("res_score"));
					restVO.setRes_ref(rs.getInt("res_ref"));
					restVO.setRes_Addr1_ref(rs.getInt("res_Addr1_ref"));
					restVO.setRes_notice_date(rs.getTimestamp("res_notice_date"));
					
					
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			
			close(rs);
			close(pstmt);
		}

		return restVO;
	}

	
	
	public ArrayList<RestVO> selectRestList() {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RestVO> restList = null;
		String sql = "select * from RESTAURANT";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
		
				restList = new ArrayList<RestVO>();
				RestVO restVO = null;
				
				do {
					

					
					restVO = new RestVO();
					
					restVO.setRes_Addr1(rs.getString("res_Addr1"));
					restVO.setRes_Addr2(rs.getString("res_Addr2"));
					restVO.setRes_category(rs.getString("res_category"));
					restVO.setRes_hours(rs.getString("res_hours"));
					restVO.setRes_id(rs.getInt("res_id"));
					restVO.setRes_mainmenu(rs.getString("res_mainmenu"));
					restVO.setRes_name(rs.getString("res_name"));
					restVO.setRes_number(rs.getString("res_number"));
					restVO.setRes_pic(rs.getString("res_pic"));
					
					restVO.setRes_re_step(rs.getInt("res_re_step"));
					restVO.setRes_readcount(rs.getInt("res_readcount"));
					restVO.setRes_score(rs.getInt("res_score"));
					restVO.setRes_ref(rs.getInt("res_ref"));
					restVO.setRes_Addr1_ref(rs.getInt("res_Addr1_ref"));
					restVO.setRes_notice_date(rs.getTimestamp("res_notice_date"));
					
					
					restList.add(restVO);
					
				} while (rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			
			close(rs);
			close(pstmt);
		}
		
		return restList;
	}
	public RestVO selectUpdateRestArticle(int res_id) throws Exception{
		// TODO Auto-generated method stub
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				RestVO restarticle = null;
				try {
						
					pstmt = con.prepareStatement(""
							+ "SELECT * FROM RESTAURANT WHERE res_id = ?");
					pstmt.setInt(1, res_id);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						restarticle = new RestVO();
						restarticle.setRes_Addr1(rs.getString("res_Addr1"));
						restarticle.setRes_Addr2(rs.getString("res_Addr2"));
						restarticle.setRes_category(rs.getString("res_category"));
						restarticle.setRes_hours(rs.getString("res_hours"));
						restarticle.setRes_id(rs.getInt("res_id"));
						restarticle.setRes_mainmenu(rs.getString("res_mainmenu"));
						restarticle.setRes_name(rs.getString("res_name"));
						restarticle.setRes_number(rs.getString("res_number"));
						restarticle.setRes_pic(rs.getString("res_pic"));
					//	restVO.setRes_pic1(rs.getString("res_pic1"));
						restarticle.setRes_re_step(rs.getInt("res_re_step"));
						restarticle.setRes_readcount(rs.getInt("res_readcount"));
						restarticle.setRes_score(rs.getInt("res_score"));
						restarticle.setRes_ref(rs.getInt("res_ref"));
						restarticle.setRes_Addr1_ref(rs.getInt("res_Addr1_ref"));
						restarticle.setRes_notice_date(rs.getTimestamp("res_notice_date"));
					}
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				finally {
					close(rs);
					close(pstmt);
				}
				
				return restarticle;	
	}

	public int updateRestArticle(RestVO restVO){
		int updateCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
	
		try {
			pstmt = con.prepareStatement(""
					+ "SELECT * FROM RESTAURANT WHERE res_id = ?");
			pstmt.setInt(1, restVO.getRes_id());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			
					
					sql = "UPDATE RESTAURANT SET res_name = ?, res_Addr1 = ?, res_category = ?, res_mainmenu = ?"
							+ ",res_number = ?,res_Addr2 = ?,res_hours = ? "
							+ " WHERE res_id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, restVO.getRes_name());
					pstmt.setString(2, restVO.getRes_Addr1());
					pstmt.setString(3, restVO.getRes_category());
					pstmt.setString(4, restVO.getRes_mainmenu());
					pstmt.setString(5, restVO.getRes_number());
					pstmt.setString(6, restVO.getRes_Addr2());
					pstmt.setString(7, restVO.getRes_hours());
					pstmt.setInt(8, restVO.getRes_id());
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


