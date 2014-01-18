package com.jo.example.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.model.PaginationBean;
import com.jo.example.dao.ExampleDao;
import com.jo.example.model.Example;
import com.jo.example.service.ExampleService;

@Service("exampleService")
public class ExampleServiceImpl implements ExampleService 
{

	@Autowired
	private ExampleDao exampleDao;
	@Override
	public void deleteExample(Example example) 
	{
		exampleDao.deleteExample(example);
	}

	@Override
	public void deleteExample(Class<Example> c, Integer id) 
	{
		exampleDao.deleteExample(c, id);
	}

	@Override
	public List<Example> findAllExample(Class<Example> c) 
	{
		return exampleDao.findAllExample();
	}

	@Override
	public List<Example> findByPage(String hql, 
			PaginationBean paginationBean) {
		return exampleDao.findExampleByPage(hql, paginationBean);
	}

	@Override
	public Example getExample(Class<Example> clazz, Integer id) 
	{
		return exampleDao.getExample(clazz, id);
	}

	@Override
	public void saveExample(Example example) 
	{
		exampleDao.saveExample(example);
	}

	@Override
	public void updateExample(Example example) 
	{
		exampleDao.saveExample(example);
	}

	public ExampleDao getExampleDao() {
		return exampleDao;
	}

	public void setExampleDao(ExampleDao exampleDao) {
		this.exampleDao = exampleDao;
	}
	
	
}
