package com.ommay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ommay.service.BaseService;

@Controller
@RequestMapping(value="/test")
public class TestController {
	/**
	 * TestController,入口地址：http://localhost:8080/Ommay/test
	 * 进入getSa_index方法的入口：	http://localhost:8080/Ommay/test/sa_index
	 */
	
	@Autowired
	private BaseService accountService;

	public BaseService getAccountService() {
		return accountService;
	}

	public void setAccountService(BaseService accountService) {
		this.accountService = accountService;
	}
	
	//业务员入口
	@RequestMapping(value="sa_index")
	public String getSa_index() {
		return "/salesman/sa_index";
	}
	//部门经理入口
	@RequestMapping(value="ma_index")
	public String getMa_index() {
		return "/manager/ma_index";
	}
	//会员入口	
	@RequestMapping(value="vi_index")
	public String getVi_index() {
		return "/vip/vi_index";
	}
	//客户代表入口
	@RequestMapping(value="re_index")
	public String getRe_index() {
		return "/representation/re_index";
	}
}
