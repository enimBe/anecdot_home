package com.enimbe.anecdot.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	public final static String FILE_UPLOAD_PATH = "";
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	public static String saveFile(int userId, int postId, MultipartFile file) {
		
		if(file == null) {
			logger.error("FileManagerService::saveFile - no image upload");
			return null;
		}
		
		String directoryName = userId + "_" + postId + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		
		if(directory.mkdir() == false) {
			logger.error("FileManagerService::saveFile - setting directory error");
			return null;
		}
		
		try {
			byte[] bytes = file.getBytes();
			
			Path path = Paths.get(filePath + file.getOriginalFilename());
			
			Files.write(path, bytes);
		} catch (IOException e) {
			logger.error("FileManagerService::saveFile - file save error");
		}
			
		return "/images/" + directoryName + file.getOriginalFilename();
			
	}
	

}
