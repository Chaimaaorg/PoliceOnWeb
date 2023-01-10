package com.java.helpers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Base64;

public class ImageToBase64 {

	public static String convertToBase64(String filePath) {
	    try {
	        File file = new File(filePath);
	        byte[] fileContent = new byte[(int)file.length()];
	        FileInputStream fis = new FileInputStream(file);
	        fis.read(fileContent);
	        fis.close();
	        return Base64.getEncoder().encodeToString(fileContent);
	    } catch (FileNotFoundException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return null;
	}

//    public static void main(String[] args) {
//        try {
//            String base64 = convertToBase64("C:\\Users\\HP\\Pictures\\music.jpg");
//            System.out.println(base64);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
}



