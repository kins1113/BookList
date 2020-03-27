package com.book.bookList.userInfoDAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.bookList.userInfoDTO.UserInfoDTO;


@Repository
public class UserInfoDAOImpl implements UserInfoDAO{
	
	private String namespace="config.mybatis.mapper.oracle.userInfo.";
	@Autowired SqlSessionTemplate sqlsession;
	
	@Override
	public List<UserInfoDTO> UserInfoSelectAll(){
		return sqlsession.selectList(namespace+"selectUserInfo");
	}
}
