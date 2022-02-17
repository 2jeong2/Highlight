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
	public String timelineView(Model model,HttpServletRequest request) {
		
		
		HttpSession session = request.getSession(); 
		int userId =(Integer)session.getAttribute("userId");
		  
		List<Post> postList = postBO.getPostList(userId);
		model.addAttribute("postList",postList);
		//List<PostDetail> postList = postBO.getPostList(userId);
		  
		//model.addAttribute("postList", postList);
		
		 
	
		
		return "post/timelineView";
	}
	
	@GetMapping("/create")
	public String createView() {
		return "post/createView";
	}
	
	//jsp로 전달할 수 있는 controller에서만 model사용가능(jstl을 사용하기 위해)
	
	
	
	
	
}
