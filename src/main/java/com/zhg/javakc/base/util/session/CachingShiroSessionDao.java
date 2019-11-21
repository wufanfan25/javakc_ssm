package com.zhg.javakc.base.util.session;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zhg.javakc.base.util.redis.RedisManager;

//@Component
public class CachingShiroSessionDao extends AbstractSessionDAO  {
	
	private static final Logger logger = LoggerFactory.getLogger(CachingShiroSessionDao.class);
	
	@Autowired
    private RedisManager redisManager;
	
	@Override
    public void delete(Session session) {
        if(session == null || session.getId() == null){
            logger.error(" session is null");
            return;
        }
        redisManager.delete(session.getId().toString());
    }

    @Override
    public Collection<Session> getActiveSessions() {
        List<Session> list = redisManager.get();
        return list;
    }

    @Override
    public void update(Session session) throws UnknownSessionException {
        if(session == null || session.getId() == null){
            logger.error(" session is null");
            return;
        }
        Serializable sessionId = session.getId();
        redisManager.add(sessionId.toString(), session);
    }

    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = generateSessionId(session);
        assignSessionId(session, sessionId);
        redisManager.add(sessionId.toString(), session);
        logger.error(" session is created");
        return sessionId;
    }

    @Override
    protected Session doReadSession(Serializable sessionId) {
        return redisManager.get(sessionId.toString());
    }
		
}
