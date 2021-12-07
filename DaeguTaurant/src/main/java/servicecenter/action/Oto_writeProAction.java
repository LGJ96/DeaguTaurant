package servicecenter.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import servicecenter.service.Oto_WriteProService;
import servicecenter.vo.OtoVO;
import vo.ActionForward;

public class Oto_writeProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		OtoVO otoVO = new OtoVO();
		otoVO.setCus_oto_number(Integer.parseInt(request.getParameter("cus_oto_number")));
		otoVO.setCus_oto_title(request.getParameter("cus_oto_title"));
		otoVO.setCus_oto_date(new Timestamp(System.currentTimeMillis()));
		otoVO.setCus_oto_reply_date(new Timestamp(System.currentTimeMillis()));
		otoVO.setCus_oto_content(request.getParameter("cus_oto_content"));
		otoVO.setUser_nickname(request.getParameter("user_nickname"));
		otoVO.setCus_ref(Integer.parseInt(request.getParameter("cus_ref")));
		otoVO.setCus_re_step(Integer.parseInt(request.getParameter("cus_re_step")));
		otoVO.setCus_re_level(Integer.parseInt(request.getParameter("cus_re_level")));
		
		
		Oto_WriteProService oto_WriteProService = new Oto_WriteProService();
		boolean registSucess = oto_WriteProService.registArticle(otoVO);
		
		ActionForward forward = null;
		if(registSucess) {
			forward = new ActionForward();
			forward.setUrl("servicecenter/question-close.jsp");
			forward.setRedirect(true);
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('실패')");
			out.println("history.back");
			out.println("</script>");
			
		}
		return forward;
	}

}
