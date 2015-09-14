package com.ommay.controller;

/*
 * Project module controller,deal with the series of projects' action.
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;
import com.ommay.entity.AccountGroup;
import com.ommay.entity.Project;
import com.ommay.entity.Suit;
import com.ommay.service.ProjectService;
import com.ommay.utils.JsonUtils;

@Controller
@RequestMapping("project")
public class ProjectController {
	@Autowired
	private ProjectService projectService;

	// get all project, just for test
	// @RequestMapping(value="/getAllProject")
	// @ResponseBody
	// public JSONObject getAllProject()
	// {
	// List list = projectService.getAll();
	// JSONObject jsonObject = new JSONObject();
	// jsonObject = new JsonUtils(list).getJsonObject();
	// return jsonObject;
	// }

	/*
	 * 這裡對應业务员查看所有项目的按钮，用model返回一个list
	 */
	@RequestMapping(value = "workerGetAllGroupProject")
	public String workerGetAllGroupProject(Model model, HttpSession session) {
		List list = projectService.getAllGroupProject();
		// for (int i = 0; i < list.size(); i++)
		// System.out.println(list.get(i));
		model.addAttribute("list", list);
		return "/salesman_n/sa_groupProject";
	}

	/*
	 * 這裡對應部门经理查看所有项目的按钮，用model返回一个list
	 */
	@RequestMapping(value = "managerGetAllGroupProject")
	public String managerGetAllGroupProject(Model model, HttpSession session) {
		List list = projectService.getAllGroupProject();
		// for (int i = 0; i < list.size(); i++)
		// System.out.println(list.get(i));
		model.addAttribute("list", list);
		return "/manager_n/ma_groupProject";
	}

	/*
	 * 业务员点击一个项目，这里接受一个uid_project，然后返回一个project对象
	 */
	@RequestMapping(value = "workerGetSingleProjectById")
	public String workerGetSingleProjectById(Model model,
			@RequestParam("id") String uidProject, HttpSession session) {
		Project project = projectService.getSingleProjectById(new Long(
				uidProject));
		AccountGroup accountGroup = projectService.getSingleWorker(project
				.getAccount());
		model.addAttribute("project", project);
		model.addAttribute("accountGroup", accountGroup);
		return "/salesman_n/sa_projectDetail";
	}

	/*
	 * 经理点击一个项目，这里接受一个uid_project，然后返回一个project对象
	 */
	@RequestMapping(value = "managerGetSingleProjectById")
	public String managerGetSingleProjectById(Model model,
			@RequestParam("uidProject") String uidProject, HttpSession session) {
		Project project = projectService.getSingleProjectById(new Long(
				uidProject));
		AccountGroup accountGroup = projectService.getSingleWorker(project
				.getAccount());
		model.addAttribute("project", project);
		model.addAttribute("accountGroup", accountGroup);
		// System.out.println("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ"
		// + accountGroup.getNameMaster());
		return "/manager_n/ma_projectDetail";
	}

	/*
	 * （Aborting）点击一个体检套餐，下方的列表应该列出栩健设定的12个体检最细项，这里返回jsonobject给前端
	 */
	public JSONObject getPhysicalItem() {
		List list = projectService.getPhysicalItem();
		JSONObject jsonObject = new JSONObject();
		jsonObject = new JsonUtils(list).getJsonObject();
		return jsonObject;
	}

	/*
	 * 在业务员模块，点击查看会员项目时调用，返回一个list
	 */
	@RequestMapping(value = "workerGetAllVipProject")
	public String workerGetAllVipProject(Model model, HttpSession session) {
		List list = projectService.getAllVipProject();
		model.addAttribute("list", list);
		return "/salesman_n/sa_vipProject";
	}

	/*
	 * 在部门经理模块，点击查看会员项目时调用，返回一个list
	 */
	@RequestMapping(value = "managerGetAllVipProject")
	public String managerGetAllVipProject(Model model, HttpSession session) {
		List list = projectService.getAllVipProject();
		model.addAttribute("list", list);
		return "/manager_n/ma_vipProject";
	}

	/*
	 * 业务员查看自己建立的团体项目
	 */
	@RequestMapping(value = "workerGetOwnerProject")
	public String workerGetOwnerProject(Model model,
			@RequestParam("id") String id, HttpSession session) {
		List<Project> list = null;
		list = projectService.workerGetOwnerProject(id);
		model.addAttribute("list", list);
		return "/salesman_n/sa_myGroupProject";
	}

	/*
	 * 经理查看自己审批的团体项目，包括项目审批和合同审批
	 */
	@RequestMapping(value = "managerGetOwnerProject")
	public String managerGetOwnerProject(Model model,
			@RequestParam("id") String id, HttpSession session) {
		List<Project> list = null;
		list = projectService.managerGetOwnerProject(id);
		model.addAttribute("list", list);
		return "/manager_n/ma_myGroupProject";
	}

	/*
	 * 项目经理能够在查看到团体项目后进行审批，这里接受一个存储了审批结果（一个
	 * project_review_flag的属性及相关的操作员，日期等）project，完成审批工作
	 */
	@RequestMapping(value = "managerFinishGroupProjectReview")
	public String managerFinishGroupProjectReview(Model model,
			@RequestParam("uidProject") String uidProject, HttpSession session) {
		Project project = projectService.getSingleProjectById(Long
				.parseLong(uidProject));
		AccountGroup accountGroup = projectService.getSingleWorker(project
				.getAccount());
		List list = projectService.getSuitList(Long.parseLong(uidProject));
		model.addAttribute("list", list);
		model.addAttribute("project", project);
		model.addAttribute("accountGroup", accountGroup);

		return "/manager_n/ma_checkProject";
	}

	/*
	 * 项目经理能够在查看到团体项目后进行合同审批，这里接受一个存储了审批结果（一个
	 * contract_review_flag的属性及相关的操作员，日期等）project，完成审批工作
	 */
	@RequestMapping(value = "/managerFinishGroupContractReview")
	public String managerFinishGroupContractReview(Model model,
			@RequestParam("uidProject") String uidProject, HttpSession session) {
		Project project = projectService.getSingleProjectById(Long
				.parseLong(uidProject));
		AccountGroup accountGroup = projectService.getSingleWorker(project
				.getAccount());
		List list = projectService.getSuitList(Long.parseLong(uidProject));
		model.addAttribute("list", list);
		model.addAttribute("project", project);
		model.addAttribute("accountGroup", accountGroup);

		return "/manager_n/ma_checkTestSuit";
	}

	/*
	 * 经理完成项目审批，对应前端项目是否通过的按钮
	 */
	@RequestMapping(value = "/managerFinishChangingProject")
	public String managerFinishChangingProject(@ModelAttribute Project project,
			Model model, HttpSession session) {
		projectService.managerFinishChangingProject(project);
		return "/manager_n/ma_groupProject";
	}

	/*
	 * 经理完成合同审批，这里对应前端是否通过合同审批的按钮
	 */
	@RequestMapping(value = "/managerFinishChangingContract")
	public String managerFinishChangingContract(
			@ModelAttribute Project project, Model model, HttpSession session) {
		projectService.managerFinishChangingContract(project);
		return "/manager_n/ma_groupProject";
	}

	/*
	 * Aborting
	 */
	@RequestMapping(value = "/getAllVipIndent")
	public String getAllVipIndent(Model model, HttpSession session) {
		List list = projectService.getAllVipIndent();
		model.addAttribute("list", list);
		return "/getAllVipIndent";
	}

	/*
	 * 这里对应新建项目，用于获取项目对应的套餐内容，每次提交调用一次这个函数， 根据已有项目，一方面返回已有的套餐，一方面返回一个新的suit对象；
	 * 若套餐数已达到5，返回一个full标志和一个list，不再返回新suit对象
	 * 
	 * private： 调用了自身的getSuit函数
	 */
	@RequestMapping(value = "/sa_testSuit_merge")
	public String getAllSuit(@ModelAttribute Suit suit, Model model,
			Long uidProject, HttpSession session) {

		int uid = projectService.getMaxProjectId();
		List list = projectService.getSuitList(new Long(uid));
		Suit newSuit = projectService.getSuit(new Long(uid));

		if (list.size() > 0 && list.size() < 5) {
			model.addAttribute("list", list);
			model.addAttribute("suit", newSuit);
			// System.out.println("aaa: "+newSuit.getSuit_number());
		} else if (list.size() >= 5) {
			model.addAttribute("list", list);
			model.addAttribute("full", "full");
		} else if (list.size() == 0) {
			model.addAttribute("suit", newSuit);
		}
		return "/salesman_n/sa_testSuit_merge";
	}

	/*
	 * 用于业务员查看已有项目的详细信息，这里返回list以及一个project
	 */
	@RequestMapping(value = "/workerGetSuitDetail")
	public String workerGetSuitDetail(@ModelAttribute Suit suit, Model model,
			@RequestParam("id") String uidProject, HttpSession session) {
		List list = projectService.getSuitList(Long.parseLong(uidProject));
		// Suit newSuit = projectService.getSuit(uidProject);
		Project project = projectService.getSingleProjectById(Long
				.parseLong(uidProject));
		if (list.size() > 0 && list.size() < 5) {
			model.addAttribute("list", list);
			model.addAttribute("project", project);
			// model.addAttribute("suit", newSuit);
			// System.out.println("aaa: "+newSuit.getSuit_number());
		} else if (list.size() >= 5) {
			model.addAttribute("list", list);
			model.addAttribute("full", "full");
			model.addAttribute("project", project);
		}
		return "/salesman_n/sa_testSuitDetail";
	}

	/*
	 * 用于经理查看已有项目的详细信息，这里返回list以及一个project
	 */
	@RequestMapping(value = "/managerGetSuitDetail")
	public String managerGetSuitDetail(@ModelAttribute Suit suit, Model model,
			@RequestParam("id") String uidProject, HttpSession session) {
		List list = projectService.getSuitList(Long.parseLong(uidProject));
		// Suit newSuit = projectService.getSuit(uidProject);
		Project project = projectService.getSingleProjectById(Long
				.parseLong(uidProject));
		if (list.size() > 0 && list.size() < 5) {
			model.addAttribute("list", list);
			model.addAttribute("project", project);
			// model.addAttribute("suit", newSuit);
			// System.out.println("aaa: "+newSuit.getSuit_number());
		} else if (list.size() >= 5) {
			model.addAttribute("list", list);
			model.addAttribute("full", "full");
			model.addAttribute("project", project);
		}
		return "/manager_n/ma_testSuitDetail";
	}

	/*
	 * 这里被getAllSuit调用，用于保存以及重定向页面
	 */
	@RequestMapping(value = "/getSuit")
	public String getSuit(@ModelAttribute Suit suit, Model model,
			HttpSession session) {// needed uidProject
		// System.out.println(suit.getProject_id());
		// System.out.println(suit.getSuit_age_lower());
		// System.out.println(suit.getNumber_item1());
		// System.out.println(suit.toString());

		projectService.saveSuit(suit);
		// System.out.println("size:"+projectService.getSuitList(uidProject).size());
		// System.out.println(projectService.getSuitList(uidProject).get(0).toString());

		model.addAttribute("list", projectService.getSuitList(Long
				.parseLong(suit.getProject_id())));
		// return "/salesman_n/sa_testSuit_merge";
		return "redirect:/project/sa_testSuit_merge";
	}

}