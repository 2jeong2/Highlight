package com.jcm.highlight.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jcm.highlight.common.FileManagerService;
import com.jcm.highlight.post.dao.PostDAO;

@Service
public class PostBO {

	
	@Autowired			
	private PostDAO postDAO;		
			
	public int addPost(int userId, String content,String userName, MultipartFile file) {		
			
		String filePath = FileManagerService.saveFile(userId, file);	
			
		return postDAO.insertPost(userId, content,userName, filePath);	
	}		
}
