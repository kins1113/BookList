package com.book.bookList.homeListController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.bookList.common.PaginationInfo;
import com.book.bookList.homeListDAO.HomeListServiceImpl;

@Controller
public class HomeListController {

	private final static Logger logger = LoggerFactory.getLogger(HomeListController.class);
	@Autowired HomeListServiceImpl homeListService;
	
	@RequestMapping(value="/homeList.do")
	public String HomeListShow(@RequestParam(defaultValue="1") int currentPage,
								@RequestParam(defaultValue="1") int recordCountPerPage,
								@RequestParam(defaultValue="0") int cateNo,
								Model model){
		logger.info("HomeList show 메서드 파라미터 currentPage={}, recordCountPerPage={}",currentPage, recordCountPerPage);
		logger.info("cateNo={}",cateNo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		//블럭사이즈 
		pagingInfo.setBlockSize(5);
		//현제 페이지 
		pagingInfo.setCurrentPage(currentPage);
		//한페이지에 몇게를 보여줄지 
		if(recordCountPerPage==1){
			pagingInfo.setRecordCountPerPage(15);
		}else{
			pagingInfo.setRecordCountPerPage(recordCountPerPage);
		}
		
		//맵에저장
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("recordCountPerPage", pagingInfo.getRecordCountPerPage());
		map.put("firstRecordIndex", pagingInfo.getFirstRecordIndex());
		map.put("cateNo",cateNo);
		//리스트 조회
		List<Map<String, Object>> listHome= homeListService.selectAllHomeList(map);
		logger.info("listHome의 사이즈는={}",listHome.size());
		
		//리스트 조회 2 totalcount용
		int totalCount=homeListService.selectGetTotalCount(map);
		logger.info("totalCount ={}",totalCount);
		pagingInfo.setTotalRecord(totalCount);
		
		//모델에 추가
		model.addAttribute("pagingInfo",pagingInfo);
		model.addAttribute("listHome",listHome);
		
		return "list/listHome";
	}
	
	@RequestMapping(value="/homeListDelete.do", method=RequestMethod.POST)
	@ResponseBody
	public int HomeListDelect(@RequestParam int[] ckArr){
		logger.info("HomList delete 메서드 list.size={}", ckArr.length);
		int re=homeListService.updateDelCk(ckArr);
		logger.info("삭제된 list 수 ={}",re);
		return re;
	}
	
	@RequestMapping(value="/homeListTrash.do")
	public String HomeListTrash(@RequestParam(defaultValue = "1") int currentPage,
								@RequestParam(defaultValue = "1") int recordCountPerPage,
								Model model){
		logger.info("homeListTrash show 메서드");
		
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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recordCountPerPage",pagingInfo.getRecordCountPerPage());
		map.put("firstRecordIndex",pagingInfo.getFirstRecordIndex());
		
		//리스트 조회
		List<Map<String, Object>> homeListTrash=homeListService.selectHomeListTrash(map);
		logger.info("addListShow homeListTrash 목록 수 = {} ",homeListTrash.size());
		model.addAttribute("homeListTrash",homeListTrash);
		//리스트 조회 2 totalcount용
		int totalCount=homeListService.selectGetTotalCountTrash();
		logger.info("totalCount ={}",totalCount);
		pagingInfo.setTotalRecord(totalCount);
		
		//모델에 추가
		model.addAttribute("pagingInfo",pagingInfo);
		
		return "list/listTrash";
	}
	
	@RequestMapping(value="/deleteHome.do", method=RequestMethod.POST)
	@ResponseBody
	public int deleteHomeList(@RequestParam int[] ckArr){
		logger.info("deleteHomeList입니다. 파라미터 ckArr.length= {} ",ckArr.length);
		int re = homeListService.deleteHomeList(ckArr);
		logger.info("DB에서 삭제된 HomeList의 수 re={}",re);
		return re;
	}
	
}
