package comm.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import comm.service.CommUpdateFormService;
import comm.vo.CommVO;
import vo.ActionForward;

public class CommUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int com_number = Integer.parseInt(request.getParameter("com_number"));
	      String com_pageNum = request.getParameter("com_pageNum");
	      
	      CommUpdateFormService commUpdateFormService = new CommUpdateFormService(); 
	      CommVO comArticle =  commUpdateFormService.getArtcticle(com_number);
	      
	      request.setAttribute("comArticle", comArticle);
	      request.setAttribute("com_pageNum", com_pageNum);
	      
	      ActionForward forward = new ActionForward();
	      forward.setUrl("comm/comm-update.jsp");
	      
	      
	      
	      return forward;
	}

}
