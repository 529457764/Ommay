package com.ommay.dao.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ommay.dao.BaseDao;
import com.ommay.dao.OrderDetailDao;
import com.ommay.entity.Indent;
import com.ommay.entity.OrderDetail;
import com.ommay.utils.Constant;

@Repository
public class OrderDetailDaoImpl extends BaseDao implements OrderDetailDao{

	@Override
    public List<Object> queryAll() {
		List orderDetailList = this.getSession().createCriteria(OrderDetail.class).list();
		return orderDetailList;
    }
	
	
	
	@Override
	public void save(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		super.save(orderDetail);
		
	}

	@Override
	public void update(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public OrderDetail findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Session getSession() {
		// TODO Auto-generated method stub
		return super.getCurrentSession();
	}



	@Override
	public List<OrderDetail> findByIndentUid(String indentId) {
		// TODO Auto-generated method stub
		List<OrderDetail> list = null;
        String Sql = String.format("select *from %s where uid_indent=%s ", Constant.TABLE_ORDER_DETAIL, indentId);
        try {
            list =super.getCurrentSession().createSQLQuery(Sql).addEntity(OrderDetail.class).list();
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("OrderDetailDaoImpl findById hql == "+Sql);
        }
        return list;
	}
    
}
