package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.FaqDAO;
import servicecenter.vo.FaqVO;

public class FaqUpdateFormService {

	public FaqVO getArtcticle(int cus_faq_number) throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
        FaqDAO faqDAO = FaqDAO.getInstance();
        faqDAO.setConnection(con);
        
        FaqVO faqArticle = faqDAO.selectUpdateArticle(cus_faq_number);
        close(con);
     return faqArticle;
	}

}
