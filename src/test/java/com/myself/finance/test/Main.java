package com.myself.finance.test;

import java.net.MalformedURLException;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.myself.finance.entity.User;
import com.myself.finance.service.IPermissionService;
import com.myself.finance.service.IUserService;

public class Main {

	/**
	 * @param args
	 * @throws MalformedURLException 
	 */
	public static void main(String[] args) throws MalformedURLException {
//		 String url = "http://localhost:8089/building/hessian/buildingService";  
//	     HessianProxyFactory factory = new HessianProxyFactory();  
//	     IBuildingService buildingService = (IBuildingService) factory.create(IBuildingService.class, url);
//	     Building building = buildingService.getBuildingById(100L);
		ApplicationContext ac = new ClassPathXmlApplicationContext("hessian-client.xml");  
		IPermissionService api = (IPermissionService) ac.getBean("permissionServiceClient");
		api.hashCode();
		System.out.println("done=" + api);
	}

}
