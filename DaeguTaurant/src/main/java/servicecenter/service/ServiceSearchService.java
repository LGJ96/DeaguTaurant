package servicecenter.service;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.FaqDAO;
import dao.NoticeDAO;
import dao.OtoDAO;
import servicecenter.vo.FaqVO;
import servicecenter.vo.NoticeVO;
import servicecenter.vo.OtoVO;
import vo.RestVO;

public class ServiceSearchService {

	public ArrayList<FaqVO> getFaqSearch(String searchword1) {
		
		Connection con = getConnection();
		FaqDAO faqDAO = FaqDAO.getInstance();
		faqDAO.setConnection(con);
		
		ArrayList<FaqVO> faqsearch = faqDAO.selectFaqList(searchword1);
		
		return faqsearch;
	}

	public ArrayList<OtoVO> getOtoSearch(String searchword1) {
		Connection con = getConnection();
		OtoDAO otoDAO = OtoDAO.getInstance();
		otoDAO.setConnection(con);
		
		ArrayList<OtoVO> otosearchword = otoDAO.selectOtoList(searchword1);
		
		return otosearchword;
	}

	public ArrayList<NoticeVO> getNoticeSearch(String searchword1) {
		Connection con = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(con);
		
		ArrayList<NoticeVO> noticesearchword = noticeDAO.selectNoticeList(searchword1);
		return noticesearchword;
	}

}
