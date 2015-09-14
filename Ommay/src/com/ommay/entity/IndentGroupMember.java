package com.ommay.entity;

/**
 * IndentGroupMember entity. @author MyEclipse Persistence Tools
 */

public class IndentGroupMember implements java.io.Serializable {

	// Fields

	private Integer uidIndentMember;
	private Integer uidIndentGroup;
	private Integer uidIndent;
	private String indentIncName;
	private String indentGroupMemberName;
	private String indentGroupMemberSex;
	private Integer indentGroupMemberAge;
	private String indentGroupMemberSicknessHistory;

	// Constructors

	/** default constructor */
	public IndentGroupMember() {
		this.uidIndentMember = -1;
		this.uidIndentGroup = -1;
		this.uidIndent = -1;
		this.indentIncName = "Unknown";
		this.indentGroupMemberName = "Unknown";
		this.indentGroupMemberSex = "Unknown";
		this.indentGroupMemberAge = -1;
		this.indentGroupMemberSicknessHistory = "Unknown";
	}

	/** full constructor */
	public IndentGroupMember(Integer uidIndentGroup, Integer uidIndent,
			String indentIncName, String indentGroupMemberName,
			String indentGroupMemberSex, Integer indentGroupMemberAge,
			String indentGroupMemberSicknessHistory) {
		this.uidIndentGroup = uidIndentGroup;
		this.uidIndent = uidIndent;
		this.indentIncName = indentIncName;
		this.indentGroupMemberName = indentGroupMemberName;
		this.indentGroupMemberSex = indentGroupMemberSex;
		this.indentGroupMemberAge = indentGroupMemberAge;
		this.indentGroupMemberSicknessHistory = indentGroupMemberSicknessHistory;
	}

	// Property accessors

	public Integer getUidIndentMember() {
		return this.uidIndentMember;
	}

	public void setUidIndentMember(Integer uidIndentMember) {
		this.uidIndentMember = uidIndentMember;
	}

	public Integer getUidIndentGroup() {
		return this.uidIndentGroup;
	}

	public void setUidIndentGroup(Integer uidIndentGroup) {
		this.uidIndentGroup = uidIndentGroup;
	}

	public Integer getUidIndent() {
		return this.uidIndent;
	}

	public void setUidIndent(Integer uidIndent) {
		this.uidIndent = uidIndent;
	}

	public String getIndentIncName() {
		return this.indentIncName;
	}

	public void setIndentIncName(String indentIncName) {
		this.indentIncName = indentIncName;
	}

	public String getIndentGroupMemberName() {
		return this.indentGroupMemberName;
	}

	public void setIndentGroupMemberName(String indentGroupMemberName) {
		this.indentGroupMemberName = indentGroupMemberName;
	}

	public String getIndentGroupMemberSex() {
		return this.indentGroupMemberSex;
	}

	public void setIndentGroupMemberSex(String indentGroupMemberSex) {
		this.indentGroupMemberSex = indentGroupMemberSex;
	}

	public Integer getIndentGroupMemberAge() {
		return this.indentGroupMemberAge;
	}

	public void setIndentGroupMemberAge(Integer indentGroupMemberAge) {
		this.indentGroupMemberAge = indentGroupMemberAge;
	}

	public String getIndentGroupMemberSicknessHistory() {
		return this.indentGroupMemberSicknessHistory;
	}

	public void setIndentGroupMemberSicknessHistory(
			String indentGroupMemberSicknessHistory) {
		this.indentGroupMemberSicknessHistory = indentGroupMemberSicknessHistory;
	}

}