package com.ommay.service.impl;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ommay.dao.DoctorDao;
import com.ommay.entity.DoctorSearchUnit;
import com.ommay.entity.DoctorTestUnit;
import com.ommay.service.DoctorService;

public class DoctorServiceImpl implements DoctorService {

	@Autowired
	private DoctorDao doctorDao;

	@Override
	public List<DoctorSearchUnit> getAllIndentVipByAccount(String account) {
		List<DoctorSearchUnit> list = doctorDao
				.getAllIndentVipByAccount(account);
		return list;
	}

	public List<DoctorSearchUnit> getAllIndentMemberByAccount(String account) {
		List<DoctorSearchUnit> list = doctorDao
				.getAllIndentMemberByAccount(account);
		return list;
	}

	@Override
	public List<DoctorTestUnit> getSingleClientTestList(String accountName) {
		return doctorDao.getSingleClientTestList(accountName);
	}

	@Override
	public List getIndentDetail(String uidIndent) {
		return doctorDao.getIndentDetail(uidIndent);
	}

	@Override
	public void saveResult(String result, String flag, String operator) {
		// String l1 = result.split("?")[1];
		// System.out.println("ssssssssssssssssssssssssssssssssssssb"+result);
		String[] l2 = result.split("-");
		String[] l3 = null;
		int size = l2.length;
		for (int i = 0; i < size; i++) {
			// System.out.println(l2[i]);
			l3 = l2[i].split("_");
			// for(int j = 0;j <l3.length;j++)
			// {
			// System.out.println(j+""+l3[j]);
			// }
			doctorDao.saveResult(flag, l3[0], l3[1], operator);
		}
	}

}
