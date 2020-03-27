package com.book.bookList.addController;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.bookList.categorieDAO.CategorieService;
import com.book.bookList.categorieDTO.CategorieDTO;

@Controller
public class AddCategorieController {

	private final static Logger logger = LoggerFactory.getLogger(AddCategorieController.class);
	@Autowired private CategorieService categorieService;

	@RequestMapping(value="/add/selectCategorie.do")
	public String selectCategorie(Model model){
		List<CategorieDTO> cateList=categorieService.selectAllCategorie();
		System.out.println("/add/selectCategorie.do 카테고리 전체 조회  cateList.size() = "+cateList.size());
		model.addAttribute("cateList", cateList);
		
		return "add/addCategorie";
	}
	
	@RequestMapping(value="/add/addCategorie.do", method=RequestMethod.GET)
	public String addCategorieShow(Model model){
		
		logger.info("카테고리 추가하는 페이지 보여주기");
		System.out.println("/add/addCategorie.do 조회  ");
		return "add/addCategorie";
	}
	
	@RequestMapping(value="/add/addCategoreInsert.do", method=RequestMethod.POST)
	public String insertCategorie(@ModelAttribute CategorieDTO categorieDTO, Model model){
		System.out.println("값이 들어 왔는지 확인 categoreDTO : "+categorieDTO.toString());
		
		String useCk=categorieDTO.getUseCk();
		System.out.println("사용여부 체크 : "+useCk);
		if(useCk == null){
			categorieDTO.setUseCk("n");
		}
		
		int insertCK=categorieService.insertCategorie(categorieDTO);
		logger.info("카테고리 추가 성공여부  insertCK= "+insertCK);
		
		return "redirect:/add/selectCategorie.do";
	}
	
	@RequestMapping(value="/add/nameCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public int nameCheck(@RequestParam String cateName){
		logger.info("nameCheck.do  파라미터 cateName={}",cateName);
		return categorieService.selectNameCheck(cateName);
	}
	
	@RequestMapping(value="/inc/selectCategorie.do", method=RequestMethod.POST)
	@ResponseBody
	public List<CategorieDTO> SelectCategorieAjax(){
		logger.info("SelectCategorieAjax 입니다.");
		List<CategorieDTO> cateListAjax= categorieService.selectAllCategorie();
		logger.info("cateListAjax.size() = {}",cateListAjax.size());
		return cateListAjax;
	}
	
	@RequestMapping("/add/cateUserChange.do")
	@ResponseBody
	public int updateCateUseCk(@RequestParam int cateNo,
							   @RequestParam String useCk){
		logger.info("ajax 카테고리 useCk 변경하는 곳 파라미터 cateNo={}  useCk={}",cateNo,useCk);
		//map에 넣기
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("cateNo", cateNo);
		map.put("useCk", useCk);
		
		categorieService.updateUseCk(map);
		return 1;
	}
}
