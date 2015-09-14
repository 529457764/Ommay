package com.ommay.dao;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ommay.entity.AccountGroup;
import com.ommay.entity.PhysicalItem;
import com.ommay.entity.Project;

@Repository
public interface ProjectDao {
	public void save(Object object);

	public void update(Object object);

	public void delete(Object object);

	public boolean verify(Object objectt);

	public List<Project> queryAll();

	public Project getSingleProjectById(int uidProject);

	public List<PhysicalItem> getPhysicalItem();

	public List<Project> workerGetOwnerProject(String accountWorker);

	public List<Project> getProjectsByAccount(String account);
	
	public AccountGroup getSingleAccountGroup(String accountGroup);

	public List<Project> managerGetOwnerProject(String accountManager);

	public Project getLastProject();

	public int getMaxProjectId();

	public long getPhysicalItemNum();
}
