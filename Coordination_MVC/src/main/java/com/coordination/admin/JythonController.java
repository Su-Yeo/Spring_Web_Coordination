package com.coordination.admin;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JythonController {
	
	private static final Logger logger = LoggerFactory.getLogger(JythonController.class);
	private String[] img = null;

	@Resource(name="imgPath")
	private String imgPath;
	
	@RequestMapping(value = "adminInsert")
	public String Tensorflow(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception  {
			
		//이미지 분석 객체 생성
		Tensorflow tf = new Tensorflow();
		
		//alert창 사용을 위한 선언 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		//파싱해서 온 이미지를 /resources/admin 폴더 안에 저장한 후,
		//해당 파일들을 순차적으로 이미지 분석 → DB등록
		//이미지 Path
		String path = "C:\\Users\\sangw\\Coordination_MVC\\Coordination_MVC"
				+ "\\src\\main\\webapp\\resources\\admin\\";
		
		String image = path + "709a56ccd5aa45ac5a30cb8f2d41ddc9.jpg";
		
		for(int i=0; i<1; i++)
		{
			//전신 이미지 분리
			tf.Cut(image);
			//상의 이미지 분석
			tf.Upper_Tensorflow(image);
			//하의 이미지 분석
			tf.Lower_Tensorflow(image);
			//이미지 복구
			tf.restore(image);
		}
		
		model.addAttribute("url", "insertStyle");
		
		return "movePage";
	}
	
	@RequestMapping(value = "parsing")
	public String ImageDown(HttpServletRequest request) {
		
		//1 : Outer
		//2 : T-shirt
		//3 : Half-Tshirt
		//4 : Hood
		String imgName="";
		URL imageUrl = null;
        InputStream in = null;
        FileOutputStream fos = null;
        int data=0;
        int num = Integer.parseInt(request.getParameter("Category"));

		//파싱해서 가져온 이미지를 배열로 받는다.
		Parsing(num);
		       
        //폴더 생성
  		File fileDir = new File(imgPath, "admin");
  		if(!fileDir.isDirectory()){
  			fileDir.mkdirs();
  		}
      		
        try {       	       
			//해당 로직에서 지정된 장소에 해당 이미지 다운로드	
			for(int i=0; i<img.length; i++)
			{
				imgName=img[i].substring(img[i].lastIndexOf('/') + 1, img[i].length());
				
				//URL로 이미지 가져오기
				imageUrl = new URL(img[i].toString());
				in = new BufferedInputStream(imageUrl.openStream());
				
				//다운로드
				fos = new FileOutputStream(imgPath+"\\admin\\"+imgName);
				while(true){
	                //이미지를 읽어온다.
	                data = in.read();
	                if(data == -1){
	                    break;
	                }
	                //이미지를 쓴다.
	                fos.write(data);
	            }
	            in.close();
	            fos.close();
	            data=0;
			}
        }catch (Exception e) {
			System.out.println("**********Error!!(ImageDown())**********");
		}	
		return "coordination/admin/style/StyleList";
	}

	public void Parsing(int num) {		
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
				img[n] = "http:"+imgs.get(n).attr("src");
			}			
		}catch(Exception e) {
			System.out.println("**********Error!! (Parsing())**********");
		}
	}
}
