package org.ssh.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.ssh.pojo.historyMsg;
import org.ssh.service.MessageManagerService;
import org.ssh.util.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

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
	private String order;

	private PageBean pageBean;
	private int page = 1;

	public int getPage() {
		return this.page;
	}

	public String doQuery() {
		recipient = getParam("txtRecipient");
		dateStart = getParam("txtDateStart");
		dateEnd = getParam("txtDateEnd");
		context = getParam("txtContext");
		order = getParam("tbOrder");

		/*
		 * mList = service.queryMsg(recipient, dateStart, dateEnd, context,
		 * order);
		 */

		String strPage = getParam("page");

		try {
			page = Integer.parseInt(strPage);
		} catch (Exception e) {
		}

		this.pageBean = service.queryForPage(recipient, dateStart, dateEnd,
				context, order, 5, this.page);// 获取封装了分页信息和数据的pageBean
		mList = this.pageBean.getList(); // 获取数据

		return INPUT;
	}

	public String doQuery(int page) {
		recipient = getParam("txtRecipient");
		dateStart = getParam("txtDateStart");
		dateEnd = getParam("txtDateEnd");
		context = getParam("txtContext");
		order = getParam("tbOrder");

		this.pageBean = service.queryForPage(recipient, dateStart, dateEnd,
				context, order, 5, page);// 获取封装了分页信息和数据的pageBean
		mList = this.pageBean.getList(); // 获取数据

		return INPUT;
	}

	public String doAdd() {
		String result = "";
		try {
			String param = getParam("param");
			if (Integer.parseInt(param) > 0) {
				System.out.println("this is add.Action!");
				msg.setId(0);
				msg.setDate((new SimpleDateFormat("yyyy-MM-dd"))
						.parse(getParam("tbDate")));
				msg.setRecName(getParam("tbRecName"));
				msg.setTelNum(getParam("tbTelNum"));
				msg.setYear(getParam("tbYear"));
				msg.setSpecialty(getParam("tbSpecialty"));
				msg.setContext(getParam("tbContext"));

				service.addUser(msg);

				result = "back";
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

				msg.setId(Integer.parseInt(getParam("tbId")));
				msg.setDate((new SimpleDateFormat("yyyy-MM-dd"))
						.parse(getParam("tbDate")));
				msg.setRecName(getParam("tbRecName"));
				msg.setTelNum(getParam("tbTelNum"));
				msg.setYear(getParam("tbYear"));
				msg.setSpecialty(getParam("tbSpecialty"));
				msg.setContext(getParam("tbContext"));
				service.modifyUser(msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "back";
	}

	public String doDelete() throws NumberFormatException, Exception {
		String id = getParam("id");
		if (id == null || "".equals(id)) {
			return null;
		}

		Integer param = Integer.parseInt(id);
		service.deleteUser(param, historyMsg.class);

		int curPage = 1;
		String strPage = getParam("page");

		try {
			curPage = Integer.parseInt(strPage);
		} catch (Exception e) {
		}

		doQuery(curPage);

		return "back";
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

	public historyMsg getMsg() {
		return msg;
	}

	public void setMsg(historyMsg msg) {
		this.msg = msg;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public String getrecipient() {
		return recipient;
	}

	public String getdateStart() {
		return dateStart;
	}

	public String getdateEnd() {
		return dateEnd;
	}

	public String getcontext() {
		return context;
	}

	public String getOrder() {
		return order;
	}
}
