/**
 * @author dung, quang, giang
 */
package tp.kits3.comedians.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import tp.kits3.comedians.model.UserModel;

public interface IUserService {
	List<UserModel> findAll();

	UserModel selectOne(int id);
	
	UserModel findOneByAccountId(int accountId);

	void insert(UserModel param);

	int update(HttpServletRequest request, UserModel param);

	void delete(int id);
	
	int findByIdCard(String idcard);
}
