package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.FaqDAO;
import servicecenter.vo.FaqVO;

public class Faq_WriteProService {

	public boolean registArticle(FaqVO faqVO) throws Exception {
		// TODO Auto-generated method stub
		boolean registSuccess = false;
        Connection con = getConnection();
        FaqDAO faqDAO = FaqDAO.getInstance();
        faqDAO.setConnection(con);
        
        int insertCount = faqDAO.insertArticle(faqVO);
        if(insertCount > 0) {
           registSuccess = true;
           commit(con);
        }
        else {
           rollback(con);
        }
        close(con);
        return registSuccess;
	}

}
