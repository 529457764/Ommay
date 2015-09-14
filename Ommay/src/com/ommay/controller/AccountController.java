package com.ommay.controller;
/**
 * @author  hs 2015/8/16
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ommay.dao.LoginModuleDao;
import com.ommay.entity.Account;
import com.ommay.service.BaseService;
import com.ommay.utils.Constant;
import com.ommay.utils.JsonUtils;

@Controller
@RequestMapping("/accident/data") 
public class AccountController {
	
	@Autowired
	private BaseService accountService;
	/**
	 * 开始页面http://localhost:8080/SpringMVC3/save_action,返回/jsp/accidentInsert.jsp页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login")
	public String login(Model model){
//		model.addAttribute(new Account());
		return "admin";
	}
	
	/**
	 * 从controller调用service
	 * 
	 */
	
	@RequestMapping(value="/operation")
	public String useSaveService(@ModelAttribute Account account) {
//		accountService.save(account);
		String accountName = account.getAccount();
		if (!(accountService.findUserByName(accountName)).equals(null)) {
			return "showUser";
		}else{
			return "accidentInsert";
		}
		
	}
	
	/**
	 * 返回json给前端，用jq接收
	 * @param name
	 * @return
	 */
	@RequestMapping(value="/accident_get_data")
    @ResponseBody
    public JSONObject  useGetData()
    {     
	   List list = accountService.getAll(Constant.TABLE_ACCOUNT_CLIENT);
	   JSONArray jsonArray = new JSONArray();
	   JSONObject jsonObject = new JSONObject();
//	   jsonObject = new JsonUtils().getJsonObject(list);
       return jsonObject;
    }
	
	
	
}
