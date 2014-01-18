package com.jo.example.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.common.dao.DaoSupport;
import com.common.model.PaginationBean;
import com.jo.example.model.Example;

/**
 * 样例dao,所以方法，请以get,find,save,update,remove,query开头
 * @author Administrator
 */
@Repository("ExampleDao")
public class ExampleDao extends DaoSupport<Example>
{
	/**
	 * 保存对象到数据库
	 * @param Example 保存的对象
	 */
	public void saveExample(Example example)
	{
		this.save(example);
	}
	
	/**
	 * 更新对象到数据库
	 * @param Example 更新的对象
	 */
	public void updateExample(Example example)
	{
		this.update(example);
	}
	
	/**
	 * 删除数据库对象
	 * @param Example 删除的对象
	 */ 
	public void deleteExample(Example example)
	{
		this.delete(example);
	}
	
	/**
	 * 删除数据库对象
	 * @param Example 删除的对象
	 */ 
	public void deleteExample(Class<Example> clazz, Integer id)
	{
		this.delete(clazz, id);
	}
	
	/**
	 * 根据ID获取唯一对象
	 * @param objClass 对象类类
	 * @param id 对象唯一编号
	 * @return 返回查询的对象
	 */
	public Example getExample(Class<Example> clazz, Integer id)
	{
		return (Example)this.get(clazz, id);
	}
	
	/**
	 * 查询所有对象
	 * @return
	 */
	public List<Example> findAllExample()
	{
		return this.findAll(Example.class);
	}
	
	/**
	 * 
	 * @param hsql
	 * @param paginationBean
	 * @return
	 */
	public List<Example> findExampleByPage(String hsql, PaginationBean paginationBean)
	{
		return this.findByPage(hsql, paginationBean.getStartNum(), paginationBean.getPageSize());
	}
}
