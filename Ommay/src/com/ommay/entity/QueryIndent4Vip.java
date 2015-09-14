package com.ommay.entity;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
public class QueryIndent4Vip {
	private Integer uidIndentVip;
	private String indentVipName;
	private String indentVipSex;
	private String status;
	private String worker;
	private String manager;

	public QueryIndent4Vip() {
		this.uidIndentVip = 0;
		this.indentVipName = "无";
		this.indentVipSex = "女";
		this.status = "无";
		this.worker = "无";
		this.manager = "无";
	}

	public Integer getUidIndentVip() {
		return uidIndentVip;
	}

	public void setUidIndentVip(Integer uidIndentVip) {
		this.uidIndentVip = uidIndentVip;
	}

	public String getIndentVipName() {
		return indentVipName;
	}

	public void setIndentVipName(String indentVipName) {
		this.indentVipName = indentVipName;
	}

	public String getIndentVipSex() {
		return indentVipSex;
	}

	public void setIndentVipSex(String indentVipSex) {
		this.indentVipSex = indentVipSex;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getWorker() {
		return worker;
	}

	public void setWorker(String worker) {
		this.worker = worker;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}
}
