package com.ommay.dao;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.ommay.entity.ProjectDetail;

@Repository
public interface ProjectDetailDao {
	List<ProjectDetail> queryAllByProjectId(int uidProject);

	List<ProjectDetail> queryAllByPackageId(String id);

	List<ProjectDetail> queryAll();

	public void save(Object object);

	public Session getSession();
}