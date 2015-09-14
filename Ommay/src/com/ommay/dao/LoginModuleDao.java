package com.ommay.dao;
/**
 * @author hs 2015/8/16
 */
import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.ommay.entity.Account;
@Repository
public interface LoginModuleDao {
	public List<Object> queryAll(String table);
	public void save(Object object);
	public void update(Object object);
	public void delete(Object object);
	public Object findByName(String name);
	public boolean verify(Object objectt);
	
	/**
	 * 注册，验证用户名是否存在
	 * @param name
	 * @return
	 */
	public boolean isAccountExit(String name);
	
	/**
	 * 登陆
	 * 验证用户名和密码
	 * @param name
	 * @param password
	 * @return
	 */
	public boolean isAccountTrue(String name, String password);
	
	public Session getSession();
}
