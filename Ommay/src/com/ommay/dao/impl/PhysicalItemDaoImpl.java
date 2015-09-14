package com.ommay.dao.impl;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.criterion.Order;

import com.ommay.dao.BaseDao;
import com.ommay.dao.PhysicalItemDao;
import com.ommay.entity.Account;
import com.ommay.entity.Indent;
import com.ommay.entity.PhysicalItem;
import com.ommay.utils.Constant;

public class PhysicalItemDaoImpl extends BaseDao implements PhysicalItemDao{
	public List<PhysicalItem> retrieveAll(){
		List list = this.getSession().createCriteria(PhysicalItem.class).list();
		return list;
	}
	
	@Override
    public List<Object> queryAll(String table) {
		List<Object> physicalItem = new LinkedList();
        String hql = "from PhysicalItem";
        try{
        	physicalItem =super.getCurrentSession().createQuery(hql).list();
        }catch(Exception e){
        	
        }
        System.out.println("physicalItem size == "+physicalItem.size());
        return physicalItem;
    }
	
	
	@Override
	public Session getSession() {
		// TODO Auto-generated method stub
		return super.getCurrentSession();
	}

	@Override
	public PhysicalItem getById(String id_item) {
		// TODO Auto-generated method stub
		PhysicalItem physicalItem = null;
        String Sql = String.format("select *from %s where id_item='%s'", Constant.TABLE_PHYSICALITEMS,id_item);
        try {
            Object object =super.getCurrentSession().createSQLQuery(Sql).addEntity(PhysicalItem.class).uniqueResult();
            if(object != null)
            	physicalItem = (PhysicalItem)object;
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("PhysicalItemDaoImpl findById hql == "+Sql);
        }
        return physicalItem;
	}
}
