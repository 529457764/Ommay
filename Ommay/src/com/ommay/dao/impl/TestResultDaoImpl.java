package com.ommay.dao.impl;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ommay.dao.BaseDao;
import com.ommay.dao.TestResultDao;
import com.ommay.entity.Indent;
import com.ommay.entity.TestResult;
import com.ommay.utils.Constant;

public class TestResultDaoImpl extends BaseDao implements TestResultDao{

	@Override
	public List<TestResult> queryAll() {
		List<TestResult> list = null;
        String Sql = String.format("select *from %s", Constant.TABLE_TEST_RESULT);
        try {
            list = (List)this.queryIdentity(Sql);
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("IndentDaoImpl findById hql == "+Sql);
        }
//        return list;
//		
//		
//		boolean isEmpty = this.getSession().createCriteria(TestResult.class).list();
//		if(isEmpty)
//			list = new LinkedList<TestResult>();
//		else
//			list = (List<TestResult>)this.getSession().createCriteria(TestResult.class).list();
		return list;
	}

	@Override
	public void save(TestResult testResult) {
		// TODO Auto-generated method stub
		super.save(testResult);
		
	}

	@Override
	public void update(TestResult testResult) {
		// TODO Auto-generated method stub
		super.update(testResult);
	}

	@Override
	public void delete(TestResult testResult) {
		// TODO Auto-generated method stub
		super.delete(testResult);
	}

	@Override
	public TestResult findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Session getSession() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TestResult> queryByAccount(String account) {
		List<TestResult> list = new LinkedList();
        String Sql = String.format("select *from %s where account='%s' ", Constant.TABLE_TEST_RESULT, account);
        try {
        	list = super.getCurrentSession().createSQLQuery(Sql).addEntity(TestResult.class).list();  
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("TestResultDaoImpl findById hql == "+Sql);
        }
        return list;
	}
	
	protected List<Object> queryIdentity(String queryStr) {
		Query query = getCurrentSession().createSQLQuery(queryStr);
		//return query.uniqueResult();
		return query.list();
	}

	@Override
	public List<TestResult> queryByAccountAndProjectUid(String account,
			String projectUid) {
		List<TestResult> list = new LinkedList();
        String Sql = String.format("select *from %s where account='%s' and uid_project='%s'", Constant.TABLE_TEST_RESULT, account,projectUid);
        try {
        	list = super.getCurrentSession().createSQLQuery(Sql).addEntity(TestResult.class).list();   
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("TestResultDaoImpl findById hql == "+Sql);
        }
        return list;
	}

	@Override
	public TestResult findByOrderDetailId(int id) {
		TestResult testResult = null;
        String Sql = String.format("select *from %s where uid_order_detail=%s ", Constant.TABLE_TEST_RESULT, String.valueOf(id));
        try {
            Object object =super.getCurrentSession().createSQLQuery(Sql).addEntity(TestResult.class).uniqueResult();
            if(object != null)
            	testResult = (TestResult)object;
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("IndentDaoImpl findById hql == "+Sql);
        }
        return testResult;
	}

}
