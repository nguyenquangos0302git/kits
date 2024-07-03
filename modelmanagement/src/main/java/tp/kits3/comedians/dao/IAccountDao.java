/**
 * @author loi, quang, giang
 */
package tp.kits3.comedians.dao;

import java.util.Date;
import java.util.List;

import tp.kits3.comedians.model.AccountModel;

public interface IAccountDao extends GenericDao<AccountModel> {

	List<AccountModel> findAll();
	
	AccountModel findById(int id);
	
	AccountModel findByUserName(String username);
	
	AccountModel findByUsernameAndPassword(String userName, String passWord);
	
	int insert(AccountModel account);
	
	void update(AccountModel account);
	
	void delete(List<Integer> ids);

	AccountModel findOneByUserNameAndStatus(String username, int status);
	
	void changeStatusAccountByIdAndStatus(int status, String username, String note, Date date, int id);
	
	int findByUserNameOrEmail(String username, String email);
	
	void updateCreateAccountToSetSalary(String note, Date createdata, String peopleUp , Date modifieddate, int id);
}
