package com.ommay.dao;

import java.util.List;

import org.hibernate.Session;

import com.ommay.entity.AccountGroup;

public interface AccountGroupDao {
	public List<AccountGroup> queryAll();
	public void save(AccountGroup accountGroup);
	public void update(AccountGroup accountGroup);
	public void delete(AccountGroup accountGroup);
	public AccountGroup findByAccount(String account); 
	public Session getSession();
}
