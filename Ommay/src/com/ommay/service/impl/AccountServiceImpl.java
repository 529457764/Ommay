package com.ommay.service.impl;
/**
 * @author hs 2015/8/16
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ommay.dao.LoginModuleDao;
import com.ommay.entity.Account;
import com.ommay.service.BaseService;

@Service
public class AccountServiceImpl implements BaseService{

	@Autowired
	private LoginModuleDao accountDao;
	public LoginModuleDao getAccountDao() {
		return accountDao;
	}

	public void setAccountDao(LoginModuleDao accountDao) {
		this.accountDao = accountDao;
	}

	@Override
	public List<Object> getAll(String table) {
		// TODO Auto-generated method stub
		List<Object> list = accountDao.queryAll(table);
		return list;
	}

	/**
	 * 通过账户名查找是否存在该用户
	 */
	@Override
	public Object findUserByName(String name) {
		// TODO Auto-generated method stub
		Account account = null;
		if(!(accountDao.findByName(name).equals(null))){
			account = (Account)accountDao.findByName(name);
		}
		return account;
	}

	@Override
	public void save(Object obj) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Object obj) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int Id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean verify(Object object) {
		// TODO Auto-generated method stub
		return false;
	}

}
