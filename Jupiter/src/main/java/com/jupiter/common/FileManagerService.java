package com.jupiter.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component	
public class FileManagerService {

			private Logger logger = LoggerFactory.getLogger(this.getClass());
			
			// 실제 이미지가 저장될 경로
			public final static String FILE_UPLOAD_PATH = "C:\\Users\\user\\Documents\\workspace-spring-tool-suite-4-4.12.0.RELEASE\\Jupiter\\images/";
			
			public String saveFile(String loginId, MultipartFile file) throws IOException {
				String directoryName = loginId + "_" + System.currentTimeMillis() + "/";
				String filePath = FILE_UPLOAD_PATH + directoryName;
				
				File directory = new File(filePath);
				if (directory.mkdir() == false) {
					logger.error("[파일업로드] 디렉토리 생성 실패" + directoryName);
					return null;
				}
				
				
				byte[] bytes = file.getBytes();
				Path path = Paths.get(filePath + file.getOriginalFilename()); // input에 올린 파일명이다.
				Files.write(path, bytes);
				
				
				return "/images/" + directoryName + file.getOriginalFilename();
			}
			
			public void deleteFile(String imagePath) throws IOException {
				
				Path path = Paths.get(FILE_UPLOAD_PATH + imagePath.replace("/images/", ""));
				if (Files.exists(path)) {
					Files.delete(path);
				}
				
				path = path.getParent();
				if (Files.exists(path)) {
					Files.delete(path);
				}
			}
}
