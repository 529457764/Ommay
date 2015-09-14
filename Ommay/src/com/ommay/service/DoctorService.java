package com.ommay.service;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
import java.util.List;

import com.ommay.entity.DoctorSearchUnit;
import com.ommay.entity.DoctorTestUnit;

public interface DoctorService {

	List<DoctorSearchUnit> getAllIndentVipByAccount(String account);

	List<DoctorSearchUnit> getAllIndentMemberByAccount(String account);

	List<DoctorTestUnit> getSingleClientTestList(String accountName);

	List getIndentDetail(String uidIndent);

	void saveResult(String result, String flag, String operator);
}
