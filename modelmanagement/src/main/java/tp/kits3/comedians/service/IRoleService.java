/**
 * @author dung
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.model.RoleModel;

public interface IRoleService {
	List<RoleModel> findAll();
	
	List<RoleModel> findAllAndSort(String field, String direction);

	RoleModel selectOne(int id);

	int insert(RoleModel param);

	int update(RoleModel param);

	List<String> findRoleNames(int accountId);
}
