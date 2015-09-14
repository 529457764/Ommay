package com.ommay.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.ommay.dao.IndentVipDao;
import com.ommay.dao.OrderDetailDao;
import com.ommay.dao.ProjectDetailDao;
import com.ommay.service.VipService;
import com.ommay.entity.IndentVip;
public class VipServiceImpl implements VipService{
	
	@Autowired
    private IndentVipDao indentVipDao;
	private OrderDetailDao orderDetailDao;
	private ProjectDetailDao projectDetailDao;
	
	public boolean saveVipAppointment(Object object){
		//indentVip ++ (*)
		//projectDetail --
		/*OrderDetail ++ */
		IndentVip indentVip = (IndentVip)object;
		if(object != null){
			indentVipDao.save(indentVip);
			return true;
		}else
			return false;
	}
}
