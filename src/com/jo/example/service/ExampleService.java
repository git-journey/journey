package com.jo.example.service;

import java.util.List;

import com.common.model.PaginationBean;
import com.jo.example.model.Example;

public interface ExampleService 
{
	public void saveExample(Example example);
	public void updateExample(Example example);
	public void deleteExample(Example example);
	public void deleteExample(Class<Example> c, Integer id);
	public Example getExample(Class<Example> c, Integer id);
	public List<Example> findAllExample(Class<Example> c);
	public List<Example> findByPage(String hql, PaginationBean paginationBean);
}
