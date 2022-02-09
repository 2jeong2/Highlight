package com.jcm.highlight.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jcm.highlight.post.bo.PostBO;
import com.jcm.highlight.post.model.Post;

@Controller

@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostBO postBO;
	
	
	@GetMapping("/timeline_view")
	public String timelineView(HttpServletRequest request,Model model) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<Post> postList = postBO.getPostList(userId);
		model.addAttribute("postList",postList);
		
		return "post/timelineView";
	}
	
	
	
	
	
	
	
	
}
