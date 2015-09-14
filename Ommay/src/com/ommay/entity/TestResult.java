package com.ommay.entity;

/**
 * TestResult entity. @author MyEclipse Persistence Tools
 */

public class TestResult implements java.io.Serializable {

	// Fields

	private Integer uidTestDetail;
	private OrderDetail orderDetail;
	private String result;
	private String idPhysicalItem;
	private String account;
	private String indentGroupMember;
	private String uidProject;

	// Constructors

	/** default constructor */
	public TestResult() {
		this.orderDetail = new OrderDetail();
		this.result = "";
		this.idPhysicalItem = "";
		this.account = "";
		this.indentGroupMember = "";
		this.uidProject = "";
	}

	/** minimal constructor */
	public TestResult(String idPhysicalItem, String account) {
		this.idPhysicalItem = idPhysicalItem;
		this.account = account;
	}

	/** full constructor */
	public TestResult(OrderDetail orderDetail, String result,
			String idPhysicalItem, String account, String indentGroupMember,
			String uidProject) {
		this.orderDetail = orderDetail;
		this.result = result;
		this.idPhysicalItem = idPhysicalItem;
		this.account = account;
		this.indentGroupMember = indentGroupMember;
		this.uidProject = uidProject;
	}

	// Property accessors

	public Integer getUidTestDetail() {
		return this.uidTestDetail;
	}

	public void setUidTestDetail(Integer uidTestDetail) {
		this.uidTestDetail = uidTestDetail;
	}

	public OrderDetail getOrderDetail() {
		return this.orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

	public String getResult() {
		return this.result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getIdPhysicalItem() {
		return this.idPhysicalItem;
	}

	public void setIdPhysicalItem(String idPhysicalItem) {
		this.idPhysicalItem = idPhysicalItem;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getIndentGroupMember() {
		return this.indentGroupMember;
	}

	public void setIndentGroupMember(String indentGroupMember) {
		this.indentGroupMember = indentGroupMember;
	}

	public String getUidProject() {
		return this.uidProject;
	}

	public void setUidProject(String uidProject) {
		this.uidProject = uidProject;
	}

}