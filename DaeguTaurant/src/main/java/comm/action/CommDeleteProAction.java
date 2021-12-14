package comm.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import comm.service.CommDeleteProService;
import vo.ActionForward;

public class CommDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int com_number = Integer.parseInt(request.getParameter("com_number"));
		String com_pageNum = request.getParameter("com_pageNum");
		
		CommDeleteProService commDeleteProService = new CommDeleteProService();
		boolean deleteSuccess = commDeleteProService.deleteArticle(com_number);
		
		ActionForward forward = null;
		if(deleteSuccess) {
			forward = new ActionForward();
			forward.setUrl("commList.dae");
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
