package com.ommay.service;
/**
 * @author hs 2015/8/17
 */
import java.util.List;

import org.springframework.stereotype.Service;

import com.ommay.entity.AccountGroup;
import com.ommay.entity.Project;
@Service
public interface LoginModuleService {
	public boolean isAccountExit(String name);
	public boolean isAccountTrue(String name, String password);
	public List  getAll(String table);
	public List getAllByFlag(int flag);
	public List getAllUserDetail();
	public Object findUserByName(String name);
	public void saveAccountMore(Object object);
	public void save(Object obj);
	public void update(Object obj);
	public void delete(int Id);
	public boolean verify(Object object);
	/**
	 * 新建项目，保存project和客户代表的信息
	 * @param project
	 * @param accountGroup
	 */
	public void saveProject(Project project, AccountGroup accountGroup);
}
