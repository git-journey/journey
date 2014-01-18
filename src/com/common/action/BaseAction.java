package com.common.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.common.model.PaginationBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport
{
	private static final long serialVersionUID = 1L;
	protected ActionContext context = ActionContext.getContext();
	protected HttpServletRequest request = (HttpServletRequest) ActionContext.getContext()
			.get(ServletActionContext.HTTP_REQUEST);
	protected HttpServletResponse response = (HttpServletResponse) ActionContext.getContext()
			.get(ServletActionContext.HTTP_RESPONSE);
	protected Map session = ActionContext.getContext().getSession();
	protected List<Integer> pageList = new ArrayList<Integer>();
	protected PaginationBean paginationBean;
	public PaginationBean getPaginationBean() {
		return paginationBean;
	}
	public void setPaginationBean(PaginationBean paginationBean) {
		this.paginationBean = paginationBean;
	}
	public void setPage(int totalPage)
	{
		for(int i=1; i<=totalPage; i++ )
		{
			pageList.add(i);
		}
		request.setAttribute("pageList", pageList);
	}
}
