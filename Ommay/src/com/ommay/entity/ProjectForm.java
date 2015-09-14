package com.ommay.entity;
/**
 * @author hs 2015/8/21
 */
import java.util.Random;

import com.ommay.utils.RandomUtils;
import com.ommay.utils.TimeUtils;

public class ProjectForm {
	// Fields
	public String  createDate;
	public int uidProject;
	public String clientName;
	public String addressGroup;
	public int peopleNumber;
	
	public String timeBegin;
	public String beginYear;
	public String beginMonth;
	public String beginDay;
	
	public String timeEnd;
	public String endYear;
	public String endMonth;
	public String endDay;
	
	public String nameMaster;
	public String phoneMaster;
	
	public String workingPhoneMaster;
	public String areaNumber;
	public String phoneNumber;
	
	public String emailGroup;
	public String nameWorker;
	
	
	
	public ProjectForm() {
		super();
	}
	public ProjectForm(String createDate, int uidProject, String clientName,
			String addressGroup, int peopleNumber, String beginYear,
			String beginMonth, String beginDay, String endYear,
			String endMonth, String endDay, String nameMaster,
			String phoneMaster, String areaNumber, String phoneNumber,
			String emailGroup, String nameWorker) {
		super();
		this.createDate = createDate;
//		this.createDate = TimeUtils.getNowDate();
		this.uidProject = uidProject;
//		this.uidProject = Integer.valueOf(new RandomUtils().getRandoms());
		this.clientName = clientName;
		this.addressGroup = addressGroup;
		this.peopleNumber = peopleNumber;
		this.beginYear = beginYear;
		this.beginMonth = beginMonth;
		this.beginDay = beginDay;
		this.endYear = endYear;
		this.endMonth = endMonth;
		this.endDay = endDay;
		this.nameMaster = nameMaster;
		this.phoneMaster = phoneMaster;
		this.areaNumber = areaNumber;
		this.phoneNumber = phoneNumber;
		this.emailGroup = emailGroup;
		this.nameWorker = nameWorker;
	}
	public String getCreateDate() {
//		return TimeUtils.getNowDate();
		return TimeUtils.getNowDate();
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getUidProject() {
		if (this.uidProject != 0) {
			return this.uidProject;
		}
		return Integer.valueOf(new RandomUtils().getRandoms());
	}
	public void setUidProject(int uidProject) {
		this.uidProject = uidProject;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getAddressGroup() {
		return addressGroup;
	}
	public void setAddressGroup(String addressGroup) {
		this.addressGroup = addressGroup;
	}
	public int getPeopleNumber() {
		return peopleNumber;
	}
	public void setPeopleNumber(int peopleNumber) {
		this.peopleNumber = peopleNumber;
	}
	public String getTimeBegin() {
		return getBeginYear()+getBeginMonth()+getBeginDay();
	}
	public void setTimeBegin(String timeBegin) {
		this.timeBegin = timeBegin;
	}
	public String getBeginYear() {
		return beginYear;
	}
	public void setBeginYear(String beginYear) {
		this.beginYear = beginYear;
	}
	public String getBeginMonth() {
		return beginMonth;
	}
	public void setBeginMonth(String beginMonth) {
		this.beginMonth = beginMonth;
	}
	public String getBeginDay() {
		return beginDay;
	}
	public void setBeginDay(String beginDay) {
		this.beginDay = beginDay;
	}
	public String getTimeEnd() {
		return getEndYear()+getEndMonth()+getEndDay();
	}
	public void setTimeEnd(String timeEnd) {
		this.timeEnd = timeEnd;
	}
	public String getEndYear() {
		return endYear;
	}
	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}
	public String getEndMonth() {
		return endMonth;
	}
	public void setEndMonth(String endMonth) {
		this.endMonth = endMonth;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getNameMaster() {
		return nameMaster;
	}
	public void setNameMaster(String nameMaster) {
		this.nameMaster = nameMaster;
	}
	public String getPhoneMaster() {
		return phoneMaster;
	}
	public void setPhoneMaster(String phoneMaster) {
		this.phoneMaster = phoneMaster;
	}
	public String getWorkingPhoneMaster() {
		return getAreaNumber()+getPhoneNumber();
	}
	public void setWorkingPhoneMaster(String workingPhoneMaster) {
		this.workingPhoneMaster = workingPhoneMaster;
	}
	public String getAreaNumber() {
		return areaNumber;
	}
	public void setAreaNumber(String areaNumber) {
		this.areaNumber = areaNumber;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmailGroup() {
		return emailGroup;
	}
	public void setEmailGroup(String emailGroup) {
		this.emailGroup = emailGroup;
	}
	public String getNameWorker() {
		return nameWorker;
	}
	public void setNameWorker(String nameWorker) {
		this.nameWorker = nameWorker;
	}
	
	
	
}
