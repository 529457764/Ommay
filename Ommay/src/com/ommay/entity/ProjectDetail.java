package com.ommay.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * ProjectDetail entity. @author MyEclipse Persistence Tools
 */

public class ProjectDetail implements java.io.Serializable {

	// Fields
	private Integer uidProjectDetail;
	private Project project;
	private String testType;
	private Integer number;
	private String packageName;
	private String packageNumber;
	private String packageClientName;
	private String packageSex;
	private Integer packageAgeUpper;
	private Integer packageAgeLower;
//	private Set orderDetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public ProjectDetail() {
		this.project = new Project();
		this.testType = "";
		this.number = 0;
		this.packageName = "";
		this.packageNumber = "";
		this.packageClientName = "";
		this.packageSex = "";
		this.packageAgeUpper = 99;
		this.packageAgeLower = 0;
	}

	/** full constructor */
	public ProjectDetail(Project project, String testType, Integer number,
			String packageName, String packageNumber, String packageClientName,
			String packageSex, Integer packageAgeUpper,
			Integer packageAgeLower, Set orderDetails) {
		this.project = project;
		this.testType = testType;
		this.number = number;
		this.packageName = packageName;
		this.packageNumber = packageNumber;
		this.packageClientName = packageClientName;
		this.packageSex = packageSex;
		this.packageAgeUpper = packageAgeUpper;
		this.packageAgeLower = packageAgeLower;
//		this.orderDetails = orderDetails;
	}

	// Property accessors

	public Integer getUidProjectDetail() {
		return this.uidProjectDetail;
	}

	public void setUidProjectDetail(Integer uidProjectDetail) {
		this.uidProjectDetail = uidProjectDetail;
	}

	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public String getTestType() {
		return this.testType;
	}

	public void setTestType(String testType) {
		this.testType = testType;
	}

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getPackageName() {
		return this.packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getPackageNumber() {
		return this.packageNumber;
	}
	
	public void setPackageNumber(String packageNumber) {
		this.packageNumber = packageNumber;
	}
	
	public String getPackageClientName() {
		return this.packageClientName;
	}

	public void setPackageClientName(String packageClientName) {
		this.packageClientName = packageClientName;
	}

	public String getPackageSex() {
		return this.packageSex;
	}

	public void setPackageSex(String packageSex) {
		this.packageSex = packageSex;
	}

	public Integer getPackageAgeUpper() {
		return this.packageAgeUpper;
	}

	public void setPackageAgeUpper(Integer packageAgeUpper) {
		this.packageAgeUpper = packageAgeUpper;
	}

	public Integer getPackageAgeLower() {
		return this.packageAgeLower;
	}

	public void setPackageAgeLower(Integer packageAgeLower) {
		this.packageAgeLower = packageAgeLower;
	}

	public void setSuitAgeLower(int parseInt) {
		this.setPackageAgeLower(parseInt);
	}

	public String getSuitNumber() {
		return this.getPackageNumber();
	}
	public void setSuitNumber(String suit_number)
	{
		this.setPackageNumber(suit_number);
		
	}
	public String getSuitAgeLower() {
		return this.getPackageAgeLower()+"";
	}

	public String getSuitAgeUpper() {
		return this.getPackageAgeUpper()+"";
	}

	public String getSuitClientName() {
		return this.getPackageClientName();
	}

	public String getSuitName() {
		return this.getPackageName();
	}

	public String getSuitSex() {
		return this.getPackageSex();
	}

	public void setSuitAgeUpper(int parseInt) {
		this.setPackageAgeUpper(parseInt);
	}

	public void setSuitClientName(String suit_client_name) {
		this.setPackageClientName(suit_client_name);
		
	}

	public void setSuitName(String suit_name) {
		this.setPackageName(suit_name);
	}

	public void setSuitSex(String suit_sex) {
		this.setPackageSex(suit_sex);
		
	}

//	public Set getOrderDetails() {
//		return this.orderDetails;
//	}
//
//	public void setOrderDetails(Set orderDetails) {
//		this.orderDetails = orderDetails;
//	}

}