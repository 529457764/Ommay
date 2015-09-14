package com.ommay.dao;
/**
 * @author hs 2015/8/18
 */
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import antlr.collections.impl.IntRange;
@Repository
public interface CheckModuleDao {
	public List<Object> queryAll(String table);
	public void save(Object object);
	public void update(Object object);
	public void delete(Object object);
	public Object findByName(String name,String findName,String table);
	public List findById(String table,  String name, int id);
	public boolean verify(Object objectt);
	public List getLimit(String queryStr, int from, int max) ;
	public void merge(Object obj);
	/**
	 * 寻找某表中id最大的项
	 * @param table
	 * @param id
	 * @return
	 */
	public Integer selectMaxId(String table, int id);
}
