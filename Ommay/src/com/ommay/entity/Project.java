package com.ommay.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Project entity. @author MyEclipse Persistence Tools
 */

public class Project implements java.io.Serializable {

	// Fields

	private Integer uidProject;
	private String account;
	private String clientName;
	private Boolean projectReviewFlag;
	private Boolean contractReviewFlag;
	private String timeBegin;
	private String timeEnd;
	private String addressGroup;
	private Integer peopleNumber;
	private String remark;
	private String projectBuilder;
	private String projectReviewDate;
	private String contractReviewDate;
	private String projectReviewRemark;
	private String projectReviewMaster;
	private String contractReviewRemark;
	private String contractReviewMaster;
//	private Set projectDetails = new HashSet(0);
	private String status;
	// Constructors

	@Override
	public String toString() {
		return "Project [uidProject=" + uidProject + ", account=" + account
				+ ", clientName=" + clientName + ", projectReviewFlag="
				+ projectReviewFlag + ", contractReviewFlag="
				+ contractReviewFlag + ", timeBegin=" + timeBegin
				+ ", timeEnd=" + timeEnd + ", addressGroup=" + addressGroup
				+ ", peopleNumber=" + peopleNumber + ", remark=" + remark
				+ ", projectBuilder=" + projectBuilder + ", projectReviewDate="
				+ projectReviewDate + ", contractReviewDate="
				+ contractReviewDate + ", projectReviewRemark="
				+ projectReviewRemark + ", projectReviewMaster="
				+ projectReviewMaster + ", contractReviewRemark="
				+ contractReviewRemark + ", contractReviewMaster="
				+ contractReviewMaster + ", status=" + status + "]";
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	/** default constructor */
	public Project() {
		this.account = "-1";
		this.clientName = "God";
		this.projectReviewFlag = false;
		this.contractReviewFlag = false;
		this.timeBegin = "2000BCBC";
		this.timeEnd = "2000BCBC";
		this.addressGroup = "";
		this.peopleNumber = 0;
		this.remark = "";
		this.projectBuilder = "";
		this.projectReviewDate = "";
		this.contractReviewDate = "";
		this.projectReviewRemark = "";
		this.projectReviewMaster = "";
		this.contractReviewRemark = "";
		this.contractReviewMaster = "";
	}

	/** full constructor */
	public Project(String account, String clientName,
			Boolean projectReviewFlag, Boolean contractReviewFlag,
			String timeBegin, String timeEnd, String addressGroup,
			Integer peopleNumber, String remark, String projectBuilder,
			String projectReviewDate, String contractReviewDate,
			String projectReviewRemark, String projectReviewMaster,
			String contractReviewRemark, String contractReviewMaster,
			Set projectDetails) {
		this.account = account;
		this.clientName = clientName;
		this.projectReviewFlag = projectReviewFlag;
		this.contractReviewFlag = contractReviewFlag;
		this.timeBegin = timeBegin;
		this.timeEnd = timeEnd;
		this.addressGroup = addressGroup;
		this.peopleNumber = peopleNumber;
		this.remark = remark;
		this.projectBuilder = projectBuilder;
		this.projectReviewDate = projectReviewDate;
		this.contractReviewDate = contractReviewDate;
		this.projectReviewRemark = projectReviewRemark;
		this.projectReviewMaster = projectReviewMaster;
		this.contractReviewRemark = contractReviewRemark;
		this.contractReviewMaster = contractReviewMaster;
//		this.projectDetails = projectDetails;
	}

	// Property accessors

	public Integer getUidProject() {
		return this.uidProject;
	}

	public void setUidProject(Integer uidProject) {
		this.uidProject = uidProject;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getClientName() {
		return this.clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public Boolean getProjectReviewFlag() {
		return this.projectReviewFlag;
	}

	public void setProjectReviewFlag(Boolean projectReviewFlag) {
		this.projectReviewFlag = projectReviewFlag;
	}

	public Boolean getContractReviewFlag() {
		return this.contractReviewFlag;
	}

	public void setContractReviewFlag(Boolean contractReviewFlag) {
		this.contractReviewFlag = contractReviewFlag;
	}

	public String getTimeBegin() {
		return this.timeBegin;
	}

	public void setTimeBegin(String timeBegin) {
		this.timeBegin = timeBegin;
	}

	public String getTimeEnd() {
		return this.timeEnd;
	}

	public void setTimeEnd(String timeEnd) {
		this.timeEnd = timeEnd;
	}

	public String getAddressGroup() {
		return this.addressGroup;
	}

	public void setAddressGroup(String addressGroup) {
		this.addressGroup = addressGroup;
	}

	public Integer getPeopleNumber() {
		return this.peopleNumber;
	}

	public void setPeopleNumber(Integer peopleNumber) {
		this.peopleNumber = peopleNumber;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getProjectBuilder() {
		return this.projectBuilder;
	}

	public void setProjectBuilder(String projectBuilder) {
		this.projectBuilder = projectBuilder;
	}

	public String getProjectReviewDate() {
		return this.projectReviewDate;
	}

	public void setProjectReviewDate(String projectReviewDate) {
		this.projectReviewDate = projectReviewDate;
	}

	public String getContractReviewDate() {
		return this.contractReviewDate;
	}

	public void setContractReviewDate(String contractReviewDate) {
		this.contractReviewDate = contractReviewDate;
	}

	public String getProjectReviewRemark() {
		return this.projectReviewRemark;
	}

	public void setProjectReviewRemark(String projectReviewRemark) {
		this.projectReviewRemark = projectReviewRemark;
	}

	public String getProjectReviewMaster() {
		return this.projectReviewMaster;
	}

	public void setProjectReviewMaster(String projectReviewMaster) {
		this.projectReviewMaster = projectReviewMaster;
	}

	public String getContractReviewRemark() {
		return this.contractReviewRemark;
	}

	public void setContractReviewRemark(String contractReviewRemark) {
		this.contractReviewRemark = contractReviewRemark;
	}

	public String getContractReviewMaster() {
		return this.contractReviewMaster;
	}

	public void setContractReviewMaster(String contractReviewMaster) {
		this.contractReviewMaster = contractReviewMaster;
	}

//	public Set getProjectDetails() {
//		return this.projectDetails;
//	}
//
//	public void setProjectDetails(Set projectDetails) {
//		this.projectDetails = projectDetails;
//	}

}