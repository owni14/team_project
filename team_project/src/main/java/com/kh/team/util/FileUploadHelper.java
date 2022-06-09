package com.kh.team.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class FileUploadHelper {
	public static String uploadFile(String uploadPath, String originalFilename, byte[] fileData) {
		UUID uuid=UUID.randomUUID();
		String saveFilename= uploadPath+"/"+uuid+"_"+originalFilename;
		System.out.println("save saveFilename :"+saveFilename);
		
		File ftarget=new File(saveFilename);
		try {
			FileCopyUtils.copy(fileData, ftarget);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return saveFilename;
	}
	
	//파일 지우기
	public static boolean deleteFile(String filename) {
		File f= new File(filename);
		if(f.exists()) {
			f.delete();
			return true;
		}
		return false;
	}
	
	//파일 리스트에서 파일 다지우기
	public static void deleteFileS(String fileDirPath) {
		File f= new File(fileDirPath);
		String[] arrfiles=f.list();
			for(String strFile:arrfiles) {
				System.out.println("deleteFileS"+strFile);
			}
		}
	
	//이벤트 파일 비교
	public static List<String> eventFilnameExtraction(String event_content,String serverIp){
		String[] arrSplitStr=event_content.split("<img");
		//list 파일 목록 담을거
		List<String> contentFileList=new ArrayList<String>();
		for(String strFile:arrSplitStr) {
			//이미지 서버꺼인지 검정
			if(strFile.contains(serverIp)) {
//				System.out.println(strFile);
				int strFileIndex=strFile.indexOf("192");
				int dblSlashIndex=strFileIndex-2;
				int endFileExtIndex=strFile.indexOf("\"",strFileIndex );
				contentFileList.add(strFile.substring(dblSlashIndex,endFileExtIndex));
			}
		}
		return contentFileList;
	}
	// 이벤트 저장 디렉토리 획득
	public static String getEventFileSaveFath(String serverip) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String today= formatter.format(new java.util.Date());
		String year=today.substring(0,4);
		String month=today.substring(4,6);
		String day=today.substring(6);
		 String filePath = 
		"//"+serverip+"/ServerFolder/"+year+"/"+month+"/"+day+"/";
		return filePath;
	}
}
