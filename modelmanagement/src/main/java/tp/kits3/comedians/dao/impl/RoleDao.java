/**
 * @author loi, quang, giang
 */
package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IRoleDao;
import tp.kits3.comedians.model.RoleModel;

@Repository
public class RoleDao extends CommonDao<RoleModel> implements IRoleDao {

	@Override
	public List<String> getRolesName(int accountid) {
		List<String> list = queryString("roleMapper", "selectRoleNames", accountid);
		return list;
	}

	@Override
	public List<RoleModel> findAll() {
		return query("roleMapper", "selectAll");
	}

	@Override
	public List<RoleModel> findAllAndSort(String field, String direction) {
		return query("roleMapper", "selectAllAndSort", field, direction);
	}

	@Override
	public RoleModel findById(int i) {
		List<RoleModel> list = query("roleMapper", "selectById", i);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public int insert(RoleModel role) {
		int result = insert("roleMapper", "insert", role);
		return result;
	}

	@Override
	public int update(RoleModel role) {
		int result = update("roleMapper", "update", role);
		return result;
	}


}
