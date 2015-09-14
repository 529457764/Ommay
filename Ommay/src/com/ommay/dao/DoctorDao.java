package com.ommay.dao;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
import java.util.List;

import com.ommay.entity.DoctorSearchUnit;
import com.ommay.entity.DoctorTestUnit;
import com.ommay.entity.ResultUnit;

public interface DoctorDao {

	List<DoctorSearchUnit> getAllIndentVipByAccount(String account);

	List<DoctorSearchUnit> getAllIndentMemberByAccount(String uidIndent);

	List<DoctorTestUnit> getSingleClientTestList(String accountName);

	List<ResultUnit> getIndentDetail(String uidIndent);

	void saveResult(String flag, String uidOrderDetail, String result,
			String operator);
}
