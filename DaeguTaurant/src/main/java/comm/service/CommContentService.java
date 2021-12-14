package comm.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import comm.vo.CommVO;
import dao.CommDAO;

public class CommContentService {

	public CommVO getArticle(int com_number) throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		
		CommVO comArticle = commDAO.selectArticle(com_number);
		close(con);
		
		return comArticle;
	}

}
