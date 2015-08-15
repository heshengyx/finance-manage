package com.myself.finance.security;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import com.myself.finance.entity.Permission;
import com.myself.finance.entity.Role;
import com.myself.finance.entity.User;
import com.myself.finance.service.IPermissionService;
import com.myself.finance.service.IRoleService;
import com.myself.finance.service.IUserService;

public class SecurityRealm extends AuthorizingRealm {
	
	private final static Logger logger = LoggerFactory
			.getLogger(SecurityRealm.class);

	@Autowired
	private IUserService userService;
	
	@Autowired
	private IRoleService roleService;
	
	@Autowired
	private IPermissionService permissionService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		SimpleAuthorizationInfo simpleAuthorInfo = null;
		/*String currentUsername = (String) super
				.getAvailablePrincipal(principals);*/
		User user = (User) super
				.getAvailablePrincipal(principals);
		List<String> roleList = new ArrayList<String>();
		List<String> permissionList = new ArrayList<String>();

		//User user = userService.getByUserName(currentUsername);
		if (null != user) {
			List<Role> roles = roleService.queryRolesByUserId(user.getId());
			if (!CollectionUtils.isEmpty(roles)) {
				logger.info("用户[{}]拥有的角色", new Object[]{user.getUsername()});
				for (Role role : roles) {
					logger.info("  角色名称[{}]", new Object[]{role.getName()});
					roleList.add(role.getName());
					List<Permission> permissions = permissionService.queryPermissionsByRoleId(role.getId());
					if (!CollectionUtils.isEmpty(permissions)) {
						for (Permission permission : permissions) {
							if (!StringUtils.isEmpty(permission.getTag())) {
								logger.info("    权限名称[{}:{}]", new Object[]{permission.getTag(), permission.getUrl()});
								permissionList.add(permission.getTag());
							}
						}
					}
				}
				simpleAuthorInfo = new SimpleAuthorizationInfo();
				simpleAuthorInfo.addRoles(roleList);
				simpleAuthorInfo.addStringPermissions(permissionList);
			}
		}
		return simpleAuthorInfo;
	}


	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		AuthenticationInfo authcInfo = null;
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;

		User param = new User();
		param.setAccount(token.getUsername());
		User user = userService.getData(param);
		if (null != user) {
			authcInfo = new SimpleAuthenticationInfo(user,
					user.getPassword(), user.getAccount());
			this.setSession("currentUser", user);
		}
		return authcInfo;
	}

	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}
}
