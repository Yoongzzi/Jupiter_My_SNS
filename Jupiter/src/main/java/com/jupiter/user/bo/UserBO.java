package com.jupiter.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jupiter.user.dao.UserDAO;
import com.jupiter.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	public void addUser(String loginId, String password, 
			String name, String email) {
		userDAO.insertUser(loginId, password, name, email);
	}
	
	public User getUserByLoginIdAndPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, password);
	}
}
