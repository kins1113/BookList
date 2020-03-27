package com.book.bookList.homeListDAO;

import java.util.List;
import java.util.Map;

import com.book.bookList.homeListDTO.HomeListDTO;

public interface HomeListService {
	public List<Map<String,Object>> selectAllHomeList(Map<String, Object> map);
	public List<Map<String,Object>> selectHomeListTrash(Map<String, Object> map);
	public int selectGetTotalCount(Map<String, Object> map);
	public int selectGetTotalCountTrash();
	public int insertHomeList(HomeListDTO dto);
	public int updateDelCk(int[] noArr);
	public int deleteHomeList(int[] noArr);
}
