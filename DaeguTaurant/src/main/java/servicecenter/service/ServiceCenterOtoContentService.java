package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.OtoDAO;
import servicecenter.vo.OtoVO;

public class ServiceCenterOtoContentService {

	public OtoVO getArticle(int cus_oto_number) throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		OtoDAO otoDAO = OtoDAO.getInstance();
		otoDAO.setConnection(con);
		
		OtoVO otoArticle = otoDAO.selectArticle(cus_oto_number);
		close(con);
		
		return otoArticle;
	}

}
