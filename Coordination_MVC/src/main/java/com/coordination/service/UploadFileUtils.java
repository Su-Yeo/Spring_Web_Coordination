package com.coordination.service;

import java.io.File;
import java.text.SimpleDateFormat;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	public static String uploadFile(String imgPath, String originalName, byte[] fileData, String id) throws Exception {
		// 날자시간 구하기
		SimpleDateFormat format = new SimpleDateFormat ("yyyyMMdd_HHmmss");
		String format_time = format.format (System.currentTimeMillis());
        // 이미지 확장자 구하기
        String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
        // 저장할 파일명 = 아이디_날짜_시간.확장자
        String savedName = id.toString() + "_" + format_time.toString() + "." + formatName;
        // 업로드할 디렉토리(날짜별 폴더) 생성 
        String savedPath = makeDir(imgPath);
        // 파일 경로(기존의 업로드경로+새폴더경로), 파일명을 받아 파일 객체 생성
        File target = new File(imgPath + savedPath, savedName);
        // 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
        FileCopyUtils.copy(fileData, target);
        return savedPath+savedName;
    }

	// 디렉토리 생성
    private static String makeDir(String imgPath) {     
    	//폴더 생성
  		File fileDir = new File(imgPath, "user");
  		if(!fileDir.isDirectory()){
  			fileDir.mkdirs();
  		}
        return "\\user\\";
    }
}
