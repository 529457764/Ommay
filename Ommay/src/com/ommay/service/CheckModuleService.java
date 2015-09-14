package com.ommay.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
/**
 * 
 * @author hs 2015/8/18
 *
 */
@Service
public interface CheckModuleService {
	public List  getAll(String table);
	public Object findUserByName(String name,String findName, String table);
	public List findById(String table,  String name, int id);
	public void save(Object obj);
	public void update(Object obj);
	public void delete(int Id);
	public boolean verify(Object object);
	public void merge(Object obj);
	public List queryLimit(String table,int from, int max);
	/**
	 * 获取个人信息
	 * @param name
	 * @param flag
	 * @return
	 */
	public JSONObject getUserMessage(String name, int flag);
	/**
	 * 修改个人信息
	 * @param name 个人姓名
	 * @param flag 
	 * @param object 从前端得到的object，按照flag转成对应用户
	 * @return
	 */
	public boolean updateUserMessage(String name, int flag,  Map<String, String> map);
	/**
	 * 寻找某表中id最大的项
	 * @param table
	 * @param id
	 * @return
	 */
	public Integer selectMaxId(String table, int id);
}
