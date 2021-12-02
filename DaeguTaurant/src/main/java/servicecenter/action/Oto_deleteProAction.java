package servicecenter.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import servicecenter.service.OtoDeleteProService;
import vo.ActionForward;

public class Oto_deleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int cus_oto_number = Integer.parseInt(request.getParameter("cus_oto_number"));
		String oto_pageNum = request.getParameter("oto_pageNum");
		
		OtoDeleteProService otoDeleteProService = new OtoDeleteProService();
		boolean deleteSuccess = otoDeleteProService.deleteArticle(cus_oto_number);
		
		ActionForward forward = null;
		if(deleteSuccess) {
			forward = new ActionForward();
			forward.setUrl("servicecenter/question-close.jsp");
			forward.setRedirect(true);
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("arert('실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		return forward;
	}

}
