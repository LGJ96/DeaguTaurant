package servicecenter.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import vo.ActionForward;

public class Faq_deleteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int cus_faq_number = Integer.parseInt(request.getParameter("cus_faq_number"));
		String faq_pageNum = request.getParameter("faq_pageNum");
		
		request.setAttribute("cus_faq_number", cus_faq_number);
		request.setAttribute("faq_pageNum", faq_pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("servicecenter/faq-delete.jsp");
		return forward;
	}

}
