package org.ssh.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.ssh.pojo.historyMsg;
import org.ssh.service.MessageManagerService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 用户管理控制器
 * */
public class UserManagerAct extends ActionSupport {

	private static final long serialVersionUID = -281275682819237996L;

	private historyMsg msg = new historyMsg();

	private MessageManagerService<historyMsg> service;

	private List<historyMsg> mList;

	private String recipient;
	private String dateStart;
	private String dateEnd;
	private String context;

	public String doQuery() {

		recipient = getParam("txtRecipient");
		dateStart = getParam("txtDateStart");
		dateEnd = getParam("txtDateEnd");
		context = getParam("txtContext");
		
		mList = service.queryMsg(recipient, dateStart, dateEnd, context);
		
		return SUCCESS;
	}

	public String doAdd() {
		String result = "";
		try {
			String param = getParam("param");
			if (Integer.parseInt(param) > 0) {
				msg.setId(0);
				service.addUser(msg);
				result = doQuery();
			} else
				result = "addUser";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String doEdit() {
		try {
			Integer param = Integer.parseInt(getParam("param"));
			if (param == 0) {
				Integer id = Integer.parseInt(getParam("id"));
				msg = service.getUser(historyMsg.class, id);
				return "editUser";
			} else if (param == 1) {
				service.modifyUser(msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doQuery();
	}

	public String doDelete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			service.deleteUser(param, historyMsg.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doQuery();
	}

	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	public MessageManagerService<historyMsg> getUserService() {
		return service;
	}

	public void setUserService(MessageManagerService<historyMsg> userService) {
		this.service = userService;
	}

	public List<historyMsg> getMList() {
		return mList;
	}

	public historyMsg getUser() {
		return msg;
	}

	public void setUser(historyMsg user) {
		this.msg = user;
	}

	public String getrecipient() {
		return recipient;
	}

	public void setrecipient() {
		this.recipient = recipient;
	}

	public String getdateStart() {
		return dateStart;
	}

	public void setdateStart() {
		this.dateStart = dateStart;
	}

	public String getdateEnd() {
		return dateEnd;
	}

	public void setdateEnd() {
		this.dateEnd = dateEnd;
	}

	public String getcontext() {
		return context;
	}

	public void setcontext() {
		this.context = context;
	}
}
