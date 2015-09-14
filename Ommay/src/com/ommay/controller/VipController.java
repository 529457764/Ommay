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
import com.ommay.dao.IndentDao;
import com.ommay.dao.IndentVipDao;
import com.ommay.dao.OrderDetailDao;
import com.ommay.dao.PhysicalItemDao;
import com.ommay.dao.ProjectDao;
import com.ommay.dao.ProjectDetailDao;
import com.ommay.dao.TestResultDao;
import com.ommay.entity.Account;
import com.ommay.entity.AccountClient;
import com.ommay.entity.Indent;
import com.ommay.entity.IndentVip;
import com.ommay.entity.OrderDetail;
import com.ommay.entity.PhysicalItem;
import com.ommay.entity.Project;
import com.ommay.entity.ProjectDetail;
import com.ommay.entity.TestResult;
import com.ommay.utils.TimeUtils;
import com.ommay.utils.Constant;

@Controller
@RequestMapping("/vip") 
public class VipController {
    
	@Autowired
    private PhysicalItemDao physicalDao;
	@Autowired
    private IndentVipDao indentVipDao;
	@Autowired
    private IndentDao indentDao;
	@Autowired
    private OrderDetailDao orderDetailDao;
	@Autowired
    private TestResultDao testResultDao;
	@Autowired
    private ProjectDao projectDao;
	@Autowired
    private AccountClientDao accountClientDao;
	@Autowired
    private ProjectDetailDao projectDetailDao;
	
	
	VipController(){
		super();
	}
	
    /**
     * The index of Vip Module
     * @return 
     */
    @RequestMapping(value="")
    public String index(Model modelmap,HttpSession httpSession){
    	String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountClient accountClient = accountClientDao.findClientByAccount(account);//For testing ...................................
    	if(accountClient != null&& flag!= null && flag==Constant.account_client){
	    	Map<String,Object> map = new HashMap<String, Object>();
	    	map.put("id",accountClient.getAccountClient());
	    	map.put("gender",accountClient.getSexClient());
	    	map.put("identity",accountClient.getIdentityCardNumber());
	    	map.put("mobilephone",accountClient.getPhoneClient());
	    	map.put("officephone", "无");
	    	map.put("email",accountClient.getEmailClient());
	    	map.put("address", accountClient.getAddressClient());
	    	map.put("sicknesshistory", accountClient.getSicknessHistory());
	    	map.put("salesman", "Unknown");
	    	map.put("name", accountClient.getAccountClient());
	    	modelmap.addAttribute("user", map);
    	}else{
    		modelmap.addAttribute("user", null);
    	}
        return "/vip/vi_index";
    }
    
    /**
     * Retrieve the vip info
     * @param model
     * @return
     */
    @RequestMapping(value="/vi_userCenter")
    public String getInfo(Model modelmap,HttpSession httpSession,HttpServletResponse response){
    	String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountClient accountClient = accountClientDao.findClientByAccount(account);//For testing ...................................
    	if(accountClient != null&& flag!= null && flag==Constant.account_client){
	    	Map<String,Object> map = new HashMap<String, Object>();
	    	map.put("id",accountClient.getAccountClient());
	    	map.put("gender",accountClient.getSexClient());
	    	map.put("identity",accountClient.getIdentityCardNumber());
	    	map.put("mobilephone",accountClient.getPhoneClient());
	    	map.put("officephone", "无");
	    	map.put("email",accountClient.getEmailClient());
	    	map.put("address", accountClient.getAddressClient());
	    	map.put("sicknesshistory", accountClient.getSicknessHistory());
	    	map.put("salesman", "Unknown");
	    	map.put("name", accountClient.getAccountClient());
	    	modelmap.addAttribute("user", map);
    	}else{
    		modelmap.addAttribute("user", null);
    	}
    	return "/vip/vi_userCenter";
    }
        
    /**
     * apply for appointments
     * @param model
     * @return
     */
    @RequestMapping(value="/vi_testAppointment")
    public String applyAppointment(Model modelmap,HttpSession httpSession){
    	String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountClient accountClient = accountClientDao.findClientByAccount(account);
    	if(accountClient!=null){
//    		List<?> appointmentslist = new LinkedList();
//	    	appointmentslist = (List<?>)indentVipDao.findByAccount(account);
//	    	int n = appointmentslist==null?0:appointmentslist.size();//For testing ...................................
	    	//LinkedList<Object> list = (LinkedList<Object>) physicalDao.queryAll(Constant.TABLE_PHYSICALITEMS);
	    	List<?> list =  (List<?>) physicalDao.retrieveAll();
	    	
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
	    		    	
	    	modelmap.addAttribute("appointments_sum", n);
	    	modelmap.addAttribute("name", accountClient.getAccountClient());
	    	modelmap.addAttribute("appointments_content", list);
    	}else{
    		modelmap.addAttribute("appointments_sum", 0);
    		modelmap.addAttribute("name", accountClient.getAccountClient());
    		modelmap.addAttribute("appointments_content", null);
    	}
    	return "vip/vi_testAppointment";
    }
    
    /**
     * apply for appointments
     * @param model
     * @return
     */
    @RequestMapping(value="/vi_submitAppointment",method=RequestMethod.POST)
    public String submitAppointment(Model modelmap,HttpSession httpSession,String year,String month,String day,Integer total,String chooseNum,String chooseId){
    	String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountClient accountClient = accountClientDao.findClientByAccount(account);//For testing ...................................
    	if(accountClient != null&& flag!=null && flag==Constant.account_client){	
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
	    		project.setClientName(accountClient.getAccountClient());//For testing ...............................................................
	    		project.setPeopleNumber(1);
	    		project.setTimeBegin(year+month+day);
	    		project.setTimeEnd("UnRecord");
	    		project.setAddressGroup("个人");
	    		projectDao.save(project);
	    			
	    		IndentVip indentVip = new IndentVip();
	    		List indentVipList = (List)indentVipDao.queryAll();
	    		int indentVipSum = indentVipList.size();
	    		indentVip.setUidIndentVip(indentVipSum+1);//int
	    		indentVip.setUidIndent(indent.getUidIndent());//int
	    		indentVip.setUidProject(project.getUidProject());//int
	    		indentVip.setAccountClientIndent(account);
	    		indentVip.setIndentVipName(accountClient.getAccountClient());
	    		indentVip.setIndentVipSex(accountClient.getSexClient());
	    		indentVip.setIndentVipEmail(accountClient.getEmailClient());
	    		indentVip.setIndentVipAddress(accountClient.getAddressClient());
	    		indentVip.setIndentVipPhone(accountClient.getPhoneClient());
	    		indentVipDao.save(indentVip);
	    		
	    		for(int j = 0; j<chooseIdItems.size() ;j++){
	    			//generate projectdetail
	    			List ProjectDetailList = (List)projectDetailDao.queryAll();
	    			int projectDetailSum = ProjectDetailList==null?0:ProjectDetailList.size();
	        		ProjectDetail projectDetail = new ProjectDetail();
	        		projectDetail.setUidProjectDetail(projectDetailSum+1);
	        		projectDetail.setProject(project);
	        		projectDetail.setTestType(physicalList.get(j).getTypeItem());
	        		projectDetailDao.save(projectDetail);//Are you sure it is ok?
	    			
	        		//generate orderdetail
	        		List orderDetailList = (List)orderDetailDao.queryAll();
	        		int orderdetailSum = orderDetailList==null?0:orderDetailList.size();
	        		OrderDetail orderDetail = new OrderDetail();
	        		orderDetail.setUidOrderDetail(orderdetailSum+1);
	        		orderDetail.setIndent(indent);
	        		orderDetail.setProjectDetail(projectDetail);
	        		orderDetail.setMoneyOrder(total);
	        		orderDetail.setOrderClientName(accountClient.getAccountClient());//For testing .........................................................
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
	    		Map<String,Object> map = new HashMap<String, Object>();
		    	map.put("id",accountClient.getAccountClient());
		    	map.put("gender",accountClient.getSexClient());
		    	map.put("identity",accountClient.getIdentityCardNumber());
		    	map.put("mobilephone",accountClient.getPhoneClient());
		    	map.put("officephone", "无");
		    	map.put("email",accountClient.getEmailClient());
		    	map.put("address", accountClient.getAddressClient());
		    	map.put("sicknesshistory", accountClient.getSicknessHistory());
		    	map.put("salesman", "Unknown");
		    	map.put("name", accountClient.getAccountClient());
	    		modelmap.addAttribute("user", map);
	    		modelmap.addAttribute("submitAppointmentsuccess","true");
	    	}
    	}else{
    		Map<String,Object> map = new HashMap<String, Object>();
	    	map.put("id",accountClient.getAccountClient());
	    	map.put("gender",accountClient.getSexClient());
	    	map.put("identity",accountClient.getIdentityCardNumber());
	    	map.put("mobilephone",accountClient.getPhoneClient());
	    	map.put("officephone", "无");
	    	map.put("email",accountClient.getEmailClient());
	    	map.put("address", accountClient.getAddressClient());
	    	map.put("sicknesshistory", accountClient.getSicknessHistory());
	    	map.put("salesman", "Unknown");
	    	map.put("name", accountClient.getAccountClient());
    		modelmap.addAttribute("user", map);
    		modelmap.addAttribute("submitAppointmentsuccess",null);
    	}
        return "vip/vi_index";
    }
    
    
    /**
     * retrieve the physical examination result
     * @see phys_result
     * @param model
     * @return
     */
    @RequestMapping(value="/vi_checkResult")
    public String retrievePhysResult(Model modelmap,HttpSession httpSession){
    	String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountClient accountClient = accountClientDao.findClientByAccount(account);
    	if(accountClient != null&& flag!=null && flag==Constant.account_client){
	    	List<IndentVip> indentVipList = (List)indentVipDao.findByAccount(account);//For testing ..........................
	    	if(indentVipList!=null){
		    	List<Indent> indentList = new LinkedList();
		    	List<Project> projectList = new LinkedList();
		    	for(int i = 0; i < indentVipList.size(); i++){
		    		Integer uidProject = indentVipList.get(i).getUidProject();
		    		Project project = projectDao.getSingleProjectById(uidProject);
		    		Indent indent = (Indent)indentDao.findById(indentVipList.get(i).getUidIndent());
		    		if(project != null)
		    			projectList.add(project);
		    		if(indent != null)
		    			indentList.add(indent);
		    	}
		//    	 = (List)projectDao.queryAllByAccount("201231000821");//For testing ................................
		    	//List<TestResult> testResultList = testResultDao.queryByAccount("201231000821");//For testing ................................
		    	List<Map<String, String>> resultList = new LinkedList<Map<String, String>>();
		    	for(int k = 0 ; k < indentVipList.size() ; k++ ){
		    		Map<String, String> result = new HashMap<String, String>();
		    		result.put("phsy_sum",String.valueOf(indentVipList.size()));
		    		String YMD = projectList.get(k).getTimeBegin();
		    		String year = "2015年";
		    		String month = "09月";
		    		String date = "06日";
		    		if(YMD!=null)
		    		{
		    		if(YMD.length() >= 4)
		    			year = YMD.substring(0,4)+"年";
		    		if(YMD.length() >= 6)
		    			month = YMD.substring(4,6)+"月";
		    		if(YMD.length() >= 8)
		    			date = YMD.substring(6,8)+"日";
		    		}
		    		result.put("phsy_time",year+month+date);
		    		
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
		    		
		    		String YMD2 = updateDate;
		    		String year2 = "2015年";
		    		String month2 = "09月";
		    		String date2 = "06日";
		    		if(YMD2!=null && !YMD2.equalsIgnoreCase("Unknown"))
		    		{
		    		if(YMD2.length() >= 4)
		    			year2 = YMD2.substring(0,4)+"年";
		    		if(YMD2.length() >= 6)
		    			month2 = YMD2.substring(4,6)+"月";
		    		if(YMD2.length() >= 8)
		    			date2 = YMD2.substring(6,8)+"日";
		    		}
		    		result.put("phsy_update_date",year2+month2+date2);		    		
		    		result.put("phsy_clerk","宫鸣");
		    		result.put("phys_project_uid",String.valueOf(projectList.get(k).getUidProject()));
		    		result.put("phys_status_boolean",String.valueOf(status == "已有结果"?true:false));
		    		resultList.add(result);
		    	}
		    	modelmap.addAttribute("phys_result",resultList);
	    	}else{
	    		List<Map<String, String>> resultList = new LinkedList<Map<String, String>>();
	    		modelmap.addAttribute("phys_result",resultList);
	    	}
    	}else{
    		modelmap.addAttribute("phys_result",null);
    	}
        return "/vip/vi_checkResult";
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
    	AccountClient accountClient = accountClientDao.findClientByAccount(account);
    	if(accountClient != null&& flag!=null && flag==Constant.account_client){
	    	List<TestResult> testResultList = testResultDao.queryByAccountAndProjectUid(account, project_uid);//For testing ................................
	    	if(testResultList !=null){
		    	List<Map<String, String>> reportList = new ArrayList<Map<String, String>>();
		    	for(int i = 0 ; i < testResultList.size() ; i++ ){
		    		Map<String, String> result = new HashMap<String, String>();
		    		result.put("phsy_report_id",project_uid);
		    		result.put("phsy_report_project",getPhysicalItemName(testResultList.get(i).getIdPhysicalItem()));
		    		result.put("phsy_report_result",testResultList.get(i).getResult());
		    		result.put("phsy_report_backup","无");
		    		reportList.add(result);
		    	}
		    	//generate phys doctor's recommendation
		    	String recommendation = "多喝水,早睡眠";
		    	//generate phys doctor's name
		    	String doctorName = "钟丽萍";
		    	//generate phys doctor's id
		    	String doctorId = "YG040001";
		    	//generate date
		    	//String date = "2014年11月17日";
		    	//generate phys client name
		    	String clientName = accountClient.getAccountClient();
		    	
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
        return "/vip/vi_resultDetail";
    }
    /*
     * @author devouty Date:2015/9/7
     */
    private String getPhysicalItemName(String string)
    {
    	if(string.equals("1"))
    		return "视力";
    	if(string.equals("2"))
    		return "耳、鼻、喉、口咽、鼻咽";
    	if(string.equals("3"))
    		return "听力";
    	if(string.equals("4"))
    		return "上腹（肝胆胰脾肾）+泌尿系";
    	if(string.equals("5"))
    		return "上腹（肝胆胰脾肾）+盆腔";
    	if(string.equals("6"))
    		return "白带常规检查";
    	if(string.equals("7"))
    		return "肺活量、一秒用力吐气量、血氧饱和度等";
    	if(string.equals("8"))
    		return "癌症筛查——卵巢肿瘤标记物";
    	if(string.equals("9"))
    		return "癌症筛查——前列腺肿瘤标记物";
    	if(string.equals("10"))
    		return "血液常规检查";
    	if(string.equals("11"))
    		return "头部CT检查";
    	if(string.equals("12"))
    		return "X光检查";
    	return string;
    }
}