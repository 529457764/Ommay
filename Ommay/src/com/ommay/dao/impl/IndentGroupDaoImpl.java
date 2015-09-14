package com.ommay.dao.impl;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;

import com.ommay.dao.BaseDao;
import com.ommay.dao.IndentGroupDao;
import com.ommay.entity.Indent;
import com.ommay.entity.IndentGroup;
import com.ommay.entity.IndentVip;
import com.ommay.utils.Constant;

public class IndentGroupDaoImpl extends BaseDao implements IndentGroupDao{

	@Override
	public List<IndentGroup> queryAll() {
		List indentGroupsList = this.getSession().createCriteria(IndentGroup.class).list();
		return indentGroupsList;
	}

	@Override
	public void save(IndentGroup indentGroup) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(IndentGroup indentGroup) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(IndentGroup indentGroup) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public IndentGroup findById(String account) {
		// TODO Auto-generated method stub
		IndentGroup indentGroup = null;
        String Sql = String.format("select *from %s where uid_indent=%s ", Constant.TABLE_INDENT_GROUP, account);
        try {
            Object object =super.getCurrentSession().createSQLQuery(Sql).addEntity(IndentGroup.class).uniqueResult();
            if(object != null)
            	indentGroup = (IndentGroup)object;
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("IndentGroupDaoImpl findById hql == "+Sql);
        }
        return indentGroup;
	}

	@Override
	public Session getSession() {
		// TODO Auto-generated method stub
		return super.getCurrentSession();
	}

	@Override
	public List<Object> findByAccount(String account){
		List<Object> list = new LinkedList();
		if (account != null) {
			String sql = "select *from "+Constant.TABLE_INDENT_GROUP+" where uid_indent_group="+account;
			try{
				list =super.getCurrentSession().createSQLQuery(sql).addEntity(IndentVip.class).list();
			}catch(Exception e){
				System.out.println("IndentVipDaoImpl findByCount's size"+list==null?0:list.size()
						 +" and sql is "+sql);
			}		
			return list;
		}else {
			return list;
		} 
	}

}
