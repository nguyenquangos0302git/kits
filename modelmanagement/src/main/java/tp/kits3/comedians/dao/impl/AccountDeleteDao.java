package tp.kits3.comedians.dao.impl;

import org.springframework.stereotype.Repository;

import tp.kits3.comedians.dao.IAccountDeleteDao;
import tp.kits3.comedians.model.AccountDeleteModel;

@Repository
public class AccountDeleteDao extends CommonDao<AccountDeleteModel> implements IAccountDeleteDao{

	@Override
	public int insert(AccountDeleteModel param) {
		int result = insert("accountDeleteMapper", "insert", param);
		result = param.getId();
		return result;
	}

	
	
}
