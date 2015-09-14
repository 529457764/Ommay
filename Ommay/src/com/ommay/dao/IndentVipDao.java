package com.ommay.dao;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.ommay.entity.Indent;
import com.ommay.entity.IndentVip;
import com.ommay.entity.Project;

@Repository
public interface IndentVipDao {
	public List<IndentVip> queryAll();
	public List<IndentVip> queryAllByAccount(String account);
	public void save(IndentVip object);
	public void update(IndentVip object);
	public void delete(IndentVip object);
	public IndentVip findById(String id);
	public List<Object> findByAccount(String account);
	public Session getSession();
}
