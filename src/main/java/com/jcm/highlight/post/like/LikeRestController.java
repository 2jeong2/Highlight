package com.jcm.highlight.post.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jcm.highlight.post.like.bo.LikeBO;

@RestController
public class LikeRestController {

	
	@Autowired
	private LikeBO likeBO;
	@GetMapping("/post/like")
	public Map<String,Boolean>like(HttpServletRequest request,@RequestParam("postId")int postId) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		boolean isLike = likeBO.addLike(postId, userId);
		
		//좋아요{"isLike":true}
		//좋아요 취소{"isLike":false}
		
		Map<String, Boolean> result = new HashMap<>();
//		if(isLike) {
//			result.put("isLike","true");
//		}else {
//			result.put("isLike","false");
//		}
		result.put("isLike", isLike);
		return result;
	}
}
