package com.ommay.entity;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
public class DoctorSearchUnit {
	private Integer uidIndent = -1;
	private String name = "未填写", sex = "未填写", status = "未填写", operator = "未填写",
			history = "未填写", inc = "个体会员";

	public String getInc() {
		return inc;
	}

	public void setInc(String inc) {
		this.inc = inc;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}

	public DoctorSearchUnit() {
		name = "未填写";
		sex = "未填写";
		status = "未填写";
		operator = "未填写";
		history = "未填写";
		inc = "个体会员";
	}

	@Override
	public String toString() {
		return "IndentMerge [uidIndent=" + uidIndent + ", name=" + name
				+ ", sex=" + sex + ", status=" + status + ", operator="
				+ operator + "]";
	}

	public Integer getUidIndent() {
		return uidIndent;
	}

	public void setUidIndent(Integer uidIndent) {
		this.uidIndent = uidIndent;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}
}
