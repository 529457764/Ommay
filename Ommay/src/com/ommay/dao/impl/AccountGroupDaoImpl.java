package com.ommay.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.ommay.dao.AccountGroupDao;
import com.ommay.dao.BaseDao;
import com.ommay.entity.AccountGroup;

@Repository
public class AccountGroupDaoImpl extends BaseDao implements AccountGroupDao{

	@Override
	public List<AccountGroup> queryAll() {
		// TODO Auto-generated method stub
		List<AccountGroup> accountGroupList = this.getSession().createCriteria(AccountGroup.class).list();
		return accountGroupList;
	}

	@Override
	public void save(AccountGroup accountGroup) {
		// TODO Auto-generated method stub
		super.save(accountGroup);
	}

	@Override
	public void update(AccountGroup accountGroup) {
		// TODO Auto-generated method stub
		super.update(accountGroup);
	}

	@Override
	public void delete(AccountGroup accountGroup) {
		// TODO Auto-generated method stub
		super.delete(accountGroup);
	}

	@Override
	public AccountGroup findByAccount(String account) {
		// TODO Auto-generated method stub
		List<AccountGroup> accountGroupList = (List)this.getSession().createCriteria(AccountGroup.class).list();
		AccountGroup ag = new AccountGroup();
		if(accountGroupList!=null && accountGroupList.size()!=0)
		{
			for(int i = 0; i< accountGroupList.size();i++){
				if(accountGroupList.get(i).getAccount().getAccount().equalsIgnoreCase(account)){
					ag = accountGroupList.get(i);
				}
			}
		}
        return ag;
	}

	@Override
	public Session getSession() {
		// TODO Auto-generated method stub
		return super.getCurrentSession();
	}

}
