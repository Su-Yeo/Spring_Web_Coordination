package com.coordination.main;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String update(StyleVO vo, Model model) throws Exception {
		
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
	
	//관리자 - style 삭제
	@RequestMapping(value = "deleteStyle", method = RequestMethod.GET)
	public String delete(StyleVO vo, Model model, HttpServletRequest request) throws Exception {
		
		//삭제하기 위한 Num 초기화 후 할당
		int num = 0;
		num = Integer.parseUnsignedInt(request.getParameter("num"));
		
		//삭제된 정보의 이미지명을 받아 프로젝트 내에 존재하는 해당 이미지 파일 삭제
		String img = request.getParameter("img");
		imgPath += "\\admin\\" + img;
		
		try {
			
			vo.setNum(num);
			
			//프로젝트 내에 이미지 파일을 삭제하기 위한 파일 객체 선언
			File file = new File(imgPath);
			
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
	public String adminPage() {
		
		return "coordination/admin/style/admin";
	}
	
	//관리자 - 데이터 등록1
	@RequestMapping(value = "adminParsingList", method = RequestMethod.GET)
	public String parsingList(HttpServletRequest request) {
		
		String password = request.getParameter("password");
		
		//관리자 비밀번호가 1234면 ParsingList로 이동
		if(password.equals("1234"))
		{
			return "coordination/admin/style/ImageParsingList";
		}
		else
		{
			//관리자 메인Page로 다시 이동
			return "redirect:adminPage";
		}
		
	}
	
	//관리자 - 데이터 수정/삭제
	@RequestMapping(value = "adminStyleList", method = RequestMethod.GET)
	public String goStyleList(Model model,
			HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range)
			throws Exception {
		
		//전체 페이지 갯수
		int listCnt = service.StyleListCount();
				
		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
				
		model.addAttribute("pagination", pagination);
		model.addAttribute("StyleList", service.StyleList(pagination));
				
		return "coordination/admin/style/StyleList";
		
		/*
		String password = request.getParameter("password");
		
		//관리자 비밀번호가 1234면 StyleList로 이동
			if(password.equals("1234"))
			{
				List<StyleVO> StyleList = service.StyleList();
				
				model.addAttribute("StyleList", StyleList);
				return "coordination/admin/style/StyleList";
			}
			else
			{
				//관리자 메인Page로 다시 이동
				return "redirect:adminPage";
			}
		*/
	}

	//관리자 - 데이터 수정．삭제2
	@RequestMapping(value = "adminUpdateForm", method = RequestMethod.GET)
	public String goUpdateStyle(StyleVO vo, Model model, HttpServletRequest request) throws Exception {
		
		int num = 0;
		num = Integer.parseInt(request.getParameter("num"));
		
		//관리자가 이미지를 수정할 경우 이동 될 Page
		//Data라는 이름으로 updateStyle값을 넘겨준다.
		List<StyleVO> StyleOne = service.StyleOne(vo, num);
		model.addAttribute("StyleOne", StyleOne);
		model.addAttribute("data", "updateStyle");
		
		return "coordination/admin/style/UpdateForm";
	}
	
	//관리자 - 데이터 검증1
	@RequestMapping(value = "adminIdentify", method = RequestMethod.GET)
	public String goIdentify(StyleVO vo,
			Model model,
			HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range
			) throws Exception {

		
		//전체 페이지 갯수
		int listCnt = service.StyleListIdentifyCount();
		
		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("StyleIdentifyList", service.StyleListIdentify(pagination));
		
		return "coordination/admin/style/Identify";
		
		/*
		String password = request.getParameter("password");
		
		//관리자 비밀번호가 1234면 Identify로 이동
			if(password.equals("1234"))
			{
				List<StyleVO> StyleListIdentify = service.StyleListIdentify();
				model.addAttribute("StyleListIdentify", StyleListIdentify);
				
				return "coordination/admin/style/Identify";
			}
			else
			{
				//관리자 메인Page로 다시 이동
				return "redirect:adminPage";
			}
		*/
	}
	
	//관리자 - 데이터 검증2
	@RequestMapping(value = "IdentifyUpdateForm", method = RequestMethod.GET)
	public String IdentifyUpdateForm(StyleVO vo, Model model, HttpServletRequest request) throws Exception {
		
		int num = 0;
		num = Integer.parseInt(request.getParameter("num"));
		
		//데이터 검증을 위해 이동 될 Page
		//data라는 이름에 IdentifyUpdate값을 준다
		List<StyleVO> StyleOne = service.StyleOne(vo, num);
		model.addAttribute("StyleOne", StyleOne);
		model.addAttribute("data", "IdentifyUpdate");
		
		return "coordination/admin/style/UpdateForm";
	}
	
	//관리자 - 데이터 검증3
		@RequestMapping(value = "IdentifyUpdate", method = RequestMethod.POST)
		public String IdentifyUpdate(StyleVO vo, Model model, HttpServletRequest request) {
			
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
