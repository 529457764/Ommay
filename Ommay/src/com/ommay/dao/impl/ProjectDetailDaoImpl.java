package com.ommay.dao.impl;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.ommay.dao.BaseDao;
import com.ommay.dao.ProjectDetailDao;
import com.ommay.entity.ProjectDetail;

public class ProjectDetailDaoImpl extends BaseDao implements ProjectDetailDao{

	//this method find all detail by uidProject
	public List<ProjectDetail> queryAllByProjectId(int uidProject) {
		List<ProjectDetail> projectDetailList =null;
		if (uidProject != -1) {
			String hql = "from ProjectDetail where uid_project="+uidProject;
			try{
				projectDetailList =super.getCurrentSession().createQuery(hql).list();
			}catch(Exception e){
				projectDetailList = new ArrayList<ProjectDetail>();
			}
			//System.out.println("projectDetailList's size == "+projectDetailList.size());
			return projectDetailList;
		}else {
			return projectDetailList;
		}
	}
	

	public void  save(Object obj) {
		getCurrentSession().save(obj);
	}
	
	public void  update(Object obj) {
		getCurrentSession().update(obj);
	}
	
	public void delete(Object obj) {
		getCurrentSession().delete(obj);
	}


	@Override
	public List<ProjectDetail> queryAllByPackageId(String id) {
		List<ProjectDetail> projectDetailList =null;
		if (id != null) {
			String hql = "from ProjectDetail where package_number like '"+id+"%'";
			try{
				projectDetailList =super.getCurrentSession().createQuery(hql).list();
			}catch(Exception e){
				projectDetailList = null;
			}
			//System.out.println("projectDetailList's size == "+projectDetailList.size());
			return projectDetailList;
		}else {
			return projectDetailList;
		}
	}


    @Override
    public List<ProjectDetail> queryAll() {
        // TODO Auto-generated method stub
        List projectDetailList = this.getSession().createCriteria(ProjectDetail.class).list();
        return projectDetailList;
    }
    
    @Override
    public Session getSession() {
        // TODO Auto-generated method stub
        return super.getCurrentSession();
    }

}
