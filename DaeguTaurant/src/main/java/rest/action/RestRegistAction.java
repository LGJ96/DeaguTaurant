package rest.action;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Info.action.Action;
import rest.service.RestRegistService;
import vo.ActionForward;
import vo.RestVO;



public class RestRegistAction implements Action {

	 @Override
	   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	     
	      String realFolder = "";//파일이 최종적으로 업로드될 물리적인 경로가 저장될 변수

	      String saveFolder = "/images/res_pic";//상대경로
	      
	      String encType = "UTF-8";
	      int maxSize = 5*1024*1024; //5mb
	      
	      //서버상에 업로드될 물리적인 경로를 얻어오는 작업
	      ServletContext context = request.getServletContext();//애플리케이션 당 하나씩 할당되는
	      //애플리케이션 전체의 환경설정 정보
	      realFolder = context.getRealPath(saveFolder);
	      
	      MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
		           new DefaultFileRenamePolicy());
	     
	      RestVO restVO = new RestVO();
     
	      String fileName = multi.getFilesystemName("res_pic"); 
			 
	      int index = fileName.indexOf("."); 
			 
	      String fileNameWithoutExt = fileName.substring(0,index);
		
	      System.out.println(fileNameWithoutExt);
			
	      restVO.setRes_pic(fileNameWithoutExt);
	   

	      HttpSession session = request.getSession();
	      session.setAttribute("restVO", restVO);	//필수요인(loginUser = null을 해결하기 위해)
	      
	      restVO.setRes_Addr1(multi.getParameter("res_Addr1"));
	      restVO.setRes_Addr2(multi.getParameter("res_Addr2"));
	      restVO.setRes_category(multi.getParameter("res_category"));
	      restVO.setRes_hours(multi.getParameter("res_hours"));
	      restVO.setRes_mainmenu(multi.getParameter("res_mainmenu"));
	      restVO.setRes_name(multi.getParameter("res_name"));
	      restVO.setRes_number(multi.getParameter("res_number"));
	      restVO.setRes_readcount(0);
	     // restVO.setRes_id(Integer.parseInt(request.getParameter("res_id")));
	     // restVO.setRes_Addr1_ref(Integer.parseInt(request.getParameter("res_Addr1_ref")));
	     // restVO.setRes_re_step(Integer.parseInt(request.getParameter("res_re_step")));
	     // restVO.setRes_ref(Integer.parseInt(request.getParameter("res_ref")));
	     // restVO.setRes_score(Integer.parseInt(request.getParameter("res_score")));
	      restVO.setRes_notice_date(new Timestamp(System.currentTimeMillis()));
	   
	     
	  
	      
	      RestRegistService restRegistService = new RestRegistService();
	      boolean registSuccess = restRegistService.registRest(restVO);
	      
	      ActionForward forward = null;
	      if(registSuccess) {
	         forward = new ActionForward();
	         forward.setUrl("home_review/index.jsp");
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
