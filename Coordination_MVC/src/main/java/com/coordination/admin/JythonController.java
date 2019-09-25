package com.coordination.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JythonController {
	
	private static final Logger logger = LoggerFactory.getLogger(JythonController.class);
	public static String[] img = new String[5];

	@RequestMapping("goadmin")
	public ModelAndView Tensorflow(HttpServletResponse response) throws Exception  {
		
		ModelAndView mav = new ModelAndView();
		Tensorflow tf = new Tensorflow();
		//alert창 사용을 위한 선언 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//1 : Outer
		//2 : T-shirt
		//3 : Half-Tshirt
		//4 : Hood
		String[] img = Parsing(1);
		
		//파싱해서 온 이미지를 /resources/admin 폴더 안에 저장한 후,
		//해당 파일들을 순차적으로 이미지 분석 → DB등록
		//이미지 Path
		String image = "C:\\Users\\sangw\\OneDrive\\Desktop\\Coordination_MVC"
				+ "\\src\\main\\webapp\\resources\\admin\\"
				+ "709a56ccd5aa45ac5a30cb8f2d41ddc6.jpg";  
		
		for(int i=0; i<1; i++)
		{
			//상의 이미지 분석
			tf.Upper_Tensorflow(image);
			//하의 이미지 분석
			tf.Lower_Tensorflow(image);
			//이미지 복구
			tf.restore(image);
		}
		return mav;
	}

	public String[] Parsing(int num) {
		
		//이미지 링크 가져오기
		//클래스 이름 가져오기 : select("클래스명")
		//id 이름 가져오기 : select("#id명")
		//속성 가져오기 : attr("alt")
		try {
			//파싱할 웹 페이지
			String url = "";
			
			switch(num)
			{
				case 1:
					url = "http://under70.kr/product/list.html?cate_no=24&page=1";
					break;
				
				case 2:
					url = "http://under70.kr/product/list.html?cate_no=53&page=1";
					break;
					
				case 3:
					url = "http://under70.kr/product/list.html?cate_no=55&page=1";
					break;
					
				case 4:
					url = "http://under70.kr/product/list.html?cate_no=33\"";
					break;
					
				default:
					url = "null";
					break;
			}
			
			//Connect (수정X) 
			Document doc = Jsoup.connect(url).get();
			  
			//상품리스트의 상품사진 class명 (수정O) 
			Elements imgs = doc.select("ul.prdList.column4 div.box a img.thumb"); 
			img = new String[imgs.size()];
			  
			for(int n=0; n<img.length; n++)
			{
				img[n] = imgs.get(n).attr("src");
			}
			 
			
		}catch(Exception e) {
			logger.info("**********Error!! (Parsing())**********");
			System.out.println("**********Error!! (Parsing())**********");
		}

		return img;
	}
}
