/**
 * @author loi, giang, quang
 */
package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.RoleModel;

public interface IRoleDao extends GenericDao<RoleModel> {

	List<String> getRolesName(int accountId);

	List<RoleModel> findAll();

	List<RoleModel> findAllAndSort(String field, String direction);

	RoleModel findById(int i);

	int insert(RoleModel role);
	
	int update(RoleModel role);
	
}
