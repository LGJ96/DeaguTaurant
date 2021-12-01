package servicecenter.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servicecenter.service.FaqUpdateFormService;
import Info.action.Action;
import vo.ActionForward;
import servicecenter.vo.FaqVO;

public class Faq_updateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int cus_faq_number = Integer.parseInt(request.getParameter("cus_faq_number"));
	      String faq_pageNum = request.getParameter("faq_pageNum");
	      
	      FaqUpdateFormService faqUpdateService = new FaqUpdateFormService(); 
	      FaqVO faqArticle =  faqUpdateService.getArtcticle(cus_faq_number);
	      
	      request.setAttribute("faqArticle", faqArticle);
	      request.setAttribute("faq_pageNum", faq_pageNum);
	      
	      ActionForward forward = new ActionForward();
	      forward.setUrl("servicecenter/faq-update.jsp");
	      
	      
	      
	      return forward;
	}

}
