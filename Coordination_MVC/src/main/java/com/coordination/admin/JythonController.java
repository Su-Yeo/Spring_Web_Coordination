package com.coordination.admin;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(value = "parsing")
	public String Tensorflow(Model model, HttpServletRequest request) throws Exception  {
			
		//이미지 분석 객체 생성
		Tensorflow tf = new Tensorflow();
		
		//이미지 분석 Path && 분석할 이미지명
		String path = "C:\\img\\tensorflow\\";
		String image = null;
		
		//파싱해서 온 이미지를 C:\img\tensorflow 폴더에 저장
		//ImageDown(request);
		
		//이동할 폴더
		File folder = new File("C:\\img\\tensorflow");
		//이동될 폴더
		File folder2 = new File("C:\\img\\admin");
		
		//DB에 등록되지않은 tensorflow폴더 안에 있는 이미지명 추출
		File[] listOfFiles = folder.listFiles();
		
		/* for (int i = 0; i < listOfFiles.length; i++) */
		for (int i = 0; i < listOfFiles.length; i++)
		{
			if(listOfFiles[i].isFile())
			{
				//Tensorflow폴더 안에 이미지파일명을 차례대로 image에 할당
				image = path + listOfFiles[i].getName();
				
				//전신 이미지 분리
				//tf.Cut(image);
				//상의 이미지 분석
				tf.Upper_Tensorflow(image);
				//하의 이미지 분석
				//tf.Lower_Tensorflow(image);
				//이미지 복구
				//tf.restore(image);	
			}
			else
			{
				System.out.println("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
				System.out.println(listOfFiles[i].getName() + "파일이 존재하지 않습니다.");
				System.out.println("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
			}
		}
		//Tensorflow에서 admin폴더로 이미지 복사
		copy(folder, folder2);
		System.out.println("======이미지 복사 완료======");
				
		//Tensorflow폴더 안에 이미지 삭제
		delete(folder.toString());
		System.out.println("======이미지 삭제 완료======");
		
		model.addAttribute("url", "insertStyle");
		
		return "movePage";
	}
	
	/* @RequestMapping(value = "parsing") */
	public void ImageDown(HttpServletRequest request) {
		
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
  		if(!fileDir.isDirectory())
  		{
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
				while(true)
				{
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
	}

	//이미지 파싱
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
	
	//C:\img\tensorflow에서 C:\img\admin으로 이동
	public static void copy(File sourceF, File targetF){
		File[] target_file = sourceF.listFiles();
		
		for (File file : target_file)
		{
			File temp = new File(targetF.getAbsolutePath() + File.separator + file.getName());
			if(file.isDirectory())
			{
				temp.mkdir();
				copy(file, temp);
			} 
			else
			{
				FileInputStream fis = null;
				FileOutputStream fos = null;
				try {
					fis = new FileInputStream(file);
					fos = new FileOutputStream(temp);
					byte[] b = new byte[4096];
					int cnt = 0;
					
					while((cnt=fis.read(b)) != -1)
					{
						fos.write(b, 0, cnt);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally{
					try {
						fis.close();
						fos.close();
					} catch (Exception e) {
						e.printStackTrace();
					}		
				}
			}
		}
	}
	
	//C:\img\tensorflow 사진 삭제
	public static void delete(String path) {
		
		File folder = new File(path);
		try {
			if(folder.exists())
			{
			    File[] folder_list = folder.listFiles();
					
			    for (int i = 0; i < folder_list.length; i++)
			    {
			    	if(folder_list[i].isFile())
			    	{
			    		folder_list[i].delete();
			    	}
			    	else
			    	{
			    		delete(folder_list[i].getPath());
			    	}
			    	folder_list[i].delete();
			    }
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
}
