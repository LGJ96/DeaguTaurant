package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.FaqDAO;


public class FaqDeleteProService {

	public boolean deleteArticle(int cus_faq_number) throws Exception {
		// TODO Auto-generated method stub
		boolean deleteSuccess = false;
		Connection con = getConnection();
        FaqDAO faqDAO = FaqDAO.getInstance();
        faqDAO.setConnection(con);
        
        int deleteCount = faqDAO.deleteArticle(cus_faq_number);
        if(deleteCount > 0) {
           deleteSuccess = true;
           commit(con);
        }
        else {
           rollback(con);
        }      
        close(con);
		return deleteSuccess;
	}

}
