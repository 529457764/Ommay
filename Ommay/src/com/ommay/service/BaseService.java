package com.ommay.service;
/**
 * @author  hs 2015/8/16
 */
import java.util.List;

import org.springframework.stereotype.Service;
@Service
public interface BaseService {
	public List  getAll(String table);
	public Object findUserByName(String name);
	public void save(Object obj);
	public void update(Object obj);
	public void delete(int Id);
	public boolean verify(Object object);
}
