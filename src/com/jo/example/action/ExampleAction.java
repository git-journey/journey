package com.jo.example.action;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.common.action.BaseAction;
import com.common.model.PaginationBean;
import com.jo.example.model.Example;
import com.jo.example.service.ExampleService;

/**
 * 样例action写法
 * @author Administrator
 *
 */
@Scope("prototype")
@Controller("exampleAction")
public class ExampleAction extends BaseAction
{
	private static final long serialVersionUID = 1L;
	@Autowired
	private ExampleService exampleService;
	private Example example;
	public String main()
	{
		return "success";
	}
	public String save()
	{
		if(example != null)
		{
			example.setExampleName4(new Date());
			exampleService.saveExample(example);
		}
		return "save";
	}
	public String delete()
	{
		if(example != null)
		{
			exampleService.deleteExample(example);
		}
		return "delete";
	}
	public String update()
	{
		if(example != null)
		{
			exampleService.updateExample(example);
		}
		return "update";
	}
	public String query()
	{
		Integer total= exampleService.findAllExample(Example.class).size();
		if(paginationBean == null)
		{
			paginationBean = new PaginationBean(total, 1, 8);
		}
		else
		{
			paginationBean.setTotalRows(total);
			paginationBean.repaginate();
		}
		this.setPage(paginationBean.getTotalPages());
		String hsql = "from Example order by exampleId desc";
		List<Example> exampleList = exampleService.findByPage(hsql, paginationBean);
		request.setAttribute("exampleList", exampleList);
		return "query";
	}
	public ExampleService getExampleService() {
		return exampleService;
	}
	public void setExampleService(ExampleService exampleService) {
		this.exampleService = exampleService;
	}
	public Example getExample() {
		return example;
	}
	public void setExample(Example example) {
		this.example = example;
	}
	
}
