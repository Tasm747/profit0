package com.ab.profit.component.impl;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import com.ab.profit.filter.AbstractFilter;
import com.ab.profit.util.DebugUtil;

// Loggiert Hibernate Anfragen 
// DebugUtil.java aus dem package "com.ab.profit.util" wird benutzt

@Component
public class DebugFilter extends AbstractFilter 
{

	public boolean isEnabledDebug()
	{
		return true;
	}
	
	public String[] getDebugUrl()
	{
		return new String[]{"/richard-hendricks", "/welcome"};
	}

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws IOException, ServletException 
	{
		try 
		{
			LOGGER.info("**************************************************** start ***************************************************");
			DebugUtil.turnOnShowSQL();
			chain.doFilter(req, resp);
		} 
		finally 
		{
			DebugUtil.turnOffShowSQL();
			LOGGER.info("****************************************************  end  ***************************************************");
		}
	}
}
