package com.book.bookList.homeListDAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.bookList.homeListDTO.HomeListDTO;

@Repository
public class HomeListDAOImpl implements HomeListDAO{
	
	private String namespace="config.mybatis.mapper.oracle.HomeList.";
	@Autowired SqlSessionTemplate sqlsession;
	
	@Override
	public List<Map<String,Object>> selectAllHomeList(Map<String, Object> map) {
		return sqlsession.selectList(namespace+"selectAllHomeList",map);
	}

	@Override
	public int selectGetTotalCount(Map<String, Object> map) {
		return sqlsession.selectOne(namespace+"selectGetTotalCount", map);
	}

	@Override
	public int insertHomeList(HomeListDTO dto) {
		return sqlsession.insert(namespace+"insertHomeList",dto);
	}

	@Override
	public int updateDelCk(int No) {
		return sqlsession.update(namespace+"updateDelCk", No);
	}

	@Override
	public List<Map<String, Object>> selectHomeListTrash(Map<String, Object> map) {
		return sqlsession.selectList(namespace+"selectHomeListTrash", map);
	}

	@Override
	public int selectGetTotalCountTrash() {
		return sqlsession.selectOne(namespace+"selectGetTotalCountTrash");
	}

	@Override
	public int deleteHomeList(int no) {
		return sqlsession.delete(namespace+"deleteHomeList", no);
	}
}
