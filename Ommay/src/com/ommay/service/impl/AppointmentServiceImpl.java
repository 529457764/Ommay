package com.ommay.service.impl;
/**
 * @author Doson 
 * Copyright (JAVA) 2015 dosonleung. All rights reserved.
 */
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ommay.dao.AccountClientDao;
import com.ommay.dao.AccountGroupDao;
import com.ommay.dao.IndentDao;
import com.ommay.dao.IndentGroupDao;
import com.ommay.dao.IndentVipDao;
import com.ommay.dao.OrderDetailDao;
import com.ommay.dao.PhysicalItemDao;
import com.ommay.dao.ProjectDao;
import com.ommay.dao.ProjectDetailDao;
import com.ommay.dao.TestResultDao;
import com.ommay.entity.AccountClient;
import com.ommay.entity.AccountGroup;
import com.ommay.entity.Indent;
import com.ommay.entity.IndentGroup;
import com.ommay.entity.IndentVip;
import com.ommay.entity.OrderDetail;
import com.ommay.entity.PhysicalItem;
import com.ommay.entity.Project;
import com.ommay.entity.ProjectDetail;
import com.ommay.entity.TestResult;
import com.ommay.service.AppointmentService;
import com.ommay.utils.Constant;

@Service
public class AppointmentServiceImpl implements AppointmentService {
    
	@Autowired
    private IndentDao indentDao;
    @Autowired
    private IndentGroupDao indentGroupDao;
    @Autowired
    private IndentVipDao indentVipDao;
    @Autowired
    private OrderDetailDao orderDetailDao; 
    @Autowired
    private ProjectDao projectDao;
    @Autowired
    private ProjectDetailDao projectDetailDao;
    @Autowired
    private AccountClientDao accountClientDao;
    @Autowired
    private TestResultDao testResultDao;
    @Autowired
    private PhysicalItemDao physicalItemDao;
    @Autowired
    private AccountGroupDao accountGroupDao;
    
	public IndentDao getIndentDao() {
		return indentDao;
	}

	public void setIndentDao(IndentDao indentDao) {
		this.indentDao = indentDao;
	}

	public IndentGroupDao getIndentGroupDao() {
		return indentGroupDao;
	}

	public void setIndentGroupDao(IndentGroupDao indentGroupDao) {
		this.indentGroupDao = indentGroupDao;
	}

	public OrderDetailDao getOrderDetailDao() {
		return orderDetailDao;
	}

	public void setOrderDetailDao(OrderDetailDao orderDetailDao) {
		this.orderDetailDao = orderDetailDao;
	}

	@Override
	public Object findVipById(String vid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean saveVip(Object vip) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateVip(Object vip) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteVip(String vid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<HashMap<String, Object>> getAllGroupAppointments(){
		List<IndentGroup> indentsGroupList = new LinkedList<IndentGroup>();
		
		List<Integer> indentsIdList;//save indent 
		List<Integer> projectIdList;//save project id
		List<String> accountGroupIdList;//save group name
		
		List<Indent> indentsList;
		List<Project> projectList;//save project
		List<HashMap<String,Object>> GroupAppointmentsList;
		
		indentsGroupList = indentGroupDao.queryAll();
		if(indentsGroupList != null){
			
			int size = indentsGroupList.size();
			indentsIdList = new ArrayList<Integer>(size);
			projectIdList = new ArrayList<Integer>(size);
			
			indentsList = new ArrayList<Indent>(size);
			projectList = new ArrayList<Project>(size);
			GroupAppointmentsList = new ArrayList<HashMap<String,Object>>(size);
			
			//retrieve indentGroup to indentgroupList
			for(int i = 0 ; i < size ; i++){
				IndentGroup indentGroup = (IndentGroup)indentsGroupList.get(i);
				indentsIdList.add(indentGroup.getUidIndent());
				projectIdList.add(indentGroup.getUidProject());//May be contained serveral identical projectUid
			}
			
			//retrieve all project included in indentGroup to projectlist
			for(int j = 0 ; j < size ; j++){
				Project project = projectDao.getSingleProjectById(projectIdList.get(j));
				if(project == null)
					project = new Project();
				projectList.add(project);//ok
			}
			
			//retrieve all indents included in indentGroup to indentsList
			for(int z = 0 ; z < size ; z++){
				Indent indent = new Indent();
				int indentId = indentsIdList.get(z);
				
				Boolean isPaid = indentDao.findColumnByIdWithBoolean("is_paid", indentId);
				Boolean finishIndent = indentDao.findColumnByIdWithBoolean("finish_indent", indentId);
				Boolean hasResult = indentDao.findColumnByIdWithBoolean("has_result", indentId);
				
				indent.setUidIndent(indentId);
				indent.setIsPaid(isPaid);
				indent.setFinishIndent(finishIndent);
				indent.setHasResult(hasResult);
				indentsList.add(indent);//null
			}
			
			for(int k = 0;k < size; k++){
				HashMap<String,Object> map = new HashMap<String, Object>();
				map.put("appointmentId", (indentsList.get(k)).getUidIndent()!=null?(indentsList.get(k)).getUidIndent():-1);//Long
				map.put("projectId",projectIdList.get(k)!=null?projectIdList.get(k):-1);//Long
				map.put("projectName",(indentsGroupList.get(k)).getIndentGroupName()!=null?(indentsGroupList.get(k)).getIndentGroupName():"Unknown");//String
				
				map.put("appointmentTime", (projectList.get(k)).getTimeBegin()!=null?(projectList.get(k)).getTimeBegin():"Unknown");//String
				map.put("appointmentClinet", (projectList.get(k)).getClientName()!=null?(projectList.get(k)).getClientName():"Unknown");//String
				map.put("appointmentSalsemen", (projectList.get(k)).getProjectBuilder()!=null?(projectList.get(k)).getProjectBuilder():"Unknown");//String
				
				Boolean isPaid = (indentsList.get(k)).getIsPaid();
				Boolean finishIndent = (indentsList.get(k)).getFinishIndent();
				Boolean hasResult = (indentsList.get(k)).getHasResult();
				
				String status;
				if(hasResult != null && finishIndent!= null && isPaid != null)
					status = hasResult?"已有结果":finishIndent?"已预约":isPaid?"已付款":"没付款"; 
				else
					status = "Unknown";
				
				map.put("appointmentStatus",status);//String			
				GroupAppointmentsList.add(map);
			}
			
			return GroupAppointmentsList;
		}else{
			return null;
		}
	}

	@Override
	public boolean saveGroup(Object group) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateGroup(Object group) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteGroup(String gid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<HashMap<String, Object>> getAllVipsAppointments() {
		List<IndentVip> indentsVipList = new LinkedList<IndentVip>();
		
		List<Integer> indentsIdList;//save indent 
		List<Integer> projectIdList;//save project id
		
		List<Indent> indentsList;
		List<Project> projectList;//save project
		List<HashMap<String,Object>> vipAppointmentsList;
		
		indentsVipList = indentVipDao.queryAll();
		if(indentsVipList != null){
			
			int size = indentsVipList.size();
			indentsIdList = new ArrayList<Integer>(size);
			projectIdList = new ArrayList<Integer>(size);
			
			indentsList = new ArrayList<Indent>(size);
			projectList = new ArrayList<Project>(size);
			vipAppointmentsList = new ArrayList<HashMap<String,Object>>(size);
			
			//retrieve indentGroup to indentgroupList
			for(int i = 0 ; i < size ; i++){
				IndentVip indentVip = (IndentVip)indentsVipList.get(i);
				indentsIdList.add(indentVip.getUidIndent());
				projectIdList.add(indentVip.getUidProject());//May be contained serveral identical projectUid
			}
			
			//retrieve all project included in indentGroup to projectlist
			for(int j = 0 ; j < size ; j++){
				Project project = projectDao.getSingleProjectById(projectIdList.get(j)==null?0:projectIdList.get(j));
				if(project == null)
					project = new Project();
				projectList.add(project);//ok
			}
			
			//retrieve all indents included in indentGroup to indentsList
			for(int z = 0 ; z < size ; z++){
				Indent indent = new Indent();
				int indentId = indentsIdList.get(z);
				
				Boolean isPaid = indentDao.findColumnByIdWithBoolean("is_paid", indentId);
				Boolean finishIndent = indentDao.findColumnByIdWithBoolean("finish_indent", indentId);
				Boolean hasResult = indentDao.findColumnByIdWithBoolean("has_result", indentId);
				
				indent.setUidIndent(indentId);
				indent.setIsPaid(isPaid);
				indent.setFinishIndent(finishIndent);
				indent.setHasResult(hasResult);
				indentsList.add(indent);//null
			}
			
			for(int k = 0;k < size; k++){
				HashMap<String,Object> map = new HashMap<String, Object>();
				map.put("appointmentId", (indentsList.get(k)).getUidIndent()!=null?(indentsList.get(k)).getUidIndent():-1);//Long
				map.put("projectId",projectIdList.get(k)!=null?projectIdList.get(k):-1);//Long
				map.put("projectName",(indentsVipList.get(k)).getIndentVipName()!=null?(indentsVipList.get(k)).getIndentVipName():"Unknown");//String
				
				map.put("appointmentTime", (projectList.get(k)).getTimeBegin()!=null?(projectList.get(k)).getTimeBegin():"Unknown");//String
				map.put("appointmentClinet", (projectList.get(k)).getClientName()!=null?(projectList.get(k)).getClientName():"Unknown");//String
				map.put("appointmentGender", (indentsVipList.get(k)).getIndentVipSex()!=null?(indentsVipList.get(k)).getIndentVipSex():"Unknown");//String
				map.put("appointmentSalsemen", (projectList.get(k)).getProjectBuilder()!=null?(projectList.get(k)).getProjectBuilder():"Unknown");//String
				
				Boolean isPaid = (indentsList.get(k)).getIsPaid();
				Boolean finishIndent = (indentsList.get(k)).getFinishIndent();
				Boolean hasResult = (indentsList.get(k)).getHasResult();
				
				String status;
				if(hasResult != null && finishIndent!= null && isPaid != null)
					status = hasResult?"已有结果":finishIndent?"已预约":isPaid?"已付款":"没付款"; 
				else
					status = "Unknown";
				
				map.put("appointmentStatus",status);//String			
				vipAppointmentsList.add(map);
			}
			
			return vipAppointmentsList;
		}else{
			return null;
		}
	}

	@Override
	public HashMap<String, Object> getGroupAppointment(String indentGroupId) {
		HashMap<String, Object> modelmap = new HashMap<String, Object>();
    	if(indentGroupId!=null){
	    	IndentGroup indentGroup = (IndentGroup)indentGroupDao.findById(indentGroupId);//First retrieve all indentVips of the owner 
	    	List<IndentGroup> IndentGroupList = (List)indentVipDao.findByAccount(String.valueOf(indentGroup.getUidIndentGroup()));
	    	if(indentGroup!=null){
		    	Indent indent;
		    	Project project;
		    	Integer uidProject = indentGroup.getUidProject();
		    	project = projectDao.getSingleProjectById(uidProject);
		    	indent = (Indent)indentDao.findById(indentGroup.getUidIndent());
		    	HashMap<String, Object> result = new HashMap<String, Object>();		    	
		    		
		    	String status;
		    	String updateDate;
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
			    
			    int i;
			    for(i = 0  ; i < IndentGroupList.size() ; i++){
			    	if(indentGroup.getUidIndentGroup() == IndentGroupList.get(i).getUidIndentGroup())
			    		break;
			    }
			    
			    List<ProjectDetail> projectDetailList = new LinkedList<ProjectDetail>();
			    projectDetailList = projectDetailDao.queryAllByProjectId(project.getUidProject());
			    result.put("phsy_account",indentGroup.getUidProject());
			    result.put("phsy_com",indentGroup.getIndentGroupName());
			    result.put("phsy_name",project.getClientName());
			    result.put("phsy_people_sum",project.getPeopleNumber());//sum of physical people
			    result.put("phsy_sum",i);
			    result.put("phsy_time_start",project.getTimeBegin()); //physical examination start
			    result.put("phsy_time_end",project.getTimeEnd()); //physical examination finished
			    result.put("phys_appointment_id", String.valueOf(indent.getUidIndent()));//physical appointment id
		    	result.put("phsy_status",status);//physical status
		    	result.put("phsy_update_date",updateDate);//physical status date
		    	result.put("phys_manager", project.getContractReviewMaster());//physical operator
		    	result.put("phys_total", indent.getMoneyIndent());//physical total
		    	result.put("phys_items", projectDetailList);//physical items
		    	result.put("phys_ispaid",indent.getIsPaid());
		    	
		    	modelmap.put("phys_result",result);
	    	}else{
	    		Map<String, Object> result = new HashMap<String, Object>();
	    		modelmap.put("phys_result",result);
	    	}
    	}else{
    		modelmap.put("phys_result",null);
    	}
    	return modelmap;
	}

	@Override
	public HashMap<String, Object> getVipAppointment(String indentVipId) {
		HashMap<String, Object> modelmap = new HashMap<String, Object>();
    	if(indentVipId!=null){
    		
    		IndentVip indentVip = (IndentVip)indentVipDao.findById(indentVipId);//First retrieve all indentVips of the owner 
    		List<IndentVip> IndentVipList = (List)indentVipDao.findByAccount(indentVip.getAccountClientIndent());
	    	if(indentVip!=null){
		    	Indent indent;
		    	Project project;
		    	Integer uidProject = indentVip.getUidProject();
		    	project = projectDao.getSingleProjectById(uidProject);
		    	indent = (Indent)indentDao.findById(indentVip.getUidIndent());
		    	HashMap<String, Object> result = new HashMap<String, Object>();		    	
		    		
		    	String status;
		    	String updateDate;
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
			    
			    List<OrderDetail> orderDetailsList = orderDetailDao.findByIndentUid(String.valueOf(indent.getUidIndent()));
			    List<TestResult> testResultList = new LinkedList<TestResult>();
			    List<PhysicalItem> physicalItemList = new LinkedList<PhysicalItem>();
			    for(int i = 0 ; i < orderDetailsList.size(); i++){
			    	TestResult testResult = testResultDao.findByOrderDetailId(orderDetailsList.get(i).getUidOrderDetail());
			    	if(testResult!=null){
			    		testResultList.add(testResult);
			    		PhysicalItem physicalItem = physicalItemDao.getById(testResult.getIdPhysicalItem());
			    		physicalItemList.add(physicalItem);
			    	}
			    }
			    
			    int i;
			    for(i = 0  ; i < IndentVipList.size() ; i++){
			    	if(indentVip.getUidIndentVip() == IndentVipList.get(i).getUidIndentVip())
			    		break;
			    }
			    
			    result.put("phsy_account",indentVip.getAccountClientIndent());
			    result.put("phsy_name",indentVip.getIndentVipName());
			    result.put("phsy_sum",i);//sum of physical examination times
			    result.put("phsy_time_start",project.getTimeBegin()); //physical examination start
			    result.put("phsy_time_end",project.getTimeEnd()); //physical examination finished
			    result.put("phys_appointment_id", String.valueOf(indent.getUidIndent()));//physical appointment id
		    	result.put("phsy_status",status);//physical status
		    	result.put("phsy_update_date",updateDate);//physical status date
		    	result.put("phys_operator", "宫鸣");//physical operator
		    	result.put("phys_total", indent.getMoneyIndent());//physical total
		    	result.put("phys_items", physicalItemList);//physical items
		    	result.put("phys_indent", indentVip.getUidIndent());//physical items
		    	result.put("phys_ispaid",indent.getIsPaid());
		    	modelmap.put("phys_result",result);
	    	}else{
	    		Map<String, Object> result = new HashMap<String, Object>();
	    		modelmap.put("phys_result",result);
	    	}
    	}else{
    		modelmap.put("phys_result",null);
    	}
    	return modelmap;
	}
		
	
    
}