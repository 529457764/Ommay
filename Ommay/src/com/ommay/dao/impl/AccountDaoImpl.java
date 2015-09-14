package com.ommay.dao.impl;
/**
 * @author hs 2015/8/16
 */
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.ommay.dao.LoginModuleDao;
import com.ommay.dao.BaseDao;
import com.ommay.entity.Account;
import com.ommay.utils.Constant;

@Repository
public class AccountDaoImpl extends BaseDao  implements LoginModuleDao {

	@Override
	public List<Object> queryAll(String table) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		String query = String.format("from %s", table);
		return super.queryAll(query, map);
	}

	@Override
	public void save(Object object) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Object object) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Object object) {
		// TODO Auto-generated method stub

	}

	@Override
	public Object findByName(String name) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		Account account =null;
		if (name != null) {
			String hql = String.format("from %s where account='%s'", Constant.TABLE_ACCOUNT, name);
			try{
				account =(Account) super.getCurrentSession().createQuery(hql).uniqueResult();
			}catch(Exception e){
				account = null;
			}
			return account;
		}else {
			return account;
		}
	}

	@Override
	public boolean verify(Object objectt) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountExit(String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Session getSession() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccountTrue(String name, String password) {
		// TODO Auto-generated method stub
		return false;
	}

}
