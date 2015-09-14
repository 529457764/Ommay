package com.ommay.entity;

/**
 * IndentGroup entity. @author MyEclipse Persistence Tools
 */

public class IndentGroup implements java.io.Serializable {

	// Fields

	private Integer uidIndentGroup;
	private Integer uidIndent;
	private Integer uidProject;
	private String indentGroupName;

	// Constructors

	/** default constructor */
	public IndentGroup() {
		this.uidIndentGroup = -1;
		this.uidIndent = -1;
		this.uidProject = -1;
		this.indentGroupName = "Unknown";
	}

	/** full constructor */
	public IndentGroup(Integer uidIndent, Integer uidProject,
			String indentGroupName) {
		this.uidIndent = uidIndent;
		this.uidProject = uidProject;
		this.indentGroupName = indentGroupName;
	}

	// Property accessors

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

	public Integer getUidProject() {
		return this.uidProject;
	}

	public void setUidProject(Integer uidProject) {
		this.uidProject = uidProject;
	}

	public String getIndentGroupName() {
		return this.indentGroupName;
	}

	public void setIndentGroupName(String indentGroupName) {
		this.indentGroupName = indentGroupName;
	}

}