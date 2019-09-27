package com.coordination.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coordination.dto.StyleVO;
import com.coordination.service.StyleService;

//Update Delete 구문 이외에 모든 작업을 담당하는 컨트롤러
@Controller
public class StyleController {

	@Autowired
	private StyleService service;
	
	@RequestMapping("adminStyleList")
	public String goStyleList(Model model) throws Exception {
		
		List<StyleVO> StyleList = service.StyleList();
			
		model.addAttribute("StyleList", StyleList);
		
		return "coordination/admin/style/StyleList";
	}

	//관리자 - style 변경 Page 이동
	//추후 GET방식을 통해 num값을 넘겨받은 다음 수행하도록 개발해야 함
	@RequestMapping(value = "adminUpdate", method = RequestMethod.GET)
	public String goUpdateStyle(HttpServletRequest request, StyleVO vo, Model model) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		List<StyleVO> StyleOne = service.StyleOne(vo, num);
		model.addAttribute("StyleOne", StyleOne);
		
		return "coordination/admin/style/updateForm";
	}
}
