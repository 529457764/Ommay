package com.ommay.service.impl;
/**
 * @author hs 2015/8/16
 */
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.ommay.dao.LoginModuleDao;
import com.ommay.entity.Account;
import com.ommay.entity.AccountClient;
import com.ommay.entity.AccountDoctor;
import com.ommay.entity.AccountFinance;
import com.ommay.entity.AccountGroup;
import com.ommay.entity.AccountManager;
import com.ommay.entity.AccountWorker;
import com.ommay.entity.Project;
import com.ommay.service.LoginModuleService;
import com.ommay.utils.Constant;
import com.ommay.utils.JsonUtils;
@Service
public class LoginModuleServiceImpl implements LoginModuleService {
    @Autowired
    private LoginModuleDao loginModuleDao;

    public LoginModuleDao getLoginModuleDao() {
        return loginModuleDao;
    }
    public void setLoginModuleDao(LoginModuleDao loginModuleDao) {
        this.loginModuleDao = loginModuleDao;
    }
    /**
     * 登陆
     * 验证用户名和密码，此处不加flag，原因是本来就不可存在相同客户名
     * @return
     */
	@Override
	public boolean isAccountTrue(String name, String password) {
        boolean isTrue = false;
        isTrue = loginModuleDao.isAccountTrue(name, password);
        return isTrue;
	}

	/**
	 * 注册
	 * 验证用户名是否已存在
	 */
    @Override
    public boolean isAccountExit(String name){
        boolean isTrue = false;
        isTrue = loginModuleDao.isAccountExit(name);
        return isTrue;
    }
	/**
	 * 新建项目，保存project和客户代表的信息
	 * @param project
	 * @param accountGroup
	 */
	@Override
	public void saveProject(Project project, AccountGroup accountGroup) {
		// TODO Auto-generated method stub
		String accountGroupName = project.getClientName();
//		String query = String.format("from AccountGroup where account='%s'", accountGroupName);
		String aString  = accountGroup.getEmailGroup();
		loginModuleDao.save(project);
		loginModuleDao.update(accountGroup);
	}
    
    @Override
    public List getAll(String table) {
        // TODO Auto-generated method stub
        return loginModuleDao.queryAll(table);
    }
    
	@Override
	public List getAllByFlag(int flag) {
		// TODO Auto-generated method stub
		List list = null;
    	switch (flag) {
		case 1:
			return loginModuleDao.queryAll(Constant.TABLE_ACCOUNT_CLIENT);
		case 2:
			return loginModuleDao.queryAll(Constant.TABLE_ACCOUNT_DOCTOR);
		case 3:
			return loginModuleDao.queryAll(Constant.TABLE_ACCOUNT_FINANCE);
		case 4:
			return loginModuleDao.queryAll(Constant.TABLE_ACCOUNT_GROUP);
		case 5:
			return loginModuleDao.queryAll(Constant.TABLE_ACCOUNT_MANAGER);
		case 6:
			return loginModuleDao.queryAll(Constant.TABLE_ACCOUNT_WORKER);
		}
		return new ArrayList();
	}
    
	@Override
	public List getAllUserDetail() {
		// TODO Auto-generated method stub
		List list = new ArrayList();
	    JSONObject jsonObject = null;
		List listClient = getAll(Constant.TABLE_ACCOUNT_CLIENT);
       jsonObject = new JsonUtils(listClient).getJsonObject();
       list.add(jsonObject);
       listClient = null;
       List listDoctor = getAll(Constant.TABLE_ACCOUNT_DOCTOR);
       jsonObject = new JsonUtils(listDoctor).getJsonObject();
       list.add(jsonObject);
       listDoctor = null;
       List listFinance = getAll(Constant.TABLE_ACCOUNT_FINANCE);
       jsonObject = new JsonUtils(listFinance).getJsonObject();
       list.add(jsonObject);
       listFinance = null;
       List listGroup = getAll(Constant.TABLE_ACCOUNT_GROUP);
       jsonObject = new JsonUtils(listGroup).getJsonObject();
       list.add(jsonObject);
       listGroup = null;
       List listManager = getAll(Constant.TABLE_ACCOUNT_MANAGER);
       jsonObject = new JsonUtils(listManager).getJsonObject();
       list.add(jsonObject);
       listManager = null;
       List listWorker = getAll(Constant.TABLE_ACCOUNT_WORKER);
       jsonObject = new JsonUtils(listWorker).getJsonObject();
       list.add(jsonObject);
       listWorker = null;
		return list;
	}
	
    @Override
    public Object findUserByName(String name) {
        // TODO Auto-generated method stub
        return loginModuleDao.findByName(name);
    }
    @Override
    public void save(Object obj) {
        // TODO Auto-generated method stub
        loginModuleDao.save(obj);
    }
    @Override
    public void update(Object obj) {
        // TODO Auto-generated method stub
    	loginModuleDao.update(obj);
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
    /**
     * 用于注册，在插入account的同时插入account_xxx表
     */
	@Override
	public void saveAccountMore(Object object) {
		// TODO Auto-generated method stub
		if(object != null){
			Account account  = (Account)object;
			loginModuleDao.save(account);
            switch(account.getAccountFlag()){
        	case 1:
        		AccountClient accountClient = new AccountClient();
        		accountClient.setAccountClient(account.getAccount());
        		accountClient.setAccount(account);
        		loginModuleDao.save(accountClient);
        		break;
        	case 2:
        		AccountDoctor accountDoctor = new AccountDoctor();
        		accountDoctor.setAccountDoctor(account.getAccount());
        		accountDoctor.setAccount(account);
        		loginModuleDao.save(accountDoctor);
        		break;
        	case 3:
        		AccountFinance accountFinance = new AccountFinance();
        		accountFinance.setAccountFinance(account.getAccount());
        		accountFinance.setAccount(account);
        		loginModuleDao.save(accountFinance);
        		break;
        	case 4:
        		AccountGroup accountGroup = new AccountGroup();
        		accountGroup.setAccountGroup(account.getAccount());
        		accountGroup.setAccount(account);
        		loginModuleDao.save(accountGroup);
        		break;
        	case 5:
        		AccountManager accountManager = new AccountManager();
        		accountManager.setAccountManager(account.getAccount());
        		accountManager.setAccount(account);
        		loginModuleDao.save(accountManager);
        		break;
        	case 6:
        		AccountWorker accountWorker = new AccountWorker();
        		accountWorker.setAccountWorker(account.getAccount());
        		accountWorker.setAccount(account);
        		loginModuleDao.save(accountWorker);
        		break;
        }
		}
	}
}