package com.ommay.entity;

/**
 * PhysicalItem entity. @author MyEclipse Persistence Tools
 */

public class PhysicalItem implements java.io.Serializable {

	// Fields

	private String idItem;
	private String nameItem;
	private String typeItem;
	private String departmentItem;
	private Integer priceItem;
	private String genderItem;
	private Integer capacityItem;

	// Constructors

	/** default constructor */
	public PhysicalItem() {
	}

	/** full constructor */
	public PhysicalItem(String idItem, String nameItem, String typeItem,
			String departmentItem, Integer priceItem, String genderItem,
			Integer capacityItem) {
		this.idItem = idItem;
		this.nameItem = nameItem;
		this.typeItem = typeItem;
		this.departmentItem = departmentItem;
		this.priceItem = priceItem;
		this.genderItem = genderItem;
		this.capacityItem = capacityItem;
	}

	// Property accessors

	public String getIdItem() {
		return this.idItem;
	}

	public void setIdItem(String idItem) {
		this.idItem = idItem;
	}

	public String getNameItem() {
		return this.nameItem;
	}

	public void setNameItem(String nameItem) {
		this.nameItem = nameItem;
	}

	public String getTypeItem() {
		return this.typeItem;
	}

	public void setTypeItem(String typeItem) {
		this.typeItem = typeItem;
	}

	public String getDepartmentItem() {
		return this.departmentItem;
	}

	public void setDepartmentItem(String departmentItem) {
		this.departmentItem = departmentItem;
	}

	public Integer getPriceItem() {
		return this.priceItem;
	}

	public void setPriceItem(Integer priceItem) {
		this.priceItem = priceItem;
	}

	public String getGenderItem() {
		return this.genderItem;
	}

	public void setGenderItem(String genderItem) {
		this.genderItem = genderItem;
	}

	public Integer getCapacityItem() {
		return this.capacityItem;
	}

	public void setCapacityItem(Integer capacityItem) {
		this.capacityItem = capacityItem;
	}

}