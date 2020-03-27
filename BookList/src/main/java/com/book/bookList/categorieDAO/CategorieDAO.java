package com.book.bookList.categorieDAO;

import java.util.List;
import java.util.Map;

import com.book.bookList.categorieDTO.CategorieDTO;

public interface CategorieDAO {
	public List<CategorieDTO> selectAllCategorie();
	public int insertCategorie(CategorieDTO categorieDTO);
	public int selectNameCheck(String cateName);
	public int updateUseCk(Map<String, Object> map);
}
