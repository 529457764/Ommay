package com.ommay.dao.impl;

/*
 * @author devouty
 * Copyright 2015-2015 devouty. All rights reserved.
 */
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.ommay.dao.BaseDao;
import com.ommay.dao.DoctorDao;
import com.ommay.entity.DoctorSearchUnit;
import com.ommay.entity.DoctorTestUnit;
import com.ommay.entity.Indent;
import com.ommay.entity.IndentGroupMember;
import com.ommay.entity.IndentVip;
import com.ommay.entity.OrderDetail;
import com.ommay.entity.ResultUnit;
import com.ommay.entity.TestResult;

public class DoctorDaoImpl extends BaseDao implements DoctorDao {

	@Override
	public List<DoctorSearchUnit> getAllIndentVipByAccount(String uidIndent) {
		List<DoctorSearchUnit> list = new ArrayList<DoctorSearchUnit>();

		String hql2 = "from IndentVip where uid_indent=" + uidIndent;
		List<Indent> l1;
		List<IndentVip> l2;

		try {
			l2 = super.getCurrentSession().createQuery(hql2).list();
		} catch (Exception e) {
			l2 = new ArrayList<IndentVip>();
		}
		int uid = l2.get(0).getUidIndent();
		String hql1 = "from Indent where uid_indent=" + uid;
		try {
			l1 = super.getCurrentSession().createQuery(hql1).list();
		} catch (Exception e) {
			l1 = new ArrayList<Indent>();
		}
		Iterator<IndentVip> it = l2.iterator();
		Indent i = l1.get(0);
		while (it.hasNext()) {
			DoctorSearchUnit unit = new DoctorSearchUnit();
			IndentVip vip = it.next();
			unit.setUidIndent(vip.getUidIndent());
			unit.setName(vip.getAccountClientIndent());
			unit.setSex(vip.getIndentVipSex());
			unit.setHistory(vip.getIndentVipSicknessHistory());
			if (i.getHasResult()) {
				unit.setStatus("查询结果");
				unit.setOperator(i.getHasResultOperator());
			} else {
				if (i.getFinishIndent()) {
					unit.setStatus("等待体检");
					unit.setOperator(i.getFinishOperator());
				} else {
					if (i.getIsPaid()) {
						unit.setStatus("等待体检");
						unit.setOperator("无");
					} else {
						unit.setStatus("未付款");
						unit.setOperator("无");
					}
				}
			}
			list.add(unit);
		}
		return list;
	}

	@Override
	public List<DoctorSearchUnit> getAllIndentMemberByAccount(String uidIndent) {
		List<DoctorSearchUnit> list = new ArrayList<DoctorSearchUnit>();
		String hql2 = "from IndentGroupMember where uid_indent="
				+ uidIndent;
		List<Indent> l1;
		List<IndentGroupMember> l2;

		try {
			l2 = super.getCurrentSession().createQuery(hql2).list();
		} catch (Exception e) {
			l2 = new ArrayList<IndentGroupMember>();
		}
		int uidIndent2 = l2.get(0).getUidIndent();
		String hql1 = "from Indent where uid_indent=" + uidIndent2;
		try {
			l1 = super.getCurrentSession().createQuery(hql1).list();
		} catch (Exception e) {
			l1 = new ArrayList<Indent>();
		}
		Iterator<IndentGroupMember> it = l2.iterator();
		Indent i = l1.get(0);
		while (it.hasNext()) {
			DoctorSearchUnit unit = new DoctorSearchUnit();
			IndentGroupMember member = it.next();
			unit.setUidIndent(member.getUidIndent());
			unit.setName("无");
			unit.setSex(member.getIndentGroupMemberSex());
			unit.setHistory(member.getIndentGroupMemberSicknessHistory());
			unit.setInc(uidIndent + "");
			if (i.getHasResult()) {
				unit.setStatus("查询结果");
				System.out.println("iiiiiiiiiiiiiiiiiiiiiiiii"
						+ i.getHasResult());
				unit.setOperator(i.getHasResultOperator());
			} else {
				if (i.getFinishIndent()) {
					unit.setStatus("等待体检");
					unit.setOperator(i.getFinishOperator());
				} else {
					if (i.getIsPaid()) {
						unit.setStatus("等待体检");
						unit.setOperator("无");
					} else {
						unit.setStatus("未付款");
						unit.setOperator("无");
					}
				}
			}
			list.add(unit);
		}
		return list;
	}

	@Override
	public List<DoctorTestUnit> getSingleClientTestList(String accountName) {
		List<DoctorTestUnit> list = new ArrayList<DoctorTestUnit>();
		// String hql = "from Indent where uid_indent="+accountName;
		// List<Indent> l1 = null;
		// try{
		// l1 = super.getCurrentSession().createQuery(hql).list();
		// }catch(Exception e){
		// l1 = new ArrayList<Indent>();
		// }
		// Iterator<Indent> it1 = l1.iterator();
		//
		String hql2 = "from IndentVip where account_client_indent='"
				+ accountName + "'";
		List<IndentVip> l2 = null;

		try {
			l2 = super.getCurrentSession().createQuery(hql2).list();
		} catch (Exception e) {
			l2 = new ArrayList<IndentVip>();
		}
		Iterator<IndentVip> it2 = l2.iterator();
		while (it2.hasNext()) {
			IndentVip i2 = it2.next();
			Integer uid = i2.getUidIndent();
			String hql = "from Indent where uid_indent=" + uid;
			List<Indent> l1 = null;
			try {
				l1 = super.getCurrentSession().createQuery(hql).list();
			} catch (Exception e) {
				System.out.println("Try to get from Indent:");
				e.printStackTrace();
				return list;
			}
			Indent i1 = l1.get(0);
			DoctorTestUnit unit = new DoctorTestUnit();
			unit.setUidIndent(i1.getUidIndent());
			unit.setAccount(accountName);
			unit.setName(i2.getIndentVipName());
			unit.setTestTime(i1.getIsPaidDate());
			if (i1.getHasResult()) {
				unit.setOperator(i1.getHasResultOperator());
				unit.setStatus("查询结果");
				unit.setUpdateTime(i1.getHasResultDate());
			} else {
				if (i1.getFinishIndent()) {
					unit.setOperator(i1.getFinishOperator());
					unit.setStatus("等待体检");
					unit.setUpdateTime(i1.getFinishDate());
				} else {
					if (i1.getIsPaid()) {
						unit.setOperator(i1.getIsPaidOperator());
						unit.setStatus("等待体检");
						unit.setUpdateTime(i1.getIsPaidDate());
					} else {
						unit.setStatus("未付款");
						unit.setUpdateTime(i1.getIsPaidDate());
					}
				}
			}
			list.add(unit);
		}
		// while(it1.hasNext())
		// {
		// Indent i1 = it1.next();
		// IndentVip i2 = it2.next();
		// DoctorTestUnit unit = new DoctorTestUnit();
		// unit.setAccount(accountName);
		// unit.setName(i2.getIndentVipName());
		// unit.setTestTime(i1.getIsPaidDate());
		// if(i1.getHasResult().equals("1"))
		// {
		// unit.setOperator(i1.getHasResultOperator());
		// unit.setStatus("查询结果");
		// unit.setUpdateTime(i1.getHasResultDate());
		// }else
		// {
		// if(i1.getFinishIndent().equals("1"))
		// {
		// unit.setOperator(i1.getFinishOperator());
		// unit.setStatus("等待体检");
		// unit.setUpdateTime(i1.getFinishDate());
		// }else
		// {
		// if(i1.getIsPaid().equals("1"))
		// {
		// unit.setOperator(i1.getIsPaidOperator());
		// unit.setStatus("等待体检");
		// unit.setUpdateTime(i1.getIsPaidDate());
		// }else
		// {
		// unit.setStatus("未付款");
		// unit.setUpdateTime(i1.getIsPaidDate());
		// }
		// }
		// }
		// list.add(unit);
		// }

		return list;
	}

	@Override
	public List<ResultUnit> getIndentDetail(String uidIndent) {
		List<ResultUnit> list = new ArrayList<ResultUnit>();
		String hql = "from OrderDetail where uid_indent=" + uidIndent;
		List<OrderDetail> l1;
		try {
			l1 = super.getCurrentSession().createQuery(hql).list();
		} catch (Exception e) {
			l1 = new ArrayList<OrderDetail>();
		}
		Iterator<OrderDetail> it = l1.iterator();
		while (it.hasNext()) {
			OrderDetail u = it.next();
			hql = "from TestResult where uid_order_detail="
					+ u.getUidOrderDetail();
			TestResult t = null;
			try {
				t = (TestResult) super.getCurrentSession().createQuery(hql)
						.uniqueResult();
				// System.out.println("ok");
			} catch (Exception e) {
				// System.out.println("No");
				t = new TestResult();
			}
			ResultUnit unit = new ResultUnit();
			unit.setResult(t.getResult());
			unit.setTestResult(t.getUidTestDetail());
			unit.setUidOrderDetail(u.getUidOrderDetail());
			unit.setName(u.getOrderClientName());
			unit.setTime(u.getOrderTime());
			String hql2 = "from Indent where uid_indent=" + uidIndent;
			try {

				Indent i = (Indent) super.getCurrentSession().createQuery(hql2)
						.uniqueResult();
				if (i.getHasResult()) {
					unit.setOperator(i.getHasResultOperator());
				} else {
					if (i.getFinishIndent()) {
						unit.setOperator(i.getFinishOperator());
					} else {
						if (i.getIsPaid()) {
							unit.setOperator(i.getIsPaidOperator());
						} else {
							unit.setOperator("无操作员");
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			int i = Integer.parseInt(t.getIdPhysicalItem());
			if (i == 1) {
				unit.setType("视力");
			}
			if (i == 2) {
				unit.setType("血液常规检查");
			}
			if (i == 3) {
				unit.setType("头部CT检查");
			}
			if (i == 4) {
				unit.setType("X光检查");
			}
			if (i == 5) {
				unit.setType("耳、鼻、喉、口咽、鼻咽");
			}
			if (i == 6) {
				unit.setType("听力");
			}
			if (i == 7) {
				unit.setType("上腹（肝胆胰脾肾）+泌尿系");
			}
			if (i == 8) {
				unit.setType("上腹（肝胆胰脾肾）+盆腔");
			}
			if (i == 9) {
				unit.setType("白带常规检查");
			}
			if (i == 10) {
				unit.setType("肺活量、一秒用力吐气量、血氧饱和度等");
			}
			if (i == 11) {
				unit.setType("癌症筛查——卵巢肿瘤标记物");
			}
			if (i == 12) {
				unit.setType("癌症筛查——前列腺肿瘤标记物");
			}
			list.add(unit);
		}
		return list;
	}

	@Override
	public void saveResult(String flag, String uidOrderDetail, String result,
			String operator) {

		String hql = "from TestResult where uid_order_detail=" + uidOrderDetail;
		TestResult unit = null;
		try {
			unit = (TestResult) super.getCurrentSession().createQuery(hql)
					.uniqueResult();
		} catch (Exception e) {
			System.out.println("-----------------------New Test Result");
			e.printStackTrace();
			// unit = new TestResult();
		}
		String hql2 = "from OrderDetail where uid_order_detail="
				+ uidOrderDetail;
		OrderDetail o = null;
		try {
			o = (OrderDetail) super.getCurrentSession().createQuery(hql2)
					.uniqueResult();
			Indent i = o.getIndent();
			i.setHasResultOperator(operator);
			Date date = new Date();
			DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
			String time = format.format(date);
			time = time.replaceAll("/", "");
			i.setHasResultDate(time);
			i.setHasResult(true);
			i.setFinishIndent(true);
			System.out.println("tttttttttttttttttttttttttttttttt"
					+ o.getOrderTime());
			super.save(i);
		} catch (Exception e) {
			System.out
					.println("-----------------------Update indent status error");
			e.printStackTrace();
		}

		unit.setResult(result);
		super.save(unit);
		//EGSave(unit);
	}

	private void EGSave(TestResult unit) {
		int uidIndent = unit.getOrderDetail().getIndent().getUidIndent();
		String hql = "from TestResult";
		List<TestResult> list = null;
		try {
			list = super.getCurrentSession().createQuery(hql).list();

			Iterator<TestResult> it = list.iterator();
			while (it.hasNext()) {
				TestResult tr = it.next();
				if (tr.getOrderDetail().getIndent().getUidIndent() == uidIndent) {
					tr.setAccount(unit.getAccount());
					tr.setIdPhysicalItem(unit.getIdPhysicalItem());
					tr.setResult(unit.getResult());
					super.save(tr);
				}
			}
		} catch (Exception e) {
			System.out
					.println("-----------------------EGSave error!!!!!!!!!!!!!!!!!!");
			e.printStackTrace();
		}
	}

}
