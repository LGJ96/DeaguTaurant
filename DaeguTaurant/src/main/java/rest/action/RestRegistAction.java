package rest.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Info.action.Action;
import rest.service.RestRegistService;
import vo.ActionForward;
import vo.RestVO;

public class RestRegistAction implements Action {

	 @Override
	   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      // TODO Auto-generated method stub
	      String realFolder = "";//파일이 최종적으로 업로드될 물리적인 경로가 저장될 변수
	      String saveFolder = "/images";//상대경로
	      String encType = "UTF-8";
	      int maxSize = 5*1024*1024; //5mb
	      
	      //서버상에 업로드될 물리적인 경로를 얻어오는 작업
	      ServletContext context = request.getServletContext();//애플리케이션 당 하나씩 할당되는
	      //애플리케이션 전체의 환경설정 정보
	      realFolder = context.getRealPath(saveFolder);
	      
	      MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
	         new DefaultFileRenamePolicy());
	      
	      RestVO restVO = new RestVO();
	      
			/*
			 * String fileName = multi.getFilesystemName("image"); int index =
			 * fileName.indexOf("."); String fileNameWithoutExt =
			 * fileName.substring(0,index);
			 */
	   
	      
	      
	      restVO.setRes_Addr1(multi.getParameter("res_Addr1"));
	      restVO.setRes_Addr2(multi.getParameter("res_Addr2"));
	      restVO.setRes_category(multi.getParameter("res_category"));
	      restVO.setRes_hours(multi.getParameter("res_hours"));
	      restVO.setRes_mainmenu(multi.getParameter("res_mainmenu"));
	      restVO.setRes_name(multi.getParameter("res_name"));
	      restVO.setRes_number(multi.getParameter("res_number"));
	      restVO.setRes_id(Integer.parseInt(multi.getParameter("res_id")));
	      restVO.setRes_re_step(Integer.parseInt(multi.getParameter("res_step")));
	      restVO.setRes_readcount(0);
	      restVO.setRes_ref(Integer.parseInt(multi.getParameter("res_ref")));
	      restVO.setRes_score(Double.parseDouble(multi.getParameter("res_score")));
	      restVO.setRes_notice_date(new Timestamp(System.currentTimeMillis()));
	    //  restVO.setRes_pic(fileNameWithoutExt);
	     
	  
	      
	      RestRegistService restRegistService = new RestRegistService();
	      boolean registSuccess = restRegistService.registRest(restVO);
	      
	      ActionForward forward = null;
	      if(registSuccess) {
	         forward = new ActionForward();
	         forward.setUrl("home_review/rest_content.jsp");
	         forward.setRedirect(true);
	      }else {
	         response.setContentType("text/html;charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("alert('등록실패')");  //경고창
	         out.println("history.back()");
	         out.println("</script>");
	      }
	      
	         
	      return forward;
	   }

}
