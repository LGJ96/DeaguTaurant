package servicecenter.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import rest.service.RestSearchService;
import servicecenter.service.ServiceCenterListService;
import servicecenter.service.ServiceSearchListService;
import servicecenter.service.ServiceSearchService;
import servicecenter.vo.FaqVO;
import servicecenter.vo.NoticeVO;
import servicecenter.vo.OtoVO;
import servicecenter.vo.PageVO;
import servicecenter.vo.SearchPageVO;
import vo.ActionForward;
import vo.RestVO;

public class ServiceSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String searchword1 = request.getParameter("searchword1");
	  	
	  	ServiceSearchService serviceSearchService = new ServiceSearchService();
	  	
	  	ArrayList<FaqVO> faqsearch = serviceSearchService.getFaqSearch(searchword1);
	  	ArrayList<OtoVO> otosearchword = serviceSearchService.getOtoSearch(searchword1);
	  	ArrayList<NoticeVO> noticesearchword = serviceSearchService.getNoticeSearch(searchword1);
	  	
	  	
	  	int sea_pageSize = 10;
		String sea_pageNum= request.getParameter("sea_pageNum");
		if(sea_pageNum == null) {
			
			sea_pageNum = "1"; 
		}
		
		int sea_currentPage = Integer.parseInt(sea_pageNum);
		
		
		int sea_startRow = (sea_currentPage -1 ) * sea_pageSize +1;
		
		
		int sea_count = 0;
		int sea_number = 0;
		
		ServiceSearchListService serviceSearchListService =  new ServiceSearchListService();
		List<NoticeVO> articleListt = null;
		sea_count = serviceSearchListService.getSearchCount();
		
		if(sea_count > 0) {
			articleListt = serviceSearchListService.getSearchCount(sea_startRow, sea_pageSize);
			
		}
		
		sea_number = sea_count -(sea_currentPage -1 )* sea_pageSize;
		
		int sea_pageCount = 0; 
		int sea_startPage = 0;
		int sea_endPage = 0;
		
		if(sea_count > 0) {
			sea_pageCount = sea_count / sea_pageSize + (sea_count % sea_pageSize == 0 ? 0 : 1);
			
			sea_startPage = (int)((sea_currentPage - 1) / 10) * 10 + 1;
			
			sea_endPage = sea_startPage + 9;
			
			if(sea_endPage > sea_pageCount) {
				sea_endPage = sea_pageCount;
				
			}
		}
		
		request.setAttribute("articleListt", articleListt);
		SearchPageVO searchPageVO = new SearchPageVO();
			
		searchPageVO.setSea_currentPage(sea_currentPage);
		searchPageVO.setSea_endPage(sea_endPage);
		searchPageVO.setSea_count(sea_count);
		searchPageVO.setSea_number(sea_number);
		searchPageVO.setSea_pageCount(sea_pageCount);
		searchPageVO.setSea_startPage(sea_startPage);
			
		request.setAttribute("searchPageVO", searchPageVO);
	  	
	  	
	  	
		HttpSession session = request.getSession();
		
		session.setAttribute("searchword1", searchword1);
		session.setAttribute("faqsearch", faqsearch);
		session.setAttribute("otosearchword", otosearchword);
		session.setAttribute("noticesearchword", noticesearchword);
		
		ActionForward forward = new ActionForward();
		      
		forward.setUrl("servicecenter/servicecenter-search-notice.jsp");
		    
		return forward;
		
	}

}
