package com.ommay.dao;

import java.util.List;

import org.hibernate.Session;

import com.ommay.entity.TestResult;

public interface TestResultDao {
	public List<TestResult> queryAll();
	public void save(TestResult testResult);
	public void update(TestResult testResult);
	public void delete(TestResult testResult);
	public TestResult findById(int id);
	public TestResult findByOrderDetailId(int id);
	public List<TestResult> queryByAccount(String account);
	public List<TestResult> queryByAccountAndProjectUid(String account,String projectUid);
	public Session getSession();
}
