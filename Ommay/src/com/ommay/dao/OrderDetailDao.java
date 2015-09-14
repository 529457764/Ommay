package com.ommay.dao;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.ommay.entity.OrderDetail;

@Repository
public interface OrderDetailDao {
	public List<Object> queryAll();
	public void save(OrderDetail orderDetail);
	public void update(OrderDetail orderDetail);
	public void delete(OrderDetail orderDetail);
	public OrderDetail findById(String id);
	public List<OrderDetail> findByIndentUid(String indentId);
	public Session getSession();
}
