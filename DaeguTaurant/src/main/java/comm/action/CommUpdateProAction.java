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
import comm.service.CommUpdateProService;
import comm.vo.CommVO;
import vo.ActionForward;

public class CommUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String realFolder = "";
		String saveFolder = "/images/com_pic";	//������ ������ ���
		String encType = "UTF-8";		//��ȯ����
		int maxSize = 5 * 1024 * 1024;	// 5mb
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
				new DefaultFileRenamePolicy());
		
		CommVO commVO = new CommVO();
		String fileName = multi.getFilesystemName("com_pic");
		int index = fileName.indexOf(".");
		String fileNameWithoutExt = fileName.substring(0, index);
		commVO.setCom_pic(fileNameWithoutExt);
		
		HttpSession session = request.getSession();
	      session.setAttribute("commVO", commVO);
		commVO.setCom_number(Integer.parseInt(multi.getParameter("com_number")));
		commVO.setCom_title(multi.getParameter("com_title"));
		commVO.setCom_date(new Timestamp(System.currentTimeMillis()));
		commVO.setCom_content(multi.getParameter("com_content"));
		commVO.setCom_subject(multi.getParameter("com_subject"));
		commVO.setUser_nickname(multi.getParameter("user_nickname"));
		commVO.setCom_readcount(0);
	    
	    CommUpdateProService commUpdateProService = new CommUpdateProService();
	      
	    boolean modifySuccess = commUpdateProService.modifyArticle(commVO);
	      
	    ActionForward forward = null;
	    if(modifySuccess) {
	       forward = new ActionForward();
	       forward.setUrl("commList.dae");
	       forward.setRedirect(true);
	    }
	    else {
	       response.setContentType("text/html;charset=UTF-8");
	       PrintWriter out = response.getWriter();
	       out.println("<script>");
	       out.println("alert('��Ͻ���')");
	       out.println("history.back();");
	       out.println("</script>");
	    }
	    return forward;
	}

}
