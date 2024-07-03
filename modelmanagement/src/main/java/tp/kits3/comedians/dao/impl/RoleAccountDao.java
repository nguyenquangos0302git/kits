/**
 * @author loi, quang, giang
 */
package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IRoleAccountDao;
import tp.kits3.comedians.model.RoleAccountModel;

@Repository
public class RoleAccountDao extends CommonDao<RoleAccountModel> implements IRoleAccountDao{

	@Override
	public int insert(RoleAccountModel roleAccountModel) {
		int result = insert("roleAccountMapper", "insert", roleAccountModel);
		result = roleAccountModel.getId();
		return result;
	}

	@Override
	public List<RoleAccountModel> findAll() {
		return query("roleAccountMapper", "selectAll");
	}

	@Override
	public void delete(int id) {
		delete("roleAccountMapper", "deleteRoleAccountByAccountId", id);
	}

	@Override
	public int insertStaffRole(RoleAccountModel roleAccountModel) {
		int result = insert("roleAccountMapper", "insertStaffRole", roleAccountModel);
		result = roleAccountModel.getId();
		return result;
	}

}
