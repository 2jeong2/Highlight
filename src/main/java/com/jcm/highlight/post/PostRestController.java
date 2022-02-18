package com.jcm.highlight.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jcm.highlight.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {

	@Autowired			
	private PostBO postBO;		
			
	@PostMapping("/timeline")		
	public  Map<String,String> timeline(		
			@RequestParam("content")String content,
			@RequestParam("file")MultipartFile file,
			HttpServletRequest request){
			
		HttpSession session = request.getSession();	
		int userId = (Integer)session.getAttribute("userId");
		//가져올 때 Object롤 가져오기때문에(integer)를 붙여줘야함
		String userName = (String)session.getAttribute("userName");
			
		int count = postBO.addPost(userId, content,userName, file);	
			
		Map<String, String> result = new HashMap<>();	
			
		if(count == 1) {	
			result.put("result", "success");
			
		}else {	
			result.put("result", "fail");
		}
		return result;	
			
	}	
	//Model 사용못함
	
	@GetMapping("/delete")
	public Map<String,String> delete(@RequestParam ("postId")int postId,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count =  postBO.deletePost(postId,userId);
		
		Map<String,String>  result = new HashMap<>();

		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	
	
}
