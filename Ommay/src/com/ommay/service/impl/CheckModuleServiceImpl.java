package com.ommay.service.impl;
/**
 * @author hs 2015/8/16
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.ommay.dao.CheckModuleDao;
import com.ommay.entity.AccountClient;
import com.ommay.entity.AccountDoctor;
import com.ommay.entity.AccountFinance;
import com.ommay.entity.AccountGroup;
import com.ommay.entity.AccountManager;
import com.ommay.entity.AccountWorker;
import com.ommay.service.CheckModuleService;
import com.ommay.utils.Constant;
import com.ommay.utils.JsonUtils;

@Service
public class CheckModuleServiceImpl implements CheckModuleService {

	@Autowired
	CheckModuleDao checkModuleDao;
	
	@Override
	public List getAll(String table) {
		// TODO Auto-generated method stub
		return checkModuleDao.queryAll(table);
	}

	@Override
	public Object findUserByName(String name,String findName,String table) {
		// TODO Auto-generated method stub
		return checkModuleDao.findByName(name, findName, table);
	}

	@Override
	public List findById(String table, String name, int id) {
		// TODO Auto-generated method stub
		return checkModuleDao.findById(table, name, id);
	}
	
	@Override
	public Integer selectMaxId(String table, int id) {
		// TODO Auto-generated method stub
		return checkModuleDao.selectMaxId(table, id);
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
	public void merge(Object obj) {
		// TODO Auto-generated method stub
		checkModuleDao.merge(obj);
	}

	@Override
	public boolean verify(Object object) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List queryLimit(String table, int from,int max) {
		// TODO Auto-generated method stub
		String query = String.format("from %s", table);
		Map<String, Object> map = new HashMap<String, Object>() ;
		return checkModuleDao.getLimit(query, from, max);
	}
	
	@Override
	public JSONObject getUserMessage(String name, int flag) {
		// TODO Auto-generated method stub
		return new SwitchFlag().getMessage(name, flag);
	}
	
	@Override
	public boolean updateUserMessage(String name, int flag, Map<String, String> map) {
		// TODO Auto-generated method stub
		return new SwitchFlag().updateMessage(name, flag, map);
	}
	/**
	 * 分情况操作数据库
	 * @author hs 2015/8/19
	 *
	 */
	class SwitchFlag{
		public SwitchFlag(){}
		/**
		 * 获取用户信息
		 * @param name
		 * @param flag
		 * @return
		 */
		public JSONObject getMessage(String name,int flag){
			JSONObject jsonObject = null;
			Object obj  = null;
			switch (flag) {
			case 1:
				obj = (Object) findUserByName(name,"account",Constant.TABLE_ACCOUNT_CLIENT);
				jsonObject = new JsonUtils(obj).getJsonObject();
				break;
			case 2:
				obj = (Object) findUserByName(name,"account",Constant.TABLE_ACCOUNT_DOCTOR);
				jsonObject = new JsonUtils(obj).getJsonObject();
				break;
			case 3:
				obj = (Object)findUserByName(name,"account",Constant.TABLE_ACCOUNT_FINANCE);
				jsonObject = new JsonUtils(obj).getJsonObject();
				break;
			case 4:
				obj = (Object) findUserByName(name,"account",Constant.TABLE_ACCOUNT_GROUP);
				jsonObject = new JsonUtils(obj).getJsonObject();
				break;
			case 5:
				obj = (Object) findUserByName(name,"account",Constant.TABLE_ACCOUNT_MANAGER);
				jsonObject = new JsonUtils(obj).getJsonObject();
				break;
			case 6:
				obj = (Object) findUserByName(name,"account",Constant.TABLE_ACCOUNT_WORKER);
				jsonObject = new JsonUtils(obj).getJsonObject();
				break;
			}
			return jsonObject;
		}
		/**
		 * 修改用户信息
		 * @param name 在表中要以name作为筛选对象
		 * @param flag 用户flag
		 * @return
		 */
		public boolean updateMessage(String name, int flag,  Map<String, String> map){
			switch (flag) {
			case 1:
				//会员
//				AccountClient accountClient = (AccountClient)object;
				AccountClient accountClient =(AccountClient)findUserByName(name, "account",Constant.TABLE_ACCOUNT_CLIENT);
				accountClient.setAccountClient(name);
				accountClient.setPhoneClient(map.get("iphone"));
				accountClient.setEmailClient(map.get("email"));
				checkModuleDao.save(accountClient);
				break;
			case 2:
				//医生
//				AccountDoctor accountDoctor = (AccountDoctor)object;
				AccountDoctor accountDoctor = (AccountDoctor)findUserByName(name, "account",Constant.TABLE_ACCOUNT_DOCTOR);
				accountDoctor.setAccountDoctor(name);
				accountDoctor.setPhoneDoctor(map.get("iphone"));
				accountDoctor.setEmailDoctor(map.get("email"));
				checkModuleDao.save(accountDoctor);
				break;
			case 3:
				//财务
//				AccountFinance accountFinance = (AccountFinance)object;
				AccountFinance accountFinance = (AccountFinance)findUserByName(name, "account",Constant.TABLE_ACCOUNT_FINANCE);
				accountFinance.setAccountFinance(name);
				accountFinance.setPhoneFinance(map.get("iphone"));
				accountFinance.setEmailFinance(map.get("email"));
				checkModuleDao.save(accountFinance);
				break;
			case 4:
				//客户代表
//				AccountGroup accountGroup = (AccountGroup)object;
				AccountGroup accountGroup = (AccountGroup)findUserByName(name, "account",Constant.TABLE_ACCOUNT_GROUP);
				accountGroup.setAccountGroup(name);
				accountGroup.setPhoneMaster(map.get("iphone"));
				accountGroup.setEmailGroup(map.get("email"));
				checkModuleDao.update(accountGroup);
				break;
			case 5:
				//经理
//				AccountManager accountManager = (AccountManager)object;
				AccountManager accountManager = (AccountManager)findUserByName(name, "account",Constant.TABLE_ACCOUNT_MANAGER);
				accountManager.setAccountManager(name);
				accountManager.setPhoneManager(map.get("iphone"));
				accountManager.setEmailManager(map.get("email"));
				checkModuleDao.save(accountManager);
				break;
			case 6:
				//业务员
//				AccountWorker accountWorker = (AccountWorker)object;
				AccountWorker accountWorker = (AccountWorker)findUserByName(name, "account",Constant.TABLE_ACCOUNT_WORKER);
				accountWorker.setAccountWorker(name);
				accountWorker.setPhoneWorker(map.get("iphone"));
				accountWorker.setEmailWorker(map.get("email"));
				checkModuleDao.save(accountWorker);
				break;
			}
			return true;
		}
	}
}
