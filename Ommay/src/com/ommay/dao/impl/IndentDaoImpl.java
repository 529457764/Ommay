package com.ommay.dao.impl;
/**
 * @author Doson 
 * Copyright (JAVA) 2015 dosonleung. All rights reserved.
 */

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.ommay.dao.IndentDao;
import com.ommay.dao.BaseDao;
import com.ommay.entity.Indent;
import com.ommay.entity.IndentVip;
import com.ommay.utils.Constant;

@Repository
public class IndentDaoImpl extends BaseDao implements IndentDao{

	@Override
	public List<Indent> queryAll() {
		List indentsList = this.getSession().createCriteria(Indent.class).list();
		return indentsList;
	}

	@Override
	public void save(Indent indent) {
		// TODO Auto-generated method stub
		super.save(indent);
	}

	@Override
	public void update(Indent indent) {
		// TODO Auto-generated method stub
		super.update(indent);
	}

	@Override
	public void delete(Indent indent) {
		// TODO Auto-generated method stub
		super.delete(indent);
	}

	@Override
	public Indent findById(int id) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Indent indent = null;
        String Sql = String.format("select *from %s where uid_indent=%s ", Constant.TABLE_INDENT, String.valueOf(id));
        try {
            Object object =super.getCurrentSession().createSQLQuery(Sql).addEntity(Indent.class).uniqueResult();
            if(object != null)
            	indent = (Indent)object;
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("IndentDaoImpl findById hql == "+Sql);
        }
        return indent;
	}

	@Override
	public Boolean findColumnByIdWithBoolean(String cloumn , int id){
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Boolean value = false;
        String Sql = String.format("select %s from %s where uid_indent=%s ", cloumn , Constant.TABLE_INDENT, String.valueOf(id));
        try {
            Object object = this.queryIdentity(Sql);
            value = (Boolean)object;
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("IndentDaoImpl findColumnByIdWithBoolean hql == "+Sql);
        }
        return value;
	}
	
	@Override
	public String findColumnByIdWithString(String cloumn , int id){
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String value = "";
        String Sql = String.format("select %s from %s where uid_indent=%s ", cloumn , Constant.TABLE_INDENT, String.valueOf(id));
        try {
            Object object = this.queryIdentity(Sql);
            value = (String)object;
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("IndentDaoImpl findColumnByIdWithBoolean hql == "+Sql);
        }
        return value;
	}
	
	
	@Override
	public Integer findColumnByIdWithInteger(String cloumn , int id){
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Integer value = 0;
        String Sql = String.format("select %s from %s where uid_indent=%s ", cloumn , Constant.TABLE_INDENT, String.valueOf(id));
        try {
            Object object = this.queryIdentity(Sql);
            value = (Integer)object;
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("IndentDaoImpl findColumnByIdWithBoolean hql == "+Sql);
        }
        return value;
	}
	
	protected Object queryIdentity(String queryStr) {
		Query query = getCurrentSession().createSQLQuery(queryStr);
		return query.uniqueResult();
//		return query.list();
	}
	
	@Override
	public Session getSession() {
		// TODO Auto-generated method stub
		return super.getCurrentSession();
	}

}
