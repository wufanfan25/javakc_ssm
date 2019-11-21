package com.zhg.javakc.modules.system.shiro.realm;

import java.util.Collection;
import java.util.HashSet;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.zhg.javakc.modules.system.user.service.UserService;

/**
 * Shiro权限控制管理其对象
 * @author zhg
 * @version v0.1
 */
public class SecurityRealm extends AuthorizingRealm{
	
	@Autowired
    private UserService userService;
	
	/**
	 * 获取用户授权信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// TODO Auto-generated method stub
		 if (principals == null) 
		 {
            throw new AuthorizationException("Principal对象不能为空");
        }
        else
        {
        	String username = (String) principals.fromRealm(getName()).iterator().next();
        	System.out.println("SecurityRealm.java line number(48):"+username);
        	
        	SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        	//session中获取用户信息
        	Subject subject = SecurityUtils.getSubject();
        	String loginName = (String)subject.getSession().getAttribute("user");
        	System.out.println("SecurityRealm.java line number(53):"+loginName);
        	//检测session信息, 如果没有则退出用户登陆状态
        	if(null == loginName || "".equals(loginName))
        	{
        		subject.logout();
        		return null;
        	}
        	else
        	{
        		//设置用户角色集合
	        	info.addRole("角色名称 rolename");
	        	
	        	//shiro认证的权限集合
	        	Collection<String> collection = new HashSet<String>();
	        	collection.add("权限控制 permission");
	        	
	        	info.addStringPermissions(collection);
	        	return info;
        	}
        }
	}

	/**
	 * 验证用户登陆信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		// TODO Auto-generated method stub
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		//执行用户登录查询
		String pass = userService.login(token.getUsername());
		if(null == pass || "".equals(pass))
		{
			throw new UnknownAccountException();//当前账号不存在
		}
		else if(!(pass).equals( String.valueOf(token.getPassword()) ) )
		{
			throw new IncorrectCredentialsException();//密码输入错误
		}
		else
		{
			return new SimpleAuthenticationInfo(token.getPrincipal(), token.getPassword(), getName());
		}
	}
	
}
