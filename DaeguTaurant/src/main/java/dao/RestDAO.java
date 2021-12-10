package dao;

import static db.JdbcUtil.*;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.RestVO;
import vo.ReviewVO;

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
	
	
	
	public int insertRest(RestVO restVO,ReviewVO reviewVO) throws Exception{
		
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
		         sql = "INSERT INTO restaurant(res_id, res_name, res_totalscore,"
		        		 + "res_category, res_mainmenu, res_number, res_Addr1, res_Addr2, res_hours, res_ref, "
		        		 + "res_re_step,res_notice_date,res_Addr1_ref, res_pic, res_readcount) "
		        		 + "VALUES(restaurant_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,0)";
		    	
		       pstmt = con.prepareStatement(sql);
		       
		       pstmt.setString(1, restVO.getRes_name());
		       pstmt.setDouble(2, restVO.getRes_totalscore() );
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
					restVO.setRes_totalscore(rs.getDouble("res_totalscore"));
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
					restVO.setRes_totalscore(rs.getDouble("res_totalscore"));
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
						restarticle.setRes_totalscore(rs.getDouble("res_totalscore"));
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


	public ArrayList<RestVO> selectRestWordList(String searchword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RestVO> restsearchwordList = null;

		
		String sql = "select * from RESTAURANT where res_name like ? OR res_category like ? OR res_Addr1 like ? OR res_mainmenu like ?";
		

		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchword+"%");
			pstmt.setString(2, "%"+searchword+"%");
			pstmt.setString(3, searchword+"%");
			pstmt.setString(4, "%"+searchword+"%");

			rs = pstmt.executeQuery();

			if (rs.next()) {

				restsearchwordList = new ArrayList<RestVO>();
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
					restVO.setRes_totalscore(rs.getDouble("res_totalscore"));
					restVO.setRes_ref(rs.getInt("res_ref"));
					restVO.setRes_Addr1_ref(rs.getInt("res_Addr1_ref"));
					restVO.setRes_notice_date(rs.getTimestamp("res_notice_date"));

					restsearchwordList.add(restVO);
				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {

			close(rs);
			close(pstmt);
		}

		return restsearchwordList;
	}

	public int selectRestCount() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int restCount = 0;
		try {
		   pstmt = con.prepareStatement("SELECT COUNT(*) FROM restaurant");
		   rs = pstmt.executeQuery();
		      
		    if(rs.next()) {
		    	restCount = rs.getInt(1);
		     }
		 } catch (Exception e) {
		      // TODO: handle exception
		      e.printStackTrace();
		 }
		 return restCount;
		 }

	
	public List<RestVO> selectRestCountList(int rest_startRow, int rest_pageSize) throws Exception {
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 List<RestVO> restListt = null;
		 String sql = "";
		
		   try {
		      
		      pstmt = con.prepareStatement(""
		            + "SELECT list2.* FROM (SELECT ROWNUM r, list1.* "
		            + " FROM (SELECT * FROM restaurant ORDER BY res_readCount DESC, res_Addr1 ASC) list1)"
		            + " list2 WHERE r BETWEEN ? AND ?");
		      pstmt.setInt(1, rest_startRow);
		      pstmt.setInt(2, rest_startRow + rest_pageSize -1);
		      rs = pstmt.executeQuery();
		      
		      if(rs.next()) {
		    	  restListt = new ArrayList<RestVO>();
		    	
		         do {
		        	 
		
		        	RestVO restVO = new RestVO();
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
					restVO.setRes_totalscore(rs.getDouble("res_totalscore"));
					restVO.setRes_ref(rs.getInt("res_ref"));
					restVO.setRes_Addr1_ref(rs.getInt("res_Addr1_ref"));
					restVO.setRes_notice_date(rs.getTimestamp("res_notice_date"));
					
					restListt.add(restVO);
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

		   return restListt;
		
	}



	// ======================================================테마/지역=================================================

	// 각 식당 각 테마
		public ArrayList<RestVO> selectRest1eachCheckSearch(String area, String category) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<RestVO> rest1eachchecksearch = null;
			String sql = "";

			try {

				if (category == null) {
					sql = "select * from RESTAURANT where res_Addr1 like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, area);

				}

				else if (area == null) {
					sql = "select * from RESTAURANT where res_category like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, category);

				}

				else {
					sql = "select * from RESTAURANT where res_Addr1 like ? AND res_category like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, area);
					pstmt.setString(2, category);

				}

				rs = pstmt.executeQuery();

				if (rs.next()) {

					rest1eachchecksearch = new ArrayList<RestVO>();
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
						restVO.setRes_totalscore(rs.getDouble("res_totalscore"));
						restVO.setRes_ref(rs.getInt("res_ref"));
						restVO.setRes_Addr1_ref(rs.getInt("res_Addr1_ref"));
						restVO.setRes_notice_date(rs.getTimestamp("res_notice_date"));
						rest1eachchecksearch.add(restVO);

					} while (rs.next());

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			finally {

				close(rs);
				close(pstmt);
			}

			return rest1eachchecksearch;
		}

		public ArrayList<RestVO> selectRest3areaCheckSearch(String[] arealist, String[] categorylist) throws Exception {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<RestVO> rest3areachecksearch = null;
			String sql = "";

			try {
				// 지역 3개
				if (arealist.length == 3 && categorylist == null) {
					sql = "select * from RESTAURANT where res_Addr1 like ? OR res_Addr1 like ? OR res_Addr1 like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, arealist[0]);
					pstmt.setString(2, arealist[1]);
					pstmt.setString(3, arealist[2]);
				}

				// 지역 2개
				else if (arealist.length == 2 && categorylist == null) {
					sql = "select * from RESTAURANT where res_Addr1 like ? OR res_Addr1 like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, arealist[0]);
					pstmt.setString(2, arealist[1]);
				}
				
				// 테마 1, 지역 2
				else if ( arealist.length == 2 && categorylist.length == 1) {
					sql = "select * from RESTAURANT where((res_Addr1 like ? OR res_Addr1 like ?)AND res_category like ?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, arealist[0]);
					pstmt.setString(2,arealist[1]);
					pstmt.setString(3, categorylist[0]);
					

				}
				 

				// 테마 2, 지역 2
				else if (categorylist.length == 2 && arealist.length == 2) {
					sql = "select * from RESTAURANT where (( res_category like ? OR res_category like ? )AND(res_Addr1 like ? OR res_Addr1 like ?))";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, categorylist[0]);
					pstmt.setString(2, categorylist[1]);
					pstmt.setString(3, arealist[0]);
					pstmt.setString(4, arealist[1]);
				}
				
				// 테마 2 , 지역1
				else if (categorylist.length == 2 && arealist.length == 1) {
					sql = "select * from RESTAURANT where ((res_category like ? OR res_category like ?) AND res_Addr1 like ?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, categorylist[0]);
					pstmt.setString(2, categorylist[1]);
					pstmt.setString(3, arealist[0]);

				}
				

				rs = pstmt.executeQuery();

				if (rs.next()) {

					rest3areachecksearch = new ArrayList<RestVO>();
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
						restVO.setRes_totalscore(rs.getDouble("res_totalscore"));
						restVO.setRes_ref(rs.getInt("res_ref"));
						restVO.setRes_Addr1_ref(rs.getInt("res_Addr1_ref"));
						restVO.setRes_notice_date(rs.getTimestamp("res_notice_date"));

						rest3areachecksearch.add(restVO);

					} while (rs.next());

				}

			}

			catch (Exception e) {
				e.printStackTrace();

			}

			finally {

				close(rs);
				close(pstmt);

			}

			return rest3areachecksearch;
		}

		public ArrayList<RestVO> selectRest2categoryCheckSearch(String[] categorylist, String[] arealist) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<RestVO> rest2categorychecksearch = null;
			String sql = "";

			try {
				// 1.지역 3개
				if (categorylist.length == 2 && arealist == null) {
					sql = "select * from RESTAURANT where res_category like ? OR res_category like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, categorylist[0]);
					pstmt.setString(2, categorylist[1]);
				}

			

				rs = pstmt.executeQuery();

				if (rs.next()) {

					rest2categorychecksearch = new ArrayList<RestVO>();
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
						restVO.setRes_totalscore(rs.getDouble("res_totalscore"));
						restVO.setRes_ref(rs.getInt("res_ref"));
						restVO.setRes_Addr1_ref(rs.getInt("res_Addr1_ref"));
						restVO.setRes_notice_date(rs.getTimestamp("res_notice_date"));

						rest2categorychecksearch.add(restVO);

					} while (rs.next());

				}

			}

			catch (Exception e) {
				e.printStackTrace();

			}

			finally {

				close(rs);
				close(pstmt);

			}

			return rest2categorychecksearch;
		}

}
	
	
	
	
	
	



