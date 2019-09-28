package com.coordination.style;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coordination.dto.StyleVO;
import com.coordination.service.StyleService;

@Controller
public class DeleteStyle {

	@Autowired
	private StyleService service;

	private static final Logger logger = LoggerFactory.getLogger(DeleteStyle.class);
	
	@RequestMapping(value = "deleteStyle")
	public String delete(HttpServletRequest request, StyleVO vo, Model model) throws Exception {
		
		//삭제하기 위한 Num 초기화 후 할당
		int num = 0;
		num = Integer.parseUnsignedInt(request.getParameter("num"));
		
		//삭제된 정보의 이미지명을 받아 프로젝트 내에 존재하는 해당 이미지 파일 삭제
		String img = request.getParameter("img");
		String path = "C:\\Users\\sangw\\OneDrive\\문서\\"
				+ "Spring_Web\\Coordination_MVC\\src\\main\\webapp\\resources\\"
				+ "admin\\" + img;
		
		try {
			vo.setNum(num);

			//프로젝트 내에 이미지 파일을 삭제하기 위한 파일 객체 선언
			File file = new File(path);
			
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
				//해당 Path에 이미지가 존재하지 않아 삭제불가능
				logger.info("==========이미지가 존재하지않아 삭제에 실패했습니다.==========");
			}
			
			model.addAttribute("url", "deleteStyle");
			
		}catch(Exception e) {
			e.printStackTrace();
			
			logger.info("==========Error!!!==========");
            model.addAttribute("url", "delete");
		}
		
		return "movePage";
	}
	
	@RequestMapping("delete")
	public @ResponseBody String deleteImage() {
		
		String path = "C:\\Users\\sangw\\OneDrive\\문서\\"
				+ "Spring_Web\\Coordination_MVC\\src\\main\\webapp\\resources\\"
				+ "admin\\39.jpg";
		
		File file = new File(path);
		
		if(file.exists() == true)
		{
			System.out.println("파일이 존재합니다.");
		}
		else
		{
			System.out.println("파일이 존재하지 않습니다.");
		}
		
		return null;
	}
}
