package org.ssh.util;

import java.util.List;
import org.ssh.pojo.historyMsg;

public class PageBean {
	private List<historyMsg> list; // 要返回的某一页的记录列表
	private int allRow; // 总记录数
	private int totalPage; // 总页数
	private int currentPage = 1; // 当前页
	private int pageSize; // 每页的记录数

	public List<historyMsg> getList() {
		return this.list;
	}

	public void setList(List<historyMsg> list) {
		this.list = list;
	}

	public int getAllRow() {
		return this.allRow;
	}

	public void setAllRow(int allRow) {
		this.allRow = allRow;
	}

	public int getTotalPage() {
		return this.totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return this.currentPage;
	}

	public void setCurrentPage(int currentpage) {
		this.currentPage = currentpage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public PageBean() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * 计算总页数 静态方法
	 * 
	 * @param pageSize
	 *            每页的记录数
	 * @param allRow
	 *            总记录数
	 * @return 总页数
	 */
	public static int countTatalPage(final int pageSize, final int allRow) {
		int toalPage = allRow % pageSize == 0 ? allRow / pageSize : allRow
				/ pageSize + 1;
		return toalPage;
	}

	/**
	 * 计算当前页开始的记录
	 * 
	 * @param pageSize
	 *            每页记录数
	 * @param currentPage
	 *            当前第几页
	 * @return 当前页开始记录号
	 */
	public static int countOffset(final int pageSize, final int currentPage) {
		final int offset = pageSize * (currentPage - 1);
		return offset;
	}

	/**
	 * 计算当前页，若为0或者请求的URL中没有“?page = ”则用1代替
	 * 
	 * @param page
	 *            传入的参数（可能为空，即0 则返回1）
	 * @return
	 */
	public static int countCurrentPage(int page) {
		final int curpage = (page == 0 ? 1 : page);
		return curpage;
	}
}
