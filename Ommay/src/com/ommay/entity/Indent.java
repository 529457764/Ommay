package com.ommay.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Indent entity. @author MyEclipse Persistence Tools
 */

public class Indent implements java.io.Serializable {

	// Fields

	private Integer uidIndent;
	private Boolean isPaid;
	private String isPaidOperator;
	private String isPaidDate;
	private Integer moneyIndent;
	private Boolean finishIndent;
	private String finishOperator;
	private String finishDate;
	private Boolean hasResult;
	private String hasResultOperator;
	private String hasResultDate;
//	private Set orderDetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public Indent() {
		this.uidIndent = -1;
		this.isPaid = false;
		this.isPaidOperator = "Unknown";
		this.isPaidDate = "Unknown";
		this.moneyIndent = -1;
		this.finishIndent = false;
		this.finishOperator = "Unknown";
		this.finishDate = "Unknown";
		this.hasResult = false;
		this.hasResultOperator = "Unknown";
		this.hasResultDate = "Unknown";
	}

	/** full constructor */
	public Indent(Boolean isPaid, String isPaidOperator, String isPaidDate,
			Integer moneyIndent, Boolean finishIndent, String finishOperator,
			String finishDate, Boolean hasResult, String hasResultOperator,
			String hasResultDate, Set orderDetails) {
		this.isPaid = isPaid;
		this.isPaidOperator = isPaidOperator;
		this.isPaidDate = isPaidDate;
		this.moneyIndent = moneyIndent;
		this.finishIndent = finishIndent;
		this.finishOperator = finishOperator;
		this.finishDate = finishDate;
		this.hasResult = hasResult;
		this.hasResultOperator = hasResultOperator;
		this.hasResultDate = hasResultDate;
//		this.orderDetails = orderDetails;
	}

	// Property accessors

	public Integer getUidIndent() {
		return this.uidIndent;
	}

	public void setUidIndent(Integer uidIndent) {
		this.uidIndent = uidIndent;
	}

	public Boolean getIsPaid() {
		return this.isPaid;
	}

	public void setIsPaid(Boolean isPaid) {
		this.isPaid = isPaid;
	}

	public String getIsPaidOperator() {
		return this.isPaidOperator;
	}

	public void setIsPaidOperator(String isPaidOperator) {
		this.isPaidOperator = isPaidOperator;
	}

	public String getIsPaidDate() {
		return this.isPaidDate;
	}

	public void setIsPaidDate(String isPaidDate) {
		this.isPaidDate = isPaidDate;
	}

	public Integer getMoneyIndent() {
		return this.moneyIndent;
	}

	public void setMoneyIndent(Integer moneyIndent) {
		this.moneyIndent = moneyIndent;
	}

	public Boolean getFinishIndent() {
		return this.finishIndent;
	}

	public void setFinishIndent(Boolean finishIndent) {
		this.finishIndent = finishIndent;
	}

	public String getFinishOperator() {
		return this.finishOperator;
	}

	public void setFinishOperator(String finishOperator) {
		this.finishOperator = finishOperator;
	}

	public String getFinishDate() {
		return this.finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

	public Boolean getHasResult() {
		return this.hasResult;
	}

	public void setHasResult(Boolean hasResult) {
		this.hasResult = hasResult;
	}

	public String getHasResultOperator() {
		return this.hasResultOperator;
	}

	public void setHasResultOperator(String hasResultOperator) {
		this.hasResultOperator = hasResultOperator;
	}

	public String getHasResultDate() {
		return this.hasResultDate;
	}

	public void setHasResultDate(String hasResultDate) {
		this.hasResultDate = hasResultDate;
	}

//	public Set getOrderDetails() {
//		return this.orderDetails;
//	}
//
//	public void setOrderDetails(Set orderDetails) {
//		this.orderDetails = orderDetails;
//	}

}