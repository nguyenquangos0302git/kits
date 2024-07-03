/**
 * @author dung, quang
 */
package tp.kits3.comedians.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IRoleAccountDao;
import tp.kits3.comedians.model.RoleAccountModel;
import tp.kits3.comedians.service.IRoleAccountService;

@Service
public class RoleAccountService implements IRoleAccountService{

	@Autowired
	private IRoleAccountDao roleAccountDao;
	
	
	@Override
	public List<RoleAccountModel> findAll() {
		return roleAccountDao.findAll();
	}


	@Override
	public void delete(int id) {
		roleAccountDao.delete(id);
	}


	@Override
	public int insertStaffRole(RoleAccountModel param) {
		return roleAccountDao.insert(param);
	}

}
