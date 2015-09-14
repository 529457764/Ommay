package com.ommay.controller;
/**
 * Appointment Module
 * @author  Doson 
 * Copyright (JAVA) 2015 dosonleung. All rights reserved.
 */
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ommay.dao.AccountClientDao;
import com.ommay.dao.AccountGroupDao;
import com.ommay.dao.PhysicalItemDao;
import com.ommay.entity.AccountClient;
import com.ommay.entity.AccountGroup;
import com.ommay.service.AppointmentService;

@Controller
@RequestMapping("salesman") 
public class AppointmentController {

	@Autowired
	private AppointmentService appointmentService;
	@Autowired
    private AccountClientDao accountClientDao;
	@Autowired
    private AccountGroupDao accountGroupDao;
	
    //root
    @RequestMapping(value="")
    public String getIndex(Model modelMap){
        return "salesman_n/sa_index";
    }
    
    @RequestMapping(value="sa_groupAppointment")
    public String getGroupAppointmnetDetail(Model modelMap,HttpSession httpSession){
    	String account = (String) httpSession.getAttribute("accountName");
    	AccountGroup ag = accountGroupDao.findByAccount(account);
    	List<HashMap> groupAppointmentsList = appointmentService.getAllGroupAppointments();
    	if(ag!=null)
    	modelMap.addAttribute("groupAccountName", ag.getNameMaster());
    	modelMap.addAttribute("groupAppointmentsList", groupAppointmentsList);
        return "salesman_n/sa_groupAppointment";
    }
    
    @RequestMapping(value="sa_vipAppointment")
    public String getGroupProject(Model modelMap,HttpSession httpSession){
    	String account = (String) httpSession.getAttribute("accountName");
    	AccountClient accountClient = accountClientDao.findClientByAccount(account);
    	List<HashMap> vipAppointmentsList = appointmentService.getAllVipsAppointments();
    	if(accountClient!=null)
    	modelMap.addAttribute("vipAccountName", accountClient.getNameClient());
    	modelMap.addAttribute("vipAppointmentsList", vipAppointmentsList);
        return "salesman_n/sa_vipAppointment";
    }
    
}

//GRANT USAGE ON *.* TO 'ommay'@'%' IDENTIFIED BY 'ommay' WITH GRANT OPTION;