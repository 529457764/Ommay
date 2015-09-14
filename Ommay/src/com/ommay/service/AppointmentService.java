package com.ommay.service;
/**
 * @author Doson 2015/8/17
 * Copyright (c) 2015 Doson. All rights reserved.
 */
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ommay.entity.Indent;

@Service
public interface AppointmentService {
	/* vip methods */
	public Object findVipById(String vid);
	public boolean saveVip(Object vip);
	public boolean updateVip(Object vip);
	public boolean deleteVip(String vid);
	/*group methods */
	public HashMap<String, Object> getGroupAppointment(String account); 
	public List getAllGroupAppointments();
	/*vip methods */
	public HashMap<String, Object> getVipAppointment(String account);
	public List getAllVipsAppointments();
	public boolean saveGroup(Object group);
	public boolean updateGroup(Object group);
	public boolean deleteGroup(String gid);
}
