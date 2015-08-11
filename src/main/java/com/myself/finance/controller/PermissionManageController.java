package com.myself.finance.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myself.common.message.JsonResult;
import com.myself.finance.entity.Permission;
import com.myself.finance.page.IPage;
import com.myself.finance.param.PermissionQueryParam;
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
	
	@RequestMapping("/list")
	@ResponseBody
	public Object list(PermissionQueryParam param) {
		IPage<Permission> datas = permissionService.query(param);
		
		JsonResult<Permission> jResult = new JsonResult<Permission>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<Permission>)datas.getData());
		return jResult;
	}
}
