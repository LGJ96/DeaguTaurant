package comm.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Info.action.Action;
import comm.service.CommWriteProService;
import comm.vo.CommVO;
import vo.ActionForward;
import vo.UserVO;

public class Comm_writeProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String realFolder = "";
		String saveFolder = "/images/com_pic";	
		String encType = "UTF-8";		
		int maxSize = 5 * 1024 * 1024;	// 5mb
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
				new DefaultFileRenamePolicy());
		
		CommVO commVO = new CommVO();
		UserVO userVO = new UserVO();
		String fileName = multi.getFilesystemName("com_pic");
		int index = fileName.indexOf(".");
		String fileNameWithoutExt = fileName.substring(0, index);
		commVO.setCom_pic(fileNameWithoutExt);
		
		/* if(fileName != null){ System.out.println(fileName.indexOf("1")); } */
		
		HttpSession session = request.getSession();
	      session.setAttribute("commVO", commVO);
	      userVO.setUser_id((String)session.getAttribute("user_id"));
		
	      
		commVO.setCom_number(Integer.parseInt(multi.getParameter("com_number")));
		commVO.setCom_title(multi.getParameter("com_title"));
		commVO.setCom_date(new Timestamp(System.currentTimeMillis()));
		commVO.setCom_subject(multi.getParameter("com_subject"));
		commVO.setCom_content(multi.getParameter("com_content"));
		commVO.setUser_nickname(multi.getParameter("user_nickname"));
		commVO.setCom_user_id(multi.getParameter("com_user_id"));
		
		
		
		CommWriteProService commWriteProService = new CommWriteProService();
		boolean registSucess = commWriteProService.registArticle(commVO, userVO);

		ActionForward forward = null;
		if(registSucess) {
			forward = new ActionForward();
			forward.setUrl("commList.dae");
			forward.setRedirect(true);
		}
		else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back");
			out.println("</script>");
			
		}
		return forward;
	}

}
