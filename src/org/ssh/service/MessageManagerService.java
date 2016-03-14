package org.ssh.service;

import java.util.List;

import org.apache.commons.validator.Msg;
import org.ssh.dao.BaseDao;
import org.ssh.pojo.historyMsg;
import org.ssh.util.PageBean;

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

	public PageBean queryForPage(String recipient, String dateStart,
			String dateEnd, String context, String order, int pageSize, int page) {

		String queryString = "SELECT m FROM historyMsg m ";
		boolean isNull = true;

		if (recipient != null && recipient.length() != 0) {
			if (isNull == false) {
				queryString += "AND ";
			} else {
				queryString += "WHERE ";
			}
			queryString += "m.recName = '" + recipient + "'";
			isNull = false;
		}

		if (dateStart != null && dateStart.length() != 0) {
			if (isNull == false) {
				queryString += "AND ";
			} else {
				queryString += "WHERE ";
			}
			queryString += "m.date > '" + dateStart + "'";
			isNull = false;
		}

		if (dateEnd != null && dateEnd.length() != 0) {
			if (isNull == false) {
				queryString += "AND ";
			} else {
				queryString += "WHERE ";
			}
			queryString += "m.date < '" + dateEnd + "'";
			isNull = false;
		}

		if (context != null && context.length() != 0) {
			if (isNull == false) {
				queryString += "AND ";
			} else {
				queryString += "WHERE ";
			}
			queryString += "m.context like '%" + context + "%'";
		}

		queryString += "ORDER BY DATE ";
		if (order != null) {
			if (order.equals("DESC")) {
				queryString += "DESC";
			}
		}
		int allRow = dao.getAllRowCount(queryString); // 总记录数
		int totalPage = PageBean.countTatalPage(pageSize, allRow); // 总页数
		
		if(page >totalPage)
		{
			page =totalPage;
		}
		
		final int offset = PageBean.countOffset(pageSize, page); // 当前页开始记录
		final int length = pageSize; // 每页记录数
		final int currentPage = PageBean.countCurrentPage(page); // 当前页
		List<historyMsg> list = dao.queryForPage(queryString, offset, length); //
		// 把分页信息保存到Bean当中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		return pageBean;

	}

	public List<T> queryMsg(String recipient, String dateStart, String dateEnd,
			String context, String order) {

		String queryString = "SELECT m FROM historyMsg m ";
		boolean isNull = true;

		if (recipient != null && recipient.length() != 0) {
			if (isNull == false) {
				queryString += "AND ";
			} else {
				queryString += "WHERE ";
			}
			queryString += "m.recName = '" + recipient + "'";
			isNull = false;
		}

		if (dateStart != null && dateStart.length() != 0) {
			if (isNull == false) {
				queryString += "AND ";
			} else {
				queryString += "WHERE ";
			}
			queryString += "m.date > '" + dateStart + "'";
			isNull = false;
		}

		if (dateEnd != null && dateEnd.length() != 0) {
			if (isNull == false) {
				queryString += "AND ";
			} else {
				queryString += "WHERE ";
			}
			queryString += "m.date < '" + dateEnd + "'";
			isNull = false;
		}

		if (context != null && context.length() != 0) {
			if (isNull == false) {
				queryString += "AND ";
			} else {
				queryString += "WHERE ";
			}
			queryString += "m.context like '%" + context + "%'";
		}

		queryString += "ORDER BY DATE ";
		if (order != null) {
			if (order.equals("DESC")) {
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
