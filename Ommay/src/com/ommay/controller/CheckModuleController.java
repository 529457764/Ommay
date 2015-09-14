package com.ommay.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ommay.entity.AccountClient;
import com.ommay.entity.AccountDoctor;
import com.ommay.entity.AccountFinance;
import com.ommay.entity.AccountForm;
import com.ommay.entity.AccountGroup;
import com.ommay.entity.AccountManager;
import com.ommay.entity.AccountMessage;
import com.ommay.entity.AccountWorker;
import com.ommay.service.CheckModuleService;
import com.ommay.utils.Constant;
import com.ommay.utils.JsonUtils;

/**
 * 查看模块
 * @author hs 2015/8/16
 *
 */
@Controller
@RequestMapping(value="/check/UserMessage") 
public class CheckModuleController {
	
	@Autowired
	private CheckModuleService checkModuleService;

	@Autowired
	private LoginModuleController loginModuleController;
	/**
	 * 查看个人信息
	 * (@RequestParam("idList[]") List<String> idList,Boolean isBatch)接收复合型参数
	 * @param flag
	 * @return
	 */
	@RequestMapping(value="/getUserMessage")
	@ResponseBody
	public JSONObject getUserMessage(HttpSession session){
		/**
		 * 获取当前登陆用户的id和flag
		 */
		String name = (String) session.getAttribute("accountName");
		int flag = (Integer)session.getAttribute("flag");
		/**
		 * 通过flag判断到底查哪个角色表，通过name（id）作为条件
		 */
		JSONObject jsonObject = checkModuleService.getUserMessage(name, flag);
		return jsonObject;
	}
	/**
	 * 此方法是loginModuleController的(value="/checkRegister")那里，注册成功之后直接跳到这里来。
	 * 完善个人信息，传入对象
	 * (1)注册成功，在loginModuleContreller的注册方法register里， return checkModuleController.perpareCompleteMessage(model,httpSession);
	 * (2)return到本方法后，把对象set进去，然后return给主页，携带完善信息的对象
	 * @param model
	 * @param session
	 * @return
	 * 完善个人信息Begin
	 */
	@RequestMapping(value="/completeMessage")
	public String perpareCompleteMessage(Model model, HttpSession session,Account account){
		/**
		 * 获取当前登陆者信息
		 * 完善信息只有注册之后马上跳入，注册功能只有业务员，管理员和经理，所以此处完善页面也只有此三人，flag为6,7,5
		 */
		int flag = (Integer)session.getAttribute("flag");
		int resigterFlag = -1;
		String name = (String)session.getAttribute("accountName");
		switch (flag) {
		case 5:
			//经理
			resigterFlag = account.getAccountFlag();
			model.addAttribute(new AccountMessage());//新建业务员，完善信息的对象
			if(resigterFlag == 6){
				session.setAttribute("registerFlag", 6);
			}
			/**
			 * 携带完善信息的公用对象AccountMessage进入完善---《业务员》---信息页面/manager_n/ma_register2
			 */
			return "/manager_n/ma_register2";
		case 6:
			//业务员
			/**
			 * ！！！！！！！！要参照case7的根据resigterFlag对当前被注册用户的flag进行分配，为了贮存当前被注册用户的flag，
			 * 到了completeMessage方法，根据resigterFlag来把accountMessage里的信息set进resigterFlag对应的acountXxx表
			 * 要合并这一块的注册会员和客户经理
			 */
		    resigterFlag = account.getAccountFlag();
			model.addAttribute(new AccountMessage());
			if(resigterFlag == 1){
				session.setAttribute("registerFlag", 1);
			}else if(resigterFlag == 4){
				session.setAttribute("registerFlag", 4);
			}
			/**
			 * 携带完善信息的公用对象AccountMessage进入完善-----《会员》------或-----《客户代表》-----信息页面/salesman_n/ma_resgister2
			 */
			return "/salesman_n/sa_register2";
		case 7:
			//管理员
			/**
			 * 从注册的那个方法中跳转得到被注册者的信息
			 */
		    resigterFlag = account.getAccountFlag();
		    model.addAttribute(new AccountMessage());
		    if (resigterFlag == 2) {
				session.setAttribute("registerFlag", 2);
				/**
				 * 应该return 对应的完善信息页面
				 */
				return "/administrator/adminFillPersonalInfo";
			}else if (resigterFlag == 3) {
				model.addAttribute(new AccountMessage());
				session.setAttribute("registerFlag", 3);
				/**
				 * 应该return 对应的完善信息页面
				 */
				return "/administrator/adminFillPersonalInfo";
			}else if (resigterFlag == 5) {
				model.addAttribute(new AccountMessage());
				session.setAttribute("registerFlag", 5);
				/**
				 * 应该return 对应的完善信息页面
				 */
				return "/administrator/adminFillPersonalInfo";
			}
		}
		/**
		 * 若flag返回其他情况则返回登陆用户的主页
		 */
//		return "perpareCompleteMessage";
		return loginModuleController.prepareRegister(model, session);
	}
	/**
	 * 完善个人信息，此方法在前端填完完善信息后，点击提交时所用的action
	 * @param obj
	 * @param session
	 * @return
	 * 完善个人信息end
	 */
	@RequestMapping(value="/complete")
	public String completeMessage(@ModelAttribute AccountMessage obj, HttpSession session,Model model){
		/**
		 * 从前端获取完善信息公用accountMessage，然后获取当前登陆的用户信息（管理员，业务员或者经理）
		 */
		int flag = (Integer)session.getAttribute("flag");
		int resigterFlag = (Integer)session.getAttribute("registerFlag");
		AccountMessage accountMessage = null;
		/**
		 * 根据当前登陆用户的flag（5,6,7）来判断，把哪些accountXxx更新表中。
		 */
		switch (flag) {
		case 5:
			//经理
			accountMessage = (AccountMessage)obj;
			AccountWorker accountWorker = (AccountWorker)checkModuleService.findUserByName(accountMessage.getName(), "account", Constant.TABLE_ACCOUNT_WORKER);
			accountWorker.setEmailWorker(accountMessage.getEmail());
			accountWorker.setPhoneWorker(accountMessage.getIphone());
			checkModuleService.update(accountWorker);
			/**
			 * 经理完善了业务员信息之后，返回主页
			 */
//			session.setAttribute("operateUserName", accountMessage.getName());
			return "redirect:/view/ma_groupProject";
		case 6:
			//业务员
			/**
			 * 根据resigterFlag来获取当前完善的是谁的信息
			 */
			if (resigterFlag == 1) {
		    	if(obj != null){
		    	accountMessage = (AccountMessage)obj;
		    	String emailString = accountMessage.getEmail();
				AccountClient accountClient = (AccountClient)checkModuleService.findUserByName(accountMessage.getName(), "account", Constant.TABLE_ACCOUNT_CLIENT);
				accountClient.setEmailClient(accountMessage.getEmail());
				accountClient.setPhoneClient(accountMessage.getIphone());
				checkModuleService.update(accountClient);
		    	}
			}else if (resigterFlag == 4) {
		    	if(obj != null){
		    	accountMessage = (AccountMessage)obj;
				AccountGroup accountGroup = (AccountGroup)checkModuleService.findUserByName(accountMessage.getName(), "account", Constant.TABLE_ACCOUNT_GROUP);
				System.out.println("accountMessage company ========" +accountMessage.getCompany() );
				accountGroup.setNameMaster(accountMessage.getName()+"-"+accountMessage.getCompany());
				accountGroup.setEmailGroup(accountMessage.getEmail());
				accountGroup.setPhoneMaster(accountMessage.getIphone());
				checkModuleService.update(accountGroup);
		    	}
			}
			/**
			 * 业务员完善了业务员或者客户代表信息之后，返回主页
			 */
			return "redirect:/view/sa_groupProject";
		case 7:
			//管理员
		    if (resigterFlag == 2) {
		    	if(obj != null){
		    	accountMessage = (AccountMessage)obj;
				AccountDoctor accountDoctor = (AccountDoctor)checkModuleService.findUserByName(accountMessage.getName(), "account", Constant.TABLE_ACCOUNT_DOCTOR);
				accountDoctor.setEmailDoctor(accountMessage.getEmail());
				accountDoctor.setPhoneDoctor(accountMessage.getIphone());
				checkModuleService.update(accountDoctor);
		    	}
				return "redirect:/adf/adminUserList";
			}else if (resigterFlag == 3) {
				accountMessage = (AccountMessage)obj;
				AccountFinance accountFinance = (AccountFinance)checkModuleService.findUserByName(accountMessage.getName(), "account", Constant.TABLE_ACCOUNT_FINANCE);
				accountFinance.setEmailFinance(accountMessage.getEmail());
				accountFinance.setPhoneFinance(accountMessage.getIphone());
				checkModuleService.update(accountFinance);
				return "redirect:/adf/adminUserList";
			}else if (resigterFlag == 5) {
//				model.addAttribute(new Account());
				accountMessage = (AccountMessage)obj;
				AccountManager accountManager = (AccountManager)checkModuleService.findUserByName(accountMessage.getName(), "account", Constant.TABLE_ACCOUNT_MANAGER);
				accountManager.setEmailManager(accountMessage.getEmail());
				accountManager.setPhoneManager(accountMessage.getIphone());
				checkModuleService.update(accountManager);
				return "redirect:/adf/adminUserList";
			}
		}
		/**
		 * 若flag返回其他情况则返回登陆用户的主页
		 */
		return loginModuleController.prepareRegister(model, session);
	}
	/**
	 * 当前端请求修改个人信息时，输入信息后，点击提交后，跳转到此方法action
	 * 修改自己个人信息
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/updateUserMessage")
	public String  updateUserMessage(String iphone, String officePhone, String email ,
			HttpSession session){
    	int flag = (Integer)session.getAttribute("flag");
		String name = (String) session.getAttribute("accountName");
		Map<String, String> map = new HashMap<String, String>();
		map.put("iphone", iphone);
		map.put("officePhone", officePhone);
		map.put("email", email);
		boolean update = checkModuleService.updateUserMessage(name, flag, map);
		/**
		 * 根据当前登陆的用户，修改了自己信息后跳回自己角色的主页
		 */
        switch (flag) {
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
			return "redirect:/adf/adminUserList";
		}
		return "updateUserMessage";//返回一个标志给前端作为前端跳转（这个不是自己页面跳转）
	}
	
	/**
	 * 分页操作
	 * @return
	 */
	@RequestMapping(value="/getLimitData")
	@ResponseBody
	public JSONObject getLimitData(){
//	       List<AccountClient> list = checkModuleService.getAll(Constant.TABLE_ACCOUNT_CLIENT);
   		   List list = checkModuleService.queryLimit(Constant.TABLE_ACCOUNT, 0,8);
	       JSONObject jsonObject = new JSONObject();
	       jsonObject = new JsonUtils(list).getJsonObject();
	       return jsonObject;
	}
	
//    @RequestMapping(value="/logOff")
//    public String logOff(Model model, HttpSession session){
//        model.addAttribute(new Account());
//        /**
//         * 初始化accountName，flag，registerFlag
//         */
//        session.setAttribute("accountName", null);
//        session.setAttribute("flag", null);
//        session.setAttribute("registerFlag", null);
//        
//        return "index";
//    }
//	
	
	
	/**
	 * old code
	 */
	
	
	
//	/**
//	 * 
//	 * 进入个人中心页面
//	 */
//    @RequestMapping(value="/myMessage")
//    public String myMessage(HttpSession session){
//    	int flag = (Integer)session.getAttribute("flag");
//        switch (flag) {
//		case 1:
//			//会员
//			return "";
//		case 2:
//			//医生
//			return "/doctor/doctor";
//		case 3:
//			//财务
//			return "/finance/finance";
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
//		}
//    
//        return "myMessage";
//    }
//	/**
//	 * 把查看体检结果对象传给前端
//	 * @param int uid_indent
//	 * @return
//	 * 查看体检结果
//	 */
//	@RequestMapping(value="/checkResult")
//	@ResponseBody
//	public JSONObject getUserResult(@RequestParam int uid_indent){
//		  /**
//		   * 通过uid_indent向order_detail表查询，获取多个uid_order_detail
//		   */
//		List list = checkModuleService.findById("OrderDetail", "uid_indent", uid_indent);
//		JSONObject jsonObject = new JSONObject();
//		jsonObject = new JsonUtils(list).getJsonObject();
//		return jsonObject;
//	}
}
