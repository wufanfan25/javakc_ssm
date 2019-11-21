package com.zhg.javakc.base.page;

import java.io.Serializable;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.plugin.Interceptor;

import com.zhg.javakc.base.dialect.Dialect;
import com.zhg.javakc.base.dialect.db.DB2Dialect;
import com.zhg.javakc.base.dialect.db.DerbyDialect;
import com.zhg.javakc.base.dialect.db.H2Dialect;
import com.zhg.javakc.base.dialect.db.HSQLDialect;
import com.zhg.javakc.base.dialect.db.MySQLDialect;
import com.zhg.javakc.base.dialect.db.OracleDialect;
import com.zhg.javakc.base.dialect.db.PostgreSQLDialect;
import com.zhg.javakc.base.dialect.db.SQLServer2005Dialect;
import com.zhg.javakc.base.dialect.db.SybaseDialect;
import com.zhg.javakc.base.util.Reflections;

/**
 * Mybatis分页拦截器基类
 * @author zhg
 * @version v0.1
 */
public abstract class BaseInterceptor implements Interceptor, Serializable {
	
	private static final long serialVersionUID = 1L;

    protected static final String PAGE = "page";
    
    protected static final String DELEGATE = "delegate";

    protected static final String MAPPED_STATEMENT = "mappedStatement";

    protected Log log = LogFactory.getLog(this.getClass());

    protected Dialect DIALECT;
    
    /**
     * 对参数进行转换和检查
     * @param parameterObject 参数对象
     * @param page            分页对象
     * @return 分页对象
     * @throws NoSuchFieldException 无法找到参数
     */
    @SuppressWarnings("unchecked")
	protected static Page<Object> convertParameter(Object parameterObject, Page<Object> page) {
    	try{
            if (parameterObject instanceof Page) {
                return (Page<Object>) parameterObject;
            } else {
                return (Page<Object>)Reflections.getFieldValue(parameterObject, PAGE);
            }
    	}catch (Exception e) {
			return null;
		}
    }

    /**
     * 设置属性，支持自定义方言类和制定数据库的方式
     * <code>dialectClass</code>,自定义方言类。可以不配置这项
     * <ode>dbms</ode> 数据库类型，插件支持的数据库
     * <code>sqlPattern</code> 需要拦截的SQL ID
     * @param p 属性
     */
    protected void initProperties(String dbType) {
    	Dialect dialect = null;
        if ("db2".equals(dbType)){
        	dialect = new DB2Dialect();
        }else if("derby".equals(dbType)){
        	dialect = new DerbyDialect();
        }else if("h2".equals(dbType)){
        	dialect = new H2Dialect();
        }else if("hsql".equals(dbType)){
        	dialect = new HSQLDialect();
        }else if("mysql".equals(dbType)){
        	dialect = new MySQLDialect();
        }else if("oracle".equals(dbType)){
        	dialect = new OracleDialect();
        }else if("postgre".equals(dbType)){
        	dialect = new PostgreSQLDialect();
        }else if("mssql".equals(dbType) || "sqlserver".equals(dbType)){
        	dialect = new SQLServer2005Dialect();
        }else if("sybase".equals(dbType)){
        	dialect = new SybaseDialect();
        }
        if (dialect == null) {
            throw new RuntimeException("mybatis dialect error.");
        }
        DIALECT = dialect;
    }
}
