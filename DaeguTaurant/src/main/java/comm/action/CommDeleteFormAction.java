package comm.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import vo.ActionForward;

public class CommDeleteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int com_number = Integer.parseInt(request.getParameter("com_number"));
		String com_pageNum = request.getParameter("com_pageNum");
		
		request.setAttribute("com_number", com_number);
		request.setAttribute("com_pageNum", com_pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("comm/comm-delete.jsp");
		return forward;
	}

}
