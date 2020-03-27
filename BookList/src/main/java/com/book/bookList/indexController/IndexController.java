package com.book.bookList.indexController;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.bookList.HomeController;
import com.book.bookList.homeListDAO.HomeListService;
import com.book.bookList.homeListDTO.HomeListDTO;

@Controller
public class IndexController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired HomeListService homeListService;
	
	@RequestMapping(value="/index.do")
	public String indexShow(Model model){
		/* List<HomeListDTO> list =homeListService.selectAllHomeList();
		 logger.info("homeList의 list.size={}",list.size());
		System.out.println("list.size = "+list.size());*/
	
		return "index";
	}
}
