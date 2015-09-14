package com.ommay.controller;

/*
 * Doctor module controller,deal with the series of doctor's operation.
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ommay.entity.DoctorSearchUnit;
import com.ommay.entity.DoctorTestUnit;
import com.ommay.service.DoctorService;
import com.ommay.utils.JsonUtils;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	@Autowired
	private DoctorService doctorService;
	/*
	 * 这里接受两个参数：输入的订单号以及类型，并用model返回一个list，用于前端显示
	 */
	@RequestMapping(value = "/doctorSearch")
	public String getAllIndentByAccount(Model model, String account,
			String optionsRadios, HttpSession httpSession) {
		List<DoctorSearchUnit> list = null;
		// System.out.println("hehe");
		// System.out.println(optionsRadios);

		try {
			if (optionsRadios.equals("0")) {//接受的类型
				list = doctorService.getAllIndentVipByAccount(account);
			} else if (optionsRadios.equals("1")) {
				list = doctorService.getAllIndentMemberByAccount(account);
			} else {
				list = new ArrayList<DoctorSearchUnit>();
			}
		} catch (Exception e) {
			list = new ArrayList<DoctorSearchUnit>();
		}
		httpSession.setAttribute("doctorSearchFlag", optionsRadios);
		model.addAttribute("list", list);
		return "/doctor/doctorOperation";
	}
	/*
	 * 这里对应前端点击一个账号，这里接受账号并返回该账号的所有订单
	 */
	@RequestMapping(value = "/getSingleClientTestList")
	@ResponseBody
	public JSONObject getSingleClientTestList(String accountName) {
		List<DoctorTestUnit> testList = null;
		testList = doctorService.getSingleClientTestList(accountName);
		// model.addAttribute("testList", testList);
		// System.out.println(accountName);
		// System.out.println("ssssssssssssssssssssssssssssssss"+testList.size());
		// System.out.println(testList.get(0).toString());
		// return "/doctor/doctorOperation";
		JsonUtils util = new JsonUtils(testList);
		return util.getJsonObject();
	}
	/*
	 * 这里对应前端点击订单的状态，这里接受订单号并返回该订单的详细信息（返回值为JSONObject）
	 */
	@RequestMapping(value = "/getIndentDetail")
	@ResponseBody
	public JSONObject getIndentDetail(String uidIndent) {
		List list;
		list = doctorService.getIndentDetail(uidIndent);
		// model.addAttribute("indentDetail", list);
		// return "/doctor/doctorOperation";
		// System.out.println(list.get(0).toString());
		// System.out.println(list.get(1).toString());
		JsonUtils util = new JsonUtils(list);
		return util.getJsonObject();
	}
	/*
	 * 这里接受一个长String，并切割String、保存对应内容（可改进）
	 */
	@RequestMapping(value = "/saveResult")
	@ResponseBody
	public boolean saveResult(String result, HttpSession httpSession) {
		String flag = "0";
		boolean f = true;
		// try
		// {
		// flag = (String) httpSession.getAttribute("doctorSearchFlag");
		// }catch(Exception e)
		// {
		// e.printStackTrace();
		// flag = "0";
		// }
		try {
			doctorService.saveResult(result, flag,
					(String) httpSession.getAttribute("accountName"));
		} catch (Exception e) {
			f = false;
		}
		return f;
	}
}
