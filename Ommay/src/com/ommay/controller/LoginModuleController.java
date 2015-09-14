package com.ommay.controller;
/**
 * 登陆模块 黄区域
 * @author  hs 2015/8/16
 */
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ommay.entity.Account;
import com.ommay.entity.AccountForm;
import com.ommay.entity.AccountGroup;
import com.ommay.entity.Project;
import com.ommay.entity.ProjectForm;
import com.ommay.entity.Suit;
import com.ommay.service.CheckModuleService;
import com.ommay.service.LoginModuleService;
import com.ommay.utils.Constant;
import com.ommay.utils.JsonUtils;
@Controller
@RequestMapping(value="/account") 
public class LoginModuleController {
    @Autowired
    private LoginModuleService loginModuleService;
    
    @Autowired
    private CheckModuleController checkModuleController;
    
    @Autowired
    private CheckModuleService checkModuleService;
    
    @Autowired
    private ProjectController projectController;
    
    /**
     * 此方法是前端点击注册用户时所跳转到的action
     * 注册前工作
     *  url输入此路径，调用此方法，注入accountForm对象，携带accountForm返回页面，进行注册form的使用
     * @param model
     * @return
     * 注册功能 Begin
     */
    @RequestMapping(value="/register")
    public String prepareRegister(Model model, HttpSession session){
        model.addAttribute(new AccountForm());
        /**
         * flag:当前登陆的帐号是管理员，或者业务员或者经理，并非是会员或其他，因为有注册权限的只有管理员，
         * 或者业务员或者经理（给别人注册）。
         */
        int flag = (Integer)session.getAttribute("flag");//当前给别人进行注册操作的是管理员，业务员或经理
        switch (flag) {
        /**
         * 根据flag返回各自角色的主页
         */
		case 5:
			//经理
			return "/manager_n/ma_register1";
		case 6:
			//业务员
			return "/salesman_n/sa_groupProject";
		case 7:
			//管理员
			return "/administrator/adminResgiter";
		}
        return "prepareRegister";
    }
    
    /**
     * 此api是前端输入了用户名后自行验证的json api
     * 注册时，检验用户是否已经存在
     * 0表示不存在，1表示存在
     * @param accountName
     * @return
     */
    @RequestMapping(value="/isAccountExist")
    @ResponseBody
    public int isAccountExist(@RequestParam String accountName){
    	int exit = -1;
    	boolean isTrue = loginModuleService.isAccountExit(accountName);
    	if (isTrue == true) {
    		//存在
			exit = 1;
		}else if (isTrue == false) {
			//不存在
			exit = 0;
		}
    	return exit;
    }
    
    /**
     * 此方法是前端填写完注册信息点击提交所跳转到的action
     * 从前端获取accountForm注册对象，后台提取用户名进行判断是否存在用户，若不存在则录入数据库，存在则无法注册
     * @param account
     * @param httpSession
     * @return "成功页面（暂时showuser）" "失败页面（返回index.jsp）" 
     * 注册功能end
     */
    @RequestMapping(value="/checkRegister")
    public String register(@ModelAttribute AccountForm accountForm, HttpSession httpSession,Model model){
    	String accountName = accountForm.getAccount();
    	Account account = new Account();
		account.setAccount(accountForm.getAccount());
		account.setPassword(accountForm.getPassword());
		account.setAccountFlag(accountForm.getAccountFlag());
//		int flag = accountForm.getAccountFlag();
		/**
		 * 获取当前登陆的角色.
		 * accountForm.getAccountFlag();为登陆的角色所注册的注册用户flag，不能作为跳转判断
		 */
		int flag = (Integer)httpSession.getAttribute("flag");
		/**
		 * 判断是否存在这个人
		 */
        boolean isTrue = loginModuleService.isAccountExit(accountName);
        httpSession.setAttribute("operateUserName", accountForm.getAccount());
        /**
         * 不存在这个人，flag为7表示当前登陆者为管理员
         */
        if(!isTrue && flag == 7){
            /**
             * 用户不存在，可以注册，存入数据库
             */
            loginModuleService.saveAccountMore(account);
            /**
             *跳转到完善个人信息，携带account参数，跳到CheckModuleController的(value="/completeMessage")
             * 
             */
            return checkModuleController.perpareCompleteMessage(model,httpSession,account);
        }
        /**
         * 当不存在此用户，并且当前登陆者为经理时
         */
        else if (!isTrue && flag == 5) {
        	loginModuleService.saveAccountMore(account);
        	/**
        	 * 跳转到完善个人信息，携带account参数，跳到CheckModuleController的(value="/completeMessage")
        	 */
			return checkModuleController.perpareCompleteMessage(model, httpSession, account);
		}
        /**
         * 当不存在此用户，并且当前登陆者为业务员时
         */
        else if(!isTrue && flag == 6){
        	loginModuleService.saveAccountMore(account);
        	/**
        	 * 跳转到完善个人信息，携带account参数，跳到CheckModuleController的(value="/completeMessage")
        	 */
			return checkModuleController.perpareCompleteMessage(model, httpSession, account);
        }
        /**
         * 此返回可忽略
         */
        return "register";//注册错误
    }
    /**
     * 登陆前工作
     * url输入此路径，调用此方法，注入account对象，携带account返回/jsp/index.jsp页面，进行登陆form的使用
     * @param model
     * @return
     * 登陆功能Begin
     */
    @RequestMapping(value="/login")
    public String prepareLogin(Model model, HttpSession session){
        model.addAttribute(new Account());
        /**
         * 初始化accountName，flag，registerFlag
         */
        session.setAttribute("accountName", null);
        session.setAttribute("flag", null);
        session.setAttribute("registerFlag", null);
        return "index";
    }
    
    /**
     * 前端传入account对象，后台提取用户名密码进行验证
     * @param account
     * @return “成功页面（暂时showuser）” “登陆失败页面（返回index.jsp）”
     * 登陆功能end
     */
    @RequestMapping(value="/checkLogin")
    public String login(@ModelAttribute Account account, HttpSession httpSession, HttpServletRequest httpReques, Model model){
        String accountName = account.getAccount();
		String password = account.getPassword();
		/**
		 * 判断数据库是否存在此用户
		 */
        boolean isTrue = loginModuleService.isAccountTrue(accountName,password);
        /**
         * 存在则判断用户名和密码是否正确
         */
        if(isTrue){
        	if(model.containsAttribute("warning")){
        		model.addAttribute("warning", 0);
        	}
            Account account2 = (Account)loginModuleService.findUserByName(accountName);
            int flag = account2.getAccountFlag();
            /**
             * 把当前登陆者的信息set进session
             */
            httpSession.setAttribute("accountName", accountName);
            httpSession.setAttribute("flag", flag);
            /**
             * 登陆结束，根据flag跳到当前登陆角色对应的主页
             */
            switch (flag) {
			case 1:
				//会员
				return "/vip/vi_index";
			case 2:
				//医生
				return "/doctor/doctorSearch";
			case 3:
				//财务
				return "/finance/financeCharge";
			case 4:
				//客户代表
				return "/representation_n/re_index";
			case 5:
				//经理
				return "/manager_n/ma_groupProject";
			case 6:
				//业务员
				return "/salesman_n/sa_groupProject";
			case 7:
				//管理员
				return "/administrator/adminUserList";
			}
        }
        /**
         * 登陆错误，返回登陆页面
         */
        model.addAttribute("warning", 1);
        return this.prepareLogin(model, httpSession);
    }
    
    /**
     * 修改账户密码，直接传参数，不用对象。
     * @return
     * 修改密码 end
     */
    @RequestMapping(value="/changePassword")
    public String  changePassword(String newPassword, HttpSession session){
    	String name = (String)session.getAttribute("accountName");
    	/**
    	 * 获取当前登陆角色的flag
    	 */
    	int flag = (Integer)session.getAttribute("flag");
    	/**
    	 * 获取当前登陆角色的account对象，不直接new account是为了防止update把null值也update进去。
    	 */
    	Account account = (Account)loginModuleService.findUserByName(name);
    	account.setPassword(newPassword);
    	/**
    	 * 更新密码
    	 */
    	loginModuleService.update(account);
    	/**
    	 * 修改密码结束后跳回当前角色的主页（要是重新登陆？）
    	 */
        switch (flag) {
//		case 1:
//			//会员
//			return "vip/vi_index";
//		case 2:
//			//医生
//			return "/doctor/doctorSearch";
//		case 3:
//			//财务
//			return "/finance/financeCharge";
//		case 4:
//			//客户代表
//			return "/representation_n/re_userCenter";
//		case 5:
//			//经理
//			return "/manager_n/ma_groupProject";
//		case 6:
//			//业务员
//			return "/salesman_n/sa_groupProject";
//		case 7:
//			//管理员
//			return "/administrator/admin";
		case 1:
			//会员
			return "/vip/vi_index";
		case 2:
			//医生
			return "redirect:/adf/doctorSearch";
		case 3:
			//财务
			return "redirect:/adf/financeCharge";
		case 4:
			//客户代表
			return "/representation_n/re_userCenter";
		case 5:
			//经理
			return "redirect:/view/ma_userCenter";
		case 6:
			//业务员
			return "redirect:/view/sa_userCenter";
		case 7:
			//管理员
			return "redirect:/adf/adminUserLis";
		}
    	return "changePassword";
    }
    
    /**
     * 新建项目入口
     * @return
     * 新建项目 Begin
     */
    @RequestMapping(value="/sa_index")
    public String getSa_index(Model model){
    	boolean exist = model.containsAttribute("handle");
    	System.out.println("model == "+exist);
    	return "/salesman_n/sa_groupProject";
    }
    /**
     * 新建项目前向前端传入projectForm对象
     * @param model
     * @return
     */
    @RequestMapping(value="/project")
    public String prepareProject(Model model){
    	model.addAttribute("projectForm",new ProjectForm());
    	return "/salesman_n/sa_newProject_merge";//跳入新建项目页面
    }
    /**
     * 新建项目
     * @param project
     * 新建项目 end
     */
    @RequestMapping(value="/newProject")
//    @ResponseBody
    public String newProject(@ModelAttribute ProjectForm projectForm, HttpSession session,Model model){
    	Project project = new Project();
    	AccountGroup accountGroup = new AccountGroup();
    	Account account = null;
    	project.setAccount(projectForm.getNameMaster());
    	project.setClientName(projectForm.getClientName());
    	project.setTimeBegin(projectForm.getTimeBegin());
    	project.setTimeEnd(projectForm.getTimeEnd());
    	project.setAddressGroup(projectForm.getAddressGroup());
    	project.setPeopleNumber(projectForm.getPeopleNumber());
    	project.setProjectBuilder((String)session.getAttribute("accountName"));
    	
    	int exist = isAccountExist(projectForm.getNameMaster());
    	if(exist == 0){
    		/**
    		 * 不存在此客户代表，返回新建项目页面
    		 */
    		return "/salesman_n/sa_newProject_merge";
    	}else if(exist == 1){
    		account = (Account) loginModuleService.findUserByName(projectForm.getNameMaster());
    		accountGroup.setAccount(account);
    		accountGroup.setAccountGroup(projectForm.getNameMaster());
    		accountGroup.setNameMaster(projectForm.getNameMaster());
    		accountGroup.setEmailGroup(projectForm.getEmailGroup());
    		accountGroup.setPhoneMaster(projectForm.getWorkingPhoneMaster());
    		accountGroup.setWorkingPhoneMaster(projectForm.getWorkingPhoneMaster());
    		loginModuleService.saveProject(project, accountGroup);
    		Suit suit = null;
    		long uidProject = -1;
    		Integer uid = checkModuleService.selectMaxId("Project",0);
    		if (uid != null) {
    			uidProject = (long)uid;
			}
    		return projectController.getAllSuit(suit, model, uidProject, session);
//    		return "/salesman_n/sa";
    	}
    	/**
    	 * 未知情况，返回新建项目
    	 */
    	return "/salesman_n/sa_newProject_merge";
    }
    
    /**
     * 查看所有用户信息（detail没做），返回json给前端，用jq接收
     * @param name
     * @return
     */
    @RequestMapping(value="/allUser/getAll")
    @ResponseBody
    public JSONObject  useGetData()
    {     
        
       List list = loginModuleService.getAllUserDetail();
       JSONObject jsonObject = new JSONObject();
       jsonObject = new JsonUtils(list).getJsonObject();
       return jsonObject;
    }
    /**
     * 以flag为条件，查找相应flag一类人的所有信息
     * @param flag
     * @return
     */
    @RequestMapping(value="/flagUser/getFlagDate")
    @ResponseBody
    public JSONObject getFlagDate(@RequestParam int flag){
    	List list = loginModuleService.getAllByFlag(flag);
    	JSONObject jsonObject = new JsonUtils(list).getJsonObject();
    	return jsonObject;
    }
    
    @RequestMapping(value="/logOff")
    public String logOff(Model model, HttpSession session){
        model.addAttribute(new Account());
        /**
         * 初始化accountName，flag，registerFlag
         */
        session.setAttribute("accountName", null);
        session.setAttribute("flag", null);
        session.setAttribute("registerFlag", null);
        
        return "index";
    }
    
    
    /**
     * old code
     */
    
    
//  /**
//  * 修改密码前给前端传入对象
//  * @param model
//  * @return
//  * 修改密码 Begin
//  */
// @RequestMapping(value="/password")
// public String preparePassword(Model model){
// 	model.addAttribute(new Account());
// 	return "";//修改密码页，前端可直接传两个参数，后台自行setAccount
// }
//  @RequestMapping(value="/changePassword")
//  public void  changePassword(@ModelAttribute Account account){
//  	loginModuleService.update(account);;
//  }
//  public void  changePassword(@RequestParam String newPassword, HttpSession session){
//	Account account = new Account();
//	account.setAccount((String)session.getAttribute("accountName"));
//	account.setPassword(newPassword);
//	account.setAccountFlag((Integer)session.getAttribute("flag"));
//	loginModuleService.update(account);
//}
}