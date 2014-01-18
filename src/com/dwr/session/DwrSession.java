package com.dwr.session;

import uk.ltd.getahead.dwr.WebContext;
import uk.ltd.getahead.dwr.WebContextFactory;

/**
 * 前台通过dwr对session进行相关操作
 * @author Administrator
 *
 */
public class DwrSession 
{
	@SuppressWarnings("deprecation")
	public String getSessioinId()
	{
		WebContext webContext = WebContextFactory.get();
		return webContext.getSession().getId();
	}
	@SuppressWarnings("deprecation")
	public void setSession(String key,String value)
	{
		WebContext webContext = WebContextFactory.get();
		webContext.getScriptSession().setAttribute(key, value);
	}
	@SuppressWarnings("deprecation")
	public String getSession(String key)
	{
		WebContext webContext = WebContextFactory.get();
		return (String)webContext.getSession().getAttribute(key);
	}
}
