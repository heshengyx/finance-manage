package com.myself.finance.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;
import com.myself.finance.entity.User;
import com.myself.finance.page.IPage;
import com.myself.finance.param.UserQueryParam;
import com.myself.finance.service.IUserService;

@Controller
@RequestMapping("/manage/user")
public class UserManageController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(UserManageController.class);
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping("")
	public String page() {
		return "user";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Object list(UserQueryParam param) {
		IPage<User> datas = userService.query(param);
		
		JsonResult<User> jResult = new JsonResult<User>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<User>)datas.getData());
		return jResult;
	}
	
	@RequestMapping("/getData")
	@ResponseBody
	public Object getData(User param) {
		JsonMessage jMessage = new JsonMessage();
		User data = null;
		try {
			data = userService.getData(param);
			jMessage.setData(data);
		} catch (Exception e) {
			jMessage.setCode(JsonMessage.ERROR_CODE);
			if (e instanceof ServiceException) {
				jMessage.setMessage(e.getMessage());
			} else {
				jMessage.setMessage("系统异常");
			}
			logger.error(jMessage.getMessage(), e);
		}
		return jMessage;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Object update(User param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			userService.update(param);
		} catch (Exception e) {
			jMessage.setCode(JsonMessage.ERROR_CODE);
			if (e instanceof ServiceException) {
				jMessage.setMessage(e.getMessage());
			} else {
				jMessage.setMessage("系统异常");
			}
			logger.error(jMessage.getMessage(), e);
		}
		return jMessage;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(User param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			userService.delete(param);
		} catch (Exception e) {
			jMessage.setCode(JsonMessage.ERROR_CODE);
			if (e instanceof ServiceException) {
				jMessage.setMessage(e.getMessage());
			} else {
				jMessage.setMessage("系统异常");
			}
			logger.error(jMessage.getMessage(), e);
		}
		return jMessage;
	}
}
