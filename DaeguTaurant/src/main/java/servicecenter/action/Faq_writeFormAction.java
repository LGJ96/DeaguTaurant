package servicecenter.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import vo.ActionForward;
import servicecenter.vo.FaqReplyVO;

public class Faq_writeFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int cus_faq_number = 0;
		if(request.getParameter("cus_faq_number") !=null) {
			cus_faq_number = Integer.parseInt(request.getParameter("cus_faq_number"));
			
		}
		
		FaqReplyVO faqReplyVO = new FaqReplyVO();
		faqReplyVO.setCus_faq_number(cus_faq_number);
		
		
		request.setAttribute("faqReplyVO", faqReplyVO);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("servicecenter/faq-write.jsp");
		return forward;
	}

}
