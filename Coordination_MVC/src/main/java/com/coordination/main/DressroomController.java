package com.coordination.main;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coordination.dto.DressroomVO;
import com.coordination.service.DressroomService;

@Controller
public class DressroomController {
	
	@Autowired
	private DressroomService service;

	@RequestMapping(value = "dressInsert", method = RequestMethod.POST)
	public String insert(DressroomVO vo, HttpServletResponse response) throws Exception {
		
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
