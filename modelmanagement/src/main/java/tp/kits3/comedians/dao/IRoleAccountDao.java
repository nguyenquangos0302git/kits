/**
 * @author loi, giang, quang
 */
package tp.kits3.comedians.dao;

import java.util.List;

import tp.kits3.comedians.model.RoleAccountModel;

public interface IRoleAccountDao extends GenericDao<RoleAccountModel>{

	List<RoleAccountModel> findAll();
	
	int insert(RoleAccountModel roleAccountModel);
	
	void delete(int id);
	
	int insertStaffRole(RoleAccountModel roleAccountModel);
	
}
