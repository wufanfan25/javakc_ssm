package com.zhg.javakc.base.util.servlet;

import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(name="initServlet",urlPatterns="/initServlet")
public class InitServlet extends HttpServlet{

	private static final long serialVersionUID = -8102278293490724613L;
	
	public void init(ServletConfig config) {
		// TODO Auto-generated method stub
		ServletContext sc = config.getServletContext();
		sc.setAttribute("path", getContextPath(sc));
		System.out.println("**********************************************");
		System.out.println("**************javakc\u9879\u76EE\u521D\u59CB\u5316\u5B8C\u6210*****************");
		System.out.println("*****http://127.0.0.1:8080"+getContextPath(sc)+"**************");
		System.out.println("**********************************************");
		
//		openDefaultBrowser("http://127.0.0.1:8080"+getContextPath(sc));
	}
	
	/** 
     * 打开默认浏览器访问页面 
     */  
    public static void openDefaultBrowser(String url){  
        //启用系统默认浏览器来打开网址。  
        try {  
            URI uri = new URI(url);  
            Desktop.getDesktop().browse(uri);  
        } catch (URISyntaxException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }
	
	private String getContextPath(ServletContext sc) {
        return sc.getContextPath();
    }
	
}
