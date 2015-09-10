package com.myself.finance.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;
import com.myself.finance.param.UserParam;
import com.myself.finance.security.CaptchaUsernamePasswordToken;
import com.myself.finance.security.IncorrectException;

@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(LoginController.class);

	@RequestMapping("")
	public String page() {
		return "login";
	}

	@RequestMapping(value = "/refer", method = RequestMethod.POST)
	@ResponseBody
	public Object login(UserParam param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			Subject subject = SecurityUtils.getSubject();
			/*
			 * UsernamePasswordToken token = new UsernamePasswordToken(
			 * user.getUsername(), user.getPassword());
			 */
			CaptchaUsernamePasswordToken token = new CaptchaUsernamePasswordToken(
					param.getUsername(), param.getPassword().toCharArray(),
					param.isRememberMe(), param.getHost(), param.getCaptcha());
			// token.setRememberMe(true);
			subject.login(token);
			logger.info("用户登录成功");
		} catch (Exception e) {
			jMessage.setCode(JsonMessage.ERROR_CODE);
			if (e instanceof AuthenticationException) {
				AuthenticationException ex = (AuthenticationException) e;
				if (ex instanceof IncorrectException) {
					jMessage.setMessage(ex.getMessage());
				} else {
					jMessage.setMessage("系统异常");
				}
			} else {
				jMessage.setMessage("系统异常");
			}
			logger.error(jMessage.getMessage(), e);
		}
		return jMessage;
	}
}
