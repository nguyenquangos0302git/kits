/**
 * @author loi, giang, quang
 */
package tp.kits3.comedians.dao;

import tp.kits3.comedians.model.UserModel;

public interface IUserDao extends GenericDao<UserModel>{

	UserModel findOneByAccountId(int accountId);
	
	int insert(UserModel userModel);
	
	void delete (int id);
	
	int findByIdCard(String idcard);
	
	int update(UserModel user);
}
