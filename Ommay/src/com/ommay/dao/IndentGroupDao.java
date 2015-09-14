package com.ommay.dao;

import java.util.List;

import org.hibernate.Session;

import com.ommay.entity.IndentGroup;

public interface IndentGroupDao {
	public List<IndentGroup> queryAll();
	public void save(IndentGroup indentGroup);
	public void update(IndentGroup indentGroup);
	public void delete(IndentGroup indentGroup);
	public IndentGroup findById(String id);
	public List<Object> findByAccount(String account);
	public Session getSession();
}
