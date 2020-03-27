package com.book.bookList.addController;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.bookList.userInfoDAO.UserInfoService;
import com.book.bookList.userInfoDTO.UserInfoDTO;

@Controller
public class AddUserController {
	
	@Autowired UserInfoService userInfoService;
	private final static Logger logger=LoggerFactory.getLogger(AddUserController.class);
	
	@RequestMapping(value="/add/addUser.do")
	public String addUserShow(Model model){
		List<UserInfoDTO> list=userInfoService.UserInfoSelectAll();
		logger.info("AddUserController - AddUserShow입니다. ");
		logger.info("userInfo select 결과 : {}",list.size());
		
		model.addAttribute("UserInfolist", list);
		
		return "add/addUser";
	}
}
