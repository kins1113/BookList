package com.book.bookList.categorieDAO;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.bookList.categorieDTO.CategorieDTO;

@Service
public class CategorieServiceImpl implements CategorieService{
	@Autowired private CategorieDAO categorieDAO;
	@Override
	public List<CategorieDTO> selectAllCategorie() {
		List<CategorieDTO> list=categorieDAO.selectAllCategorie();
		System.out.println("서비스에서 list.size() "+list.size());
		return list;
	}

	@Override
	public int insertCategorie(CategorieDTO categorieDTO) {
		return categorieDAO.insertCategorie(categorieDTO);
	}

	@Override
	public int selectNameCheck(String cateName) {
		return categorieDAO.selectNameCheck(cateName);
	}

	@Override
	public int updateUseCk(Map<String, Object> map) {
		return categorieDAO.updateUseCk(map);
	}

}
