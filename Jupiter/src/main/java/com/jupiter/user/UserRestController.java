package com.jupiter.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jupiter.common.EncryptUtils;
import com.jupiter.user.bo.UserBO;

@RequestMapping("/user")
@RestController
public class UserRestController {
	@Autowired
	private UserBO userBO;
	
	
	
	
}
