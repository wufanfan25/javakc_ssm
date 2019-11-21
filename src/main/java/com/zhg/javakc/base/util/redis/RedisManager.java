package com.zhg.javakc.base.util.redis;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

//@Component
public class RedisManager {
	
	@Autowired
    private RedisTemplate<String, Session> redisTemplate;
    
    private static final String KEY = "shareSessionMap";
    
    public void add(String sessionId, byte[] bytes){
        redisTemplate.boundHashOps(KEY).put(sessionId, bytes);
    }
    public void add(String sessionId, Session session){
        redisTemplate.boundHashOps(KEY).put(sessionId, session);
    }
    
    public void delete(String sessionId){
        redisTemplate.boundHashOps(KEY).delete(sessionId);
    }
    
    public Session get(String sessionId){
        return (Session) redisTemplate.boundHashOps(KEY).get(sessionId);
    }
    
    public List<Session> get(){
        List<Session> list = new ArrayList<>();
        List<Object> values = redisTemplate.boundHashOps(KEY).values();
        for (Object object : values) 
        {
            list.add((Session) object);
        }
        return list;
    }
    
}
