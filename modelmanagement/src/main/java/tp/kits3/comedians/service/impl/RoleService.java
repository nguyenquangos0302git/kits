/**
 * @author dung, quang
 */
package tp.kits3.comedians.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.comedians.dao.IRoleDao;
import tp.kits3.comedians.model.RoleModel;
import tp.kits3.comedians.service.IRoleService;

@Service
public class RoleService implements IRoleService {

	@Autowired
	private IRoleDao roleDao;

	@Override
	public List<RoleModel> findAll() {
		List<RoleModel> list = roleDao.findAll();
		return list;
	}

	@Override
	public List<String> findRoleNames(int accountId) {
		return roleDao.getRolesName(accountId);
	}

	@Override
	public List<RoleModel> findAllAndSort(String field, String direction) {
		List<RoleModel> list = roleDao.findAllAndSort(field, direction.equalsIgnoreCase("ASC") ? "ASC" : "DESC");
		list.remove(0);
		return list;
	}

	@Override
	public RoleModel selectOne(int id) {

		return roleDao.findById(id);
	}

	@Override
	public int insert(RoleModel param) {
		int result = roleDao.insert(param);
		return result;
	}

	@Override
	public int update(RoleModel param) {
		int result =roleDao.update(param);
		return result;
	}

}
