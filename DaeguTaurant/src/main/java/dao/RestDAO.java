package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		 
		 int id = restVO.getRes_id();
		 int ref = restVO.getRes_ref();
	      int re_step = restVO.getRes_re_step();
	      int number = 0;
	      String sql = "";
		    
		    
		    try {
		    	 pstmt = con.prepareStatement("SELECT MAX(id) FROM restaurant");
		         rs = pstmt.executeQuery();
		         //���� �ۼ��� ���� ������ �ִ밪�� ���ڵ尡 ����.
		         
		         if(rs.next()) { //���ݱ��� �ۼ��� ���� �ϳ��� ������...
		            number = rs.getInt(1) + 1;
		         } else {
		            number = 1;
		         }
		         
		         if(id != 0) {
		            //�ۼ��� ���� ����̸�...
		            sql = "UPDATE restaurant SET re_step = re_step + 1 WHERE ref = ? AND re_step > ?";
		            //�亯�� �޷��� ������ ref ���� ���� ref ���� ������ �ְ�, �亯�� �޷��� ������ 
		            //re_step ������ ū re_step ���� ������ �ִ� �۵��� re_step ���� 1�� �������Ѷ�
		            pstmt = con.prepareStatement(sql);
		            pstmt.setInt(1, ref);
		            pstmt.setInt(2, re_step);
		            pstmt.executeUpdate();
		            
		            re_step = re_step + 1;
		           
		         }
		         else {
		            ref = number;
		            re_step = 0;
		            
		         }
		         sql = "INSERT INTO restaurant(res_id, res_name, res_score,"
		        		 + "res_category, res_mainmenu, res_number, res_Addr1, res_Addr2, res_hours, res_ref, "
		        		 + "res_re_step,res_notice_date,res_readcount) "
		        		 + "VALUES(restaurant_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,0)";
		    	
		       pstmt = con.prepareStatement(sql);
		       pstmt.setString(1, restVO.getRes_name());
		       pstmt.setDouble(2, restVO.getRes_score());
		       //pstmt.setString(3, restVO.getRes_pic());
		       pstmt.setString(4, restVO.getRes_category());
		       pstmt.setString(5, restVO.getRes_mainmenu());
		       pstmt.setString(6, restVO.getRes_Addr1());
		       pstmt.setString(7, restVO.getRes_Addr2());
		       pstmt.setString(8, restVO.getRes_hours());
		       pstmt.setInt(9, ref);
		       pstmt.setInt(10, re_step);
		       pstmt.setTimestamp(11, restVO.getRes_notice_date());
		      

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
	
	
}


