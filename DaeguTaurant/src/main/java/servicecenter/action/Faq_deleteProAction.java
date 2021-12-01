package servicecenter.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servicecenter.service.FaqDeleteProService;
import Info.action.Action;
import vo.ActionForward;

public class Faq_deleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int cus_faq_number = Integer.parseInt(request.getParameter("cus_faq_number"));
		String faq_pageNum = request.getParameter("faq_pageNum");
		
		FaqDeleteProService faqDeleteProService = new FaqDeleteProService();
		boolean deleteSuccess = faqDeleteProService.deleteArticle(cus_faq_number);
		
		ActionForward forward = null;
		if(deleteSuccess) {
			forward = new ActionForward();
			forward.setUrl("servicecenter/notice-close.jsp");
			forward.setRedirect(true);
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("arert('삭제실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		return forward;
	}

}
