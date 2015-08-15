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
import com.myself.finance.data.RoleTreeData;
import com.myself.finance.entity.Role;
import com.myself.finance.page.IPage;
import com.myself.finance.param.RoleQueryParam;
import com.myself.finance.param.UserRoleParam;
import com.myself.finance.service.IRoleService;

@Controller
@RequestMapping("/manage/role")
public class RoleManageController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(RoleManageController.class);
	
	@Autowired
	private IRoleService roleService;
	
	@RequestMapping("")
	public String page() {
		return "role";
	}
	
	@RequestMapping("/tree")
	@ResponseBody
	public Object tree(RoleQueryParam param) {
		JsonMessage jMessage = new JsonMessage();
		List<RoleTreeData> datas = null;
		try {
			datas = roleService.tree(param);
			jMessage.setData(datas);
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
	
	@RequestMapping("/saveTree")
	@ResponseBody
	public Object saveTree(UserRoleParam param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			roleService.saveUserRoles(param);
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
	
	@RequestMapping("/query")
	@ResponseBody
	public Object query(RoleQueryParam param) {
		IPage<Role> datas = roleService.query(param);
		
		JsonResult<Role> jResult = new JsonResult<Role>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<Role>)datas.getData());
		return jResult;
	}
	
	@RequestMapping("/getData")
	@ResponseBody
	public Object getData(Role param) {
		JsonMessage jMessage = new JsonMessage();
		Role data = null;
		try {
			data = roleService.getData(param);
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
	
	@RequestMapping("/save")
	@ResponseBody
	public Object save(Role param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			roleService.save(param);
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
	public Object update(Role param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			roleService.update(param);
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
	public Object delete(Role param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			roleService.delete(param);
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
