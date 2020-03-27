package com.book.bookList.userInfoDAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.bookList.userInfoDTO.UserInfoDTO;

@Service
public class UserInfoServiceImpl implements UserInfoService{
	
	@Autowired UserInfoDAO userInfoDAO;
	@Override
	public List<UserInfoDTO> UserInfoSelectAll() {
		return userInfoDAO.UserInfoSelectAll();
	}
	
}
