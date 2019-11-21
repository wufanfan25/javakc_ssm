package com.zhg.javakc.modules.system.shiro.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhg.javakc.modules.system.user.service.UserService;

/**
 * 基础登陆信息表现层实现
 * @author zhg
 * @version v0.1
 */
@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 登陆验证
	 * @param name
	 * @param pass
	 * @return 登陆状态（成功/失败）
	 */
	@RequestMapping(value="/login")
	public String login(String name, String pass)
	{
		//创建用户名和密码的令牌  
		UsernamePasswordToken token = new UsernamePasswordToken(name, pass);
		token.setRememberMe(true);
		//subject理解成权限对象。类似user对象
		Subject subject = SecurityUtils.getSubject();
		try 
		{ 
			subject.login(token);
		} 
		catch (UnknownAccountException ex) 
		{ 
			System.out.println("用户名没有找到!");
		} 
		catch (IncorrectCredentialsException ex) 
		{
			System.out.println("用户名密码不匹配!");
		} 
		catch (AuthenticationException e) 
		{
			e.printStackTrace();
			System.out.println("其他的登录错误!");
		}
		//shiro的认证方法
		if (subject.isAuthenticated()) 
		{
			subject.getSession().setAttribute("user", userService.findByName(name));
			return "redirect:/index.jsp";
		}
		return "redirect:/login.jsp";
	}
	
//	@RequestMapping(value="/home")
//	public String home()
//	{
//		Subject subject = SecurityUtils.getSubject();
//		return "";
//	}

}
