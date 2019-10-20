package com.coordination.admin;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TensorflowImpl implements Tensorflow {

	private static final Logger logger = LoggerFactory.getLogger(TensorflowImpl.class);
	
	//전신 이미지를 상의/하의로 구분
	//상의 : 원본이미지에 상의부분을 덮어씌움
	//하의 : 원본이미지.1jpg
	//원본 : 원본이미지.2jpg로 Copy
	@Override
	public void Cut(String image) {
		String s = null;
		try {
			
			System.out.println("Executing Python cut.py");
			
			String cutPath = "C:\\Python\\Lib\\site-packages\\"
					+ "tensorflow\\examples\\label_image\\cut.py";
			
			//추론 이미지 경로와 동일해야함
			String[] cut = new String[3];
			cut[0] = "Python";
			cut[1] = cutPath;
			cut[2] = image;
			
			Process process = Runtime.getRuntime().exec(cut);
			
			BufferedReader stdInput = new BufferedReader(new
					InputStreamReader(process.getInputStream()));
			
			BufferedReader stdError = new BufferedReader(new
					InputStreamReader(process.getErrorStream()));
			
			while((s = stdInput.readLine()) != null)
			{
				System.out.println(s);
			}
			
			while((s = stdError.readLine()) != null)
			{
				System.out.println(s);
			}
		}catch(Exception e){
			logger.info("**********Error!! (Cut())**********");
			System.out.println("**********Error!! (Cut())**********");
			e.printStackTrace();
			
			System.exit(-1);
		}finally {
			System.out.println("===상의 이미지 자르기 완료===");
			System.out.println("===하의 이미지 자르기 완료===");
			System.out.println("===원본 복사 완료===");
			System.out.println();
		}
	}

	//관리자-상의 이미지 분석
	@Override
	public void admin_Upper(String image) {
		String s = null;
		try {
			
			System.out.println("Executing Python admin_upper.py");
			
			//이미지 추론
			String PythonScriptPath = "C:\\Python\\Lib\\site-packages\\tensorflow"
					+ "\\examples\\label_image\\admin_upper.py";
			
			String[] cmd = new String[7];
			cmd[0] = "Python";
			cmd[1] = PythonScriptPath;
			cmd[2] = "--input_layer=Mul";
			cmd[3] = "--output_layer=final_result";
			cmd[4] = "--labels=C:\\tmp\\color\\retrain_labels.txt";
			cmd[5] = "--graph=C:\\tmp\\color\\retrain_graph.pb";
			cmd[6] = "--image=" + image;
			
			Process process = Runtime.getRuntime().exec(cmd);
			
			BufferedReader stdInput = new BufferedReader(new
					InputStreamReader(process.getInputStream()));
			
			BufferedReader stdError = new BufferedReader(new
					InputStreamReader(process.getErrorStream()));
			
			while((s = stdInput.readLine()) != null)
			{
				System.out.println(s);
			}
			
			while((s = stdError.readLine()) != null)
			{
				System.out.println(s);
			}
		}catch(Exception e){
			logger.info("**********Error!! (admin_Upper())**********");
			System.out.println("**********Error!! (admin_Upper())**********");
			e.printStackTrace();
			
			System.exit(-1);
		}finally {
			System.out.println("======상의 이미지 분석 완료===");
			System.out.println();
		}
	}

	//관리자-하의 이미지 분석
	@Override
	public void admin_Lower(String image) {
		//이미지명 → 이미지명-1.jpg
		image = image.substring(0, image.length()-4);
		image += "-1.jpg";
		String s = null;
		try {
			
			System.out.println("Executing Python admin_lower.py");		
						
			//이미지 추론
			String PythonScriptPath = "C:\\Python\\Lib\\site-packages\\tensorflow"
					+ "\\examples\\label_image\\admin_lower.py";
			
			String[] cmd = new String[7];
			cmd[0] = "Python";
			cmd[1] = PythonScriptPath;
			cmd[2] = "--input_layer=Mul";
			cmd[3] = "--output_layer=final_result";
			cmd[4] = "--labels=C:\\tmp\\color\\retrain_labels.txt";
			cmd[5] = "--graph=C:\\tmp\\color\\retrain_graph.pb";
			cmd[6] = "--image=" + image;
			
			Process process = Runtime.getRuntime().exec(cmd);
			
			BufferedReader stdInput = new BufferedReader(new
					InputStreamReader(process.getInputStream()));
			
			BufferedReader stdError = new BufferedReader(new
					InputStreamReader(process.getErrorStream()));
			
			while((s = stdInput.readLine()) != null)
			{
				System.out.println(s);
			}
			
			while((s = stdError.readLine()) != null)
			{
				System.out.println(s);
			}
			
		}catch(Exception e){
			logger.info("**********Error!! (admin_Lower())**********");
			System.out.println("**********Error!! (admin_Lower())**********");
			e.printStackTrace();
			
			System.exit(-1);
		}finally {
			System.out.println("======하의 이미지 분석 완료===");
			System.out.println();
		}		
	}

	//관리자-쇼핑몰 이름 업데이트
	@Override
	public void admin_ShopName(String shopName) {
		String s = null;
		try {
			
			System.out.println("Executing Python shopName.py");		
							
			//이미지 추론
			String PythonScriptPath = "C:\\Python\\Lib\\site-packages\\tensorflow"
					+ "\\examples\\label_image\\shopName.py";
				
			String[] cmd = new String[3];
			cmd[0] = "Python";
			cmd[1] = PythonScriptPath;
			cmd[2] = shopName;
				
			Process process = Runtime.getRuntime().exec(cmd);
				
			BufferedReader stdInput = new BufferedReader(new
					InputStreamReader(process.getInputStream()));
				
			BufferedReader stdError = new BufferedReader(new
					InputStreamReader(process.getErrorStream()));
				
			while((s = stdInput.readLine()) != null)
			{
				System.out.println(s);
			}
				
			while((s = stdError.readLine()) != null)
			{
				System.out.println(s);
			}
				
		}catch(Exception e){
			logger.info("**********Error!! (admin_ShopName())**********");
			System.out.println("**********Error!! (admin_ShopName())**********");
			e.printStackTrace();
				
			System.exit(-1);
		}finally {
			System.out.println("======쇼핑몰 이름 업데이트 완료======");
			System.out.println();
		}
	}

	//관리자-사진 이미지 복구
	@Override
	public void admin_restore(String image) {
		String s = null;
		try {
			//이미지명.jpg → 이미지명
			String restore = image.substring(0, image.length()-4);
			
			//이미지명 → 이미지명-2.jpg (원본파일명)
			restore += "-2.jpg";
			
			String[] cmd = new String[3];
			cmd[0] = "Python";
			cmd[1] = "C:\\Python\\Lib\\site-packages\\tensorflow\\"
					+ "examples\\label_image\\restore.py";
			cmd[2] = restore;
			
			
			Runtime.getRuntime().exec(cmd);
		}catch(Exception e) {
			logger.info("**********Error!! (admin_restore())**********");
			System.out.println("**********Error!! (admin_restore())**********");
			e.printStackTrace();
			
			System.exit(-1);
		}finally {
			System.out.println("======이미지 복구 완료===");
			System.out.println();
		}
	}

	//사용자-상의 이미지 분석
	@Override
	public void user(String image) {
		String s = null;
		try {
			
			System.out.println("Executing Python user_upper.py");
			
			//이미지 추론
			String PythonScriptPath = "C:\\Python\\Lib\\site-packages\\tensorflow"
					+ "\\examples\\label_image\\user.py";
			
			String[] cmd = new String[7];
			cmd[0] = "Python";
			cmd[1] = PythonScriptPath;
			cmd[2] = "--input_layer=Mul";
			cmd[3] = "--output_layer=final_result";
			cmd[4] = "--labels=C:\\tmp\\color\\retrain_labels.txt";
			cmd[5] = "--graph=C:\\tmp\\color\\retrain_graph.pb";
			cmd[6] = "--image=" + image;
			
			Process process = Runtime.getRuntime().exec(cmd);
			
			BufferedReader stdInput = new BufferedReader(new
					InputStreamReader(process.getInputStream()));
			
			BufferedReader stdError = new BufferedReader(new
					InputStreamReader(process.getErrorStream()));
			
			while((s = stdInput.readLine()) != null)
			{
				System.out.println(s);
			}
			
			while((s = stdError.readLine()) != null)
			{
				System.out.println(s);
			}
		}catch(Exception e){
			logger.info("**********Error!! (user())**********");
			System.out.println("**********Error!! (user())**********");
			e.printStackTrace();
			
			System.exit(-1);
		}finally {
			System.out.println("======사용자 이미지 분석 완료===");
			System.out.println();
		}
	}
}
