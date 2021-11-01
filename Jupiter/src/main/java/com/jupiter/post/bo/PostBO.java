package com.jupiter.post.bo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jupiter.common.FileManagerService;
import com.jupiter.post.dao.PostDAO;

@Service
public class PostBO {
	private Logger logger = LoggerFactory.getLogger(PostBO.class);
	
	private static final int POST_MAX_SIZE = 3;
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public void addUpPost(int userId, String content, MultipartFile file) {
		
	}
	
	
	
}
