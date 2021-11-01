package com.jupiter.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jupiter.common.EncryptUtils;
import com.jupiter.user.bo.UserBO;
import com.jupiter.user.model.User;

@RequestMapping("/user")
@RestController
public class UserRestController {
	@Autowired
	private UserBO userBO;
	
	/**
	 * 아이디 중복확인 체크
	 * @param loginId
	 * @return
	 */
	@RequestMapping("/is_comflicted_id")
	public Map<String, Boolean> isComflictedId(
			@RequestParam("loginId") String loginId) {
		
		// 중복 여부에 대한 결과 Map 생성
		Map<String, Boolean> result = new HashMap<>();
		result.put("result", userBO.existLoginId(loginId));
		
		return result;
	}
	
	/**
	 * 회원가입
	 * @param loginId
	 * @param password
	 * @param name
	 * @param email
	 * @return
	 */
	@PostMapping("/sign_up")
	public Map <String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		
		userBO.addUser(loginId, encryptPassword, name, email);
		
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		return result; 
		}
	
	/**
	 * 로그인
	 * @param loginId
	 * @param password
	 * @param request
	 * @return
	 */
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password,
			HttpServletRequest request) {
		
		String encryptPassword =EncryptUtils.md5(password);
		
		
		User user = userBO.getUserByLoginIdAndPassword(loginId, encryptPassword);
		
		
		Map<String, Object> result = new HashMap<>();
		if (user != null) {
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userloginId", user.getLoginId());
		} else {
			result.put("result", "error");
		}
		

		
		// 결과 리턴
		return result;
		
	}
}
	
	

