package com.ommay.service.impl;

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

import org.springframework.beans.factory.annotation.Autowired;

import com.ommay.dao.ProjectDao;
import com.ommay.dao.ProjectDetailDao;
import com.ommay.dao.impl.ProjectDaoImpl;
import com.ommay.entity.AccountGroup;
import com.ommay.entity.Indent;
import com.ommay.entity.IndentVip;
import com.ommay.entity.PhysicalItem;
import com.ommay.entity.Project;
import com.ommay.entity.ProjectDetail;
import com.ommay.entity.QueryIndent4Vip;
import com.ommay.entity.Suit;
import com.ommay.service.ProjectService;

public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private ProjectDetailDao projectDetailDao;

	public List<Project> getAllGroupProject() {
		List<Project> list = ((ProjectDaoImpl) projectDao)
				.queryAllGroupProject();
		Iterator it = list.iterator();
		while (it.hasNext()) {
			Project project = (Project) it.next();
			if (project.getContractReviewFlag()) {
				project.setStatus("合同审批已通过");
			} else {
				if (project.getProjectReviewFlag()) {
					project.setStatus("项目审批已通过");
				} else {
					project.setStatus("项目待审批");
				}
			}
		}
		return list;
	}

	public List<QueryIndent4Vip> getAllVipProject() {
		List<IndentVip> indentVipList = ((ProjectDaoImpl) projectDao)
				.queryAllIndentVip();
		List<Indent> indentList = ((ProjectDaoImpl) projectDao)
				.queryAllIndent();
		List<QueryIndent4Vip> list = new ArrayList();
		Iterator indentVipIt = indentVipList.iterator();
		Iterator indentIt;
		while (indentVipIt.hasNext()) {
			indentIt = indentList.iterator();
			IndentVip tempVip = (IndentVip) indentVipIt.next();
			Indent tempIndent = (Indent) indentIt.next();
			if (tempVip.getUidIndentVip().equals(tempIndent.getUidIndent())) {
				QueryIndent4Vip unit = new QueryIndent4Vip();
				unit.setIndentVipName(tempVip.getIndentVipName());
				unit.setIndentVipSex(tempVip.getIndentVipSex());
				unit.setUidIndentVip(tempVip.getUidIndentVip());
				unit.setManager("无");
				if (tempIndent.getHasResult()) {
					unit.setStatus("结果已出");
					unit.setWorker(tempIndent.getHasResultOperator());
				} else {
					if (tempIndent.getFinishIndent()) {
						unit.setStatus("等待结果中");
						unit.setWorker(tempIndent.getFinishOperator());
					} else {
						if (tempIndent.getIsPaid()) {
							unit.setStatus("未完成检查");
							unit.setWorker(tempIndent.getIsPaidOperator());
						} else {
							unit.setStatus("代付款");
							unit.setWorker("无");
						}
					}
				}
				list.add(unit);
			}
		}
		return list;
	}

	public void finishProjectReview(Long uuidProject, boolean isPass) {
		Project project = null;
		ProjectDaoImpl projectDaoImpl = new ProjectDaoImpl();
		project = projectDaoImpl.findById(uuidProject.intValue());
		if (project != null) {
			project.setProjectReviewFlag(isPass);
			projectDaoImpl.update(project);
			System.out.println("Change project review flag successful!");
		} else {
			System.out.println("Change project review flag failed!");
		}
	}

	@Override
	public List getAll() {
		return projectDao.queryAll();
	}

	@Override
	public Project getSingleProjectById(Long uidProject) {
		Project project = projectDao
				.getSingleProjectById(uidProject.intValue());
		if (project.getContractReviewFlag()) {
			project.setStatus("合同审批已通过");
		} else {
			if (project.getProjectReviewFlag()) {
				project.setStatus("项目审批已通过");
			} else {
				project.setStatus("项目登记");
			}
		}
		return project;
	}

	@Override
	public List getPhysicalItem() {
		List physicalItem = projectDao.getPhysicalItem();
		return physicalItem;
	}

	@Override
	public void save(Project project) {
		projectDao.save(project);
	}

	@Override
	public List<Project> workerGetOwnerProject(String account_worker) {
		List<Project> projectList = projectDao
				.workerGetOwnerProject(account_worker);
		Iterator it = projectList.iterator();
		while (it.hasNext()) {
			Project project = (Project) it.next();
			if (project.getContractReviewFlag()) {
				project.setStatus("合同审批已通过");
			} else {
				if (project.getProjectReviewFlag()) {
					project.setStatus("项目审批已通过");
				} else {
					project.setStatus("项目待审批");
				}
			}
		}
		return projectList;
	}

	public AccountGroup getSingleWorker(String accountWorker) {
		return projectDao.getSingleAccountGroup(accountWorker);
	}

	@Override
	public List<Suit> getSuitList(Long uidProject) {
		List<Suit> SuitList = new ArrayList<Suit>();
		List<ProjectDetail> projectDetailList = projectDetailDao
				.queryAllByProjectId(uidProject.intValue());
		com.ommay.entity.Suit unit = null;

		if (projectDetailList.size() != 0)// 数据库中存了东西
		{
			List<String> SuitIdList = getSuitIdList(projectDetailList);
			Iterator<String> SuitIdIt = SuitIdList.iterator();
			while (SuitIdIt.hasNext()) {
				unit = new Suit();
				String id = SuitIdIt.next();
				projectDetailList = projectDetailDao.queryAllByPackageId(id);
				Iterator<ProjectDetail> it = projectDetailList.iterator();
				String SuitSingleId = null, column = null;
				// 记录每个unit的勾上了的项
				while (it.hasNext()) {
					SuitSingleId = it.next().getSuitNumber();
					column = SuitSingleId.substring(SuitSingleId.length() - 2,
							SuitSingleId.length());
					Integer i = Integer.parseInt(column);
					saveSuitSingleColumn(unit, i);
				}
				// 记录一个unit的属性
				ProjectDetail projectDetail = projectDetailList.get(0);
				unit.setSuit_age_lower(projectDetail.getSuitAgeLower() + "");
				unit.setSuit_age_upper(projectDetail.getSuitAgeUpper() + "");
				unit.setSuit_client_name(projectDetail.getSuitClientName());
				unit.setSuit_name(projectDetail.getSuitName());
				unit.setSuit_number(id);
				unit.setSuit_sex(projectDetail.getSuitSex());
				unit.setProject_id(projectDetail.getProject().getUidProject()
						+ "");
				unit.setSuit_selected_number(unit.getNumber_item1()
						+ unit.getNumber_item2() + unit.getNumber_item3()
						+ unit.getNumber_item4() + unit.getNumber_item5()
						+ unit.getNumber_item6() + unit.getNumber_item7()
						+ unit.getNumber_item8() + unit.getNumber_item9()
						+ unit.getNumber_item10() + unit.getNumber_item11()
						+ unit.getNumber_item12());
				unit.setSuit_sum(getSelectedSum(unit));
				SuitList.add(unit);
			}

		}
		System.out.println("SuitList's size == " + SuitList.size());
		return SuitList;
	}

	public Suit getSuit(Long uidProject) {
		Suit suit = new Suit();
		suit.setProject_id(uidProject + "");
		int number = getSuitIdList(
				projectDetailDao.queryAllByProjectId(uidProject.intValue()))
				.size();
		suit.setSuit_number(uidProject + "" + (number + 1) + "");
		System.out.println("bbb: " + suit.getSuit_number());
		return suit;

	}

	public void saveSuit(Suit suit) {
		ProjectDetail projectDetail = null;
		List<String> list = getSuitIdList(projectDetailDao
				.queryAllByProjectId(Integer.parseInt(suit.getProject_id())));
		int number = list.size();
		if (number == 5) {
			System.out.println("SuitListNumber is 5");
			return;
		}
		String detail = "";
		if (suit.getNumber_item1() == 1) {
			projectDetail = new ProjectDetail();
			projectDetail.setSuitAgeLower(Integer.parseInt(suit
					.getSuit_age_lower()));
			projectDetail.setSuitAgeUpper(Integer.parseInt(suit
					.getSuit_age_upper()));
			projectDetail.setSuitClientName(suit.getSuit_client_name());
			projectDetail.setSuitName(suit.getSuit_name());
			projectDetail.setSuitSex(suit.getSuit_sex());
			projectDetail.setNumber((int) (projectDao.getPhysicalItemNum()+1));
			projectDetail.setTestType("视力");
			projectDetail.setProject(projectDao.getSingleProjectById(Integer
					.parseInt((suit.getProject_id()))));
			projectDetail.setSuitNumber(suit.getProject_id() + (number + 1)
					+ "01");
			projectDetailDao.save(projectDetail);
			detail = detail + "视力,";
		}
		if (suit.getNumber_item2() == 1) {
			projectDetail = new ProjectDetail();
			projectDetail.setSuitAgeLower(Integer.parseInt(suit
					.getSuit_age_lower()));
			projectDetail.setSuitAgeUpper(Integer.parseInt(suit
					.getSuit_age_upper()));
			projectDetail.setSuitClientName(suit.getSuit_client_name());
			projectDetail.setSuitName(suit.getSuit_name());
			projectDetail.setSuitSex(suit.getSuit_sex());
			projectDetail.setNumber((int) (projectDao.getPhysicalItemNum()+1));
			projectDetail.setTestType("血液常规检查");
			projectDetail.setProject(projectDao.getSingleProjectById(Integer
					.parseInt(suit.getProject_id())));
			projectDetail.setSuitNumber(suit.getProject_id() + (number + 1)
					+ "02");
			projectDetailDao.save(projectDetail);
			detail = detail + "血液常规检查,";
		}
		if (suit.getNumber_item3() == 1) {
			projectDetail = new ProjectDetail();
			projectDetail.setSuitAgeLower(Integer.parseInt(suit
					.getSuit_age_lower()));
			projectDetail.setSuitAgeUpper(Integer.parseInt(suit
					.getSuit_age_upper()));
			projectDetail.setSuitClientName(suit.getSuit_client_name());
			projectDetail.setSuitName(suit.getSuit_name());
			projectDetail.setSuitSex(suit.getSuit_sex());
			projectDetail.setNumber((int) (projectDao.getPhysicalItemNum()+1));
			projectDetail.setTestType("头部CT检查");
			projectDetail.setProject(projectDao.getSingleProjectById(Integer
					.parseInt(suit.getProject_id())));
			projectDetail.setSuitNumber(suit.getProject_id() + (number + 1)
					+ "03");
			projectDetailDao.save(projectDetail);
			detail = detail + "头部CT检查,";
		}
		if (suit.getNumber_item4() == 1) {
			projectDetail = new ProjectDetail();
			projectDetail.setSuitAgeLower(Integer.parseInt(suit
					.getSuit_age_lower()));
			projectDetail.setSuitAgeUpper(Integer.parseInt(suit
					.getSuit_age_upper()));
			projectDetail.setSuitClientName(suit.getSuit_client_name());
			projectDetail.setSuitName(suit.getSuit_name());
			projectDetail.setSuitSex(suit.getSuit_sex());
			projectDetail.setNumber((int) (projectDao.getPhysicalItemNum()+1));
			projectDetail.setTestType("X光检查");
			projectDetail.setProject(projectDao.getSingleProjectById(Integer
					.parseInt(suit.getProject_id())));
			projectDetail.setSuitNumber(suit.getProject_id() + (number + 1)
					+ "04");
			projectDetailDao.save(projectDetail);
			detail = detail + "X光检查,";
		}
		if (suit.getNumber_item5() == 1) {
			projectDetail = new ProjectDetail();
			projectDetail.setSuitAgeLower(Integer.parseInt(suit
					.getSuit_age_lower()));
			projectDetail.setSuitAgeUpper(Integer.parseInt(suit
					.getSuit_age_upper()));
			projectDetail.setSuitClientName(suit.getSuit_client_name());
			projectDetail.setSuitName(suit.getSuit_name());
			projectDetail.setSuitSex(suit.getSuit_sex());
			projectDetail.setNumber((int) (projectDao.getPhysicalItemNum()+1));
			projectDetail.setTestType("耳、鼻、喉、口咽、鼻咽");
			projectDetail.setProject(projectDao.getSingleProjectById(Integer
					.parseInt(suit.getProject_id())));
			projectDetail.setSuitNumber(suit.getProject_id() + (number + 1)
					+ "05");
			projectDetailDao.save(projectDetail);
			detail = detail + "耳、鼻、喉、口咽、鼻咽,";
		}
		if (suit.getNumber_item6() == 1) {
			projectDetail = new ProjectDetail();
			projectDetail.setSuitAgeLower(Integer.parseInt(suit
					.getSuit_age_lower()));
			projectDetail.setSuitAgeUpper(Integer.parseInt(suit
					.getSuit_age_upper()));
			projectDetail.setSuitClientName(suit.getSuit_client_name());
			projectDetail.setSuitName(suit.getSuit_name());
			projectDetail.setSuitSex(suit.getSuit_sex());
			projectDetail.setNumber((int) (projectDao.getPhysicalItemNum()+1));
			projectDetail.setTestType("听力");
			projectDetail.setProject(projectDao.getSingleProjectById(Integer
					.parseInt(suit.getProject_id())));
			projectDetail.setSuitNumber(suit.getProject_id() + (number + 1)
					+ "06");
			projectDetailDao.save(projectDetail);
			detail = detail + "听力,";
		}
		if (suit.getNumber_item7() == 1) {
			projectDetail = new ProjectDetail();
			projectDetail.setSuitAgeLower(Integer.parseInt(suit
					.getSuit_age_lower()));
			projectDetail.setSuitAgeUpper(Integer.parseInt(suit
					.getSuit_age_upper()));
			projectDetail.setSuitClientName(suit.getSuit_client_name());
			projectDetail.setSuitName(suit.getSuit_name());
			projectDetail.setSuitSex(suit.getSuit_sex());
			projectDetail.setNumber((int) (projectDao.getPhysicalItemNum()+1));
			projectDetail.setTestType("上腹（肝胆胰脾肾）+泌尿系");
			projectDetail.setProject(projectDao.getSingleProjectById(Integer
					.parseInt(suit.getProject_id())));
			projectDetail.setSuitNumber(suit.getProject_id() + (number + 1)
					+ "07");
			projectDetailDao.save(projectDetail);
			detail = detail + "上腹（肝胆胰脾肾）+泌尿系,";
		}
		if (suit.getNumber_item8() == 1) {
			projectDetail = new ProjectDetail();
			projectDetail.setSuitAgeLower(Integer.parseInt(suit
					.getSuit_age_lower()));
			projectDetail.setSuitAgeUpper(Integer.parseInt(suit
					.getSuit_age_upper()));
			projectDetail.setSuitClientName(suit.getSuit_client_name());
			projectDetail.setSuitName(suit.getSuit_name());
			projectDetail.setSuitSex(suit.getSuit_sex());
			projectDetail.setNumber((int) (projectDao.getPhysicalItemNum()+1));
			projectDetail.setTestType("上腹（肝胆胰脾肾）+盆腔");
			projectDetail.setProject(projectDao.getSingleProjectById(Integer
					.parseInt(suit.getProject_id())));
			projectDetail.setSuitNumber(suit.getProject_id() + (number + 1)
					+ "08");
			projectDetailDao.save(projectDetail);
			detail = detail + "上腹（肝胆胰脾肾）+盆腔,";
		}
		if (suit.getNumber_item9() == 1) {
			projectDetail = new ProjectDetail();
			projectDetail.setSuitAgeLower(Integer.parseInt(suit
					.getSuit_age_lower()));
			projectDetail.setSuitAgeUpper(Integer.parseInt(suit
					.getSuit_age_upper()));
			projectDetail.setSuitClientName(suit.getSuit_client_name());
			projectDetail.setSuitName(suit.getSuit_name());
			projectDetail.setSuitSex(suit.getSuit_sex());
			projectDetail.setNumber((int) (projectDao.getPhysicalItemNum()+1));
			projectDetail.setTestType("白带常规检查");
			projectDetail.setProject(projectDao.getSingleProjectById(Integer
					.parseInt(suit.getProject_id())));
			projectDetail.setSuitNumber(suit.getProject_id() + (number + 1)
					+ "09");
			projectDetailDao.save(projectDetail);
			detail = detail + "白带常规检查,";
		}
		if (suit.getNumber_item10() == 1) {
			projectDetail = new ProjectDetail();
			projectDetail.setSuitAgeLower(Integer.parseInt(suit
					.getSuit_age_lower()));
			projectDetail.setSuitAgeUpper(Integer.parseInt(suit
					.getSuit_age_upper()));
			projectDetail.setSuitClientName(suit.getSuit_client_name());
			projectDetail.setSuitName(suit.getSuit_name());
			projectDetail.setSuitSex(suit.getSuit_sex());
			projectDetail.setNumber((int) (projectDao.getPhysicalItemNum()+1));
			projectDetail.setTestType("肺活量、一秒用力吐气量、血氧饱和度等");
			projectDetail.setProject(projectDao.getSingleProjectById(Integer
					.parseInt(suit.getProject_id())));
			projectDetail.setSuitNumber(suit.getProject_id() + (number + 1)
					+ "10");
			projectDetailDao.save(projectDetail);
			detail = detail + "肺活量、一秒用力吐气量、血氧饱和度等,";
		}
		if (suit.getNumber_item11() == 1) {
			projectDetail = new ProjectDetail();
			projectDetail.setSuitAgeLower(Integer.parseInt(suit
					.getSuit_age_lower()));
			projectDetail.setSuitAgeUpper(Integer.parseInt(suit
					.getSuit_age_upper()));
			projectDetail.setSuitClientName(suit.getSuit_client_name());
			projectDetail.setSuitName(suit.getSuit_name());
			projectDetail.setSuitSex(suit.getSuit_sex());
			projectDetail.setNumber((int) (projectDao.getPhysicalItemNum()+1));
			projectDetail.setTestType("癌症筛查——卵巢肿瘤标记物");
			projectDetail.setProject(projectDao.getSingleProjectById(Integer
					.parseInt(suit.getProject_id())));
			projectDetail.setSuitNumber(suit.getProject_id() + (number + 1)
					+ "11");
			projectDetailDao.save(projectDetail);
			detail = detail + "癌症筛查——卵巢肿瘤标记物,";
		}
		if (suit.getNumber_item12() == 1) {
			projectDetail = new ProjectDetail();
			projectDetail.setSuitAgeLower(Integer.parseInt(suit
					.getSuit_age_lower()));
			projectDetail.setSuitAgeUpper(Integer.parseInt(suit
					.getSuit_age_upper()));
			projectDetail.setSuitClientName(suit.getSuit_client_name());
			projectDetail.setSuitName(suit.getSuit_name());
			projectDetail.setSuitSex(suit.getSuit_sex());
			projectDetail.setNumber((int) (projectDao.getPhysicalItemNum()+1));
			projectDetail.setTestType("癌症筛查——前列腺肿瘤标记物");
			projectDetail.setProject(projectDao.getSingleProjectById(Integer
					.parseInt(suit.getProject_id())));
			projectDetail.setSuitNumber(suit.getProject_id() + (number + 1)
					+ "12");
			projectDetailDao.save(projectDetail);
			detail = detail + "癌症筛查——前列腺肿瘤标记物,";
		}

		/*
		 * 这里开始保存套餐进physical item
		 */
		if (detail.length() > 1)
			detail = detail.substring(0, detail.length() - 1);
		else
			detail = suit.getSuit_name();
		long physicalNum = projectDao.getPhysicalItemNum();
		PhysicalItem pUnit = new PhysicalItem();
		pUnit.setIdItem((physicalNum + 1) + "");
		pUnit.setNameItem(suit.getSuit_name());
		pUnit.setPriceItem(suit.getSuit_sum());
		pUnit.setGenderItem("both");
		pUnit.setCapacityItem(5000);
		pUnit.setDepartmentItem("综合科室");
		pUnit.setTypeItem(detail);
		projectDao.save(pUnit);
	}

	/*
	 * 下面这段是一开始写死五个套餐的
	 */
	// @Override
	// public List<Suit> getSuitList(Long uidProject) {
	// List<Suit> SuitList = new ArrayList<Suit>();
	// List<ProjectDetail> projectDetailList =
	// projectDetailDao.queryAllByProjectId(uidProject);
	// com.ommay.entity.Suit unit = null;
	//
	//
	// if(projectDetailList.size() != 0)//数据库中存了东西
	// {
	// List<String> SuitIdList = getSuitIdList(projectDetailList);
	// Iterator<String> SuitIdIt = SuitIdList.iterator();
	// while(SuitIdIt.hasNext())
	// {
	// unit = new Suit();
	// String id = SuitIdIt.next();
	// projectDetailList = projectDetailDao.queryAllBySuitId(id);
	// Iterator<ProjectDetail> it = projectDetailList.iterator();
	// String SuitSingleId = null,column = null;
	// //记录每个unit的勾上了的项
	// while(it.hasNext())
	// {
	// SuitSingleId = it.next().getSuitNumber();
	// column = SuitSingleId.substring(SuitSingleId.length()-3,
	// SuitSingleId.length()-1);
	// Integer i = Integer.parseInt(column);
	// int number[] = unit.getNumber_item();
	// number[i] = 1;
	// boolean flag[] = unit.getFlag_item();
	// flag[i] = true;
	// }
	// //记录一个unit的属性
	// ProjectDetail projectDetail = projectDetailList.get(0);
	// unit.setSuit_age_lower(projectDetail.getSuitAgeLower()+"");
	// unit.setSuit_age_upper(projectDetail.getSuitAgeUpper()+"");
	// unit.setSuit_client_name(projectDetail.getSuitClientName());
	// unit.setSuit_name(projectDetail.getSuitName());
	// unit.setSuit_number(id);
	// unit.setSuit_sex(projectDetail.getSuitSex());
	// unit.setProject_id(projectDetail.getProject().getUidProject()+"");
	// SuitList.add(unit);
	// }
	// int size = SuitList.size();
	// if(size < 5)//没有5个套餐，这里要填满套餐
	// {
	// for(int i = 0;i<5-size;i++)
	// {
	// unit = new Suit();
	// unit.setProject_id(SuitList.get(0).getProject_id());
	// SuitList.add(unit);
	// }
	// }
	// }else//数据库没存东西
	// {
	// for(int i = 0;i<5;i++)
	// {
	// unit = new Suit();
	// unit.setProject_id(SuitList.get(0).getProject_id());
	// SuitList.add(unit);
	// }
	// }
	// System.out.println("SuitList's size == "+SuitList.size());
	// return SuitList;
	// }

	// public void saveSuitListIntoProjectWithBooleanFlag(List<Suit>
	// SuitList)
	// {
	// Iterator<Suit> it = SuitList.iterator();
	// while(it.hasNext())
	// {
	// // create table project_detail
	// // (
	// // uid_project_detail bigint auto_increment,
	// // uid_project bigint,/*外键*/
	// // test_type varchar(20)default '未定义',/*套餐类型*/
	// // number int default 0,/*套餐数*/
	// // Suit_name varchar(20) default '未定义',
	// // Suit_number varchar(50) default '0',
	// // Suit_client_name varchar(50) default '未定义',
	// // Suit_sex varchar(10) default '女',
	// // Suit_age_upper int default 99,
	// // Suit_age_lower int default 0,
	// // primary key (uid_project_detail),
	// // foreign key (uid_project) references project (uid_project)
	// // )ENGINE=InnoDB DEFAULT CHARSET=utf8;
	// Suit unit = it.next();
	// boolean flag[] = unit.getFlag_item();
	// ProjectDetail projectDetail = null;
	// String projectId = unit.getProject_id();
	// for(int i = 0;i < 12; i++)
	// {
	// if(flag[i])
	// {
	// projectDetail = new ProjectDetail();
	// projectDetail.setProject(projectDao.getSingleProjectById(Long.parseLong(projectId)).get(0));
	// //projectDetail.setTestType(projectDao.getPhysicalItem().get(i).getTypeItem());
	// projectDetail.setSuitAgeLower(Integer.parseInt(unit.getSuit_age_lower()));
	// projectDetail.setSuitAgeUpper(Integer.parseInt(unit.getSuit_age_upper()));
	// projectDetail.setSuitClientName(unit.getSuit_client_name());
	// projectDetail.setSuitName(unit.getSuit_name());
	// if(i<10)
	// {
	// projectDetail.setSuitNumber(projectId+"0"+(i+1));
	// }
	// else
	// {
	// projectDetail.setSuitNumber(projectId+(i+1));
	// }
	// projectDetail.setSuitSex(unit.getSuit_sex());projectDetail.setNumber(0);
	// }
	// }
	// }
	// }
	// public void saveSuitListIntoProjectWithNumberFlag(List<Suit>
	// SuitList)
	// {
	// Iterator<Suit> it = SuitList.iterator();
	// while(it.hasNext())
	// {
	// // create table project_detail
	// // (
	// // uid_project_detail bigint auto_increment,
	// // uid_project bigint,/*外键*/
	// // test_type varchar(20)default '未定义',/*套餐类型*/
	// // number int default 0,/*套餐数*/
	// // Suit_name varchar(20) default '未定义',
	// // Suit_number varchar(50) default '0',
	// // Suit_client_name varchar(50) default '未定义',
	// // Suit_sex varchar(10) default '女',
	// // Suit_age_upper int default 99,
	// // Suit_age_lower int default 0,
	// // primary key (uid_project_detail),
	// // foreign key (uid_project) references project (uid_project)
	// // )ENGINE=InnoDB DEFAULT CHARSET=utf8;
	// Suit unit = it.next();
	// int flag[] = unit.getNumber_item();
	// ProjectDetail projectDetail = null;
	// String projectId = unit.getProject_id();
	// for(int i = 0;i < 12; i++)
	// {
	// if(flag[i] == 1)
	// {
	// projectDetail = new ProjectDetail();
	// projectDetail.setProject(projectDao.getSingleProjectById(Long.parseLong(projectId)).get(0));
	// //projectDetail.setTestType(projectDao.getPhysicalItem().get(i).getTypeItem());
	// projectDetail.setSuitAgeLower(Integer.parseInt(unit.getSuit_age_lower()));
	// projectDetail.setSuitAgeUpper(Integer.parseInt(unit.getSuit_age_upper()));
	// projectDetail.setSuitClientName(unit.getSuit_client_name());
	// projectDetail.setSuitName(unit.getSuit_name());
	// if(i<10)
	// {
	// projectDetail.setSuitNumber(projectId+"0"+(i+1));
	// }
	// else
	// {
	// projectDetail.setSuitNumber(projectId+(i+1));
	// }
	// projectDetail.setSuitSex(unit.getSuit_sex());projectDetail.setNumber(0);
	// }
	// }
	// }
	// }

	// 这个函数获得Suit id list，建议不要看内部逻辑
	private List<String> getSuitIdList(List<ProjectDetail> projectDetailList) {

		List<String> SuitIdList = new ArrayList<String>();
		java.util.Iterator<ProjectDetail> it = projectDetailList.iterator();
		String tempSuitId = null, SuitId;
		Iterator<String> stringIt = null;
		while (it.hasNext()) {
			tempSuitId = it.next().getSuitNumber();
			SuitId = tempSuitId.substring(0, tempSuitId.length() - 2);
			stringIt = (Iterator<String>) SuitIdList.iterator();
			if (!stringIt.hasNext()) {
				SuitIdList.add(SuitId);
			} else {
				while (stringIt.hasNext()) {
					String tempStringId = stringIt.next();
					if (!SuitId.equals(tempStringId)) {
						SuitIdList.add(SuitId);
						break;
					}
				}
			}
		}
		ArrayList list_tmp = new ArrayList(); // 建立一个用于临时存放不重复list元素的List集合。
		for (Object obj : SuitIdList) {
			if (!list_tmp.contains(obj)) { // 注意contains方法是通过equals方法进行比较的所以你要根据你自己的需要看是否需要重写list对象里面的equals方法。
				list_tmp.add(obj);// 如果上面加了强制转型，这里需要写list_tmp.add(u);
			}
		}
		return list_tmp;
	}

	private void saveSuitSingleColumn(Suit unit, int column) {
		switch (column) {
		case 1:
			unit.setNumber_item1(1);
			break;
		case 2:
			unit.setNumber_item2(1);
			break;
		case 3:
			unit.setNumber_item3(1);
			break;
		case 4:
			unit.setNumber_item4(1);
			break;
		case 5:
			unit.setNumber_item5(1);
			break;
		case 6:
			unit.setNumber_item6(1);
			break;
		case 7:
			unit.setNumber_item7(1);
			break;
		case 8:
			unit.setNumber_item8(1);
			break;
		case 9:
			unit.setNumber_item9(1);
			break;
		case 10:
			unit.setNumber_item10(1);
			break;
		case 11:
			unit.setNumber_item11(1);
			break;
		case 12:
			unit.setNumber_item12(1);
			break;
		default:
			throw new RuntimeException("Suit's column is error.@author devouty");
		}
	}

	@Override
	public List getAllVipIndent() {
		// TODO Auto-generated method stub
		return null;
	}

	private int getSelectedSum(Suit unit) {
		int sum = 0;
		List<PhysicalItem> list = projectDao.getPhysicalItem();
		if (unit.getNumber_item1() == 1)
			sum = sum + list.get(1 - 1).getPriceItem();
		if (unit.getNumber_item2() == 1)
			sum = sum + list.get(2 - 1).getPriceItem();
		if (unit.getNumber_item3() == 1)
			sum = sum + list.get(3 - 1).getPriceItem();
		if (unit.getNumber_item4() == 1)
			sum = sum + list.get(4 - 1).getPriceItem();
		if (unit.getNumber_item5() == 1)
			sum = sum + list.get(5 - 1).getPriceItem();
		if (unit.getNumber_item6() == 1)
			sum = sum + list.get(6 - 1).getPriceItem();
		if (unit.getNumber_item7() == 1)
			sum = sum + list.get(7 - 1).getPriceItem();
		if (unit.getNumber_item8() == 1)
			sum = sum + list.get(8 - 1).getPriceItem();
		if (unit.getNumber_item9() == 1)
			sum = sum + list.get(9 - 1).getPriceItem();
		if (unit.getNumber_item10() == 1)
			sum = sum + list.get(10 - 1).getPriceItem();
		if (unit.getNumber_item11() == 1)
			sum = sum + list.get(11 - 1).getPriceItem();
		if (unit.getNumber_item12() == 1)
			sum = sum + list.get(12 - 1).getPriceItem();
		return sum;
	}

	@Override
	public List<Project> managerGetOwnerProject(String id) {
		List<Project> projectList = projectDao.managerGetOwnerProject(id);
		Iterator it = projectList.iterator();
		while (it.hasNext()) {
			Project project = (Project) it.next();
			if (project.getContractReviewFlag()) {
				project.setStatus("合同审批已通过");
			} else {
				if (project.getProjectReviewFlag()) {
					project.setStatus("项目审批已通过");
				} else {
					project.setStatus("项目待审批");
				}
			}
		}
		return projectList;
	}

	@Override
	public void managerFinishChangingProject(Project project) {
		Project p = projectDao.getSingleProjectById(Integer.parseInt(project
				.getClientName()));
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		String time = format.format(date);
		time = time.replaceAll("/", "");
		p.setProjectReviewDate(time);
		p.setProjectReviewFlag(project.getProjectReviewFlag());
		p.setProjectReviewMaster(project.getProjectReviewMaster());
		p.setProjectReviewRemark(project.getProjectReviewRemark());
		// System.out.println(p.toString());
		projectDao.update(p);

	}

	@Override
	public void managerFinishChangingContract(Project project) {
		Project p = projectDao.getSingleProjectById(Integer.parseInt(project
				.getClientName()));
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		String time = format.format(date);
		time = time.replaceAll("/", "");
		p.setContractReviewDate(time);
		p.setContractReviewFlag(project.getContractReviewFlag());
		p.setContractReviewMaster(project.getContractReviewMaster());
		p.setContractReviewRemark(project.getContractReviewRemark());
		// System.out.println(p.toString());
		projectDao.update(p);

	}

	@Override
	public Project getLastProject() {
		return projectDao.getLastProject();

	}

	@Override
	public int getMaxProjectId() {
		return projectDao.getMaxProjectId();
	}
}

/*
 * Suit id detail: ********* * ** uidproject Suit's number(1~5) Suit
 * detail(1~12)
 * 
 * @author devouty
 */
