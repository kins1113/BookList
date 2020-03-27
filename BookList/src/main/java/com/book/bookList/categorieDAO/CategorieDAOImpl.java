package com.book.bookList.categorieDAO;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.bookList.categorieDTO.CategorieDTO;


@Repository
public class CategorieDAOImpl implements CategorieDAO{
	
	private String namespace="config.mybatis.mapper.oracle.categorie.";
	
	@Autowired SqlSessionTemplate sqlSession;
	
	public List<CategorieDTO> selectAllCategorie(){
		List<CategorieDTO> list = sqlSession.selectList(namespace+"selectAllCategorie");
		System.out.println("DTO에서 : "+list.size());
		return list;
	}
	
	public int insertCategorie(CategorieDTO categorieDTO){
		return sqlSession.insert(namespace+"insertCategorie",categorieDTO);
	}

	@Override
	public int selectNameCheck(String cateName) {
		return sqlSession.selectOne(namespace+"selectNameCheck",cateName);
	}

	@Override
	public int updateUseCk(Map<String, Object> map) {
		return sqlSession.update(namespace+"updateUseCk", map);
	}
}
