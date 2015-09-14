package com.ommay.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ommay.dao.AccountClientDao;
import com.ommay.dao.BaseDao;
import com.ommay.entity.AccountClient;
import com.ommay.entity.AccountDoctor;
import com.ommay.entity.AccountFinance;
import com.ommay.entity.AccountWorker;

public class AccountClientDaoImpl extends BaseDao implements AccountClientDao{

	@Override
	public List<AccountClient> queryAll() {
		// TODO Auto-generated method stub
		List indentsList = this.getSession().createCriteria(AccountClient.class).list();
		return indentsList;
	}

	@Override
	public void save(AccountClient accountClient) {
		// TODO Auto-generated method stub
		super.save(accountClient);
	}

	@Override
	public void update(AccountClient accountClient) {
		// TODO Auto-generated method stub
		super.update(accountClient);
	}

	@Override
	public void delete(AccountClient accountClient) {
		// TODO Auto-generated method stub
		super.delete(accountClient);
	}

	@Override
	public AccountClient findClientByAccount(String account) {
		// TODO Auto-generated method stub
		List<AccountClient> accountClientList = (List)this.getSession().createCriteria(AccountClient.class).list();
		AccountClient ac = new AccountClient();
		if(accountClientList!=null && accountClientList.size()!=0)
		{
			for(int i = 0; i< accountClientList.size();i++){
				if(accountClientList.get(i).getAccount().getAccount().equalsIgnoreCase(account)){
					ac = accountClientList.get(i);
				}
			}
		}
        return ac;
	}

	protected Object queryIdentity(String queryStr) {
		Query query = getCurrentSession().createSQLQuery(queryStr);
		return query.uniqueResult();
//		return query.list();
	}
	
	@Override
	public Session getSession() {
		// TODO Auto-generated method stub
		return super.getCurrentSession();
	}

	@Override
	public AccountFinance findFinanceByAccount(String account) {
		// TODO Auto-generated method stub
		List<AccountFinance> accountClientList = (List)this.getSession().createCriteria(AccountFinance.class).list();
		AccountFinance ac = new AccountFinance();
		if(accountClientList!=null && accountClientList.size()!=0)
		{
			for(int i = 0; i< accountClientList.size();i++){
				if(accountClientList.get(i).getAccount().getAccount().equalsIgnoreCase(account)){
					ac = accountClientList.get(i);
				}
			}
		}
        return ac;
	}

	@Override
	public AccountWorker findWorkerByAccount(String account) {
		// TODO Auto-generated method stub
		List<AccountWorker> accountClientList = (List)this.getSession().createCriteria(AccountWorker.class).list();
		AccountWorker ac = new AccountWorker();
		if(accountClientList!=null && accountClientList.size()!=0)
		{
			for(int i = 0; i< accountClientList.size();i++){
				if(accountClientList.get(i).getAccount().getAccount().equalsIgnoreCase(account)){
					ac = accountClientList.get(i);
				}
			}
		}
        return ac;
	}

	@Override
	public AccountDoctor findDoctorByAccount(String account) {
		// TODO Auto-generated method stub
		List<AccountDoctor> accountClientList = (List)this.getSession().createCriteria(AccountDoctor.class).list();
		AccountDoctor ac = new AccountDoctor();
		if(accountClientList!=null && accountClientList.size()!=0)
		{
			for(int i = 0; i< accountClientList.size();i++){
				if(accountClientList.get(i).getAccount().getAccount().equalsIgnoreCase(account)){
					ac = accountClientList.get(i);
				}
			}
		}
        return ac;
	}

}
