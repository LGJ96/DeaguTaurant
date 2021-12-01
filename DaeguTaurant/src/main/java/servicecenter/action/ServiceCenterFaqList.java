package servicecenter.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servicecenter.service.ServiceCenterFaqListService;
import Info.action.Action;
import vo.ActionForward;
import servicecenter.vo.FaqPageVO;
import servicecenter.vo.FaqVO;

public class ServiceCenterFaqList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int faq_pageSize = 10; 
		String faq_pageNum= request.getParameter("faq_pageNum");
		if(faq_pageNum == null) {
			
			faq_pageNum = "1"; 
		}
		
		int faq_currentPage = Integer.parseInt(faq_pageNum);
		
		int faq_startRow = (faq_currentPage -1 ) * faq_pageSize +1;
		
		int faq_count = 0;
		int faq_number = 0;
		
		ServiceCenterFaqListService serviceCenterFaqListService =  new ServiceCenterFaqListService();
		List<FaqVO> faqArticleList = null;
		faq_count = serviceCenterFaqListService.getArticleCount();
		
		if(faq_count > 0) {
			faqArticleList = serviceCenterFaqListService.getArticleCount(faq_startRow, faq_pageSize);
			
		}
		
		faq_number = faq_count -(faq_currentPage -1 )* faq_pageSize;
		
		int faq_pageCount = 0; 
		int faq_startPage = 0;
		int faq_endPage = 0;
		
		if(faq_count > 0) {
			faq_pageCount = faq_count / faq_pageSize + (faq_count % faq_pageSize == 0 ? 0 : 1);
			
			faq_startPage = (int)((faq_currentPage - 1) / 10) * 10 + 1;
			
			faq_endPage = faq_startPage + 9;
			
			if(faq_endPage > faq_pageCount) {
				faq_endPage = faq_pageCount;
				
			}
		}
		
		request.setAttribute("faqArticleList", faqArticleList);
		FaqPageVO faqPageVO = new FaqPageVO();
			
		faqPageVO.setFaq_currentPage(faq_currentPage);
		faqPageVO.setFaq_endPage(faq_endPage);
		faqPageVO.setFaq_count(faq_count);
		faqPageVO.setFaq_number(faq_number);
		faqPageVO.setFaq_pageCount(faq_pageCount);
		faqPageVO.setFaq_startPage(faq_startPage);
			
		request.setAttribute("faqPageVO", faqPageVO);
		ActionForward forward = new ActionForward();
		forward.setUrl("servicecenter/servicecenterFaq.jsp");
		return forward;
	}

}
