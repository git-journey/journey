package com.common.dao;

import static org.hibernate.criterion.Restrictions.eq;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 基本DAO
 * @author Administrator
 * @param <T>
 */
public class DaoSupport<T> 
{	
		@Autowired
		protected SessionFactory sessionFactory;
		
		public SessionFactory getSessionFactory() {
			return sessionFactory;
		}

		public void setSessionFactory(SessionFactory sessionFactory) {
			this.sessionFactory = sessionFactory;
		}

		protected Session getSession() {
	        return sessionFactory.getCurrentSession();
	    }
		
	    protected <T> void save(T t) {
	        getSession().save(t);
	    }

	    @SuppressWarnings("unchecked")
		protected <T> T get(Class<T> clazz, int id) {
	        return (T) getSession().get(clazz, id);
	    }

	    @SuppressWarnings("unchecked")
		protected <T> List<T> findByProperty(Class<T> clazz, String property, Object value) {
	        return getSession().createCriteria(clazz).add(eq(property, value)).list();
	    }

	    @SuppressWarnings("unchecked")
		protected <T> List<T> findAll(Class<T> clazz) {
	        return getSession().createCriteria(clazz).list();
	    }

	    protected <T> void update(T t) {
	        getSession().update(t);
	    }

	    @SuppressWarnings("unchecked")
		protected <T> void delete(Class clazz, int id) {
	        getSession().delete(get(clazz, id));
	    }

	    protected <T> void delete(T t) {
	        getSession().delete(t);
	    }
	    public <T> List<T> queryForList(String hql, Object param) {
			return queryForList(hql, new Object[] { param });

		}
	    public <T> List<T> queryForList(String hql) {
			return queryForList(hql, new Object[] {});
		}
	    
	    public <T> List<T> queryForList(String hql, Object[] params) {
			Query query = getSession().createQuery(hql);
			setQueryParams(query, params);
			return (List<T>) query.list();

		}
	    
	    public <T> List<T> findByPage(String hql,
				int firstResult, int maxResult) {
			return findByPage(hql, new Object[] {}, firstResult,
					maxResult);

		}
	    public T queryForObject(String hql, Object[] params) {
			Query query = getSession().createQuery(hql);
			setQueryParams(query, params);
			return (T)query.uniqueResult();

		}
	    public <T> List<T> findByPage(String hql,
				Object param, int firstResult, int maxResult) {
			return findByPage(hql, new Object[] { param },
					firstResult, maxResult);

		}
	    public <T> List<T> findByPage(String hql,
				Object[] params, int firstResult, int maxResult) {
			Query query = getSession().createQuery(hql);
			setQueryParams(query, params);
			query.setFirstResult(firstResult);
			query.setMaxResults(maxResult);
			return (List<T>) query.list();

		}
	    private void setQueryParams(Query query, Object[] params) {
			if (null == params) {
				return;
			}
			for (int i = 0; i < params.length; i++) {
				query.setParameter(i, params[i]);
			}
		}  
}
