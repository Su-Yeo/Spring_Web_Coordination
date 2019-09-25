package com.coordination.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coordination.dto.StyleVO;
import com.coordination.service.StyleService;

@Controller
public class StyleController {

	@Autowired
	private StyleService service;

	//관리자 - style 변경 Page 이동
	//추후 GET방식을 통해 num값을 넘겨받은 다음 수행하도록 개발해야 함
	//@RequestMapping(value = "adminUpdate", method = RequestMethod.GET)
	@RequestMapping("adminUpdate")
	public String goUpdateStyle(StyleVO vo, Model model) throws Exception {
		
		List<StyleVO> StyleOne = service.StyleOne(vo, 1);
		model.addAttribute("StyleOne", StyleOne);
		
		return "coordination/admin/style/updateForm";
	}
}
