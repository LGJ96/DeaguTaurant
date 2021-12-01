package servicecenter.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servicecenter.service.FaqUpdateProService;
import Info.action.Action;
import vo.ActionForward;
import servicecenter.vo.FaqVO;

public class Faq_updateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		FaqVO faqVO = new FaqVO();
		faqVO.setCus_faq_number(Integer.parseInt(request.getParameter("cus_faq_number")));
		faqVO.setCus_faq_title(request.getParameter("cus_faq_title"));
		faqVO.setCus_faq_date(new Timestamp(System.currentTimeMillis()));
		faqVO.setCus_faq_content(request.getParameter("cus_faq_content"));
	    
	    FaqUpdateProService faqUpdateProService = new FaqUpdateProService();
	      
	    boolean modifySuccess = faqUpdateProService.modifyArticle(faqVO);
	      
	    ActionForward forward = null;
	    if(modifySuccess) {
	       forward = new ActionForward();
	       forward.setUrl("serviceCenterFaqList.dae");
	       forward.setRedirect(true);
	    }
	    else {
	       response.setContentType("text/html;charset=UTF-8");
	       PrintWriter out = response.getWriter();
	       out.println("<script>");
	       out.println("alert('등록실패')");
	       out.println("history.back();");
	       out.println("</script>");
	    }
	    return forward;
	}

}
