package com.coordination.main;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.coordination.dto.ClosetVO;
import com.coordination.service.ClosetService;
import com.coordination.service.UploadFileUtils;

@Controller
public class UploadController {
	
	@Resource(name="imgPath")
	private String imgPath;
    
	@RequestMapping(value="imgUpload")
    public String imgUpload(HttpSession session) {
		
		if(session.getAttribute("userId") == null)
		{
			return "redirect:/";
		}
		
    	return "/coordination/member/imgUpload";
    }
	
    //이미지 업로드 처리
    @ResponseBody // view가 아닌 data리턴
    @RequestMapping(value="/uploadImg", method=RequestMethod.POST)
    public ResponseEntity<String> uploadImg(MultipartFile file, HttpSession session) throws Exception {//session.getId(); 수정
    	
    	//id
    	String userId = session.getAttribute("userId").toString();
    	
    	return new ResponseEntity<String>(
    			UploadFileUtils.uploadFile(
    					imgPath,
    					file.getOriginalFilename(),
    					file.getBytes(),
    					userId), HttpStatus.OK);
    }

    //이미지 표시
    @ResponseBody // view가 아닌 data리턴
    @RequestMapping(value = "/displayImg", method = RequestMethod.GET)
    public ResponseEntity<byte[]> displayImg(@RequestParam("name") String fileName, @RequestParam("folder") String folder) throws Exception {
    	// 서버의 파일을 다운로드하기 위한 스트림
        InputStream in = null; //java.io
        ResponseEntity<byte[]> entity = null;
        try {
            // 헤더 구성 객체(외부에서 데이터를 주고받을 때에는 header와 body를 구성해야하기 때문에)
            HttpHeaders headers = new HttpHeaders();
            // InputStream 생성
            in = new FileInputStream(imgPath+"\\"+folder+"\\"+fileName);
            // 이미지 파일이면
            headers.setContentType(MediaType.IMAGE_JPEG);
            // 바이트배열, 헤더, HTTP상태코드
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // HTTP상태 코드()
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close(); //스트림 닫기
        }
        return entity;
    }
}
