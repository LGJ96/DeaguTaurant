package servicecenter.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import vo.ActionForward;

public class Notice_deleteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int cus_notice_number = Integer.parseInt(request.getParameter("cus_notice_number"));
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("cus_notice_number", cus_notice_number);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("servicecenter/notice-delete.jsp");
		return forward;
	}

}
