/**
 * @author loi, quang, giang
 */
package tp.kits3.comedians.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IUserDao;
import tp.kits3.comedians.model.UserModel;

@Repository
public class UserDao extends CommonDao<UserModel> implements IUserDao {

	@Override
	public int insert(UserModel userModel) {
		int result = insert("userMapper", "insert", userModel);
		result = userModel.getId();
		return result;
	}

	@Override
	public UserModel findOneByAccountId(int accountId) {
		List<UserModel> list = query("userMapper", "selectByAccountId", accountId);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public void delete(int id) {
		delete("userMapper", "deleteUserByAccountId", id);
	}

	@Override
	public int findByIdCard(String idcard) {
		List<UserModel> list = query("userMapper", "selectUserByIdCard", idcard);
		return list.isEmpty() ? 0 : 1;
	}

	@Override
	public int update(UserModel user) {
		int result = update("userMapper", "update", user);
		return result;
	}
}
