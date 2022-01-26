package com.jcm.highlight.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jcm.highlight.common.EncryptUtils;
import com.jcm.highlight.user.dao.UserDAO;
import com.jcm.highlight.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String phoneNumber,String loginId, String name, String password, String email) {
		
		String encPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(phoneNumber, loginId, name, encPassword, email);
	}
	
	public User selectUser(String loginId, String password) {
		
		
		return userDAO.getUser(loginId, EncryptUtils.md5(password));
	}
}
