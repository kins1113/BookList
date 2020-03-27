package com.book.bookList.addController;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.bookList.categorieDAO.CategorieService;
import com.book.bookList.categorieDTO.CategorieDTO;
import com.book.bookList.common.PaginationInfo;
import com.book.bookList.homeListDAO.HomeListService;
import com.book.bookList.homeListDTO.HomeListDTO;

@Controller
public class AddListController {

	private final static Logger logger= LoggerFactory.getLogger(AddListController.class);
	@Autowired CategorieService categorieService;
	@Autowired HomeListService homeListService;
	
	@RequestMapping(value="/add/addList.do")
	public String addListShow( @RequestParam(defaultValue = "1") int currentPage,
		     				   @RequestParam(defaultValue = "1") int recordCountPerPage,
		     				   Model model){
		logger.info("currentPage = {}",currentPage);
		logger.info("recordCountPerPage = {}",recordCountPerPage);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		
		//블럭사이즈
		pagingInfo.setBlockSize(5);
		//현제 페이지
		pagingInfo.setCurrentPage(currentPage);
		//한페이지에 몇게를 보여줄지 
		if(recordCountPerPage==1) {
			pagingInfo.setRecordCountPerPage(15);
		}else {
			pagingInfo.setRecordCountPerPage(recordCountPerPage);
		}
		//맵에 저장
		Map<String, Object>map =new HashMap<String, Object>();
		map.put("recordCountPerPage",pagingInfo.getRecordCountPerPage());
		map.put("firstRecordIndex",pagingInfo.getFirstRecordIndex());
		map.put("cateNo", 0);
		
		//리스트 조회
		List<Map<String, Object>> homeList=homeListService.selectAllHomeList(map);
		logger.info("addListShow homelist 목록 수 = {} ",homeList.size());
		model.addAttribute("homeList",homeList);
		//리스트 조회 2 totalcount용
		int totalCount=homeListService.selectGetTotalCount(map);
		logger.info("totalCount ={}",totalCount);
		pagingInfo.setTotalRecord(totalCount);
		
		//모델에 추가
		model.addAttribute("pagingInfo",pagingInfo);
		
		//카테고리 조회
		List<CategorieDTO> cateList=categorieService.selectAllCategorie();
		logger.info("addListShow 카테고리 수 = {}",cateList.size());
		model.addAttribute("cateList",cateList);
		
		
		logger.info("pagingInfo.getFirstPage()={}",pagingInfo.getFirstPage());
		logger.info("pagingInfo.getLastPage()={}",pagingInfo.getLastPage());
		logger.info("pagingInfo.getTotalPage()={}",pagingInfo.getTotalPage());
		
		return "add/addList";
	}
	
	@RequestMapping("/add/addHomeList.do")
	public String addHomeList(@ModelAttribute HomeListDTO homeListDTO, Model model){
		logger.info("HomeList 추가 파라미터 ={}",homeListDTO);
		
		//날짜가 있으면 포맷 변경
		int re=homeListService.insertHomeList(homeListDTO);
		logger.info("HomeList insert 결과 ={} ",re);
		
		return "redirect:/add/addList.do";
	}
	

}
