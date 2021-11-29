package rest.action;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Info.action.Action;
import rest.service.RestUpdateService;
import vo.ActionForward;
import vo.RestVO;


public class RestUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		/*String realFolder = "";//파일이 최종적으로 업로드될 물리적인 경로가 저장될 변수
		String saveFolder = "/images/res_pic";//상대경로
		String encType = "UTF-8";
		int maxSize = 5*1024*1024;
		//서버상에 업로드될 물리적인 경로를 얻어오는 작업
		  ServletContext context = request.getServletContext();//애플리케이션 당 하나씩 할당되는
		  //애플리케이션 전체의 환경설정 정보
		  realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
		        new DefaultFileRenamePolicy());*/
	    
		int res_id = Integer.parseInt(request.getParameter("res_id"));
		/*String existFile = multi.getFilesystemName("res_pic"); 
		
		Enumeration<String> fileNames = multi.getFileNames();
		RestVO restVO = new RestVO();
		
		if(fileNames.hasMoreElements())
		{
		    String fileName = fileNames.nextElement();
		    String updateFile = multi.getFilesystemName(fileName);
		    
		    if(updateFile == null)    // 수정시 새로운 파일을 첨부 안했다면 기존 파일명을 세팅
		        restVO.setRes_pic(existFile);
		    else    // 새로운 파일을 첨부했을 경우
		    	restVO.setRes_pic(updateFile);
		}*/


		RestUpdateService restUpdateService = new RestUpdateService();
		
		
		RestVO restarticle = restUpdateService.getUpdateRestArticle(res_id);  
		request.setAttribute("restarticle", restarticle);
		
		
		ActionForward forward = new ActionForward();
		forward.setUrl("home_review/restaurnat_Update.jsp");	
		return forward;
	}
	
}
