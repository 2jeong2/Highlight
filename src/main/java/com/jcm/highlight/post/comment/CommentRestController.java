package com.jcm.highlight.post.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;

import com.jcm.highlight.post.comment.bo.CommentBO;

public class CommentRestController {
	
	
	@Autowired
	private CommentBO commentBO;
	
	public Map<String, String> create(
			@RequestParam("postId")int postId,
			@RequestParam("content")String content,
			HttpServletRequest request
			){
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName =  (String)session.getAttribute("userName");
		
		Map<String, String> result = new HashMap<>();
		
		int count = commentBO.addComment(userId, postId, userName, content);
		 if(count == 1) {
			 result.put("result", "success");
			 
		 }else {
			 result.put("result", "fail");
		 }
		 return result;
		
	}

}
