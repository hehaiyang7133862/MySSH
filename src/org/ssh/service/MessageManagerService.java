package org.ssh.service;

import java.util.List;

import org.ssh.dao.BaseDao;

import com.sun.org.apache.bcel.internal.generic.NEW;

/**
 * 用户管理业务逻辑的实现
 * */
public class MessageManagerService<T> {

	private BaseDao dao;

	public T doLogin(String userName, String password) throws Exception {
		if (userName == null || password == null)
			return null;
		String queryString = "SELECT u FROM Userinfo u WHERE u.uname = '"
				+ userName + "' AND u.password = " + password;
		List<T> users = dao.getObjects(queryString);
		return users.get(0);
	}

	public List<T> queryUsers(String uname, Class<T> clazz) {
		if (uname == null || "".equals(uname))
			return dao.getAllObjects(clazz);
		String queryString = "SELECT * FROM histroymsg";
		return dao.getObjects(queryString);
	}

	public List<T> queryMsg(String recipient, String dateStart, String dateEnd,
			String context, String order) {

		String queryString = "SELECT m FROM historyMsg m ";
		boolean isNull = true;

		if (recipient != null && !"".equals(recipient)) {
			if (isNull == false) {
				queryString += "AND ";
			} else {
				queryString += "WHERE ";
			}
			queryString += "m.recName = '" + recipient + "'";
			isNull = false;
		}

		if (dateStart != null && !"".equals(dateStart)) {
			if (isNull == false) {
				queryString += "AND ";
			} else {
				queryString += "WHERE ";
			}
			queryString += "m.date > '" + dateStart + "'";
			isNull = false;
		}

		if (dateEnd != null && !"".equals(dateEnd)) {
			if (isNull == false) {
				queryString += "AND ";
			} else {
				queryString += "WHERE ";
			}
			queryString += "m.date < '" + dateEnd + "'";
			isNull = false;
		}

		if (context != null && !"".equals(context)) {
			if (isNull == false) {
				queryString += "AND ";
			} else {
				queryString += "WHERE ";
			}
			queryString += "m.context like '%" + context + "%'";
		}

		queryString += "ORDER BY DATE ";
		if (order != null && !"".equals(context)) {
			if (order.equals(new String("DESC"))) {
				queryString += "DESC";
			}
		}

		System.out.println(queryString);
		return dao.getObjects(queryString);
	}

	public void addUser(T user) throws Exception {
		dao.addObject(user);
	}

	public void modifyUser(T user) throws Exception {
		dao.updateObject(user);
	}

	public void deleteUser(int id, Class<T> clazz) throws Exception {
		T u = dao.getObject(clazz, id);
		dao.deleteObject(u);
	}

	public T getUser(Class<T> clazz, int id) {
		return dao.getObject(clazz, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
}
