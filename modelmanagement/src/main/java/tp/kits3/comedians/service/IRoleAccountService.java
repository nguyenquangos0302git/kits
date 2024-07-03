/**
 * @author dung, quang, giang
 */
package tp.kits3.comedians.service;

import java.util.List;

import tp.kits3.comedians.model.RoleAccountModel;

public interface IRoleAccountService {
	List<RoleAccountModel> findAll();
	
	void delete(int id);
	
	int insertStaffRole(RoleAccountModel param);
	
}
