package com.ommay.dao;
/**
 * @author Doson 
 * Copyright (JAVA) 2015 dosonleung. All rights reserved.
 */
import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.ommay.entity.Indent;

@Repository
public interface IndentDao {
	public List<Indent> queryAll();
	public void save(Indent indent);
	public void update(Indent indent);
	public void delete(Indent indent);
	public Indent findById(int id);
	public Integer findColumnByIdWithInteger(String cloumn , int id);
	public Boolean findColumnByIdWithBoolean(String cloumn , int id);
	public String findColumnByIdWithString(String cloumn , int id);
	public Session getSession();
}
