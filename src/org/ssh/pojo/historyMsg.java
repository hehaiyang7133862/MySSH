package org.ssh.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class historyMsg implements java.io.Serializable {

	private static final long serialVersionUID = 5866268712137826050L;

	private Integer id;
	private Date date;
	private String recName;
	private String telNum;
	private String year;
	private String specialty;
	private String context;

	public historyMsg() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getRecName() {
		return this.recName;
	}

	public void setRecName(String recName) {
		this.recName = recName;
	}

	public String getTelNum() {
		return this.telNum;
	}

	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}

	public String getYear() {
		return this.year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSpecialty() {
		return this.specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public String getContext() {
		return this.context;
	}

	public void setContext(String context) {
		this.context = context;
	}
}