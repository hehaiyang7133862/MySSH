package org.ssh.dao;

import java.io.Serializable;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * 数据库io操作
 */
public class BaseDao extends HibernateDaoSupport {

	/** 查询 */
	public <T> List<T> getObjects(String queryString) {
		return (List<T>) this.getHibernateTemplate().find(queryString);
	}

	/**
	 * 分页查询
	 * 
	 * @param hql
	 *            查询条件
	 * @param offset
	 *            开始记录
	 * @param length
	 *            一次查询几条记录
	 * @return 查询的记录集合
	 */
	@SuppressWarnings("unchecked")
	public <T> List<T> queryForPage(final String hql, final int offset,
			final int length) {
		Session session = this.getSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(offset);
		q.setMaxResults(length);
		List<T> list = q.list();
		session.close();
		return list;
	}

	public int getAllRowCount(String hql) {
		return this.getHibernateTemplate().find(hql).size();
	}

	/** 查询所有 */
	public <T> List<T> getAllObjects(Class<T> clazz) {
		return this.getHibernateTemplate().loadAll(clazz);
	}

	/** 添加一个 */
	public <T> void addObject(T clazz) {
		this.getHibernateTemplate().save(clazz);
	}

	/** 更新指定的 */
	public <T> void updateObject(T clazz) {
		this.getHibernateTemplate().update(clazz);
	}

	/** 删除指定的 */
	public <T> void deleteObject(T clazz) {
		this.getHibernateTemplate().delete(clazz);
	}

	/** 通过id获取 */
	public <T> T getObject(Class<T> clazz, Serializable id) {
		return this.getHibernateTemplate().get(clazz, id);
	}
}
