/**
 * @author loi, giang, quang
 */
package tp.kits3.comedians.dao.impl;


import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IAccountDao;
import tp.kits3.comedians.model.AccountModel;

@Repository
public class AccountDao extends CommonDao<AccountModel> implements IAccountDao{
	
	@Override
	public List<AccountModel> findAll() {
		return query("accountMapper", "selectAll");
	}
	
	@Override
	public AccountModel findById(int id) {
		List<AccountModel> list = query("accountMapper", "selectById", id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public AccountModel findByUsernameAndPassword(String userName, String passWord) {
		List<AccountModel> list = query("accountMapper", "selectByUsernameAndPassword", userName, passWord);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public int insert(AccountModel account) {
		int result = insert("accountMapper", "insert", account);
		result = account.getId();
		return result;
	}

	@Override
	public void update(AccountModel account) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(List<Integer> ids) {
		delete("accountMapper", "deleteAccountById", ids);
	}

	@Override
	public AccountModel findByUserName(String username) {
		List<AccountModel> list = query("accountMapper", "selectByUsername", username);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public AccountModel findOneByUserNameAndStatus(String username, int status) {
		List<AccountModel> list = query("accountMapper", "selectByUsernameAndStatus",username,status);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public void changeStatusAccountByIdAndStatus(int status, String username, String note, Date date, int id) {
		updateField("accountMapper", "updateStatusAccount", status, username, note, date, id);
	}

	@Override
	public int findByUserNameOrEmail(String username, String email) {
		List<AccountModel> list = query("accountMapper", "selectByUserNameOrEmail",username,email);
		return list.isEmpty() ? 0 : 1;
	}

	@Override
	public void updateCreateAccountToSetSalary(String note, Date createdata, String peopleUp, Date modifieddate,
			int id) {
		updateField("accountMapper", "updateCreatedateAccount", note, createdata, peopleUp, modifieddate, id);
		
	}
	
}
