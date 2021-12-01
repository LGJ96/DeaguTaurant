package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;

import dao.OtoDAO;
import servicecenter.vo.OtoVO;

public class ServiceCenterOtoListService {

	public int getArticleCount() throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		OtoDAO otoDAO = OtoDAO.getInstance();
		otoDAO.setConnection(con);
		
		int articleCount = otoDAO.selectArticleCount();
		close(con);
		return articleCount;
	}

	public List<OtoVO> getArticleCount(int oto_startRow, int oto_pageSize) throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		OtoDAO otoDAO = OtoDAO.getInstance();
		otoDAO.setConnection(con);
		
		List<OtoVO> otoArticleList = otoDAO.selectArticleList(oto_startRow, oto_pageSize);
		close(con);
		
		
		return otoArticleList;
	}

}
