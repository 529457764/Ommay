package com.ommay.dao.impl;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.ommay.dao.BaseDao;
import com.ommay.dao.IndentVipDao;
import com.ommay.entity.Indent;
import com.ommay.entity.IndentVip;
import com.ommay.entity.Project;
import com.ommay.utils.Constant;

@Repository
public class IndentVipDaoImpl extends BaseDao implements IndentVipDao{

	@Override
	public List<IndentVip> queryAll() {
		List<IndentVip> indentVipsList = this.getSession().createCriteria(IndentVip.class).list();
		return indentVipsList;
	}

	@Override
	public void save(IndentVip object) {
		// TODO Auto-generated method stub
		super.save(object);
	}

	@Override
	public void update(IndentVip object) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(IndentVip object) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public IndentVip findById(String account) {
		// TODO Auto-generated method stub
		IndentVip indentVip = null;
        String Sql = String.format("select *from %s where uid_indent=%s ", Constant.TABLE_INDENT_VIP_, account);
        try {
            Object object =super.getCurrentSession().createSQLQuery(Sql).addEntity(IndentVip.class).uniqueResult();
            if(object != null)
            	indentVip = (IndentVip)object;
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("IndentVipDaoImpl findById hql == "+Sql);
        }
        return indentVip;
	}

	@Override
	public List<IndentVip> queryAllByAccount(String account){
		List<IndentVip> list = null;
		String Sql = String.format("select * from %s where account_client_indent='%s' ", Constant.TABLE_INDENT_VIP_, account);
        try {
            list = (List)this.queryIdentity(Sql);
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("IndentDaoImpl findColumnByIdWithBoolean hql == "+Sql);
        }
		
		return list;
	}
	
	public List<Object> findByAccount(String account){        
         List<Object> list = new LinkedList();
		if (account != null) {
			String sql = "select *from "+Constant.TABLE_INDENT_VIP_+" where account_client_indent='"+account+"'";
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
