package com.book.bookList.userInfoDAO;

import java.util.List;

import com.book.bookList.userInfoDTO.UserInfoDTO;

public interface UserInfoDAO {
	public List<UserInfoDTO> UserInfoSelectAll();
}
