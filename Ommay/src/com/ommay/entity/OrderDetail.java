package com.ommay.entity;

import java.util.Set;

/**
 * OrderDetail entity. @author MyEclipse Persistence Tools
 */

public class OrderDetail implements java.io.Serializable {

	// Fields

	private Integer uidOrderDetail;
	private ProjectDetail projectDetail;
	private Indent indent;
	private String orderTime;
	private Integer moneyOrder;
	private String orderClientName;
//	private Set testResults = new HashSet(0);

	// Constructors

	/** default constructor */
	public OrderDetail() {
		this.uidOrderDetail = 0;
		this.projectDetail = new ProjectDetail();
		this.indent = new Indent();
		this.orderTime = "";
		this.moneyOrder = 0;
		this.orderClientName = "";
	}

	/** full constructor */
	public OrderDetail(ProjectDetail projectDetail, Indent indent,
			String orderTime, Integer moneyOrder, String orderClientName,
			Set testResults) {
		this.projectDetail = projectDetail;
		this.indent = indent;
		this.orderTime = orderTime;
		this.moneyOrder = moneyOrder;
		this.orderClientName = orderClientName;
//		this.testResults = testResults;
	}

	// Property accessors

	public Integer getUidOrderDetail() {
		return this.uidOrderDetail;
	}

	public void setUidOrderDetail(Integer uidOrderDetail) {
		this.uidOrderDetail = uidOrderDetail;
	}

	public ProjectDetail getProjectDetail() {
		return this.projectDetail;
	}

	public void setProjectDetail(ProjectDetail projectDetail) {
		this.projectDetail = projectDetail;
	}

	public Indent getIndent() {
		return this.indent;
	}

	public void setIndent(Indent indent) {
		this.indent = indent;
	}

	public String getOrderTime() {
		return this.orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public Integer getMoneyOrder() {
		return this.moneyOrder;
	}

	public void setMoneyOrder(Integer moneyOrder) {
		this.moneyOrder = moneyOrder;
	}

	public String getOrderClientName() {
		return this.orderClientName;
	}

	public void setOrderClientName(String orderClientName) {
		this.orderClientName = orderClientName;
	}

//	public Set getTestResults() {
//		return this.testResults;
//	}
//
//	public void setTestResults(Set testResults) {
//		this.testResults = testResults;
//	}

}