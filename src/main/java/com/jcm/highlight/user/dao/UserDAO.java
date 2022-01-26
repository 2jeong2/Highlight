package com.jcm.highlight.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jcm.highlight.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("phoneNumber")String phoneNumber,
			@Param("loginId")String loginId,
			@Param("name")String name, 
			@Param("password")String password,
			@Param("email")String email);
	
	
	public User getUser(
			@Param("loginId")String loginId,
			@Param("password")String password);
}
