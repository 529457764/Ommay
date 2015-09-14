package com.ommay.controller;

/**
 * Finance Module
 * @author  Doson 
 * Copyright (JAVA) 2015 dosonleung. All rights reserved.
 */

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.TimeUtil;
import com.ommay.dao.AccountClientDao;
import com.ommay.dao.IndentDao;
import com.ommay.dao.IndentGroupDao;
import com.ommay.dao.IndentVipDao;
import com.ommay.entity.AccountFinance;
import com.ommay.entity.Indent;
import com.ommay.entity.IndentGroup;
import com.ommay.entity.IndentVip;
import com.ommay.service.AppointmentService;
import com.ommay.utils.Constant;
import com.ommay.utils.TimeUtils;

@Controller
@RequestMapping("/finance") 
public class FinanceController {
	
	@Autowired
    private IndentVipDao indentVipDao;
	@Autowired
    private IndentGroupDao indentGroupDao;
	@Autowired
    private IndentDao indentDao;
	@Autowired
	private AppointmentService appointmentService;
	@Autowired
	private AccountClientDao accountClientDao;
	
	FinanceController(){
		super();
	}
	
	@RequestMapping(value="")
    public String index(Model modelMap,HttpSession httpSession,HttpServletResponse response){
		String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountFinance accountFinance = accountClientDao.findFinanceByAccount(account);//For testing ...................................
    	if(accountFinance != null&& flag!=null && flag==Constant.account_finance){
    		return "finance/financeCharge";
    	}else{
    		modelMap.addAttribute("unlogin", false);
    		return "finance/financeCharge";
    	}
    }
	
	@RequestMapping(value="OmmayPay",method=RequestMethod.GET)
    public String ommayPay(Model modelMap,@RequestParam String id){
    	IndentVip indentVip = indentVipDao.findById(id);
    	IndentGroup indentGroup;
    	if(indentVip == null){
    		indentGroup = indentGroupDao.findById(id);
    			if(indentGroup == null){
    				modelMap.addAttribute("resultItem", "not found");
    			}else{
    				modelMap.addAttribute("resultItem", "finance/appointment?indentOwnerId="+indentGroup.getUidIndent()+"&type=1");
    			}
    		}else{
    			modelMap.addAttribute("resultItem", "finance/appointment?indentOwnerId="+indentVip.getUidIndent()+"&type=0");
    		}
		return "finance/financeCharge";
    }
	
	@RequestMapping(value="appointment",method=RequestMethod.GET)
    public String retrieveLatestAppointment(Model modelMap,@RequestParam String indentOwnerId,String type){
		if(type.equalsIgnoreCase("1")){
			modelMap.addAttribute("phys_indent", indentOwnerId);//physical items
			modelMap.addAttribute("1", appointmentService.getGroupAppointment(indentOwnerId));
		}else{
			modelMap.addAttribute("phys_indent", indentOwnerId);
			modelMap.addAttribute("0", appointmentService.getVipAppointment(indentOwnerId));
		}
    	return "finance/financeCharge";
    }
	
	@RequestMapping(value="groupAppointment")
    public String getGroupAppointments(Model modelMap,HttpSession httpSession){
		String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountFinance accountFinance = accountClientDao.findFinanceByAccount(account);//For testing ...................................
    	if(accountFinance != null&& flag!=null && flag==Constant.account_finance){
    		List<HashMap> groupAppointmentsList = appointmentService.getAllGroupAppointments();
        	modelMap.addAttribute("groupAppointmentsList", groupAppointmentsList);
        	return "finance/financeGroup";
    	}else{
    		modelMap.addAttribute("unlogin", false);
    		return "finance/financeCharge";
    	}		
    }
	
	@RequestMapping(value="vipAppointment")
    public String getVipAppointments(Model modelMap,HttpSession httpSession){
		String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountFinance accountFinance = accountClientDao.findFinanceByAccount(account);//For testing ...................................
    	if(accountFinance != null&& flag!=null && flag==Constant.account_finance){
    		List<HashMap> vipAppointmentsList = appointmentService.getAllVipsAppointments();
        	modelMap.addAttribute("vipAppointmentsList", vipAppointmentsList);
        	return "finance/financeClient";
    	}else{
    		modelMap.addAttribute("unlogin", false);
    		return "finance/financeCharge";
    	}			
    }
	
	@RequestMapping(value="OmmayPaid",method=RequestMethod.GET)
    public String setPay(Model modelMap,HttpSession httpSession,@RequestParam String indent_id){
		String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountFinance accountFinance = accountClientDao.findFinanceByAccount(account);//For testing ...................................
    	if(accountFinance != null&& flag!=null && flag==Constant.account_finance){
    		Indent indent = indentDao.findById(Integer.parseInt(indent_id));
    		if(indent != null){
    			indent.setIsPaid(true);
    			indent.setIsPaidDate(TimeUtils.getNowDate());
    			indent.setIsPaidOperator((String) httpSession.getAttribute("accountName"));
    			indentDao.update(indent);
    		}
    		modelMap.addAttribute("update",true);
        	return "finance/financeCharge";
    	}else{
    		modelMap.addAttribute("unlogin", false);
    		return "finance/financeCharge";
    	}			
    }
	
	@RequestMapping(value="frob")
	@ResponseBody
    public String test(){
		String id = TimeUtils.getNowDateAndTime();
		String frob = "{\"code\":\"0\",\"msg\":\"ok\",\"data\":{\"frob_list\":[{\"frob_id\":\""+id+"\",\"uid\":\""+id+"\",\"departure_id\":\"departureid\",\"departurename\":\"deaprturename\",\"destination_id\":\"destinationid\",\"destination_name\":\"destinationname\",\"photo\":\"http://cdn.theatlantic.com/static/mt/assets/business/Screen%20Shot%202012-05-15%20at%2010.39.43%20AM.png\",\"depart_time\":\"departuretime\",\"comeback_time\":\"comebacktime\",\"add_time\":\"posttime\"}]}}";;			
		return frob;
	}
	
	@RequestMapping(value="paid")
    public String paid(Model modelMap,HttpSession httpSession,@RequestParam int uid_indent){
		String account = (String) httpSession.getAttribute("accountName");
    	Integer flag = (Integer) httpSession.getAttribute("flag");
    	AccountFinance accountFinance = accountClientDao.findFinanceByAccount(account);//For testing ...................................
    	if(accountFinance != null&& flag!=null && flag==Constant.account_finance){
    		Indent indent = indentDao.findById(uid_indent);
    		if(indent!=null){
    			indent.setIsPaid(true);
    			indent.setIsPaidDate(TimeUtils.getNowDate());
    			indent.setIsPaidOperator(account);
    			indentDao.update(indent);
    		}
    		List<HashMap> vipAppointmentsList = appointmentService.getAllVipsAppointments();
        	modelMap.addAttribute("vipAppointmentsList", vipAppointmentsList);
        	return "finance/financeClient";
    	}else{
    		modelMap.addAttribute("unlogin", false);
    		return "finance/financeCharge";
    	}			
    }
	
	
/*
 * <!--  2.团体体检订单 -->
    <div id="group-indent">
        <table class="table table-bordered" id="physical-package">
            <thead>
                <tr>
                    <th width="5%">序号</th>
                    <th width="10%">预约号</th>
                    <th width="10%">项目编号</th>
                    <th width="20%">预约名称</th>
                    <th width="15%">预约时间</th>
                    <th width="10%">客户代表</th>
                    <th width="10%">业务员</th>
                    <th width="10%">预约状态</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>11</td>
                    <td>2222</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!--      end      -->


    <!-- 3.个人体检订单 -->
    <div class="show-client" id="personal-indent" >
        <table class="table table-bordered" id="physical-package">
            <thead>
                <tr>
                    <th width="5%">序号</th>
                    <th width="10%">预约号</th>
                    <th width="10%">会员编号</th>
                    <th width="20%">预约名称</th>
                    <th width="15%">预约时间</th>
                    <th width="10%">会员姓名</th>
                    <th width="5%">性别</th>
                    <th width="10%">业务员</th>
                    <th width="10%">预约状态</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>11</td>
                    <td>2222</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!--    end   -->
 */
	
	
}
