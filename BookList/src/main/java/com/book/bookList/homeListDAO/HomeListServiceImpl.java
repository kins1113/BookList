package com.book.bookList.homeListDAO;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.bookList.homeListDTO.HomeListDTO;

@Service
public class HomeListServiceImpl implements HomeListService{
	
	@Autowired HomeListDAO homeListDAO;
	private final static Logger logger=LoggerFactory.getLogger(HomeListServiceImpl.class);
	
	@Override
	public List<Map<String, Object>> selectAllHomeList(Map<String, Object> map) {
		return homeListDAO.selectAllHomeList(map);
	}

	@Override
	public int selectGetTotalCount(Map<String,Object> map) {
		return homeListDAO.selectGetTotalCount(map);
	}

	@Override
	public int insertHomeList(HomeListDTO dto) {
		logger.info("서비스에서 HomeListDTO= {}",dto);
		return homeListDAO.insertHomeList(dto);
		
	}

	@Override
	public int updateDelCk(int[] noArr) {
		int count=0;
		for(int i=0;i<noArr.length;i++){
			homeListDAO.updateDelCk(noArr[i]);
			count++;
		}
		return count;
	}

	@Override
	public List<Map<String, Object>> selectHomeListTrash(Map<String, Object> map) {
		return homeListDAO.selectHomeListTrash(map);
	}

	@Override
	public int selectGetTotalCountTrash() {
		return homeListDAO.selectGetTotalCountTrash();
	}

	@Override
	public int deleteHomeList(int[] noArr) {
		int re = 0;
		for(int i=0; i<noArr.length;i++){
			homeListDAO.deleteHomeList(noArr[i]);
			re++;
		}
		return re;
	}
	
}
