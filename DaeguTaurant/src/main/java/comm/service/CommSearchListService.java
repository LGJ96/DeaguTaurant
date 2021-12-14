package comm.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.List;

import comm.vo.CommVO;
import dao.CommDAO;

public class CommSearchListService {

	public int getComCount() throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		 
		int comCount = commDAO.selectComCount();
		close(con);
			
		return comCount;
	}

	public List<CommVO> getComCountList(int com_startRow, int com_pageSize) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		
		List<CommVO> comListt = commDAO.selectComCountList(com_startRow, com_pageSize);
		close(con);
		
		return comListt;
	}

}
