package com.ommay.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Session;

import com.ommay.entity.PhysicalItem;

public interface PhysicalItemDao {
	public List<PhysicalItem> retrieveAll();
	public List<Object> queryAll(String table); 
	public PhysicalItem getById(String id_item);
	public Session getSession();
}
