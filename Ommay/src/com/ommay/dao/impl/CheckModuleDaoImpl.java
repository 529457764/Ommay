package com.ommay.dao.impl;

/**
 * @author  hs 2015/8/16
 */

import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ommay.dao.BaseDao;
import com.ommay.dao.CheckModuleDao;
import com.ommay.entity.Account;
import com.ommay.utils.Constant;
@Repository
public class CheckModuleDaoImpl extends BaseDao implements CheckModuleDao {

	
	@Override
	public List<Object> queryAll(String table) {
        Map<String, Object> map = null;
        String query = String.format("from %s", table);
        return super.queryAll(query, map);
	}

	@Override
	public List findById(String table,  String name, int id) {
		// TODO Auto-generated method stub
        Map<String, Object> map = null;
        String query = String.format("from %s where %s=%d", table, name, id);
        return super.queryAll(query, map);
	}

	
	@Override
	public Object findByName(String name, String findName, String table) {
		// TODO Auto-generated method stub
        String hql = String.format("from %s where account='%s'", table, name);
        Object object = null;
        try {
            object = super.getCurrentSession().createQuery(hql).uniqueResult();
            return object;
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("CheckModuleDaoImpl findByName=="+e);
        }
        return null;
	}
	@Override
	public Integer selectMaxId(String table, int id) {
		// TODO Auto-generated method stub
		String hql = String.format("select max(project.uidProject) from Project project");
		Object object = null;
        try {
            Integer maxId = (Integer) super.getCurrentSession().createQuery(hql).uniqueResult();
            return maxId;
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("CheckModuleDaoImpl selectMaxId=="+e);
            e.printStackTrace();
        }
        return null;
	}

	@Override
	public boolean verify(Object objectt) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	protected Session getCurrentSession() {
		// TODO Auto-generated method stub
		return super.getCurrentSession();
	}

	@Override
	public void save(Object obj) {
		// TODO Auto-generated method stub
		super.save(obj);
	}

	@Override
	public void update(Object obj) {
		// TODO Auto-generated method stub
		super.update(obj);
	}

	@Override
	public void merge(Object obj) {
		// TODO Auto-generated method stub
		super.merge(obj);
	}

	@Override
	public void delete(Object obj) {
		// TODO Auto-generated method stub
		super.delete(obj);
	}

	@Override
	protected Object findById(Integer id, Class clas) {
		// TODO Auto-generated method stub
		return super.findById(id, clas);
	}

//	@Override
//	protected List queryAll(String queryStr, Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return super.queryAll(queryStr, map);
//	}

	@Override
	protected Object queryIdentity(String queryStr, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return super.queryIdentity(queryStr, map);
	}

	@Override
	public SessionFactory getSessionFactory() {
		// TODO Auto-generated method stub
		return super.getSessionFactory();
	}

	@Override
	public void setSessionFactory(SessionFactory sessionFactory) {
		// TODO Auto-generated method stub
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public List getLimit(String queryStr, int from,int max) {
		// TODO Auto-generated method stub
		return super.queryLimit(queryStr, from, max);
	}

}
