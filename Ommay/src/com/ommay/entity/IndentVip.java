package com.ommay.entity;

/**
 * IndentVip entity. @author MyEclipse Persistence Tools
 */

public class IndentVip implements java.io.Serializable {

	// Fields

	private Integer uidIndentVip;
	private Integer uidIndent;
	private Integer uidProject;
	private String accountClientIndent;
	private String indentVipName;
	private String indentVipSex;
	private String indentVipPhone;
	private String indentVipIdcard;
	private String indentVipEmail;
	private String indentVipAddress;
	private String indentVipSicknessHistory;

	// Constructors

	/** default constructor */
	public IndentVip() {
		this.uidIndentVip = -1;
		this.uidIndent = -1;
		this.uidProject = -1;
		this.accountClientIndent = accountClientIndent;
		this.indentVipName = indentVipName;
		this.indentVipSex = indentVipSex;
		this.indentVipPhone = indentVipPhone;
		this.indentVipIdcard = indentVipIdcard;
		this.indentVipEmail = indentVipEmail;
		this.indentVipAddress = indentVipAddress;
		this.indentVipSicknessHistory = indentVipSicknessHistory;
	}

	/** full constructor */
	public IndentVip(Integer uidIndent, Integer uidProject,
			String accountClientIndent, String indentVipName,
			String indentVipSex, String indentVipPhone, String indentVipIdcard,
			String indentVipEmail, String indentVipAddress,
			String indentVipSicknessHistory) {
		this.uidIndent = uidIndent;
		this.uidProject = uidProject;
		this.accountClientIndent = accountClientIndent;
		this.indentVipName = indentVipName;
		this.indentVipSex = indentVipSex;
		this.indentVipPhone = indentVipPhone;
		this.indentVipIdcard = indentVipIdcard;
		this.indentVipEmail = indentVipEmail;
		this.indentVipAddress = indentVipAddress;
		this.indentVipSicknessHistory = indentVipSicknessHistory;
	}

	// Property accessors

	public Integer getUidIndentVip() {
		return this.uidIndentVip;
	}

	public void setUidIndentVip(Integer uidIndentVip) {
		this.uidIndentVip = uidIndentVip;
	}

	public Integer getUidIndent() {
		return this.uidIndent;
	}

	public void setUidIndent(Integer uidIndent) {
		this.uidIndent = uidIndent;
	}

	public Integer getUidProject() {
		return this.uidProject;
	}

	public void setUidProject(Integer uidProject) {
		this.uidProject = uidProject;
	}

	public String getAccountClientIndent() {
		return this.accountClientIndent;
	}

	public void setAccountClientIndent(String accountClientIndent) {
		this.accountClientIndent = accountClientIndent;
	}

	public String getIndentVipName() {
		return this.indentVipName;
	}

	public void setIndentVipName(String indentVipName) {
		this.indentVipName = indentVipName;
	}

	public String getIndentVipSex() {
		return this.indentVipSex;
	}

	public void setIndentVipSex(String indentVipSex) {
		this.indentVipSex = indentVipSex;
	}

	public String getIndentVipPhone() {
		return this.indentVipPhone;
	}

	public void setIndentVipPhone(String indentVipPhone) {
		this.indentVipPhone = indentVipPhone;
	}

	public String getIndentVipIdcard() {
		return this.indentVipIdcard;
	}

	public void setIndentVipIdcard(String indentVipIdcard) {
		this.indentVipIdcard = indentVipIdcard;
	}

	public String getIndentVipEmail() {
		return this.indentVipEmail;
	}

	public void setIndentVipEmail(String indentVipEmail) {
		this.indentVipEmail = indentVipEmail;
	}

	public String getIndentVipAddress() {
		return this.indentVipAddress;
	}

	public void setIndentVipAddress(String indentVipAddress) {
		this.indentVipAddress = indentVipAddress;
	}

	public String getIndentVipSicknessHistory() {
		return this.indentVipSicknessHistory;
	}

	public void setIndentVipSicknessHistory(String indentVipSicknessHistory) {
		this.indentVipSicknessHistory = indentVipSicknessHistory;
	}

}