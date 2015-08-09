package com.myself.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myself.common.message.JsonResult;
import com.myself.finance.entity.User;
import com.myself.finance.page.IPage;
import com.myself.finance.param.UserQueryParam;
import com.myself.finance.service.IUserService;

@Controller
@RequestMapping("/manage/user")
public class UserManageController extends BaseController {

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
}
