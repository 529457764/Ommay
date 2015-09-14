package com.ommay.service;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
import java.util.List;

import com.ommay.entity.AccountGroup;
import com.ommay.entity.Project;
import com.ommay.entity.Suit;

public interface ProjectService {
	public List getAll();

	public List getAllVipProject();

	public List getAllGroupProject();

	public Project getSingleProjectById(Long uidProject);

	public List getPhysicalItem();

	public void save(Project project);

	public List<Project> workerGetOwnerProject(String accountWorker);

	public Suit getSuit(Long uidProject);

	public List getAllVipIndent();

	List<Suit> getSuitList(Long uidProject);

	public void saveSuit(Suit suit);

	public AccountGroup getSingleWorker(String accountWorker);

	public List<Project> managerGetOwnerProject(String id);

	public void managerFinishChangingProject(Project project);

	public void managerFinishChangingContract(Project project);

	public Project getLastProject();

	int getMaxProjectId();

}
