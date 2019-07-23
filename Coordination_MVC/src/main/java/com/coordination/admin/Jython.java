package com.coordination.admin;

import com.coordination.admin.*;

public class Jython {

	public static void main(String[] args) {
		//Upper_Tensorflow를 통해 전신사진을 상의영역만 자른 후, 추론
		//Lower_Tensorflow를 통해 전신사진을 하의영역만 자른 후, 추론
		//restore를 통해 이미지를 복구한다.
		//이미지를 추론하는 과정에서 이미지의 경로를 지정해주어야하기 때문에
		//upper.py 를 이용해 상의 영역을 자른 후, 이미지를 덮어씌워 분석시킨다.
		//lower.py 를 이용해 하의 영역을 자른 후, 이미지를 덮어씌워 분석시킨다.
		//label_image.py : 상의 영역의 이미지를 분석하여 Database에 저장
		//label_image2.py : 하의 영역의 이미지를 분석하여 Database
		// 
				
		Tensorflow tf = new Tensorflow();
		
		//String image = "C:\\Users\\sangw\\OneDrive\\Desktop\\data\\6.jpg";
		//String image = "C:\\Users\\sangw\\OneDrive\\Desktop\\data\\10.jpg";
		//String image = "C:\\Users\\sangw\\OneDrive\\Desktop\\data\\18.jpg";
		String image = "C:\\Users\\sangw\\OneDrive\\Desktop\\data\\14.jpg";
		
		//상의 분석
		tf.Upper_Tensorflow(image);

		//하의 분석
		tf.Lower_Tensorflow(image);
				
		//사진 복구
		tf.restore(image);
	}
}