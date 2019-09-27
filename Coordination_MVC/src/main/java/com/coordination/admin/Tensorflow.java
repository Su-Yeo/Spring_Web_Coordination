package com.coordination.admin;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Tensorflow {
	
	private static final Logger logger = LoggerFactory.getLogger(Tensorflow.class);
	
	//전신 이미지 분리
	//원본 이미지 -> 상의 이미지
	//하의 이미지 -> 원본파일-1.jpg
	//원본 이미지 -> 원본파일-2.jpg로 복사
	public void Cut(String image)
	{
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
		}
	}
	
	//상의 이미지 분석
	public void Upper_Tensorflow(String image)
	{
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
			cmd[4] = "--labels=C:\\tmp\\top\\retrain_labels.txt";
			cmd[5] = "--graph=C:\\tmp\\top\\retrain_graph.pb";
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
			logger.info("**********Error!! (Upper_Tensorflow())**********");
			System.out.println("**********Error!! (Upper_Tensorflow())**********");
			e.printStackTrace();
			
			System.exit(-1);
		}finally {
			System.out.println("======상의 이미지 분석 완료===");
		}
	}
	
	//하의 이미지 분석
	public void Lower_Tensorflow(String image)
	{
		//이미지명 → 이미지명-1.jpg
		image = image.substring(0, image.length()-4);
		image += "-1.jpg";
		System.out.println(image);

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
			cmd[4] = "--labels=C:\\tmp\\top\\retrain_labels.txt";
			cmd[5] = "--graph=C:\\tmp\\top\\retrain_graph.pb";
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
			logger.info("**********Error!! (lower_Tensorflow())**********");
			System.out.println("**********Error!! (lower_Tensorflow())**********");
			e.printStackTrace();
			
			System.exit(-1);
		}finally {
			System.out.println("======하의 이미지 분석 완료===");
		}

	}
	
	//이미지 복구
	public void restore(String image)
	{
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
			logger.info("**********Error!! (restore())**********");
			System.out.println("**********Error!! (restore())**********");
			e.printStackTrace();
			
			System.exit(-1);
		}finally {
			System.out.println("======이미지 복구 완료===");
		}
	}
}