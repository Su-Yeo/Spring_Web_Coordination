package com.coordination.main;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coordination.dto.AdminPagination;
import com.coordination.dto.StyleVO;
import com.coordination.service.StyleService;

//Update Delete 구문 이외에 모든 작업을 담당하는 컨트롤러
@Controller
public class StyleController {

	@Resource(name="imgPath")
	private String imgPath;
	
	@Autowired
	private StyleService service;
	
	private static final Logger logger = LoggerFactory.getLogger(StyleController.class);
	
	//관리자 - style 변경
	@RequestMapping(value = "updateStyle", method = RequestMethod.POST)
	public String update(StyleVO vo, Model model, HttpSession session) throws Exception {
		
		if(! session.getAttribute("userId").equals("admin"))
		{
			return "coordination/index";
		}
		else
		{
			try {
				
				service.updateStyle(vo);
				logger.info("==========이미지 수정 완료==========");
	            
	            //업데이트 완료 후, StyleList로 이동
	            model.addAttribute("url", "updateStyle");
				
			}catch(Exception e) {
				e.printStackTrace();
				
				logger.info("==========Error!!!==========");
				model.addAttribute("url", "error");
			}
			
			return "movePage";
		}
	}

	
	//관리자 - style 삭제
	@RequestMapping(value = "deleteStyle", method = RequestMethod.GET)
	public String delete(StyleVO vo, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		if(! session.getAttribute("userId").equals("admin"))
		{
			return "coordination/index";
		}
		
		//삭제하기 위한 Num 초기화 후 할당
		int num = 0;
		num = Integer.parseUnsignedInt(request.getParameter("num"));
		
		//삭제된 정보의 이미지명을 받아 프로젝트 내에 존재하는 해당 이미지 파일 삭제
		String img = request.getParameter("img");
		String Path = "C:\\img\\admin\\" + img;
		
		try {
			
			vo.setNum(num);
			
			//프로젝트 내에 이미지 파일을 삭제하기 위한 파일 객체 선언
			File file = new File(Path);
			System.out.println("**********파일 위치 : " + file + " *****************");
			
			//해당 파일이 존재한다면 DB정보 삭제 + 이미지 삭제
			if(file.exists() == true)
			{
				service.deleteStyle(vo);
				file.delete();
				
				//삭제 완료 후, StyleList로 이동
				logger.info("==========이미지를 정상적으로 삭제했습니다.==========");
			}
			else
			{
				//해당 imgPath에 이미지가 존재하지 않아 삭제불가능
				logger.info("==========이미지가 존재하지않아 삭제에 실패했습니다.==========");
			}
			model.addAttribute("url", "deleteStyle");
			
		}catch(Exception e) {
			e.printStackTrace();
			
			logger.info("==========Error!!!==========");
            model.addAttribute("url", "error");
		}
		
		return "movePage";
	}
	
	//관리자 메인Page
	@RequestMapping("adminPage")
	public String adminPage(HttpSession session) {
		
		if(! session.getAttribute("userId").equals("admin"))
		{
			return "redirect:/";
		}
		else
		{
			return "coordination/admin/style/admin";
		}
	}
	
	//관리자 - 데이터 등록1 → JythonController
	@RequestMapping(value = "adminParsingList", method = RequestMethod.GET)
	public String parsingList(HttpSession session) {
		
		if(! session.getAttribute("userId").equals("admin"))
		{
			return "redirect:/";
		}
		else
		{
			return "coordination/admin/style/ImageParsingList";
		}
	}
	
	//관리자 - 데이터 검증1
	@RequestMapping(value = "adminIdentify", method = RequestMethod.GET)
	public String goIdentify(StyleVO vo,
			Model model,
			HttpServletRequest request,
			HttpSession session,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range
			) throws Exception {
			
		if(! session.getAttribute("userId").equals("admin"))
		{
			return "redirect:/";
		}
		else
		{
			//전체 페이지 갯수
			int listCnt = service.StyleListIdentifyCount();
			
			//Pagination 객체생성
			AdminPagination adminPagination = new AdminPagination();
			adminPagination.pageInfo(page, range, listCnt);
			
			model.addAttribute("pagination", adminPagination);
			model.addAttribute("StyleIdentifyList", service.StyleListIdentify(adminPagination));
			
			return "coordination/admin/style/Identify";
		}
	}	
	
	//관리자 - 데이터 검증2
	@RequestMapping(value = "IdentifyUpdateForm", method = RequestMethod.GET)
	public String IdentifyUpdateForm(StyleVO vo, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		if(! session.getAttribute("userId").equals("admin"))
		{
			return "redirect:/";
		}
		else
		{
			int num = 0;
			num = Integer.parseInt(request.getParameter("num"));
			
			//데이터 검증을 위해 이동 될 Page
			//data라는 이름에 IdentifyUpdate값을 준다
			List<StyleVO> StyleOne = service.StyleOne(vo, num);
			model.addAttribute("StyleOne", StyleOne);
			model.addAttribute("data", "IdentifyUpdate");
			
			return "coordination/admin/style/UpdateForm";
		}
	}
	
	//관리자 - 데이터 검증3
	@RequestMapping(value = "IdentifyUpdate", method = RequestMethod.POST)
	public String IdentifyUpdate(StyleVO vo, Model model, HttpServletRequest request, HttpSession session) {
			
		if(! session.getAttribute("userId").equals("admin"))
		{
			return "redirect:/";
		}
		else
		{
			try {
					
				vo.setNum(vo.getNum());
				service.updateIndentify(vo);
					
				logger.info("==========관리자 이미지 검증 완료!==========");
					
				model.addAttribute("url", "IdentifyUpdate");
					
			}catch(Exception e) {
				e.printStackTrace();
					
				logger.info("==========Error!!!==========");
				model.addAttribute("url", "error");
			}
				
			return "movePage";
		}
	}	
	
	//관리자 - 데이터 수정/삭제 리스트
	@RequestMapping(value = "adminStyleList", method = RequestMethod.GET)
	public String goStyleList(Model model,
			HttpServletRequest request,
			HttpSession session,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range)
			throws Exception {
		
		if(! session.getAttribute("userId").equals("admin"))
		{
			return "redirect:/";
		}
		else
		{
			//전체 페이지 갯수
			int listCnt = service.StyleListCount();

			//Pagination 객체생성
			AdminPagination adminPagination = new AdminPagination();
			adminPagination.pageInfo(page, range, listCnt);

			model.addAttribute("pagination", adminPagination);
			model.addAttribute("StyleList", service.StyleList(adminPagination));

			return "coordination/admin/style/StyleList";
		}
	}

	//관리자 - 데이터 수정/삭제 폼
	@RequestMapping(value = "adminUpdateForm", method = RequestMethod.GET)
	public String goUpdateStyle(StyleVO vo, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		if(! session.getAttribute("userId").equals("admin"))
		{
			return "redirect:/";
		}
		else
		{		
			int num = 0;
			num = Integer.parseInt(request.getParameter("num"));

			//관리자가 이미지를 수정할 경우 이동 될 Page
			//Data라는 이름으로 updateStyle값을 넘겨준다.
			List<StyleVO> StyleOne = service.StyleOne(vo, num);
			model.addAttribute("StyleOne", StyleOne);
			model.addAttribute("data", "updateStyle");

			return "coordination/admin/style/UpdateForm";
		}
	}
	
	//사용자가 나만의 옷장에서 옷 클릭 시, 해당 옷을 입은 코디룩 추천
	@RequestMapping(value = "Recommendation", method = RequestMethod.GET)
	public String Recommendation(StyleVO vo,
			Model model,
			HttpServletRequest request,
			HttpSession session,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
			throws Exception{
		
		if(session.getAttribute("userId") == null)
		{
			return "redirect:/";
		}
		else
		{			
			//옷의 종류, 색상 받아오기
			String top = request.getParameter("top");
			String bottom = request.getParameter("bottom");
			String topColor = request.getParameter("topColor");
			String bottomColor = request.getParameter("bottomColor");
			System.out.println("=====================================================");
			System.out.println("상의 : " + top);
			System.out.println("상의 색상 : " + topColor);
			System.out.println("하의 : " + bottom);
			System.out.println("하의 색상 : " + bottomColor);
			System.out.println("페이지 : " + page);
			System.out.println("범위 : " + range);
			System.out.println("=====================================================");
			
			if(top!="" && topColor!="")
			{
				vo.setTop(top);
				vo.setTop_color(topColor);
			}else {
				vo.setTop(null);
				vo.setTop_color(null);
			}
			
			if(bottom!="" && bottomColor!="")
			{
				vo.setPants(bottom);
				vo.setPants_color(bottomColor);
			}else {
				vo.setPants(null);
				vo.setPants_color(null);
			}
			//전체 페이지 갯수
			int listCnt = service.StyleRecommendationCount(vo);
			
			if(listCnt==0) {
				model.addAttribute("TopUrl", "Recommendation?top="+top+"&topColor="+topColor);
				model.addAttribute("BottomUrl", "Recommendation?bottom="+bottom+"&bottomColor="+bottomColor);
			}
			
			//Pagination 객체생성
			vo.pageInfo(page, range, listCnt);
			model.addAttribute("pagination", vo);
			model.addAttribute("StyleList", service.StyleRecommendation(vo));
			model.addAttribute("top", top);
			model.addAttribute("bottom", bottom);
			model.addAttribute("topColor", topColor);
			model.addAttribute("bottomColor", bottomColor);
			
			return "coordination/member/Recommendation";
		}
	}
}
