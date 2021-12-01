package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.FaqDAO;
import servicecenter.vo.FaqVO;

public class FaqUpdateProService {

	public boolean modifyArticle(FaqVO faqVO) throws Exception {
		// TODO Auto-generated method stub
		boolean modifySuccess = false;
		Connection con = getConnection();
		FaqDAO faqDAO = FaqDAO.getInstance();
		faqDAO.setConnection(con);
		
		int updateCount = faqDAO.updateArticle(faqVO);
		
		if(updateCount > 0) {
			commit(con);
			modifySuccess = true;
		}
		else {
			rollback(con);
		}
		return modifySuccess;
	}

}
