package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;

import dao.FaqDAO;
import servicecenter.vo.FaqVO;

public class ServiceCenterFaqListService {

	public int getArticleCount() throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		FaqDAO faqDAO = FaqDAO.getInstance();
		faqDAO.setConnection(con);
		
		int articleCount = faqDAO.selectArticleCount();
		close(con);
		return articleCount;
	}

	public List<FaqVO> getArticleCount(int faq_startRow, int faq_pageSize) throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		FaqDAO faqDAO = FaqDAO.getInstance();
		faqDAO.setConnection(con);
		
		List<FaqVO> articleList = faqDAO.selectArticleList(faq_startRow, faq_pageSize);
		close(con);
		
		
		return articleList;
	}

}
