package com.ommay.controller;

/**
 * Appointment Module
 * @author  Doson 
 * Copyright (JAVA) 2015 dosonleung. All rights reserved.
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ommay.dao.AccountClientDao;
import com.ommay.dao.AccountGroupDao;
import com.ommay.dao.IndentDao;
import com.ommay.dao.IndentGroupDao;
import com.ommay.dao.OrderDetailDao;
import com.ommay.dao.PhysicalItemDao;
import com.ommay.dao.ProjectDao;
import com.ommay.dao.ProjectDetailDao;
import com.ommay.dao.TestResultDao;
import com.ommay.entity.AccountClient;
import com.ommay.entity.AccountGroup;
import com.ommay.entity.Indent;
import com.ommay.entity.IndentVip;
import com.ommay.entity.OrderDetail;
import com.ommay.entity.PhysicalItem;
import com.ommay.entity.Project;
import com.ommay.entity.ProjectDetail;
import com.ommay.entity.TestResult;
import com.ommay.utils.Constant;
import com.ommay.utils.TimeUtils;

@Controller
@RequestMapping("/representation") 
public class RepresentController {
	
	@Autowired
    private ProjectDao projectDao;
	@Autowired
    private IndentDao indentDao;
	@Autowired
    private PhysicalItemDao physicalDao;
	@Autowired
    private AccountGroupDao accountGroupDao;
	@Autowired
    private ProjectDetailDao projectDetailDao;
	@Autowired
    private OrderDetailDao orderDetailDao;
	@Autowired
    private TestResultDao testResultDao;
	@Autowired
    private IndentGroupDao indentGroupDao;
	
	/**
     * The index of Represent Module
     * @return 
     */
    @RequestMapping(value="")
    public String index(Model modelmap,HttpSession httpSession){
    	String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountGroup ag = accountGroupDao.findByAccount(account);//For testing ...................................
    	if(ag != null&& flag!= null && flag==Constant.account_group){
	    	Map<String,Object> map = new HashMap<String, Object>();
	    	int index = ag.getNameMaster().indexOf('-');
	    	String com,name;
	    	if(index >= 0 && index < ag.getNameMaster().length()-1){
	    		com = ag.getNameMaster().substring(0,index);
	    		name = ag.getNameMaster().substring(index+1,ag.getNameMaster().length());
	    	}else{
	    		com = "没填写公司";
	    		name = ag.getNameMaster();
	    	}
	    	map.put("id",ag.getAccountGroup());
	    	map.put("namemaster",name);
	    	map.put("comname", com);
	    	map.put("emailmaster",ag.getNameMaster());
	    	map.put("phonemaster", ag.getPhoneMaster());
	    	map.put("workingphonemaster", ag.getWorkingPhoneMaster());
	    	map.put("salesman", "安生美业务员");
	    	modelmap.addAttribute("user", map);
    	}else{
    		modelmap.addAttribute("user", null);
    	}
        return "representation_n/re_index";
    }
    
    /**
     * Retrieve the vip info
     * @param model
     * @return
     */
    @RequestMapping(value="/re_userCenter")
    public String getInfo(Model modelmap,HttpSession httpSession,HttpServletResponse response){
    	String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountGroup ag = accountGroupDao.findByAccount(account);//For testing ...................................
    	if(ag != null&& flag!= null && flag==Constant.account_group){
	    	Map<String,Object> map = new HashMap<String, Object>();
	    	map.put("id",ag.getAccount().getAccount());
	    	map.put("com",ag.getAccountGroup());
	    	map.put("email",ag.getEmailGroup());
	    	map.put("mobilephone",ag.getPhoneMaster());
	    	map.put("namemaster", ag.getNameMaster());
	    	map.put("phonemaster",ag.getPhoneMaster());
	    	map.put("address", ag.getWorkingPhoneMaster());
	    	map.put("salesman", "宫鸣");
	    	modelmap.addAttribute("com", map);
    	}else{
    		modelmap.addAttribute("com", null);
    	}
    	return "representation_n/re_userCenter";
    }
    
    /**
     * apply for appointments
     * @param model
     * @return
     */
    @RequestMapping(value="/re_testAppointment")
    public String applyAppointment(Model modelmap,HttpSession httpSession){
    	String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountGroup ag = accountGroupDao.findByAccount(account);
    	
    	if(ag!=null){
    		int index = ag.getNameMaster().indexOf('-');
	    	String com,name;
	    	if(index >= 0 && index < ag.getNameMaster().length()-1){
	    		com = ag.getNameMaster().substring(0,index);
	    		name = ag.getNameMaster().substring(index+1,ag.getNameMaster().length());
	    	}else{
	    		com = "没填写公司";
	    		name = ag.getNameMaster();
	    	}
    		List<?> projectDetailList = new LinkedList();
    		List<Project> projectList = new LinkedList();
    		projectList = projectDao.getProjectsByAccount(account);
    		Project lastProject = null;
    		ProjectDetail projectDetail = null;
    		Integer n = 0;
    		if(projectList!=null && projectList.size()>0){
    			lastProject = projectList.get(projectList.size()-1);
    			projectDetailList = (List<?>)projectDetailDao.queryAllByProjectId(lastProject.getUidProject());
    			projectDetail = (ProjectDetail) projectDetailList.get(0);
    			if(projectDetail!=null){
    				n = projectDetail.getNumber();
    			}
    		}   		
	    	//LinkedList<Object> list = (LinkedList<Object>) physicalDao.queryAll(Constant.TABLE_PHYSICALITEMS);
	    	List<?> list =  (List<?>) physicalDao.retrieveAll();
	    		    	
	    	modelmap.addAttribute("appointments_sum", n);
	    	modelmap.addAttribute("com", com);
	    	modelmap.addAttribute("name", name);
	    	modelmap.addAttribute("appointments_content", list);
    	}else{
    		modelmap.addAttribute("appointments_sum", 0);
    		modelmap.addAttribute("com", "");
    		modelmap.addAttribute("name", "");
    		modelmap.addAttribute("appointments_content", null);
    	}
    	return "representation_n/re_testAppointment";
    }
    
    
    
    
    /**
     * apply for appointments
     * @param model
     * @return
     */
    @RequestMapping(value="/re_submitAppointment",method=RequestMethod.POST)
    public String submitAppointment(Model modelmap,HttpSession httpSession,String beginYear,String beginMonth,String beginDay,String beginTime,String endYear,String endMonth,String endDay,String endTime ,Integer total,String chooseNum,String chooseId){
    	String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountGroup ag = accountGroupDao.findByAccount(account);//For testing ...................................
    	if(ag != null&& flag!=null && flag==Constant.account_group){	
	    	boolean insertResult = false;
	    	String[] chooseIdArray = chooseId.split(",");//split
	    	List<PhysicalItem> physicalList =  (List<PhysicalItem>) physicalDao.retrieveAll();//
	    	List<String> chooseIdItems = new ArrayList<String>();
	    	//resolve chooseId from chooseIdArray to chooseIdItems
	    	for(int i = 0; i<chooseIdArray.length; i++){
	    		if(chooseIdArray[i].equalsIgnoreCase("true")){
	    			chooseIdItems.add(String.valueOf(i));
	    		}
	    	}
	    	if(chooseIdItems.size() > 0){
	    		
	    		//generate indent
	    		List indentList = (List)indentDao.queryAll();
	    		int indentSum = indentList==null?0:indentList.size();
	    		Indent indent = new Indent();
	    		indent.setUidIndent(indentSum+1);//inital the uid of the indent
	    		indent.setMoneyIndent(total);
	    		indentDao.save(indent);//Are you sure it is ok?
	    				
	    		//generate project
	    		List projectList = (List)projectDao.queryAll();
	    		int projectSum = projectList==null?0:projectList.size();
	    		Project project = new Project();
	    		project.setUidProject(projectSum+1);
	    		project.setAccount(account);//For testing ...............................................................
	    		String mul = ag.getNameMaster();
	    		int index = ag.getNameMaster().indexOf('-');
		    	String com,name;
		    	if(index >= 0 && index < ag.getNameMaster().length()-1){
		    		com = ag.getNameMaster().substring(0,index);
		    		name = ag.getNameMaster().substring(index+1,ag.getNameMaster().length());
		    	}else{
		    		com = "没填写公司";
		    		name = ag.getNameMaster();
		    	}
	    		project.setClientName(mul);//For testing ...............................................................
	    		project.setPeopleNumber(100);
	    		project.setTimeBegin(beginYear+beginMonth+beginDay);
	    		project.setTimeEnd(endYear+endMonth+endDay);
	    		project.setAddressGroup(com);
	    		project.setProjectBuilder(ag.getNameMaster());
	    		projectDao.save(project);
	    				
	    		for(int j = 0; j<chooseIdItems.size() ;j++){
	    			//generate projectdetail
	    			List ProjectDetailList = (List)projectDetailDao.queryAll();
	    			int projectDetailSum = ProjectDetailList==null?0:ProjectDetailList.size();
	        		ProjectDetail projectDetail = new ProjectDetail();
	        		projectDetail.setUidProjectDetail(projectDetailSum+1);
	        		projectDetail.setProject(project);
	        		projectDetail.setTestType(physicalList.get(j).getTypeItem());
	        		projectDetail.setPackageName(chooseIdItems.get(j));
	        		projectDetailDao.save(projectDetail);//Are you sure it is ok?
	    			
	        		//generate orderdetail
	        		List orderDetailList = (List)orderDetailDao.queryAll();
	        		int orderdetailSum = orderDetailList==null?0:orderDetailList.size();
	        		OrderDetail orderDetail = new OrderDetail();
	        		orderDetail.setUidOrderDetail(orderdetailSum+1);
	        		orderDetail.setIndent(indent);
	        		orderDetail.setProjectDetail(projectDetail);
	        		orderDetail.setMoneyOrder(total);
	        		orderDetail.setOrderClientName(ag.getNameMaster());//For testing .........................................................
	        		orderDetail.setOrderTime(TimeUtils.getNowDate());
	        		orderDetailDao.save(orderDetail);//Are you sure it is ok?
	        		
	        		List testResultSumList = ((List)testResultDao.queryAll());
	    			int testResultSum = testResultSumList==null?0:testResultSumList.size();
	    			TestResult testResult = new TestResult();
	    			testResult.setUidTestDetail(testResultSum+1);
	    			testResult.setOrderDetail(orderDetail);
	    			testResult.setIdPhysicalItem(chooseIdItems.get(j));
	    			testResult.setResult("haven't yet");
	    			testResult.setIndentGroupMember("");
	    			testResult.setUidProject(String.valueOf(project.getUidProject()));
	    			testResult.setAccount(account);//For testing .........................................................
	    			testResultDao.save(testResult);
	    		}
	    		insertResult = true;
	    		
	    	}else{
	    		insertResult = false;
	    	}
	    	if(insertResult){	
	    		modelmap.addAttribute("submitAppointmentsuccess","true");
	    	}
    	}else{
    		modelmap.addAttribute("submitAppointmentsuccess",null);
    	}
        return "representation_n/re_index";
    }
    
    /**
     * retrieve the physical examination result
     * @see phys_result
     * @param model
     * @return
     */
    @RequestMapping(value="/re_checkResult")
    public String retrievePhysResult(Model modelmap,HttpSession httpSession){
    	String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountGroup ag = accountGroupDao.findByAccount(account);
    	if(ag != null&& flag!=null && flag==Constant.account_group){
	    	List<IndentVip> indentGroupList = (List)indentGroupDao.findByAccount(account);//For testing ..........................
	    	if(indentGroupList!=null){
		    	List<Indent> indentList = new LinkedList();
		    	List<Project> projectList = new LinkedList();
		    	for(int i = 0; i < indentGroupList.size(); i++){
		    		Integer uidProject = indentGroupList.get(i).getUidProject();
		    		Project project = projectDao.getSingleProjectById(uidProject);
		    		Indent indent = (Indent)indentDao.findById(indentGroupList.get(i).getUidIndent());
		    		if(project != null)
		    			projectList.add(project);
		    		if(indent != null)
		    			indentList.add(indent);
		    	}
		//    	 = (List)projectDao.queryAllByAccount("201231000821");//For testing ................................
		    	//List<TestResult> testResultList = testResultDao.queryByAccount("201231000821");//For testing ................................
		    	List<Map<String, String>> resultList = new LinkedList<Map<String, String>>();
		    	for(int k = 0 ; k < indentGroupList.size() ; k++ ){
		    		Map<String, String> result = new HashMap<String, String>();
		    		result.put("phsy_sum",String.valueOf(indentGroupList.size()));
		    		result.put("phsy_time",projectList.get(k).getTimeBegin());
		    		
		    		String status;
		    		String updateDate;
		    		Indent indent = indentList.get(k);
			    		if(indent != null){
			    		Boolean isPaid = indent.getIsPaid();
						Boolean finishIndent = indent.getFinishIndent();
						Boolean hasResult = indent.getHasResult();
			    		
						String isPaidDate = indent.getIsPaidDate();
						String finish_date = indent.getFinishDate();
						String hasResultDate = indent.getHasResultDate();
						updateDate = hasResultDate!=null?hasResultDate:finish_date!=null?finish_date:isPaidDate!=null?isPaidDate:"Unknown";
						
						if(hasResult != null && finishIndent!= null && isPaid != null)
							status = hasResult?"已有结果":finishIndent?"已预约":isPaid?"已付款":"没付款"; 
						else
							status = "Unknown";
		    		}else{
		    			updateDate = "没有更新日期";
		    			status = "没有状态";
		    		}
		    		
		    		result.put("phsy_status",status);
		    		result.put("phsy_update_date",updateDate);
		    		result.put("phsy_clerk",String.valueOf(k));
		    		result.put("phys_project_uid",String.valueOf(projectList.get(k).getUidProject()));
		    		result.put("phys_status_boolean",String.valueOf(status == "已有结果"?true:false));
		    		resultList.add(result);
		    	}
		    	modelmap.addAttribute("name",account);
		    	modelmap.addAttribute("phys_result",resultList);
	    	}else{
	    		List<Map<String, String>> resultList = new LinkedList<Map<String, String>>();
	    		modelmap.addAttribute("name",account);
	    		modelmap.addAttribute("phys_result",resultList);
	    	}
    	}else{
    		modelmap.addAttribute("name",account);
    		modelmap.addAttribute("phys_result",null);
    	}
        return "/representation_n/re_checkResult";
    }
    
    /**
     * retrieve the physical examination result derail
     * @see phys_report phys_recommendation phys_doctor_id phys_doctor_name phys_date phys_client_name
     * @param model
     * @return
     */
    @RequestMapping(value="/phys_result_detail")
    public String retrievePhysResultDetail(Model modelmap,HttpSession httpSession,@RequestParam String project_uid){
    	//generate phys report f
    	String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountGroup ag = accountGroupDao.findByAccount("account");
    	if(ag != null&& flag!=null && flag==Constant.account_group){
	    	List<TestResult> testResultList = testResultDao.queryByAccountAndProjectUid(account, project_uid);//For testing ................................
	    	if(testResultList !=null){
		    	List<Map<String, String>> reportList = new ArrayList<Map<String, String>>();
		    	for(int i = 0 ; i < testResultList.size() ; i++ ){
		    		Map<String, String> result = new HashMap<String, String>();
		    		result.put("phsy_report_id",project_uid);
		    		result.put("phsy_report_project",testResultList.get(i).getIdPhysicalItem());
		    		result.put("phsy_report_result",testResultList.get(i).getResult());
		    		result.put("phsy_report_backup","No");
		    		reportList.add(result);
		    	}
		    	//generate phys doctor's recommendation
		    	String recommendation = "多喝水,早睡眠";
		    	//generate phys doctor's name
		    	String doctorName = "梁都城";
		    	//generate phys doctor's id
		    	String doctorId = "YG040001";
		    	//generate date
		    	//String date = "2014年11月17日";
		    	//generate phys client name
		    	String clientName = ag.getNameMaster();
		    	
		    	modelmap.addAttribute("phys_client_name",clientName);
		    	modelmap.addAttribute("phys_doctor_id",doctorId);
		    	modelmap.addAttribute("phys_doctor_name",doctorName);
		    	modelmap.addAttribute("phys_date",doctorName);
		    	modelmap.addAttribute("phys_report",reportList);
		    	modelmap.addAttribute("phys_recommendation",recommendation);
	    	}
    	}else{
    		modelmap.addAttribute("phys_report",null);
    	}
        return "/representation_n/re_resultDetail";
    }    
    
}
