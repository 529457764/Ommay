package com.ommay.entity;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
public class ResultUnit {
	Integer uidOrderDetail = 0, testResult = 0;
	String type = "未填写", result = "未填写";
	String name = "", operator = "", time = "";

	public ResultUnit() {
		name = "";
		operator = "";
		time = "";
		uidOrderDetail = 0;
		testResult = 0;
		type = "未填写";
		result = "未填写";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getUidOrderDetail() {
		return uidOrderDetail;
	}

	public void setUidOrderDetail(Integer uidOrderDetail) {
		this.uidOrderDetail = uidOrderDetail;
	}

	public Integer getTestResult() {
		return testResult;
	}

	public void setTestResult(Integer testResult) {
		this.testResult = testResult;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
}
