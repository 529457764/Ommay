package com.ommay.controller;
/**
 * @author jjb 2015/8/25
 */
import javax.persistence.MappedSuperclass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ommay.entity.Account;
import com.ommay.service.BaseService;

@Controller
@RequestMapping(value="adf")
public class ADFController {
    @Autowired
    private BaseService accountService;

    public BaseService getAccountService() {
        return accountService;
    }

    public void setAccountService(BaseService accountService) {
        this.accountService = accountService;
    }
    
    /**
     * admin
     * @return
     */
    @RequestMapping(value="adminFillPersonalInfo")
    public String adminFillPersonalInfo() {
        return "/administrator/adminFillPersonalInfo";
    }
    @RequestMapping(value="adminResgiter")
    public String adminResgiter() {
        return "/administrator/adminResgiter";
    }
    @RequestMapping(value="adminUserList")
    public String adminUserList() {
        return "/administrator/adminUserList";
    }
   
   /**
    * doctor
    * @return [description]
    */
    @RequestMapping(value="doctorOperation")
    public String doctorOperation() {
        return "/doctor/doctorOperation";
    }
    @RequestMapping(value="doctorSearch")
    public String doctorSearch() {
        return "/doctor/doctorSearch";
    }
    @RequestMapping(value="d_userInfo")
    public String userInfo1() {
        return "/doctor/userInfo";
    }
    
    
    /**
     * finance
     */
    @RequestMapping(value="financeCharge")
    public String financeCharge() {
        return "/finance/financeCharge";
    }
    @RequestMapping(value="financeClient")
    public String financeClient() {
        return "/finance/financeClient";
    }
    @RequestMapping(value="financeGroup")
    public String financeGroup() {
        return "/finance/financeGroup";
    }
    @RequestMapping(value="f_userInfo")
    public String userInfo() {
        return "/finance/userInfo";
    }
    
}
