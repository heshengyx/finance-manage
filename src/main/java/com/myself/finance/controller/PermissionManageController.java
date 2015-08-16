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
import com.myself.finance.data.PermissionTreeData;
import com.myself.finance.entity.Permission;
import com.myself.finance.page.IPage;
import com.myself.finance.param.PermissionQueryParam;
import com.myself.finance.param.RolePermissionParam;
import com.myself.finance.service.IPermissionService;

@Controller
@RequestMapping("/manage/permission")
public class PermissionManageController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(PermissionManageController.class);
	
	@Autowired
	private IPermissionService permissionService;
	
	@RequestMapping("")
	public String page() {
		return "permission";
	}
	
	@RequestMapping("/tree")
	@ResponseBody
	public Object tree(PermissionQueryParam param) {
		JsonMessage jMessage = new JsonMessage();
		List<PermissionTreeData> datas = null;
		try {
			datas = permissionService.tree(param);
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
	public Object saveTree(RolePermissionParam param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			permissionService.saveRolePermissions(param);
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
	
	@RequestMapping("/list")
	@ResponseBody
	public Object list(PermissionQueryParam param) {
		List<Permission> datas = permissionService.list(param);
		
		JsonResult<Permission> jResult = new JsonResult<Permission>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.size());
		jResult.setRecordsFiltered(datas.size());
		jResult.setData(datas);
		return jResult;
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public Object query(PermissionQueryParam param) {
		IPage<Permission> datas = permissionService.query(param);
		
		JsonResult<Permission> jResult = new JsonResult<Permission>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<Permission>)datas.getData());
		return jResult;
	}
	
	@RequestMapping("/getData")
	@ResponseBody
	public Object getData(Permission param) {
		JsonMessage jMessage = new JsonMessage();
		Permission data = null;
		try {
			data = permissionService.getData(param);
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
	public Object save(Permission param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			permissionService.save(param);
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
	public Object update(Permission param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			permissionService.update(param);
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
	public Object delete(Permission param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			permissionService.delete(param);
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
