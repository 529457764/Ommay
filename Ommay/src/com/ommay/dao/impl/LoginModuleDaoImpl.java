package com.ommay.dao.impl;
/**
 * @author  hs 2015/8/16
 */
import java.util.List;
import java.util.Map;

import org.hibernate.NonUniqueResultException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.ommay.dao.BaseDao;
import com.ommay.dao.LoginModuleDao;
import com.ommay.entity.Account;
import com.ommay.utils.Constant;
@Repository
public class LoginModuleDaoImpl extends BaseDao implements LoginModuleDao {
    /**
     * 用于登陆
     * 检测用户名和密码是否存在和正确
     */
    @Override
    public boolean isAccountExit(String name){
        boolean isTrue = false;
        Map<String, Object> map = null;
        Account account =null;
        if (name != null) {
            /**
             * 用户名检查
             */
            String hql = String.format("from %s where account='%s'", Constant.TABLE_ACCOUNT, name);
            try{
                    Object object = super.getCurrentSession().createQuery(hql).uniqueResult();
                    if(!(object.equals(null))){
                        isTrue = true;
                        return isTrue;
                    }
            }catch(Exception e){
                account = null;
                isTrue = false;
                System.out.println("LoginModuleDaoImpl isAccountTrue =="+e);
            }
        }
        return isTrue;
    }
    
    @Override
    public List<Object> queryAll(String table) {
        // TODO Auto-generated method stub
        Map<String, Object> map = null;
//		String table = "from"+Constant.TABLE_ACCIDENT_NAME;
        String query = String.format("from %s", table);
        return super.queryAll(query, map);
    }
    @Override
    public Object findByName(String name) {
        // TODO Auto-generated method stub
        String hql = String.format("from %s where account='%s'", Constant.TABLE_ACCOUNT, name);
        Account account = null;
        try {
            Object object = super.getCurrentSession().createQuery(hql).uniqueResult();
            account = (Account)object;
            return account;
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("LoginModuleDaoImpl findByName =="+e);
        }
        return null;
    }
    @Override
    public boolean verify(Object objectt) {
        // TODO Auto-generated method stub
        return false;
    }
    @Override
    protected Session getCurrentSession() {
        // TODO Auto-generated method stub
        return super.getCurrentSession();
    }
    @Override
    public void save(Object obj) {
        // TODO Auto-generated method stub
        super.save(obj);
    }
    @Override
    public void update(Object obj) {
        // TODO Auto-generated method stub
        super.update(obj);
    }
    @Override
    protected void merge(Object obj) {
        // TODO Auto-generated method stub
        super.merge(obj);
    }
    @Override
    public void delete(Object obj) {
        // TODO Auto-generated method stub
        super.delete(obj);
    }
    @Override
    protected Object findById(Integer id, Class clas) {
        // TODO Auto-generated method stub
        return super.findById(id, clas);
    }
    @Override
    protected List queryAll(String queryStr, Map<String, Object> map) {
        // TODO Auto-generated method stub
        return super.queryAll(queryStr, map);
    }
    @Override
    protected List queryLimit(String queryStr,int from, int max) {
        // TODO Auto-generated method stub
        return super.queryLimit(queryStr, from, max);
    }
    @Override
    protected Object queryIdentity(String queryStr, Map<String, Object> map) {
        // TODO Auto-generated method stub
        return super.queryIdentity(queryStr, map);
    }
    @Override
    public SessionFactory getSessionFactory() {
        // TODO Auto-generated method stub
        return super.getSessionFactory();
    }
    @Override
    public void setSessionFactory(SessionFactory sessionFactory) {
        // TODO Auto-generated method stub
        super.setSessionFactory(sessionFactory);
    }

	@Override
	public Session getSession() {
		// TODO Auto-generated method stub
		return super.getCurrentSession();
	}

	@Override
	public boolean isAccountTrue(String name, String password) {
		// TODO Auto-generated method stub
        boolean isTrue = false;
        Map<String, Object> map = null;
        Account account =null;
        if (name != null) {
            /**
             * 用户名和密码检查
             */
            String hql = String.format("from %s where account='%s' and password='%s'", Constant.TABLE_ACCOUNT, name,password);
            try{
                    Object object = super.getCurrentSession().createQuery(hql).uniqueResult();
                    if(!(object.equals(null))){
                        isTrue = true;
                        return isTrue;
                    }
            }catch(Exception e){
                account = null;
                isTrue = false;
                System.out.println("LoginModuleDaoImpl isAccountTrue =="+e);
            }
        }
        return isTrue;
	}
}