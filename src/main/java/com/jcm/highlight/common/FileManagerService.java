package com.jcm.highlight.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	//public final static String FILE_UPLOAD_PATH="C:\\Users\\eje93\\Documents\\웹개발\\DATABASE\\SpringProject\\upload/";
	public final static String FILE_UPLOAD_PATH="D:\\이정이\\0927\\DATABASE\\SpringProject\\upload(highlight)\\image/";
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class); 
	//파일 저장
	public static String saveFile(int userId,MultipartFile file) {
		
		
		if(file == null) {
			logger.error("FileManangerService::saveFile - 업로드 파일 없음");
			return null;
		}
		String directoryName = userId + "_" + System.currentTimeMillis() + "/"; 
		
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			//디렉토리 생성 에러
			logger.error("FileManagerService::saveFile - 디렉토리 생성 에러");
			return null;
		}
		
		
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
			
		} catch (IOException e) {
			logger.error("FileManagerService::saveFile - 파일 저장 에러");
			e.printStackTrace();
			return null;
		}
		
		return "/images/" + directoryName +file.getOriginalFilename();
	}
	
	//파일 삭제 
	public static void removeFile(String filePath) {
		
		if(filePath == null) {
			logger.error("FileManagerService::removeFile - 삭제할 파일 없음");
			return;
		}
		
		//삭제할 파일 경로
		//filePAth:/image/2_3879438/test.png
		//실제 파일 경로 :
		String realFilePath = FILE_UPLOAD_PATH + filePath.replace("/images/", "");
		
		//파일 지우기
		Path path = Paths.get(realFilePath);
		//파일이 있는지 확인
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("FileManagerService::removeFile - 파일 삭제 실패");
				e.printStackTrace();
			}
		}
		path = path.getParent();
		
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("FileManagerService::removeFile - 디렉토리 삭제 실패");
				e.printStackTrace();
			}
		}
	}
}
