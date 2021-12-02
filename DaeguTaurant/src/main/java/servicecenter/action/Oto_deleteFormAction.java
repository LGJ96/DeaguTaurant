package servicecenter.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import vo.ActionForward;

public class Oto_deleteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int cus_oto_number = Integer.parseInt(request.getParameter("cus_oto_number"));
		String oto_pageNum = request.getParameter("oto_pageNum");
		
		request.setAttribute("cus_oto_number", cus_oto_number);
		request.setAttribute("oto_pageNum", oto_pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("servicecenter/oto-delete.jsp");
		return forward;
	}


}
