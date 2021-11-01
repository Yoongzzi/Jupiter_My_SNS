package com.jupiter.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@RequestMapping("/post_upload_page")
	public String postUploadPage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
//		if (userId == null) {
//			return "redirect:/user/login_view";
//		}
		model.addAttribute("viewName", "post/post_upload");
		return "template/layout";
	}

}
