package com.ommay.dao.impl;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.ommay.dao.BaseDao;
import com.ommay.dao.ProjectDao;
import com.ommay.entity.AccountGroup;
import com.ommay.entity.Indent;
import com.ommay.entity.IndentVip;
import com.ommay.entity.PhysicalItem;
import com.ommay.entity.Project;

@Repository
public class ProjectDaoImpl extends BaseDao implements ProjectDao {

	@Override
	public List<Project> queryAll() {
		Map<String, Object> map = null;
		String table = String.format("from %s", "Project");
		return super.queryAll(table, map);
	}

	@Override
	protected Session getCurrentSession() {
		return super.getCurrentSession();
	}

	// this method get all worker's projects.
	public Object queryAllByProjectBuilder(String projectBuilder) {
		List<Project> projectList = null;
		if (projectBuilder != null) {
			String hql = "from Project where project_builder='"
					+ projectBuilder + "'";
			try {
				projectList = super.getCurrentSession().createQuery(hql).list();
			} catch (Exception e) {
				projectList = new ArrayList<Project>();
			}
			System.out.println("projectList's size == " + projectList.size());
			return projectList;
		} else {
			return projectList;
		}
	}

	// this method get a single Project by uuid
	public Project findById(int uidProject) {

		Project project = null;
		if (uidProject != -1) {
			String hql = String.format("from Project where uid_project='"
					+ uidProject + "'");
			try {
				project = (Project) super.getCurrentSession().createQuery(hql)
						.uniqueResult();
			} catch (Exception e) {
				project = null;
			}
			return project;
		} else {
			return project;
		}
	}

	// this method get all group project without condition
	// I achieve it by judge the people's number
	public List<Project> queryAllGroupProject() {
		List<Project> projectList = null;
		String hql = "from Project where address_group<>'个人'";
		try {
			projectList = super.getCurrentSession().createQuery(hql).list();
		} catch (Exception e) {
			projectList = new ArrayList<Project>();
		}
		System.out.println("projectList's size == " + projectList.size());
		return projectList;
	}

	// this method get all vip project without condition
	// I achieve it by judge the people's number
	public List<IndentVip> queryAllIndentVip() {
		List<IndentVip> vipIndentList = null;
		String hql = "from IndentVip";
		try {
			vipIndentList = super.getCurrentSession().createQuery(hql).list();
		} catch (Exception e) {
			vipIndentList = new ArrayList<IndentVip>();
		}
		return vipIndentList;
	}

	@Override
	public boolean verify(Object objectt) {
		return false;
	}

	public void update(Object obj) {
		getCurrentSession().update(obj);
	}

	public void delete(Object obj) {
		getCurrentSession().delete(obj);
	}

	public void save(Object obj) {
		getCurrentSession().save(obj);
	}

	@Override
	public Project getSingleProjectById(int uidProject) {
		Project project = null;
		String hql = String.format("from Project where uid_project="
				+ uidProject);
		try {
			project = (Project) super.getCurrentSession().createQuery(hql)
					.uniqueResult();
		} catch (Exception e) {
			project = new Project();
		}
		// System.out.println("retrieve a project from");
		return project;
	}

	@Override
	public List<PhysicalItem> getPhysicalItem() {
		List<PhysicalItem> physicalItem = null;
		String hql = "from PhysicalItem";
		try {
			physicalItem = super.getCurrentSession().createQuery(hql).list();
		} catch (Exception e) {
			physicalItem = new ArrayList();
		}
		System.out.println("physicalItem size == " + physicalItem.size());
		return physicalItem;
	}

	@Override
	public List<Project> workerGetOwnerProject(String accountWorker) {
		List<Project> projectList = null;
		String hql = String.format("from Project where project_builder='"
				+ accountWorker + "'");
		try {
			projectList = super.getCurrentSession().createQuery(hql).list();
		} catch (Exception e) {
			projectList = new ArrayList<Project>();
		}
		System.out.println("projectList size == " + projectList.size());
		return projectList;
	}

	@Override
	public List<Project> getProjectsByAccount(String account) {
		List<Project> projectList = null;
		String hql = String.format("from Project where account='"
				+ account + "'");
		try {
			projectList = super.getCurrentSession().createQuery(hql).list();
		} catch (Exception e) {
			projectList = new ArrayList<Project>();
		}
		System.out.println("projectList size == " + projectList.size());
		return projectList;
	}

	@Override
	public AccountGroup getSingleAccountGroup(String accountGroup) {
		String hql = String.format("from AccountGroup where account_group='"
				+ accountGroup + "'");
		AccountGroup account = null;
		try {
			Object object = super.getCurrentSession().createQuery(hql)
					.uniqueResult();
			account = (AccountGroup) object;
			return account;
		} catch (Exception e) {
			System.out.println("LoginModuleDaoImpl findByName ==" + e);
		}
		return account;
	}

	public List<Indent> queryAllIndent() {
		List<Indent> indentList = null;
		String hql = "from Indent";
		try {
			indentList = super.getCurrentSession().createQuery(hql).list();
		} catch (Exception e) {
			indentList = new ArrayList<Indent>();
		}
		return indentList;
	}

	@Override
	public List<Project> managerGetOwnerProject(String accountManager) {
		List<Project> projectList = null, l1 = null, l2 = null;
		String hql1 = String
				.format("from Project where project_review_master='"
						+ accountManager + "'");
		String hql2 = String
				.format("from Project where contract_review_master='"
						+ accountManager + "'");

		try {
			l1 = super.getCurrentSession().createQuery(hql1).list();
		} catch (Exception e) {
			l1 = new ArrayList<Project>();
		}
		try {
			l2 = super.getCurrentSession().createQuery(hql2).list();
		} catch (Exception e) {
			l2 = new ArrayList<Project>();
		}
		if (l1.size() == 0)
			return l2;
		if (l2.size() == 0)
			return l1;
		l1.addAll(l2);
		projectList = new ArrayList<Project>();
		for (Project obj : l1) {
			if (!projectList.contains(obj)) { // 注意contains方法是通过equals方法进行比较的所以你要根据你自己的需要看是否需要重写list对象里面的equals方法。
				projectList.add(obj);// 如果上面加了强制转型，这里需要写list_tmp.add(u);
			}
		}
		// System.out.println("projectList size == "+projectList.size());
		return projectList;
	}

	@Override
	public Project getLastProject() {
		Project project = null;
		String hql = String.format("select max(uid_project) from Project");
		try {
			Object object = super.getCurrentSession().createQuery(hql)
					.uniqueResult();
			project = getSingleProjectById(Integer.parseInt((String) object));
			return project;
		} catch (Exception e) {
			System.out.println("getLastProject error ==" + e);
		}
		return project;
	}

	@Override
	public long getPhysicalItemNum() {
		String hql = "select count(*) from PhysicalItem";
		Long i = (long) 0;
		try {
			i = (Long) super.getCurrentSession().createQuery(hql)
					.uniqueResult();
		} catch (Exception e) {
			System.out.println("Get physical item error");
			e.printStackTrace();
		}

		return i;
	}

	@Override
	public int getMaxProjectId() {
		String hql = String
				.format("select max(project.uidProject) from Project project");
		Object object = null;
		try {
			Integer maxId = (Integer) super.getCurrentSession()
					.createQuery(hql).uniqueResult();
			return maxId;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("CheckModuleDaoImpl selectMaxId==" + e);
			e.printStackTrace();
		}
		return (Integer) null;
	}
}
