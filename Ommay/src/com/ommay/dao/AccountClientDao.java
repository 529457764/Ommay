package com.ommay.dao;

import java.util.List;

import org.hibernate.Session;

import com.ommay.entity.AccountClient;
import com.ommay.entity.AccountDoctor;
import com.ommay.entity.AccountFinance;
import com.ommay.entity.AccountWorker;

public interface AccountClientDao {
	public List<AccountClient> queryAll();
	public void save(AccountClient accountClient);
	public void update(AccountClient accountClient);
	public void delete(AccountClient accountClient);
	public AccountClient findClientByAccount(String account);
	public AccountFinance findFinanceByAccount(String account);
	public AccountWorker findWorkerByAccount(String account);
	public AccountDoctor findDoctorByAccount(String account);
	public Session getSession();
}
