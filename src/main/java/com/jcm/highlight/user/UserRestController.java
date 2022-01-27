package com.jcm.highlight.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jcm.highlight.user.bo.UserBO;
import com.jcm.highlight.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {

	
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String,String> signUp(
			@RequestParam("phoneNumber")String phoneNumber,
			@RequestParam("loginId")String loginId,
			@RequestParam("name")String name,
			@RequestParam("password")String password,
			@RequestParam("email")String email) {
		
		
		 int count =  userBO.addUser(phoneNumber, loginId, name, password, email);
		 Map<String,String> result = new HashMap<>();
		 if(count == 1) {
			 
			 result.put("result","success");
			 
			 
		 }else {
			 result.put("result", "fail");
		 }
		 return result;
	}

	@PostMapping("/sign_in")
	public Map<String,String> signIn(
			@RequestParam("loginId")String loginId,
			@RequestParam("password")String password,
			HttpServletRequest request){
		
		User user = userBO.selectUser(loginId, password);
		
		Map<String,String> result = new HashMap<>();
		
		if(user != null) {
			//로그인 성공
			result.put("result", "success");
			HttpSession session = request.getSession();
			
			//id,loginId,name
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			
		}else {
			//로그인 실패
			result.put("result", "fail");
		}
		return result;
	}
	
}
