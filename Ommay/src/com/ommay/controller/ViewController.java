package com.ommay.controller;

import javax.persistence.MappedSuperclass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ommay.entity.Account;
import com.ommay.entity.ProjectForm;
import com.ommay.service.BaseService;

@Controller
@RequestMapping(value="view")
public class ViewController {
	@Autowired
	private BaseService accountService;

	public BaseService getAccountService() {
		return accountService;
	}

	public void setAccountService(BaseService accountService) {
		this.accountService = accountService;
	}
	
	/**
	 * salesman_n
	 * @return
	 */
	@RequestMapping(value="sa_groupProject")
	public String sa_groupProject() {
		return "/salesman_n/sa_groupProject";
	}
	@RequestMapping(value="sa_myGroupProject")
	public String sa_myGroupProject() {
		return "/salesman_n/sa_myGroupProject";
	}
	@RequestMapping(value="sa_vipProject")
	public String sa_vipProject() {
		return "/salesman_n/sa_vipProject";
	}
	@RequestMapping(value="sa_myVipProject")
	public String sa_myVipProject() {
		return "/salesman_n/sa_myVipProject";
	}
	@RequestMapping(value="sa_newProject")
	public String sa_newProject(Model model) {
		model.addAttribute("projectForm" ,new ProjectForm());
		return "/salesman_n/sa_newProject_merge";
	}
	/*
	@RequestMapping(value="sa_newVip")
	public String sa_newVip() {
		return "/salesman_n/sa_newVip";
	}
	*/
	@RequestMapping(value="sa_groupAppointment")
	public String sa_groupAppointment() {
		return "/salesman_n/sa_groupAppointment";
	}
	@RequestMapping(value="sa_vipAppointment")
	public String sa_vipAppointment() {
		return "/salesman_n/sa_vipAppointment";
	}
	@RequestMapping(value="sa_userCenter")
	public String sa_userCenter() {
		return "/salesman_n/sa_userCenter";
	}
	@RequestMapping(value="sa_testSuit")
	public String sa_testSuit_merge() {
		return "/salesman_n/sa_testSuit_merge";
	}
	@RequestMapping(value="sa_projectDetail")
	public String sa_projectDetail() {
		return "/salesman_n/sa_projectDetail";
	}
	@RequestMapping(value="sa_testSuitDetail")
	public String sa_testSuitDetail() {
		return "/salesman_n/sa_testSuitDetail";
	}
	@RequestMapping(value="sa_groupAppointmentDetail")
	public String sa_groupAppointmentDetail() {
		return "/salesman_n/sa_groupAppointmentDetail";
	}
	@RequestMapping(value="sa_vipAppointmentDetail")
	public String sa_vipAppointmentDetail() {
		return "/salesman_n/sa_vipAppointmentDetail";
	}
	@RequestMapping(value="sa_VipManage")
	public String sa_manage() {
		return "/salesman_n/sa_VipManage";
	}
	@RequestMapping(value="sa_ReManage")
	public String sa_ReManage() {
		return "/salesman_n/sa_ReManage";
	}
	@RequestMapping(value="sa_register1")
	public String sa_register1() {
		return "/salesman_n/sa_register1";
	}
	@RequestMapping(value="sa_register2")
	public String sa_register2() {
		return "/salesman_n/sa_register2";
	}

	
	/**
	 * manager_n
	 */
	@RequestMapping(value="ma_groupProject")
	public String ma_groupProject() {
		return "/manager_n/ma_groupProject";
	}
	@RequestMapping(value="ma_myGroupProject")
	public String ma_myGroupProject() {
		return "/manager_n/ma_myGroupProject";
	}
	@RequestMapping(value="ma_vipProject")
	public String ma_vipProject() {
		return "/manager_n/ma_vipProject";
	}
	@RequestMapping(value="ma_myVipProject")
	public String ma_myVipProject() {
		return "/manager_n/ma_myVipProject";
	}
	@RequestMapping(value="ma_groupAppointment")
	public String ma_groupAppointment() {
		return "/manager_n/ma_groupAppointment";
	}
	@RequestMapping(value="ma_salesmanManage")
	public String ma_salesmanManage(Model model) {
		model.addAttribute("account", new Account());
		return "/manager_n/ma_salesmanManage";
	}
	@RequestMapping(value="ma_userCenter")
	public String ma_userCenter() {
		return "/manager_n/ma_userCenter";
	}
	
	@RequestMapping(value="ma_checkProject")
	public String ma_checkProject() {
		return "/manager_n/ma_checkProject";
	}
	@RequestMapping(value="ma_checkTestSuit")
	public String ma_checkTestSuit() {
		return "/manager_n/ma_checkTestSuit";
	}
	@RequestMapping(value="ma_groupAppointmentDetail")
	public String ma_groupAppointmentDetail() {
		return "/manager_n/ma_groupAppointmentDetail";
	}
	
	@RequestMapping(value="ma_register1")
	public String ma_register1() {
		return "/manager_n/ma_register1";
	}
	@RequestMapping(value="ma_register2")
	public String ma_register2() {
		return "/manager_n/ma_register2";
	}
	
	/**
	 * representation_n
	 */
	@RequestMapping(value="re_userCenter")
	public String re_userCenter() {
		return "/representation_n/re_userCenter";
	}
	@RequestMapping(value="re_testAppointment")
	public String re_testAppointment() {
		return "/representation_n/re_testAppointment";
	}
	@RequestMapping(value="re_checkResult")
	public String re_checkResult() {
		return "/representation_n/re_checkResult";
	}
	@RequestMapping(value="re_resultDetail")
	public String re_resultDetail() {
		return "/representation_n/re_resultDetail";
	}
	
}
