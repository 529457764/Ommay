package com.ommay.dao;
/**
 * @author hs 2015/8/16
 */
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	protected BaseDao() {
		// TODO Auto-generated constructor stub
	}
	
	protected Session getCurrentSession() {
		if (sessionFactory != null) {
			System.out.println("sessionFactory == "+sessionFactory);
			return sessionFactory.getCurrentSession();
		}
		return null;
	}
	
	/**
	 * 储存，增
	 * @param obj
	 */
	protected void  save(Object obj) {
		getCurrentSession().save(obj);
	}
	
	/**
	 * 改
	 * @param obj
	 */
	protected void  update(Object obj) {
		getCurrentSession().update(obj);
//		getCurrentSession().flush();
	}
	/**
	 * 游离类合并？
	 * @param obj
	 */
	protected void merge(Object obj) {
		getCurrentSession().merge(obj);
	}

	/**
	 * 删
	 * @param obj
	 */
	protected void delete(Object obj) {
		getCurrentSession().delete(obj);
	}
	
	/**
	 * 以id为条件查看
	 * @param id
	 * @param clas
	 * @return
	 */
	protected Object findById(Integer id, Class clas) {
		return getCurrentSession().get(clas.getName(), id);
	}
	
	/**
	 * 查询所有
	 * @param queryStr
	 * @param map
	 * @return
	 */
	protected List queryAll(String queryStr, Map<String, Object> map) {
		Query query = getCurrentSession().createQuery(queryStr);
		if (map != null) {
			for (String key : map.keySet()) {
				query.setParameter(key, map.get(key));
			}
		}
		return query.list();
	}

	/**
	 * 获取数据某区间 from -- > max
	 * map不能为null，否则跟queryAll没区别。map应该为queryAll出来的list转成map
	 * @param queryStr
	 * @param map
	 * @param from
	 * @param max
	 * @return
	 */
//	protected List queryLimit(String queryStr, Map<String, Object> map,
//			int from, int max) {
//		Query query = getCurrentSession().createQuery(queryStr);
//				for (String key : map.keySet()) {
//					query.setParameter(key, map.get(key));
//				}
//				if (from >= 0 && max > 0) {
//					query.setFirstResult(from);
//					query.setMaxResults(max);
//				}
//		return query.list();
//	}
		protected List queryLimit(String queryStr,int from, int max) {
			Query query = getCurrentSession().createQuery(queryStr);
			List list = new ArrayList();
			List allList = query.list();
			for (int i = from; i < max && i < allList.size(); i++) {
				list.add(allList.get(i));
			}
	return list;
	}

	/**
	 * 自行输入sql条件查询语句，Hibernate返回唯一一个结果
	 * @param queryStr
	 * @param map
	 * @return
	 */
	protected Object queryIdentity(String queryStr, Map<String, Object> map) {
		Query query = getCurrentSession().createQuery(queryStr);
		for (String key : map.keySet()) {
			query.setParameter(key, map.get(key));
		}
		return query.uniqueResult();
//		return query.list();
	}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
